import codecs
import csv
import io
import json
import logging
import math
import os
import re
import uuid
from collections import Counter
from datetime import datetime, timezone
from typing import Optional

import pandas as pd
import portalocker
from fastapi import FastAPI, Depends, HTTPException, Request, UploadFile, File
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import FileResponse, JSONResponse
from fastapi.routing import APIRoute
from fastapi.staticfiles import StaticFiles
from pydantic import BaseModel, field_validator
from starlette.middleware.base import BaseHTTPMiddleware
from starlette.responses import Response
from starlette.routing import Match

from auth import load_users, update_users, hash_password
import storage

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# ── Cause whitelist (prevents path traversal via cause param) ─

VALID_CAUSES = frozenset([
    "Total_Deaths", "Diseases_of_Heart", "Malignant_Neoplasms", "Accidents",
    "COVID_19", "Cerebrovascular_Diseases", "Chronic_Lower_Respiratory_Diseases",
    "Alzheimers_Disease", "Diabetes_Mellitus", "Nephritis_Nephrotic_Syndrome_Nephrosis",
    "Influenza_and_Pneumonia", "Septicemia", "Intentional_Self_Harm",
    "Chronic_Liver_Disease_Cirrhosis", "All_Other_Causes",
])

VALID_PROVIDER_METRICS = frozenset([
    "total_active_mds_per_100k",
    "primary_care_physicians_per_100k",
    "hospital_beds_per_100k",
    "hpsa_primary_care_designation",
    "psychiatry_mds_per_100k",
])

UPLOAD_MAX_BYTES = 100 * 1024 * 1024  # 100 MB
UPLOAD_MAX_PROBLEMS = 5  # shown in a refused upload's 400 detail

# The years every published rate table holds, and so the range the UI offers.
# A new release year means updating this one constant.
EXPECTED_YEARS = range(2008, 2023)

# Copied from app/pipeline/deaths_pipeline.py, which refuses to write tables
# outside this band. An all-cause crude rate beyond it means a wrong denominator.
ALL_CAUSE_RATE_MIN = 100.0
ALL_CAUSE_RATE_MAX = 3_000.0

# ── County allowlist (loaded from population at startup) ──────

def _load_county_names() -> dict:
    """
    Map lowercased county name -> the canonical spelling used in the data.

    The allowlist used to be built from the GeoJSON's uppercase names plus
    their .title() form, so "DUPAGE".title() gave "Dupage" and the real data
    name "DuPage" was rejected with a 422. Ten counties failed that way,
    including DuPage, McHenry, McLean, DeKalb, LaSalle, Chicago and
    Suburban Cook. Building from the population table instead means the
    allowlist is exactly the set of names the rest of the app uses, and
    lookups are case-insensitive so the UI and the data cannot drift apart.
    It used to read the first rate table, so replacing that table by upload
    changed the valid counties at the next start. Population is not uploadable.
    """
    names: set[str] = set()
    population = os.path.join(os.path.dirname(__file__), "static", "population_by_county_year.csv")
    try:
        names.update(pd.read_csv(population, usecols=["County"])["County"])
    except Exception as e:
        logger.warning("Could not load county names from the population table: %s", e)

    geo_path = os.path.join(os.path.dirname(__file__), "static", "illinois-counties.geojson")
    try:
        with open(geo_path) as f:
            geo = json.load(f)
        names.update(feat["properties"]["COUNTY_NAM"] for feat in geo["features"])
    except Exception as e:
        logger.warning("Could not load county allowlist from GeoJSON: %s", e)

    canonical: dict[str, str] = {}
    for name in names:
        # A name from the population table wins over the GeoJSON's uppercase form.
        key = name.strip().lower()
        if key not in canonical or not name.isupper():
            canonical[key] = name.strip()
    return canonical


COUNTY_CANONICAL = _load_county_names()
VALID_COUNTIES = frozenset(COUNTY_CANONICAL.values())


def _canonical_county(value: str) -> str:
    """Resolve any casing of a county name to the spelling used in the data."""
    resolved = COUNTY_CANONICAL.get(value.strip().lower())
    if not resolved:
        raise ValueError(
            f"Unknown county: {value!r}. Expected one of the "
            f"{len(COUNTY_CANONICAL)} Illinois reporting areas."
        )
    return resolved

# ── Audit log (append-only JSONL) ─────────────────────────────

AUDIT_FILE = os.path.join(storage.DATA_DIR, "audit.jsonl")

# ── App setup ─────────────────────────────────────────────────

app = FastAPI(docs_url=None, redoc_url=None)

_raw_origins = os.environ.get("ALLOWED_ORIGINS", "http://localhost:5173,http://127.0.0.1:5173")
ALLOWED_ORIGINS = [o.strip() for o in _raw_origins.split(",") if o.strip()]

app.add_middleware(
    CORSMiddleware,
    allow_origins=ALLOWED_ORIGINS,
    allow_credentials=True,
    allow_methods=["GET", "POST", "PUT", "DELETE", "OPTIONS"],
    allow_headers=["Authorization", "Content-Type"],
)


class SecurityHeadersMiddleware(BaseHTTPMiddleware):
    async def dispatch(self, request: Request, call_next) -> Response:
        response = await call_next(request)
        response.headers["X-Content-Type-Options"] = "nosniff"
        response.headers["X-Frame-Options"] = "DENY"
        response.headers["Referrer-Policy"] = "strict-origin-when-cross-origin"
        response.headers["Cache-Control"] = "no-store"
        response.headers["Strict-Transport-Security"] = "max-age=31536000; includeSubDomains"
        response.headers["Content-Security-Policy"] = (
            "default-src 'self'; "
            "script-src 'self'; "
            # index.css pulls webfonts from Google Fonts: the stylesheet comes
            # from fonts.googleapis.com and the font files from fonts.gstatic.com.
            "style-src 'self' 'unsafe-inline' https://fonts.googleapis.com; "
            "font-src 'self' https://fonts.gstatic.com data:; "
            "img-src 'self' data: blob:; "
            "connect-src 'self';"
        )
        return response


app.add_middleware(SecurityHeadersMiddleware)

data_dir = os.path.join(os.path.dirname(__file__), "static")
death_rates_dir = os.path.join(data_dir, "death_rate_tables")
provider_dir = os.path.join(data_dir, "provider_tables")
os.makedirs(death_rates_dir, exist_ok=True)
os.makedirs(provider_dir, exist_ok=True)

# ── Auth (bypassed: every request is treated as the built-in admin) ──

_PASS_RE = re.compile(r'^(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,}$')

_FAKE_USER = {"id": "1", "username": "admin", "name": "IDPH Admin", "role": "admin", "token_version": 0}

def get_current_user():
    return _FAKE_USER

def require_admin():
    return _FAKE_USER

def require_editor():
    return _FAKE_USER


def _audit(action: str, resource: str, detail: str, user: dict, request: Optional[Request] = None):
    try:
        entry = {
            "id": str(uuid.uuid4()),
            "user": user.get("username", "unknown"),
            "action": action,
            "resource": resource,
            "detail": detail,
            "timestamp": datetime.now(timezone.utc).isoformat(),
            "ip": request.client.host if request and request.client else None,
        }
        with portalocker.Lock(AUDIT_FILE, "a", timeout=5) as f:
            f.write(json.dumps(entry) + "\n")
    except Exception as e:
        logger.warning("Audit log write failed: %s", e)


_TABLE_CACHE: dict[str, tuple[float, pd.DataFrame]] = {}


def _read_table(path: str) -> pd.DataFrame:
    """
    Read a pipeline CSV, cached on the file's modification time.

    Every view in the dashboard hits these endpoints, and the backend used to
    re-parse the CSV with pandas on each request. The tables only change when
    the pipeline runs or an admin uploads, so the mtime is a sufficient key.
    """
    stamp = os.path.getmtime(path)
    cached = _TABLE_CACHE.get(path)
    if cached and cached[0] == stamp:
        return cached[1]
    df = pd.read_csv(path, na_values=["", " "])
    _TABLE_CACHE[path] = (stamp, df)
    return df


DATASET_BACKUP_DIR = os.path.join(storage.DATA_DIR, "dataset_backups")
DATASET_OVERLAY_DIR = os.path.join(storage.DATA_DIR, "datasets")
DATASET_SUFFIX = "_death_rates_by_county_year.csv"


def _dataset_path(cause: str) -> Optional[str]:
    """
    Where a cause's table is served from, or None if it has none.

    The committed tables in static/ are never written at runtime. An upload
    goes to var/datasets/ and shadows the committed file, and a delete leaves a
    <cause>.deleted tombstone that hides both. The caller validates cause.
    """
    if os.path.exists(os.path.join(DATASET_OVERLAY_DIR, f"{cause}.deleted")):
        return None
    for folder in (DATASET_OVERLAY_DIR, death_rates_dir):
        path = os.path.join(folder, f"{cause}{DATASET_SUFFIX}")
        if os.path.exists(path):
            return path
    return None


def _effective_datasets() -> dict[str, str]:
    """Every cause with a table being served, mapped to its path, sorted by cause."""
    names = set(os.listdir(death_rates_dir))
    if os.path.isdir(DATASET_OVERLAY_DIR):
        names.update(os.listdir(DATASET_OVERLAY_DIR))
    causes = sorted(n.removesuffix(DATASET_SUFFIX) for n in names if n.endswith(DATASET_SUFFIX))
    paths = {cause: _dataset_path(cause) for cause in causes}
    return {cause: path for cause, path in paths.items() if path}


DATASET_BACKUP_KEEP = 10  # newest backups kept per cause, plus the oldest

# Group 1 is the time stamp. The microseconds and the short uuid are absent from
# names written before retention was added, and those still have to sort.
_BACKUP_STAMP = re.compile(r"\.(\d{8}T\d{6}(?:\d{6})?)Z(?:\.[0-9a-f]{8})?\.csv$")


def _prune_dataset_backups(table: str) -> None:
    """
    Keep the newest DATASET_BACKUP_KEEP backups of one table, plus the oldest.

    The oldest is the closest thing to the pipeline's original output, so it
    outlives the limit. Order comes from the stamp in the name, not the mtime,
    which a restore or a volume copy can change. A name that does not parse is
    left alone, and a failed removal only logs, because the admin's write has
    already been made safe by the new backup.
    """
    stamped = []
    for fname in os.listdir(DATASET_BACKUP_DIR):
        match = _BACKUP_STAMP.search(fname)
        if match and fname[:match.start()] == table:
            stamped.append((match.group(1), fname))
    stamped.sort()  # a stamp without microseconds sorts first within its second
    for _, fname in stamped[1:-DATASET_BACKUP_KEEP]:
        try:
            os.remove(os.path.join(DATASET_BACKUP_DIR, fname))
        except OSError as e:
            logger.warning("Could not prune backup %s: %s", fname, e)


def _backup_dataset(path: str) -> Optional[str]:
    """
    Copy a pipeline table aside before an admin overwrites or deletes it.

    Uploads used to replace the committed CSV in place with no way back, so a
    bad file meant re-running the pipeline to recover. Backups live under var/
    so they are never served and never committed.

    Names used to have one-second resolution and opened with "wb", so two writes
    in the same second kept only the first upload and lost the version before
    it. "xb" means a backup can never replace another one.
    """
    if not os.path.exists(path):
        return None
    os.makedirs(DATASET_BACKUP_DIR, exist_ok=True)
    stamp = datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%S%fZ")
    table = os.path.basename(path).removesuffix(".csv")
    name = f"{table}.{stamp}.{uuid.uuid4().hex[:8]}.csv"
    with open(path, "rb") as src, open(os.path.join(DATASET_BACKUP_DIR, name), "xb") as dst:
        dst.write(src.read())
    _prune_dataset_backups(table)
    return name


def _records(df: pd.DataFrame) -> list[dict]:
    """DataFrame -> JSON records with NaN as null rather than 0 or NaN."""
    return json.loads(df.to_json(orient="records"))


def _validate_cause(cause: str) -> str:
    if cause not in VALID_CAUSES:
        raise HTTPException(status_code=400, detail=f"Unknown cause: {cause}")
    return cause


_RATE_CELL_RE = re.compile(r"[+-]?([0-9]+\.?[0-9]*|\.[0-9]+)([eE][+-]?[0-9]+)?")


def _name_list(names: list[str], limit: int = 5) -> str:
    """Up to `limit` names for an error message, cut short so a bad file cannot flood it."""
    shown = ", ".join(n[:40] for n in names[:limit])
    return shown + (f" and {len(names) - limit} more" if len(names) > limit else "")


def validate_rate_csv(contents: bytes, cause: str) -> list[str]:
    """
    Every reason this upload cannot be a rate table. Empty means it can.

    Only a County column used to be required, so a two-line file could replace a
    published table. This reads raw strings with csv, not pandas, because pandas
    would pass "NA" and "null" as empty, "inf" as a number, and rename a
    duplicate year column instead of showing it.
    """
    try:
        text = contents.decode("utf-8-sig")
        rows = [row for row in csv.reader(io.StringIO(text, newline="")) if row]
    except UnicodeDecodeError:
        return ["The file is not UTF-8 text"]
    except csv.Error as e:
        return [f"Invalid CSV: {e}"]
    if not rows:
        return ["The file is empty"]

    years = [str(y) for y in EXPECTED_YEARS]
    header, body = rows[0], rows[1:]
    if header != ["County", *years]:
        return [
            f"Columns must be exactly County, then {years[0]} to {years[-1]} in order. "
            f"Found: {', '.join(header)[:80]}"
        ]

    problems: list[str] = []
    has_value = False
    for row in body:
        county = row[0]
        if len(row) != len(header):
            problems.append(f"{county[:40]}: {len(row)} columns, expected {len(header)}")
            continue
        for year, cell in zip(years, row[1:]):
            if cell == "":
                continue
            where = f"{county[:40]} {year}: {cell[:40]!r}"
            value = float(cell) if _RATE_CELL_RE.fullmatch(cell) else math.nan
            if not math.isfinite(value):
                problems.append(f"{where} is not a number")
            elif value < 0:
                problems.append(f"{where} is negative")
            elif cause == "Total_Deaths" and not ALL_CAUSE_RATE_MIN <= value <= ALL_CAUSE_RATE_MAX:
                problems.append(
                    f"{where} is outside the all-cause band of "
                    f"{ALL_CAUSE_RATE_MIN:.0f} to {ALL_CAUSE_RATE_MAX:.0f}"
                )
            else:
                has_value = True

    seen = Counter(row[0] for row in body)
    missing = sorted(VALID_COUNTIES - seen.keys())
    if missing:
        problems.append(f"Missing {len(missing)} of {len(VALID_COUNTIES)} reporting areas: {_name_list(missing)}")
    unknown = sorted(seen.keys() - VALID_COUNTIES)
    if unknown:
        problems.append(f"Not a reporting area, spelling must match exactly: {_name_list(unknown)}")
    repeated = sorted(c for c, n in seen.items() if n > 1)
    if repeated:
        problems.append(f"Listed more than once: {_name_list(repeated)}")
    if not problems and not has_value:
        problems.append("The table has no values, every cell is empty")
    return problems


def _write_atomic(path: str, contents: bytes) -> None:
    """
    Swap a file's contents in one step, so a reader sees the old or the new.

    The temp file sits beside the target because os.replace must stay on one
    volume, and does not end in .csv so no table listing can pick it up.
    """
    tmp = os.path.join(os.path.dirname(path), f".upload-{uuid.uuid4().hex}.tmp")
    try:
        with open(tmp, "xb") as f:
            f.write(contents)
            f.flush()
            os.fsync(f.fileno())
        os.replace(tmp, path)
    finally:
        if os.path.exists(tmp):
            os.remove(tmp)


# ── Pydantic models ───────────────────────────────────────────

class AnnotationCreate(BaseModel):
    county: str
    cause: Optional[str] = None
    text: str
    type: str = "info"

    @field_validator("county")
    @classmethod
    def valid_county(cls, v: str) -> str:
        return _canonical_county(v)

    @field_validator("type")
    @classmethod
    def valid_type(cls, v: str) -> str:
        if v not in ("info", "warning", "intervention"):
            raise ValueError("type must be info, warning, or intervention")
        return v

    @field_validator("text")
    @classmethod
    def non_empty_text(cls, v: str) -> str:
        v = v.strip()
        if not v:
            raise ValueError("text cannot be empty")
        return v[:1000]


class AnnotationUpdate(BaseModel):
    """
    Fields an edit may change.

    county and cause used to be missing here, so the edit form could change
    them and the API would silently keep the old values. text had no validator,
    so an edit could blank an annotation out.
    """
    county: Optional[str] = None
    cause: Optional[str] = None
    text: Optional[str] = None
    type: Optional[str] = None

    @field_validator("county")
    @classmethod
    def valid_county(cls, v: Optional[str]) -> Optional[str]:
        return _canonical_county(v) if v is not None else None

    @field_validator("type")
    @classmethod
    def valid_type(cls, v: Optional[str]) -> Optional[str]:
        if v is not None and v not in ("info", "warning", "intervention"):
            raise ValueError("type must be info, warning, or intervention")
        return v

    @field_validator("text")
    @classmethod
    def non_empty_text(cls, v: Optional[str]) -> Optional[str]:
        if v is None:
            return None
        v = v.strip()
        if not v:
            raise ValueError("text cannot be empty")
        return v[:1000]


class ThresholdUpsert(BaseModel):
    cause: str
    rate: float

    @field_validator("rate")
    @classmethod
    def positive_rate(cls, v: float) -> float:
        if v <= 0:
            raise ValueError("rate must be positive")
        return v


class PresetCreate(BaseModel):
    name: str
    cause: str
    year: int
    district: Optional[int] = None
    is_public: bool = True

    @field_validator("year")
    @classmethod
    def valid_year(cls, v: int) -> int:
        if v not in EXPECTED_YEARS:
            raise ValueError("Invalid year")
        return v

    @field_validator("name")
    @classmethod
    def non_empty_name(cls, v: str) -> str:
        v = v.strip()[:100]
        if not v:
            raise ValueError("Name is required")
        return v

    @field_validator("district")
    @classmethod
    def valid_district(cls, v: Optional[int]) -> Optional[int]:
        if v is not None and not (1 <= v <= 9):
            raise ValueError("Invalid district")
        return v


class UserCreate(BaseModel):
    username: str
    name: str
    role: str
    password: str

    @field_validator("username")
    @classmethod
    def valid_username(cls, v: str) -> str:
        if not re.match(r"^[a-zA-Z0-9_\-\.]{2,64}$", v):
            raise ValueError("Username must be 2-64 alphanumeric characters")
        return v

    @field_validator("role")
    @classmethod
    def valid_role(cls, v: str) -> str:
        if v not in ("admin", "editor", "viewer"):
            raise ValueError("Role must be admin, editor, or viewer")
        return v

    @field_validator("password")
    @classmethod
    def password_strength(cls, v: str) -> str:
        if not _PASS_RE.match(v):
            raise ValueError("Password must be 8+ characters with at least one digit and one special character")
        return v


class UserUpdate(BaseModel):
    name: Optional[str] = None
    role: Optional[str] = None
    password: Optional[str] = None

    @field_validator("role")
    @classmethod
    def valid_role(cls, v: Optional[str]) -> Optional[str]:
        if v is not None and v not in ("admin", "editor", "viewer"):
            raise ValueError("Role must be admin, editor, or viewer")
        return v

    @field_validator("password")
    @classmethod
    def password_strength(cls, v: Optional[str]) -> Optional[str]:
        if v is not None and not _PASS_RE.match(v):
            raise ValueError("Password must be 8+ characters with at least one digit and one special character")
        return v


# ── Health ────────────────────────────────────────────────────

@app.get("/health")
async def health():
    return {"status": "ok"}


# ── Data endpoints ───────────────────────────────────────────

@app.get("/geojson")
def get_geojson(user=Depends(get_current_user)):
    geojson_path = os.path.join(data_dir, "illinois-counties.geojson")
    if not os.path.exists(geojson_path):
        raise HTTPException(status_code=404, detail="GeoJSON not found")
    return FileResponse(geojson_path, media_type="application/json")


@app.get("/death_rates")
def get_death_rates(cause: str, user=Depends(get_current_user)):
    _validate_cause(cause)
    file_path = _dataset_path(cause)
    if not file_path:
        raise HTTPException(status_code=404, detail=f"Data not found for cause: {cause}")
    try:
        df = _read_table(file_path)
        # Missing values stay null. They used to be coerced to 0, which the UI
        # then drew as "no deaths" for causes IDPH simply stopped publishing.
        return JSONResponse(content=_records(df))
    except Exception as e:
        logger.error("Error reading %s: %s", cause, e)
        raise HTTPException(status_code=500, detail="Failed to read data")


@app.get("/provider_data")
def get_provider_data(metric: str, user=Depends(get_current_user)):
    if metric not in VALID_PROVIDER_METRICS:
        raise HTTPException(status_code=400, detail=f"Unknown metric: {metric}")
    file_path = os.path.join(provider_dir, f"{metric}_by_county_year.csv")
    if not os.path.exists(file_path):
        raise HTTPException(status_code=404, detail=f"Data not found for metric: {metric}")
    try:
        df = _read_table(file_path)
        return JSONResponse(content=_records(df))
    except Exception as e:
        logger.error("Error reading provider metric %s: %s", metric, e)
        raise HTTPException(status_code=500, detail="Failed to read data")


# ── Meta ─────────────────────────────────────────────────────

@app.get("/meta")
def get_meta(user=Depends(get_current_user)):
    """
    Everything the UI needs to avoid hardcoding years, counties or caveats.

    The year range used to be fetched but ignored: five views hardcoded
    2009-2022 sliders while the data starts at 2008. It also used to be read
    from the first rate table, so one bad upload moved it for every view.
    Uploads are now pinned to EXPECTED_YEARS, so that is the range.
    """
    datasets = _effective_datasets()

    return {
        "year_min": min(EXPECTED_YEARS),
        "year_max": max(EXPECTED_YEARS),
        "counties": sorted(VALID_COUNTIES),
        "available_causes": list(datasets),
        # The pipeline computes deaths / population x 100,000. The IDPH county
        # reports publish totals with no age breakdown, so age standardisation
        # is not possible from this source and the UI must not claim it.
        "rate_basis": "crude",
        "rate_label": "Crude rate per 100,000",
        "rate_note": (
            "Crude rates, not age-adjusted. Counties with older populations "
            "will show higher rates partly because of age."
        ),
        # Measured from population_by_county_year.csv. test_population_note.py
        # recomputes these, so rebuilding the denominators fails until this is
        # rewritten.
        "population_note": (
            "Population estimates change Census series at 2020: vintage 2019 "
            "through 2019, vintage 2023 from 2020. At that join 25 of 102 "
            "counties move more than 3% (18 down, 7 up; Cook +2.20%, Illinois "
            "+0.94%), so rate changes across 2019-2020 partly reflect the "
            "population series, not only deaths."
        ),
        "provider_metrics": _provider_provenance(),
    }


def _provider_provenance() -> dict:
    """Which provider years are measured and which are filled in."""
    path = os.path.join(provider_dir, "metric_provenance.json")
    if not os.path.exists(path):
        return {}
    try:
        with open(path) as f:
            return json.load(f)
    except Exception as e:
        logger.warning("Could not read provider provenance: %s", e)
        return {}


@app.get("/population")
def get_population(user=Depends(get_current_user)):
    """
    County population by year, the same denominators the pipeline divides by.

    The UI needs these for excess-deaths arithmetic. It used to multiply every
    year by a hardcoded 2020 population table, which overstated excess deaths
    for shrinking counties in the early years by as much as their population
    had fallen since.
    """
    path = os.path.join(data_dir, "population_by_county_year.csv")
    if not os.path.exists(path):
        raise HTTPException(status_code=404, detail="Population table not found")
    return JSONResponse(content=_records(_read_table(path)))


@app.get("/provider_summary")
def get_provider_summary(user=Depends(get_current_user)):
    """
    Statewide HPSA picture as category counts.

    HPSA codes (0 none, 1 whole county, 2 part of county) are categories, so
    there is no meaningful state average. The old table averaged them into
    figures like 1.44 and the UI showed that as a percentage.
    """
    path = os.path.join(provider_dir, "hpsa_primary_care_summary_by_year.csv")
    if not os.path.exists(path):
        raise HTTPException(status_code=404, detail="HPSA summary not found")
    return JSONResponse(content=_records(_read_table(path)))


# ── Export ────────────────────────────────────────────────────

@app.get("/export/csv")
def export_csv(cause: str, request: Request, user=Depends(get_current_user)):
    _validate_cause(cause)
    file_path = _dataset_path(cause)
    if not file_path:
        raise HTTPException(status_code=404, detail="Dataset not found")
    _audit("export", f"datasets/{cause}", "CSV export", user, request)
    return FileResponse(
        file_path,
        media_type="text/csv",
        filename=f"idph_{cause}_death_rates.csv",
    )


# ── Annotations ───────────────────────────────────────────────

@app.get("/annotations")
def list_annotations(user=Depends(get_current_user)):
    return storage.load("annotations", [])


@app.post("/annotations")
def create_annotation(body: AnnotationCreate, request: Request, user=Depends(get_current_user)):
    if user.get("role") not in ("admin", "editor"):
        raise HTTPException(status_code=403, detail="Editor access required")
    if body.cause is not None:
        _validate_cause(body.cause)
    entry = {
        "id": str(uuid.uuid4()),
        "county": body.county,
        "cause": body.cause,
        "text": body.text,
        "type": body.type,
        "created_by": user["username"],
        "created_at": datetime.now(timezone.utc).isoformat(),
        "updated_at": datetime.now(timezone.utc).isoformat(),
    }

    def _append(data):
        data.append(entry)

    storage.load_and_save("annotations", _append)
    _audit("create", f"annotations/{entry['id']}", f"Annotated {body.county}", user, request)
    return entry


@app.put("/annotations/{annotation_id}")
def update_annotation(
    annotation_id: str,
    body: AnnotationUpdate,
    request: Request,
    user=Depends(get_current_user),
):
    if user.get("role") not in ("admin", "editor"):
        raise HTTPException(status_code=403, detail="Editor access required")
    if body.cause is not None:
        _validate_cause(body.cause)

    updated = {}

    def _update(data):
        idx = next((i for i, a in enumerate(data) if a["id"] == annotation_id), None)
        if idx is None:
            return
        if body.text is not None:
            data[idx]["text"] = body.text
        if body.type is not None:
            data[idx]["type"] = body.type
        if body.county is not None:
            data[idx]["county"] = body.county
        # cause is nullable, so an explicit null clears it. "not set" and
        # "set to nothing" are told apart with model_fields_set.
        if "cause" in body.model_fields_set:
            data[idx]["cause"] = body.cause
        data[idx]["updated_at"] = datetime.now(timezone.utc).isoformat()
        updated.update(data[idx])

    storage.load_and_save("annotations", _update)
    if not updated:
        raise HTTPException(status_code=404, detail="Annotation not found")
    _audit("update", f"annotations/{annotation_id}", "Updated annotation", user, request)
    return updated


@app.delete("/annotations/{annotation_id}")
def delete_annotation(annotation_id: str, request: Request, user=Depends(get_current_user)):
    if user.get("role") not in ("admin", "editor"):
        raise HTTPException(status_code=403, detail="Editor access required")

    found = {"deleted": False}

    def _remove(data):
        before = len(data)
        data[:] = [a for a in data if a["id"] != annotation_id]
        found["deleted"] = len(data) < before

    storage.load_and_save("annotations", _remove)
    if not found["deleted"]:
        raise HTTPException(status_code=404, detail="Annotation not found")
    _audit("delete", f"annotations/{annotation_id}", "Deleted annotation", user, request)
    return {"ok": True}


# ── Thresholds ────────────────────────────────────────────────

def _threshold_rows(data):
    # Records saved before notifications were dropped may still hold notify_email.
    return [{k: v for k, v in t.items() if k != "notify_email"} for t in data]


@app.get("/thresholds")
def list_thresholds(user=Depends(get_current_user)):
    return _threshold_rows(storage.load("thresholds", []))


@app.post("/thresholds")
def upsert_threshold(body: ThresholdUpsert, request: Request, user=Depends(require_admin)):
    _validate_cause(body.cause)
    now = datetime.now(timezone.utc).isoformat()
    result = {}

    def _upsert(data):
        existing = next((t for t in data if t["cause"] == body.cause), None)
        if existing:
            existing.pop("notify_email", None)
            existing.update(rate=body.rate, updated_at=now)
        else:
            data.append({
                "id": str(uuid.uuid4()),
                "cause": body.cause,
                "rate": body.rate,
                "created_by": user["username"],
                "created_at": now,
                "updated_at": now,
            })
        result["thresholds"] = _threshold_rows(data)

    storage.load_and_save("thresholds", _upsert)
    _audit("upsert", f"thresholds/{body.cause}", f"Set threshold {body.rate}", user, request)
    return result.get("thresholds", [])


@app.delete("/thresholds/{cause}")
def delete_threshold(cause: str, request: Request, user=Depends(require_admin)):
    _validate_cause(cause)
    found = {"deleted": False}

    def _remove(data):
        before = len(data)
        data[:] = [t for t in data if t["cause"] != cause]
        found["deleted"] = len(data) < before

    storage.load_and_save("thresholds", _remove)
    if not found["deleted"]:
        raise HTTPException(status_code=404, detail="Threshold not found")
    _audit("delete", f"thresholds/{cause}", "Removed threshold", user, request)
    return {"ok": True}


# ── Presets ───────────────────────────────────────────────────

@app.get("/presets")
def list_presets(user=Depends(get_current_user)):
    all_presets = storage.load("presets", [])
    return [p for p in all_presets if p.get("is_public") or p.get("created_by") == user["username"]]


@app.post("/presets")
def create_preset(body: PresetCreate, request: Request, user=Depends(get_current_user)):
    _validate_cause(body.cause)
    entry = {
        "id": str(uuid.uuid4()),
        "name": body.name,
        "cause": body.cause,
        "year": body.year,
        "district": body.district,
        "is_public": body.is_public,
        "created_by": user["username"],
        "created_at": datetime.now(timezone.utc).isoformat(),
    }

    def _append(data):
        data.append(entry)

    storage.load_and_save("presets", _append)
    _audit("create", f"presets/{entry['id']}", f"Created preset '{body.name}'", user, request)
    return entry


@app.delete("/presets/{preset_id}")
def delete_preset(preset_id: str, request: Request, user=Depends(get_current_user)):
    found = {"target": None}

    def _remove(data):
        target = next((p for p in data if p["id"] == preset_id), None)
        if not target:
            return
        if target["created_by"] != user["username"] and user.get("role") != "admin":
            found["forbidden"] = True
            return
        found["target"] = target
        data[:] = [p for p in data if p["id"] != preset_id]

    storage.load_and_save("presets", _remove)
    if found.get("forbidden"):
        raise HTTPException(status_code=403, detail="Cannot delete another user's preset")
    if not found["target"]:
        raise HTTPException(status_code=404, detail="Preset not found")
    _audit("delete", f"presets/{preset_id}", f"Deleted preset '{found['target']['name']}'", user, request)
    return {"ok": True}


# ── Admin: Dataset management ─────────────────────────────────

@app.get("/admin/datasets")
def list_datasets(user=Depends(require_admin)):
    files = []
    for cause, fpath in _effective_datasets().items():
        stat = os.stat(fpath)
        files.append({
            "cause": cause,
            "filename": os.path.basename(fpath),
            "size_kb": round(stat.st_size / 1024, 1),
            "modified": datetime.fromtimestamp(stat.st_mtime, timezone.utc).isoformat().replace("+00:00", "Z"),
            # An upload shadows the committed table, even after a new pipeline build.
            "source": "uploaded" if os.path.dirname(fpath) == DATASET_OVERLAY_DIR else "committed",
        })
    return sorted(files, key=lambda x: x["cause"])


@app.post("/admin/upload")
async def upload_dataset(
    cause: str,
    request: Request,
    file: UploadFile = File(...),
    user=Depends(require_admin),
):
    _validate_cause(cause)
    if not (file.filename or "").endswith(".csv"):
        raise HTTPException(status_code=400, detail="Only CSV files are accepted")
    contents = await file.read(UPLOAD_MAX_BYTES + 1)
    if len(contents) > UPLOAD_MAX_BYTES:
        raise HTTPException(status_code=413, detail=f"File exceeds {UPLOAD_MAX_BYTES // (1024*1024)} MB limit")
    problems = validate_rate_csv(contents, cause)
    if problems:
        # A string, not a list: AdminPanel renders detail as it arrives.
        extra = len(problems) - UPLOAD_MAX_PROBLEMS
        raise HTTPException(
            status_code=400,
            detail="Upload refused, the current table is unchanged. "
                   + "; ".join(problems[:UPLOAD_MAX_PROBLEMS])
                   + (f"; and {extra} more" if extra > 0 else ""),
        )
    current = _dataset_path(cause)
    backup = _backup_dataset(current) if current else None
    os.makedirs(DATASET_OVERLAY_DIR, exist_ok=True)
    dest = os.path.join(DATASET_OVERLAY_DIR, f"{cause}{DATASET_SUFFIX}")
    # /export/csv serves this file as is, so an Excel BOM stops here.
    _write_atomic(dest, contents.removeprefix(codecs.BOM_UTF8))
    # Cleared only after the write, so a failed upload leaves the delete in force.
    tombstone = os.path.join(DATASET_OVERLAY_DIR, f"{cause}.deleted")
    if os.path.exists(tombstone):
        os.remove(tombstone)
    _TABLE_CACHE.pop(dest, None)
    _audit("upload", f"datasets/{cause}",
           f"Uploaded {file.filename} ({len(contents)} bytes)"
           + (f", previous version kept as {backup}" if backup else ""),
           user, request)
    return {"ok": True, "cause": cause, "rows": len(VALID_COUNTIES), "backup": backup}


@app.delete("/admin/datasets/{cause}")
def delete_dataset(cause: str, request: Request, user=Depends(require_admin)):
    _validate_cause(cause)
    fpath = _dataset_path(cause)
    if not fpath:
        raise HTTPException(status_code=404, detail="Dataset not found")
    backup = _backup_dataset(fpath)
    # The tombstone goes first: it alone hides the table, and removing the
    # overlay copy afterwards only tidies up.
    os.makedirs(DATASET_OVERLAY_DIR, exist_ok=True)
    with open(os.path.join(DATASET_OVERLAY_DIR, f"{cause}.deleted"), "w"):
        pass
    overlay = os.path.join(DATASET_OVERLAY_DIR, f"{cause}{DATASET_SUFFIX}")
    if os.path.exists(overlay):
        os.remove(overlay)
    _TABLE_CACHE.pop(overlay, None)
    _audit("delete", f"datasets/{cause}",
           "Deleted dataset" + (f", kept as {backup}" if backup else ""), user, request)
    return {"ok": True, "backup": backup}


# ── Admin: User management ────────────────────────────────────

@app.get("/admin/users")
def list_users_admin(user=Depends(require_admin)):
    return [{k: v for k, v in u.items() if k != "password_hash"} for u in load_users()]


@app.post("/admin/users")
def create_user(body: UserCreate, request: Request, user=Depends(require_admin)):
    new_user = {
        "id": str(uuid.uuid4()),
        "username": body.username,
        "password_hash": hash_password(body.password),
        "role": body.role,
        "name": body.name,
        "token_version": 0,
        "created_at": datetime.now(timezone.utc).isoformat(),
    }

    # The uniqueness check and the append happen under one lock. Done as a
    # load, edit, save the two could interleave and admit a duplicate.
    def _add(users: list) -> None:
        if any(u["username"] == body.username for u in users):
            raise HTTPException(status_code=409, detail="Username already exists")
        users.append(new_user)

    update_users(_add)
    _audit("create", f"users/{new_user['id']}", f"Created user {body.username} ({body.role})", user, request)
    return {k: v for k, v in new_user.items() if k != "password_hash"}


@app.put("/admin/users/{user_id}")
def update_user(user_id: str, body: UserUpdate, request: Request, user=Depends(require_admin)):
    def _edit(users: list) -> dict:
        idx = next((i for i, u in enumerate(users) if u["id"] == user_id), None)
        if idx is None:
            raise HTTPException(status_code=404, detail="User not found")
        if body.name is not None:
            users[idx]["name"] = body.name
        if body.role is not None or body.password is not None:
            # Invalidate all existing sessions for this user
            users[idx]["token_version"] = users[idx].get("token_version", 0) + 1
        if body.role is not None:
            users[idx]["role"] = body.role
        if body.password is not None:
            users[idx]["password_hash"] = hash_password(body.password)
        return dict(users[idx])

    updated = update_users(_edit)
    _audit("update", f"users/{user_id}", f"Updated user {updated['username']}", user, request)
    return {k: v for k, v in updated.items() if k != "password_hash"}


@app.delete("/admin/users/{user_id}")
def delete_user(user_id: str, request: Request, user=Depends(require_admin)):
    # Compare against "id" as well as "sub": the bypassed auth user carries
    # "id", so the self-delete guard never fired.
    if user_id in {user.get("sub"), user.get("id")}:
        raise HTTPException(status_code=400, detail="Cannot delete your own account")

    def _remove(users: list) -> dict:
        target = next((u for u in users if u["id"] == user_id), None)
        if not target:
            raise HTTPException(status_code=404, detail="User not found")
        users[:] = [u for u in users if u["id"] != user_id]
        return target

    target = update_users(_remove)
    _audit("delete", f"users/{user_id}", f"Deleted user {target['username']}", user, request)
    return {"ok": True}


# ── Admin: Audit log ──────────────────────────────────────────

@app.get("/admin/audit")
def get_audit(limit: int = 100, offset: int = 0, user=Depends(require_admin)):
    if limit > 500:
        limit = 500
    entries = []
    if os.path.exists(AUDIT_FILE):
        try:
            with portalocker.Lock(AUDIT_FILE, "r", timeout=5) as f:
                entries = [json.loads(line) for line in f if line.strip()]
        except Exception as e:
            logger.error("Failed to read audit log: %s", e)
    entries_sorted = sorted(entries, key=lambda e: e["timestamp"], reverse=True)
    return {"total": len(entries_sorted), "entries": entries_sorted[offset: offset + limit]}


# ── SPA fallback ──────────────────────────────────────────────

_ui_dir = os.path.join(os.path.dirname(__file__), "ui")
_index = os.path.join(_ui_dir, "index.html")


def _mount_ui_assets(target: FastAPI, ui_dir: str) -> bool:
    """
    Mount the built bundle if there is one. StaticFiles raises when its
    directory is missing, so a ui/ without assets/ (an interrupted copy, say)
    used to stop the whole API from importing.
    """
    assets_dir = os.path.join(ui_dir, "assets")
    if not os.path.isdir(assets_dir):
        return False
    target.mount("/assets", StaticFiles(directory=assets_dir), name="assets")
    return True


_mount_ui_assets(app, _ui_dir)


# The SPA's own routes, as declared in frontend/src/App.tsx. A page load or a
# refresh on any of these has to return index.html so the client router can
# take over. Note that "admin" is both a client route (/admin) and an API
# namespace (/admin/users); the real API routes are matched before this
# fallback is ever reached, so only the bare client route arrives here.
_SPA_ROUTES = frozenset({
    "", "map", "insights", "scorecard", "priority", "pulse", "providers", "access",
    "admin",
})
# The only client route that carries a parameter.
_SPA_ROUTE_PREFIXES = ("county/",)


def _allowed_methods(scope) -> set:
    """Methods of the real routes at this path, empty if the path is unknown."""
    allowed = set()
    for route in app.routes:
        if isinstance(route, APIRoute) and route.matches(scope)[0] == Match.PARTIAL:
            allowed |= route.methods
    return allowed


# Every method, because a GET-only catch-all made the router answer 405 for a
# POST to a path that does not exist.
@app.api_route(
    "/{full_path:path}",
    methods=["GET", "HEAD", "POST", "PUT", "PATCH", "DELETE", "OPTIONS"],
    include_in_schema=False,
)
async def spa_fallback(full_path: str, request: Request):
    """
    Serve the SPA for client-side routes, and refuse anything API-shaped.

    Returning index.html with a 200 for an unknown API path is how a
    misconfigured API_BASE stayed invisible: the frontend called /api/meta, got
    HTML and a 200, and quietly rendered empty panels instead of failing. An
    XHR asks for JSON, so it gets a JSON 404; a browser navigation asks for
    HTML, so it gets the app.

    Only a read can be answered with the page. Any other method gets 404, or
    405 where the path is real and only the method is wrong.
    """
    if request.method != "GET":
        allowed = _allowed_methods(request.scope)
        if allowed:
            raise HTTPException(
                status_code=405,
                detail="Method Not Allowed",
                headers={"Allow": ", ".join(sorted(allowed))},
            )
    if request.method not in ("GET", "HEAD"):
        raise HTTPException(status_code=404, detail=f"No such endpoint: /{full_path}")

    path = full_path.strip("/").lower()
    accept = request.headers.get("accept", "")

    # Nothing legitimately lives under /api. Always refuse, so a bad API_BASE
    # fails loudly rather than being answered with the page itself.
    if path == "api" or path.startswith("api/"):
        raise HTTPException(status_code=404, detail=f"No such endpoint: /{full_path}")

    # Matched exactly, not by first segment: /admin is a client route but
    # /admin/anything belongs to the admin API, and answering an unknown one
    # with the page would hide the error from the caller.
    is_client_route = path in _SPA_ROUTES or path.startswith(_SPA_ROUTE_PREFIXES)
    wants_html = "text/html" in accept

    if not is_client_route and not wants_html:
        raise HTTPException(status_code=404, detail=f"No such endpoint: /{full_path}")

    if os.path.isfile(_index):
        return FileResponse(_index)
    raise HTTPException(status_code=503, detail="UI not built. Run npm run build in app/frontend.")
