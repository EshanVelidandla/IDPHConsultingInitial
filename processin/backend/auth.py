import json
import logging
import os
import secrets
import time
from collections import defaultdict
from datetime import datetime, timedelta
from typing import Any, Dict, Optional

import bcrypt
from jose import JWTError, jwt

logger = logging.getLogger(__name__)

SECRET_KEY = os.environ.get("JWT_SECRET", "")
if not SECRET_KEY:
    raise RuntimeError(
        "JWT_SECRET environment variable is not set. "
        "Set it to a long random string before starting the server."
    )

ALGORITHM = "HS256"
TOKEN_EXPIRE_HOURS = 8
MIN_PASSWORD_LENGTH = 8

DATA_DIR = os.path.dirname(os.path.abspath(__file__))
USERS_FILE = os.path.join(DATA_DIR, "users.json")
RATE_LIMIT_FILE = os.path.join(DATA_DIR, "rate_limit.json")

_RATE_WINDOW = 300   # seconds
_MAX_FAILURES = 5

# Load persisted failure timestamps on startup, pruning anything outside the window.
def _load_failures() -> Dict[str, list]:
    if not os.path.exists(RATE_LIMIT_FILE):
        return defaultdict(list)
    try:
        now = time.time()
        with open(RATE_LIMIT_FILE) as f:
            raw = json.load(f)
        return defaultdict(list, {k: [t for t in v if now - t < _RATE_WINDOW] for k, v in raw.items()})
    except Exception:
        return defaultdict(list)

_login_failures: Dict[str, list] = _load_failures()


def _flush_failures() -> None:
    try:
        with open(RATE_LIMIT_FILE, "w") as f:
            json.dump(dict(_login_failures), f)
    except Exception as e:
        logger.warning("Failed to persist rate limit state: %s", e)


def is_rate_limited(username: str) -> bool:
    now = time.time()
    _login_failures[username] = [t for t in _login_failures[username] if now - t < _RATE_WINDOW]
    return len(_login_failures[username]) >= _MAX_FAILURES


def record_failure(username: str) -> None:
    _login_failures[username].append(time.time())
    _flush_failures()


def clear_failures(username: str) -> None:
    _login_failures.pop(username, None)
    _flush_failures()


def hash_password(password: str) -> str:
    return bcrypt.hashpw(password.encode(), bcrypt.gensalt(rounds=12)).decode()


def verify_password(password: str, stored: str) -> bool:
    try:
        stored_bytes = stored.encode()
        # Reject legacy SHA-256 hashes (format: hexsalt:hexdigest, no $2 prefix).
        if not stored_bytes.startswith(b"$2"):
            logger.warning("Legacy SHA-256 hash detected — password must be reset via admin panel")
            return False
        return bcrypt.checkpw(password.encode(), stored_bytes)
    except Exception:
        return False


def _generate_initial_users() -> list:
    """
    Seed default users from environment variables on first boot.

    ADMIN_PASSWORD   — password for the 'admin' account (required)
    VIEWER_PASSWORD  — password for the 'viewer' account (optional)

    If ADMIN_PASSWORD is not set, a random password is generated and printed
    to stdout once. Capture it from the deployment logs immediately.
    """
    admin_pass = os.environ.get("ADMIN_PASSWORD")
    if not admin_pass:
        admin_pass = secrets.token_urlsafe(16)
        logger.warning(
            "ADMIN_PASSWORD not set. Generated one-time admin password: %s  "
            "— change it immediately via the admin panel.",
            admin_pass,
        )

    users = [
        {
            "id": "1",
            "username": "admin",
            "password_hash": hash_password(admin_pass),
            "role": "admin",
            "name": "IDPH Admin",
            "token_version": 0,
            "created_at": datetime.utcnow().isoformat() + "Z",
        }
    ]

    viewer_pass = os.environ.get("VIEWER_PASSWORD")
    if viewer_pass:
        users.append(
            {
                "id": "2",
                "username": "viewer",
                "password_hash": hash_password(viewer_pass),
                "role": "viewer",
                "name": "Read-Only User",
                "token_version": 0,
                "created_at": datetime.utcnow().isoformat() + "Z",
            }
        )

    return users


def load_users() -> list:
    if not os.path.exists(USERS_FILE):
        initial = _generate_initial_users()
        with open(USERS_FILE, "w") as f:
            json.dump(initial, f, indent=2)
        return initial
    with open(USERS_FILE) as f:
        return json.load(f)


def save_users(users: list) -> None:
    with open(USERS_FILE, "w") as f:
        json.dump(users, f, indent=2)


def authenticate_user(username: str, password: str) -> Optional[Dict[str, Any]]:
    if is_rate_limited(username):
        return None
    user = next((u for u in load_users() if u["username"] == username), None)
    if not user or not verify_password(password, user["password_hash"]):
        record_failure(username)
        return None
    clear_failures(username)
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
