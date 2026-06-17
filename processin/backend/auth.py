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

# In-memory login rate limit: max 5 failures per username per 5-minute window
_login_failures: Dict[str, list] = defaultdict(list)
_RATE_WINDOW = 300   # seconds
_MAX_FAILURES = 5


def is_rate_limited(username: str) -> bool:
    now = time.time()
    _login_failures[username] = [t for t in _login_failures[username] if now - t < _RATE_WINDOW]
    return len(_login_failures[username]) >= _MAX_FAILURES


def record_failure(username: str) -> None:
    _login_failures[username].append(time.time())


def clear_failures(username: str) -> None:
    _login_failures.pop(username, None)


def hash_password(password: str) -> str:
    return bcrypt.hashpw(password.encode(), bcrypt.gensalt(rounds=12)).decode()


def verify_password(password: str, stored: str) -> bool:
    try:
        stored_bytes = stored.encode()
        # Detect legacy SHA-256 hashes (format: "hexsalt:hexdigest") and reject them.
        # All passwords must be re-hashed with bcrypt on next admin-triggered reset.
        if not stored_bytes.startswith(b"$2"):
            logger.warning("Legacy SHA-256 hash detected — password must be reset via admin panel")
            return False
        return bcrypt.checkpw(password.encode(), stored_bytes)
    except Exception:
        return False


def _generate_initial_users() -> list:
    """
    Create default users from environment variables on first boot.

    Required env vars:
      ADMIN_PASSWORD   — password for the 'admin' account
      VIEWER_PASSWORD  — password for the 'viewer' account (optional; skipped if unset)

    If ADMIN_PASSWORD is not set, a random password is generated and printed
    to stdout ONCE. Capture it from the deployment logs.
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
