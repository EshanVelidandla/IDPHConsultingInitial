from datetime import datetime, timedelta
from typing import Optional, Dict, Any
import json
import os
import hashlib
import secrets

from jose import JWTError, jwt

SECRET_KEY = os.environ.get("JWT_SECRET", "idph-analytics-key-2024-change-in-prod")
ALGORITHM = "HS256"
TOKEN_EXPIRE_HOURS = 8

DATA_DIR = os.path.dirname(os.path.abspath(__file__))
USERS_FILE = os.path.join(DATA_DIR, "users.json")


def hash_password(password: str, salt: Optional[str] = None) -> str:
    if salt is None:
        salt = secrets.token_hex(16)
    h = hashlib.sha256(f"{salt}:{password}".encode()).hexdigest()
    return f"{salt}:{h}"


def verify_password(password: str, stored: str) -> bool:
    try:
        salt = stored.split(":", 1)[0]
        return hash_password(password, salt) == stored
    except Exception:
        return False


def load_users() -> list:
    if not os.path.exists(USERS_FILE):
        initial = [
            {
                "id": "1",
                "username": "admin",
                "password_hash": hash_password("idph2024"),
                "role": "admin",
                "name": "IDPH Admin",
                "created_at": datetime.utcnow().isoformat() + "Z",
            },
            {
                "id": "2",
                "username": "viewer",
                "password_hash": hash_password("viewer123"),
                "role": "viewer",
                "name": "Read-Only User",
                "created_at": datetime.utcnow().isoformat() + "Z",
            },
        ]
        with open(USERS_FILE, "w") as f:
            json.dump(initial, f, indent=2)
        return initial
    with open(USERS_FILE) as f:
        return json.load(f)


def save_users(users: list) -> None:
    with open(USERS_FILE, "w") as f:
        json.dump(users, f, indent=2)


def authenticate_user(username: str, password: str) -> Optional[Dict[str, Any]]:
    user = next((u for u in load_users() if u["username"] == username), None)
    if not user or not verify_password(password, user["password_hash"]):
        return None
    return {k: v for k, v in user.items() if k != "password_hash"}


def create_token(data: dict) -> str:
    payload = data.copy()
    payload["exp"] = datetime.utcnow() + timedelta(hours=TOKEN_EXPIRE_HOURS)
    return jwt.encode(payload, SECRET_KEY, algorithm=ALGORITHM)


def decode_token(token: str) -> Optional[Dict[str, Any]]:
    try:
        return jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
    except JWTError:
        return None
