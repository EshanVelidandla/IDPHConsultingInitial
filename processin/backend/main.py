from fastapi import FastAPI, Depends, HTTPException, UploadFile, File, Request
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import FileResponse, JSONResponse, StreamingResponse
from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials
import pandas as pd
import os
import uuid
import io
from datetime import datetime
from typing import Optional
from pydantic import BaseModel

from auth import (
    authenticate_user, create_token, decode_token,
    load_users, save_users, hash_password,
)
import storage

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

data_dir = os.path.join(os.path.dirname(__file__), "static")
death_rates_dir = os.path.join(data_dir, "death_rate_tables")
os.makedirs(death_rates_dir, exist_ok=True)

# ── Auth helpers ─────────────────────────────────────────────

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
    storage.save("audit", log[-500:])  # keep last 500 entries


# ── Pydantic models ──────────────────────────────────────────

class LoginRequest(BaseModel):
    username: str
    password: str


class AnnotationCreate(BaseModel):
    county: str
    cause: Optional[str] = None
    text: str
    type: str = "info"  # info | warning | intervention


class AnnotationUpdate(BaseModel):
    text: Optional[str] = None
    type: Optional[str] = None


class ThresholdUpsert(BaseModel):
    cause: str
    rate: float
    notify_email: Optional[str] = None


class PresetCreate(BaseModel):
    name: str
    cause: str
    year: int
    district: Optional[int] = None
    is_public: bool = True


class UserCreate(BaseModel):
    username: str
    name: str
    role: str
    password: str


class UserUpdate(BaseModel):
    name: Optional[str] = None
    role: Optional[str] = None
    password: Optional[str] = None


# ── Auth endpoints ───────────────────────────────────────────

@app.post("/auth/login")
def login(body: LoginRequest, request: Request):
    user = authenticate_user(body.username, body.password)
    if not user:
        raise HTTPException(status_code=401, detail="Invalid credentials")
    token = create_token({"sub": user["id"], "username": user["username"], "role": user["role"], "name": user["name"]})
    _audit("login", "auth", f"Successful login", user, request)
    return {"access_token": token, "token_type": "bearer", "user": user}


@app.get("/auth/me")
def me(user=Depends(get_current_user)):
    return user


# ── Data endpoints (auth required) ──────────────────────────

@app.get("/geojson")
def get_geojson(user=Depends(get_current_user)):
    geojson_path = os.path.join(data_dir, "illinois-counties.geojson")
    if os.path.exists(geojson_path):
        return FileResponse(geojson_path)
    return JSONResponse(status_code=404, content={"error": "GeoJSON not found"})


@app.get("/death_rates")
def get_death_rates(cause: str, user=Depends(get_current_user)):
    file_path = os.path.join(death_rates_dir, f"{cause}_death_rates_by_county_year.csv")
    if not os.path.exists(file_path):
        return JSONResponse(status_code=404, content={"error": f"Data not found for cause: {cause}"})
    try:
        df = pd.read_csv(file_path, na_values=["", " "])
        return JSONResponse(content=df.fillna(0).to_dict(orient="records"))
    except Exception as e:
        return JSONResponse(status_code=500, content={"error": str(e)})


# ── Export ───────────────────────────────────────────────────

@app.get("/export/csv")
def export_csv(cause: str, request: Request, user=Depends(get_current_user)):
    file_path = os.path.join(death_rates_dir, f"{cause}_death_rates_by_county_year.csv")
    if not os.path.exists(file_path):
        raise HTTPException(status_code=404, detail="Dataset not found")
    _audit("export", f"datasets/{cause}", f"CSV export requested", user, request)
    return FileResponse(
        file_path,
        media_type="text/csv",
        filename=f"idph_{cause}_death_rates.csv",
    )


# ── Annotations ──────────────────────────────────────────────

@app.get("/annotations")
def list_annotations(user=Depends(get_current_user)):
    return storage.load("annotations", [])


@app.post("/annotations")
def create_annotation(body: AnnotationCreate, request: Request, user=Depends(get_current_user)):
    if user.get("role") not in ("admin", "editor"):
        raise HTTPException(status_code=403, detail="Editor access required")
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
def update_annotation(annotation_id: str, body: AnnotationUpdate, request: Request, user=Depends(get_current_user)):
    if user.get("role") not in ("admin", "editor"):
        raise HTTPException(status_code=403, detail="Editor access required")
    annotations = storage.load("annotations", [])
    idx = next((i for i, a in enumerate(annotations) if a["id"] == annotation_id), None)
    if idx is None:
        raise HTTPException(status_code=404, detail="Annotation not found")
    if body.text is not None:
        annotations[idx]["text"] = body.text
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


# ── Thresholds ───────────────────────────────────────────────

@app.get("/thresholds")
def list_thresholds(user=Depends(get_current_user)):
    return storage.load("thresholds", [])


@app.post("/thresholds")
def upsert_threshold(body: ThresholdUpsert, request: Request, user=Depends(require_admin)):
    thresholds = storage.load("thresholds", [])
    existing = next((t for t in thresholds if t["cause"] == body.cause), None)
    if existing:
        existing["rate"] = body.rate
        existing["notify_email"] = body.notify_email
        existing["updated_at"] = datetime.utcnow().isoformat() + "Z"
    else:
        thresholds.append({
            "id": str(uuid.uuid4()),
            "cause": body.cause,
            "rate": body.rate,
            "notify_email": body.notify_email,
            "created_by": user["username"],
            "created_at": datetime.utcnow().isoformat() + "Z",
            "updated_at": datetime.utcnow().isoformat() + "Z",
        })
    storage.save("thresholds", thresholds)
    _audit("upsert", f"thresholds/{body.cause}", f"Set threshold {body.rate}", user, request)
    return thresholds


@app.delete("/thresholds/{cause}")
def delete_threshold(cause: str, request: Request, user=Depends(require_admin)):
    thresholds = storage.load("thresholds", [])
    before = len(thresholds)
    thresholds = [t for t in thresholds if t["cause"] != cause]
    if len(thresholds) == before:
        raise HTTPException(status_code=404, detail="Threshold not found")
    storage.save("thresholds", thresholds)
    _audit("delete", f"thresholds/{cause}", "Removed threshold", user, request)
    return {"ok": True}


# ── Presets ──────────────────────────────────────────────────

@app.get("/presets")
def list_presets(user=Depends(get_current_user)):
    all_presets = storage.load("presets", [])
    return [p for p in all_presets if p.get("is_public") or p.get("created_by") == user["username"]]


@app.post("/presets")
def create_preset(body: PresetCreate, request: Request, user=Depends(get_current_user)):
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


# ── Admin: Dataset management ────────────────────────────────

@app.get("/admin/datasets")
def list_datasets(user=Depends(require_admin)):
    files = []
    if os.path.exists(death_rates_dir):
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
    file: UploadFile = File(...),
    request: Request = None,
    user=Depends(require_admin),
):
    if not file.filename.endswith(".csv"):
        raise HTTPException(status_code=400, detail="Only CSV files are accepted")
    contents = await file.read()
    # Validate it's parseable and has a County column
    try:
        df = pd.read_csv(io.BytesIO(contents))
        if "County" not in df.columns:
            raise HTTPException(status_code=400, detail="CSV must have a 'County' column")
    except Exception as e:
        raise HTTPException(status_code=400, detail=f"Invalid CSV: {e}")
    dest = os.path.join(death_rates_dir, f"{cause}_death_rates_by_county_year.csv")
    with open(dest, "wb") as f:
        f.write(contents)
    _audit("upload", f"datasets/{cause}", f"Uploaded {file.filename} ({len(contents)} bytes)", user, request)
    return {"ok": True, "cause": cause, "rows": len(df)}


@app.delete("/admin/datasets/{cause}")
def delete_dataset(cause: str, request: Request, user=Depends(require_admin)):
    fpath = os.path.join(death_rates_dir, f"{cause}_death_rates_by_county_year.csv")
    if not os.path.exists(fpath):
        raise HTTPException(status_code=404, detail="Dataset not found")
    os.remove(fpath)
    _audit("delete", f"datasets/{cause}", "Deleted dataset", user, request)
    return {"ok": True}


# ── Admin: User management ───────────────────────────────────

@app.get("/admin/users")
def list_users_admin(user=Depends(require_admin)):
    return [{k: v for k, v in u.items() if k != "password_hash"} for u in load_users()]


@app.post("/admin/users")
def create_user(body: UserCreate, request: Request, user=Depends(require_admin)):
    users = load_users()
    if any(u["username"] == body.username for u in users):
        raise HTTPException(status_code=409, detail="Username already exists")
    if body.role not in ("admin", "editor", "viewer"):
        raise HTTPException(status_code=400, detail="Role must be admin, editor, or viewer")
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
        if body.role not in ("admin", "editor", "viewer"):
            raise HTTPException(status_code=400, detail="Invalid role")
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
    before = len(users)
    target = next((u for u in users if u["id"] == user_id), None)
    if not target:
        raise HTTPException(status_code=404, detail="User not found")
    users = [u for u in users if u["id"] != user_id]
    if len(users) == before:
        raise HTTPException(status_code=404, detail="User not found")
    save_users(users)
    _audit("delete", f"users/{user_id}", f"Deleted user {target['username']}", user, request)
    return {"ok": True}


# ── Admin: Audit log ─────────────────────────────────────────

@app.get("/admin/audit")
def get_audit(
    limit: int = 100,
    offset: int = 0,
    user=Depends(require_admin),
):
    log = storage.load("audit", [])
    log_sorted = sorted(log, key=lambda e: e["timestamp"], reverse=True)
    return {
        "total": len(log_sorted),
        "entries": log_sorted[offset: offset + limit],
    }


@app.get("/")
def root():
    return {"message": "Illinois Death Data API — v2 with auth"}
