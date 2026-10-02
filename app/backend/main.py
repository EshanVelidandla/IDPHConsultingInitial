import io
import json
import logging
import os
import re
import uuid
from datetime import datetime, timezone
from typing import Optional

import pandas as pd
import portalocker
from fastapi import FastAPI, Depends, HTTPException, Request, UploadFile, File
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import FileResponse, JSONResponse
from fastapi.staticfiles import StaticFiles
from pydantic import BaseModel, field_validator
from starlette.middleware.base import BaseHTTPMiddleware
from starlette.responses import Response

from auth import load_users, save_users, hash_password
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

# ── County allowlist (loaded from GeoJSON at startup) ─────────

def _load_county_names() -> dict:
    """
    Map lowercased county name -> the canonical spelling used in the data.

    The allowlist used to be built from the GeoJSON's uppercase names plus
    their .title() form, so "DUPAGE".title() gave "Dupage" and the real data
    name "DuPage" was rejected with a 422. Ten counties failed that way,
    including DuPage, McHenry, McLean, DeKalb, LaSalle, Chicago and
    Suburban Cook. Building from the death rate table instead means the
    allowlist is exactly the set of names the rest of the app uses, and
    lookups are case-insensitive so the UI and the data cannot drift apart.
    """
    names: set[str] = set()
    tables = os.path.join(os.path.dirname(__file__), "static", "death_rate_tables")
    try:
        any_table = next(f for f in sorted(os.listdir(tables)) if f.endswith(".csv"))
        names.update(pd.read_csv(os.path.join(tables, any_table), usecols=["County"])["County"])
    except Exception as e:
        logger.warning("Could not load county names from the rate tables: %s", e)

    geo_path = os.path.join(os.path.dirname(__file__), "static", "illinois-counties.geojson")
    try:
        with open(geo_path) as f:
            geo = json.load(f)
        names.update(feat["properties"]["COUNTY_NAM"] for feat in geo["features"])
    except Exception as e:
        logger.warning("Could not load county allowlist from GeoJSON: %s", e)

    canonical: dict[str, str] = {}
    for name in names:
        # A name from the rate tables wins over the GeoJSON's uppercase form.
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

AUDIT_FILE = os.path.join(os.path.dirname(__file__), "var", "audit.jsonl")

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

# ── Auth (bypassed — every request is treated as the built-in admin) ──

_EMAIL_RE = re.compile(r"^[^@\s]+@[^@\s]+\.[^@\s]+$")
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


DATASET_BACKUP_DIR = os.path.join(os.path.dirname(__file__), "var", "dataset_backups")


def _backup_dataset(path: str) -> Optional[str]:
    """
    Copy a pipeline table aside before an admin overwrites or deletes it.

    Uploads used to replace the committed CSV in place with no way back, so a
    bad file meant re-running the pipeline to recover. Backups live under var/
    so they are never served and never committed.
    """
    if not os.path.exists(path):
        return None
    os.makedirs(DATASET_BACKUP_DIR, exist_ok=True)
    stamp = datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%SZ")
    name = f"{os.path.basename(path).removesuffix('.csv')}.{stamp}.csv"
    with open(path, "rb") as src, open(os.path.join(DATASET_BACKUP_DIR, name), "wb") as dst:
        dst.write(src.read())
    return name


def _records(df: pd.DataFrame) -> list[dict]:
    """DataFrame -> JSON records with NaN as null rather than 0 or NaN."""
    return json.loads(df.to_json(orient="records"))


def _validate_cause(cause: str) -> str:
    if cause not in VALID_CAUSES:
        raise HTTPException(status_code=400, detail=f"Unknown cause: {cause}")
    return cause


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
    notify_email: Optional[str] = None

    @field_validator("rate")
    @classmethod
    def positive_rate(cls, v: float) -> float:
        if v <= 0:
            raise ValueError("rate must be positive")
        return v

    @field_validator("notify_email")
    @classmethod
    def valid_email(cls, v: Optional[str]) -> Optional[str]:
        if v and not _EMAIL_RE.match(v):
            raise ValueError("Invalid email address")
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
        if not (2000 <= v <= 2100):
            raise ValueError("Invalid year")
        return v

    @field_validator("name")
    @classmethod
    def non_empty_name(cls, v: str) -> str:
        return v.strip()[:100]


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
    file_path = os.path.join(death_rates_dir, f"{cause}_death_rates_by_county_year.csv")
    if not os.path.exists(file_path):
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
    2009-2022 sliders while the data starts at 2008.
    """
    year_min, year_max = None, None
    for fname in sorted(os.listdir(death_rates_dir)):
        if not fname.endswith(".csv"):
            continue
        try:
            df = _read_table(os.path.join(death_rates_dir, fname))
            year_cols = [int(c) for c in df.columns if re.fullmatch(r"\d{4}", c)]
            if year_cols:
                year_min, year_max = min(year_cols), max(year_cols)
                break
        except Exception:
            continue

    causes = sorted(
        f.removesuffix("_death_rates_by_county_year.csv")
        for f in os.listdir(death_rates_dir)
        if f.endswith("_death_rates_by_county_year.csv")
    )

    return {
        "year_min": year_min or 2008,
        "year_max": year_max or 2022,
        "counties": sorted(VALID_COUNTIES),
        "available_causes": causes,
        # The pipeline computes deaths / population x 100,000. The IDPH county
        # reports publish totals with no age breakdown, so age standardisation
        # is not possible from this source and the UI must not claim it.
        "rate_basis": "crude",
        "rate_label": "Crude rate per 100,000",
        "rate_note": (
            "Crude rates, not age-adjusted. Counties with older populations "
            "will show higher rates partly because of age."
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
    file_path = os.path.join(death_rates_dir, f"{cause}_death_rates_by_county_year.csv")
    if not os.path.exists(file_path):
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

@app.get("/thresholds")
def list_thresholds(user=Depends(get_current_user)):
    return storage.load("thresholds", [])


@app.post("/thresholds")
def upsert_threshold(body: ThresholdUpsert, request: Request, user=Depends(require_admin)):
    _validate_cause(body.cause)
    now = datetime.now(timezone.utc).isoformat()
    result = {}

    def _upsert(data):
        existing = next((t for t in data if t["cause"] == body.cause), None)
        if existing:
            existing.update(rate=body.rate, notify_email=body.notify_email, updated_at=now)
        else:
            data.append({
                "id": str(uuid.uuid4()),
                "cause": body.cause,
                "rate": body.rate,
                "notify_email": body.notify_email,
                "created_by": user["username"],
                "created_at": now,
                "updated_at": now,
            })
        result["thresholds"] = list(data)

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
    for fname in os.listdir(death_rates_dir):
        if not fname.endswith(".csv"):
            continue
        fpath = os.path.join(death_rates_dir, fname)
        stat = os.stat(fpath)
        cause = fname.replace("_death_rates_by_county_year.csv", "")
        files.append({
            "cause": cause,
            "filename": fname,
            "size_kb": round(stat.st_size / 1024, 1),
            "modified": datetime.fromtimestamp(stat.st_mtime).isoformat() + "Z",
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
    try:
        df = pd.read_csv(io.BytesIO(contents))
        if "County" not in df.columns:
            raise HTTPException(status_code=400, detail="CSV must contain a 'County' column")
    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(status_code=400, detail=f"Invalid CSV: {e}")
    dest = os.path.join(death_rates_dir, f"{cause}_death_rates_by_county_year.csv")
    backup = _backup_dataset(dest)
    with open(dest, "wb") as f:
        f.write(contents)
    _TABLE_CACHE.pop(dest, None)
    _audit("upload", f"datasets/{cause}",
           f"Uploaded {file.filename} ({len(contents)} bytes)"
           + (f", previous version kept as {backup}" if backup else ""),
           user, request)
    return {"ok": True, "cause": cause, "rows": len(df), "backup": backup}


@app.delete("/admin/datasets/{cause}")
def delete_dataset(cause: str, request: Request, user=Depends(require_admin)):
    _validate_cause(cause)
    fpath = os.path.join(death_rates_dir, f"{cause}_death_rates_by_county_year.csv")
    if not os.path.exists(fpath):
        raise HTTPException(status_code=404, detail="Dataset not found")
    backup = _backup_dataset(fpath)
    os.remove(fpath)
    _TABLE_CACHE.pop(fpath, None)
    _audit("delete", f"datasets/{cause}",
           "Deleted dataset" + (f", kept as {backup}" if backup else ""), user, request)
    return {"ok": True, "backup": backup}


# ── Admin: User management ────────────────────────────────────

@app.get("/admin/users")
def list_users_admin(user=Depends(require_admin)):
    return [{k: v for k, v in u.items() if k != "password_hash"} for u in load_users()]


@app.post("/admin/users")
def create_user(body: UserCreate, request: Request, user=Depends(require_admin)):
    users = load_users()
    if any(u["username"] == body.username for u in users):
        raise HTTPException(status_code=409, detail="Username already exists")
    new_user = {
        "id": str(uuid.uuid4()),
        "username": body.username,
        "password_hash": hash_password(body.password),
        "role": body.role,
        "name": body.name,
        "token_version": 0,
        "created_at": datetime.now(timezone.utc).isoformat(),
    }
    users.append(new_user)
    save_users(users)
    _audit("create", f"users/{new_user['id']}", f"Created user {body.username} ({body.role})", user, request)
    return {k: v for k, v in new_user.items() if k != "password_hash"}


@app.put("/admin/users/{user_id}")
def update_user(user_id: str, body: UserUpdate, request: Request, user=Depends(require_admin)):
    users = load_users()
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
    save_users(users)
    _audit("update", f"users/{user_id}", f"Updated user {users[idx]['username']}", user, request)
    return {k: v for k, v in users[idx].items() if k != "password_hash"}


@app.delete("/admin/users/{user_id}")
def delete_user(user_id: str, request: Request, user=Depends(require_admin)):
    if user_id == user.get("sub"):
        raise HTTPException(status_code=400, detail="Cannot delete your own account")
    users = load_users()
    target = next((u for u in users if u["id"] == user_id), None)
    if not target:
        raise HTTPException(status_code=404, detail="User not found")
    users = [u for u in users if u["id"] != user_id]
    save_users(users)
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

if os.path.isdir(_ui_dir):
    app.mount("/assets", StaticFiles(directory=os.path.join(_ui_dir, "assets")), name="assets")


# The SPA's own routes, as declared in frontend/src/App.tsx. A page load or a
# refresh on any of these has to return index.html so the client router can
# take over. Note that "admin" is both a client route (/admin) and an API
# namespace (/admin/users); the real API routes are matched before this
# fallback is ever reached, so only the bare client route arrives here.
_SPA_ROUTES = frozenset({
    "", "insights", "scorecard", "priority", "pulse", "providers", "access",
    "admin",
})
# The only client route that carries a parameter.
_SPA_ROUTE_PREFIXES = ("county/",)


@app.get("/{full_path:path}", include_in_schema=False)
async def spa_fallback(full_path: str, request: Request):
    """
    Serve the SPA for client-side routes, and refuse anything API-shaped.

    Returning index.html with a 200 for an unknown API path is how a
    misconfigured API_BASE stayed invisible: the frontend called /api/meta, got
    HTML and a 200, and quietly rendered empty panels instead of failing. An
    XHR asks for JSON, so it gets a JSON 404; a browser navigation asks for
    HTML, so it gets the app.
    """
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
