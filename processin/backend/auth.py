import hashlib
import logging
import os
import secrets
import time
from collections import defaultdict
from datetime import datetime, timedelta
from typing import Any, Dict, Optional

from jose import JWTError, jwt

logger = logging.getLogger(__name__)

SECRET_KEY = os.environ.get("JWT_SECRET", "")
if not SECRET_KEY:
    logger.warning(
        "JWT_SECRET env var is not set — using an insecure default. "
        "Set JWT_SECRET in production."
    )
    SECRET_KEY = "idph-dev-key-not-for-production"

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
    attempts = _login_failures[username]
    # Drop attempts outside the window
    _login_failures[username] = [t for t in attempts if now - t < _RATE_WINDOW]
    return len(_login_failures[username]) >= _MAX_FAILURES


def record_failure(username: str) -> None:
    _login_failures[username].append(time.time())


def clear_failures(username: str) -> None:
    _login_failures.pop(username, None)


def hash_password(password: str, salt: Optional[str] = None) -> str:
    if salt is None:
        salt = secrets.token_hex(16)
    h = hashlib.sha256(f"{salt}:{password}".encode()).hexdigest()
    return f"{salt}:{h}"


def verify_password(password: str, stored: str) -> bool:
    try:
        salt = stored.split(":", 1)[0]
        return secrets.compare_digest(hash_password(password, salt), stored)
    except Exception:
        return False


def _load_users_raw() -> list:
    import json

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


def load_users() -> list:
    return _load_users_raw()


def save_users(users: list) -> None:
    import json

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
