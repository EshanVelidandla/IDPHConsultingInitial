import io
import logging
import os
import re
import uuid
from datetime import datetime
from typing import Optional

import pandas as pd
from fastapi import FastAPI, Depends, HTTPException, Request, UploadFile, File
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import FileResponse, JSONResponse
from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials
from pydantic import BaseModel, field_validator
from starlette.middleware.base import BaseHTTPMiddleware
from starlette.responses import Response

from auth import (
    authenticate_user, create_token, decode_token,
    load_users, save_users, hash_password, is_rate_limited,
)
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

UPLOAD_MAX_BYTES = 20 * 1024 * 1024  # 20 MB

# ── App setup ─────────────────────────────────────────────────

app = FastAPI(docs_url=None, redoc_url=None)  # Disable API docs in production

# CORS — restrict to configured origins; defaults to localhost only
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
        return response


app.add_middleware(SecurityHeadersMiddleware)

data_dir = os.path.join(os.path.dirname(__file__), "static")
death_rates_dir = os.path.join(data_dir, "death_rate_tables")
provider_dir = os.path.join(data_dir, "provider_tables")
os.makedirs(death_rates_dir, exist_ok=True)
os.makedirs(provider_dir, exist_ok=True)

# ── Auth helpers ──────────────────────────────────────────────

_bearer = HTTPBearer(auto_error=False)


def get_current_user(creds: HTTPAuthorizationCredentials = Depends(_bearer)):
    if not creds:
        raise HTTPException(status_code=401, detail="Not authenticated")
    user = decode_token(creds.credentials)
    if not user:
        raise HTTPException(status_code=401, detail="Invalid or expired token")
    return user


def require_admin(user=Depends(get_current_user)):
    if user.get("role") != "admin":
        raise HTTPException(status_code=403, detail="Admin access required")
    return user


def require_editor(user=Depends(get_current_user)):
    if user.get("role") not in ("admin", "editor"):
        raise HTTPException(status_code=403, detail="Editor access required")
    return user


def _audit(action: str, resource: str, detail: str, user: dict, request: Optional[Request] = None):
    log = storage.load("audit", [])
    log.append({
        "id": str(uuid.uuid4()),
        "user": user.get("username", "unknown"),
        "action": action,
        "resource": resource,
        "detail": detail,
        "timestamp": datetime.utcnow().isoformat() + "Z",
        "ip": request.client.host if request and request.client else None,
    })
    storage.save("audit", log[-500:])


def _validate_cause(cause: str) -> str:
    if cause not in VALID_CAUSES:
        raise HTTPException(status_code=400, detail=f"Unknown cause: {cause}")
    return cause


# ── Pydantic models ───────────────────────────────────────────

class LoginRequest(BaseModel):
    username: str
    password: str

    @field_validator("username")
    @classmethod
    def no_whitespace(cls, v: str) -> str:
        if not re.match(r"^[a-zA-Z0-9_\-\.]{1,64}$", v):
            raise ValueError("Invalid username format")
        return v


class AnnotationCreate(BaseModel):
    county: str
    cause: Optional[str] = None
    text: str
    type: str = "info"

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
        return v[:1000]  # cap at 1000 chars


class AnnotationUpdate(BaseModel):
    text: Optional[str] = None
    type: Optional[str] = None

    @field_validator("type")
    @classmethod
    def valid_type(cls, v: Optional[str]) -> Optional[str]:
        if v is not None and v not in ("info", "warning", "intervention"):
            raise ValueError("type must be info, warning, or intervention")
        return v


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
    def min_length(cls, v: str) -> str:
        if len(v) < 8:
            raise ValueError("Password must be at least 8 characters")
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
    def min_length(cls, v: Optional[str]) -> Optional[str]:
        if v is not None and len(v) < 8:
            raise ValueError("Password must be at least 8 characters")
        return v


# ── Auth endpoints ────────────────────────────────────────────

@app.post("/auth/login")
def login(body: LoginRequest, request: Request):
    if is_rate_limited(body.username):
        raise HTTPException(status_code=429, detail="Too many failed attempts — try again later")
    user = authenticate_user(body.username, body.password)
    if not user:
        # Uniform response to prevent username enumeration
        raise HTTPException(status_code=401, detail="Invalid credentials")
    token = create_token({
        "sub": user["id"],
        "username": user["username"],
        "role": user["role"],
        "name": user["name"],
    })
    _audit("login", "auth", "Successful login", user, request)
    return {"access_token": token, "token_type": "bearer", "user": user}


@app.get("/auth/me")
def me(user=Depends(get_current_user)):
    return user


# ── Data endpoints (auth required) ───────────────────────────

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
        df = pd.read_csv(file_path, na_values=["", " "])
        return JSONResponse(content=df.fillna(0).to_dict(orient="records"))
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
        df = pd.read_csv(file_path, na_values=["", " "])
        return JSONResponse(content=df.fillna(0).to_dict(orient="records"))
    except Exception as e:
        logger.error("Error reading provider metric %s: %s", metric, e)
        raise HTTPException(status_code=500, detail="Failed to read data")


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
    annotations = storage.load("annotations", [])
    entry = {
        "id": str(uuid.uuid4()),
        "county": body.county,
        "cause": body.cause,
        "text": body.text,
        "type": body.type,
        "created_by": user["username"],
        "created_at": datetime.utcnow().isoformat() + "Z",
        "updated_at": datetime.utcnow().isoformat() + "Z",
    }
    annotations.append(entry)
    storage.save("annotations", annotations)
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
    annotations = storage.load("annotations", [])
    idx = next((i for i, a in enumerate(annotations) if a["id"] == annotation_id), None)
    if idx is None:
        raise HTTPException(status_code=404, detail="Annotation not found")
    if body.text is not None:
        annotations[idx]["text"] = body.text[:1000]
    if body.type is not None:
        annotations[idx]["type"] = body.type
    annotations[idx]["updated_at"] = datetime.utcnow().isoformat() + "Z"
    storage.save("annotations", annotations)
    _audit("update", f"annotations/{annotation_id}", "Updated annotation", user, request)
    return annotations[idx]


@app.delete("/annotations/{annotation_id}")
def delete_annotation(annotation_id: str, request: Request, user=Depends(get_current_user)):
    if user.get("role") not in ("admin", "editor"):
        raise HTTPException(status_code=403, detail="Editor access required")
    annotations = storage.load("annotations", [])
    before = len(annotations)
    annotations = [a for a in annotations if a["id"] != annotation_id]
    if len(annotations) == before:
        raise HTTPException(status_code=404, detail="Annotation not found")
    storage.save("annotations", annotations)
    _audit("delete", f"annotations/{annotation_id}", "Deleted annotation", user, request)
    return {"ok": True}


# ── Thresholds ────────────────────────────────────────────────

@app.get("/thresholds")
def list_thresholds(user=Depends(get_current_user)):
    return storage.load("thresholds", [])


@app.post("/thresholds")
def upsert_threshold(body: ThresholdUpsert, request: Request, user=Depends(require_admin)):
    _validate_cause(body.cause)
    thresholds = storage.load("thresholds", [])
    existing = next((t for t in thresholds if t["cause"] == body.cause), None)
    now = datetime.utcnow().isoformat() + "Z"
    if existing:
        existing.update(rate=body.rate, notify_email=body.notify_email, updated_at=now)
    else:
        thresholds.append({
            "id": str(uuid.uuid4()),
            "cause": body.cause,
            "rate": body.rate,
            "notify_email": body.notify_email,
            "created_by": user["username"],
            "created_at": now,
            "updated_at": now,
        })
    storage.save("thresholds", thresholds)
    _audit("upsert", f"thresholds/{body.cause}", f"Set threshold {body.rate}", user, request)
    return thresholds


@app.delete("/thresholds/{cause}")
def delete_threshold(cause: str, request: Request, user=Depends(require_admin)):
    _validate_cause(cause)
    thresholds = storage.load("thresholds", [])
    before = len(thresholds)
    thresholds = [t for t in thresholds if t["cause"] != cause]
    if len(thresholds) == before:
        raise HTTPException(status_code=404, detail="Threshold not found")
    storage.save("thresholds", thresholds)
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
    presets = storage.load("presets", [])
    entry = {
        "id": str(uuid.uuid4()),
        "name": body.name,
        "cause": body.cause,
        "year": body.year,
        "district": body.district,
        "is_public": body.is_public,
        "created_by": user["username"],
        "created_at": datetime.utcnow().isoformat() + "Z",
    }
    presets.append(entry)
    storage.save("presets", presets)
    _audit("create", f"presets/{entry['id']}", f"Created preset '{body.name}'", user, request)
    return entry


@app.delete("/presets/{preset_id}")
def delete_preset(preset_id: str, request: Request, user=Depends(get_current_user)):
    presets = storage.load("presets", [])
    target = next((p for p in presets if p["id"] == preset_id), None)
    if not target:
        raise HTTPException(status_code=404, detail="Preset not found")
    if target["created_by"] != user["username"] and user.get("role") != "admin":
        raise HTTPException(status_code=403, detail="Cannot delete another user's preset")
    presets = [p for p in presets if p["id"] != preset_id]
    storage.save("presets", presets)
    _audit("delete", f"presets/{preset_id}", f"Deleted preset '{target['name']}'", user, request)
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
    with open(dest, "wb") as f:
        f.write(contents)
    _audit("upload", f"datasets/{cause}", f"Uploaded {file.filename} ({len(contents)} bytes)", user, request)
    return {"ok": True, "cause": cause, "rows": len(df)}


@app.delete("/admin/datasets/{cause}")
def delete_dataset(cause: str, request: Request, user=Depends(require_admin)):
    _validate_cause(cause)
    fpath = os.path.join(death_rates_dir, f"{cause}_death_rates_by_county_year.csv")
    if not os.path.exists(fpath):
        raise HTTPException(status_code=404, detail="Dataset not found")
    os.remove(fpath)
    _audit("delete", f"datasets/{cause}", "Deleted dataset", user, request)
    return {"ok": True}


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
        "created_at": datetime.utcnow().isoformat() + "Z",
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
    log = storage.load("audit", [])
    log_sorted = sorted(log, key=lambda e: e["timestamp"], reverse=True)
    return {"total": len(log_sorted), "entries": log_sorted[offset: offset + limit]}


from fastapi.staticfiles import StaticFiles

_ui_dir = os.path.join(os.path.dirname(__file__), "static", "ui")
if os.path.isdir(_ui_dir):
    app.mount("/", StaticFiles(directory=_ui_dir, html=True), name="ui")
