"""
User store for the IDPH Mortality Analytics app.

NOTE: Authentication is bypassed for local use. Every request is treated as
the built-in admin (see get_current_user in main.py). Passwords are stored
as plain text and never verified. Do not deploy this build to a public host.
"""

import json
import logging
import os
from datetime import datetime, timezone

import portalocker

logger = logging.getLogger(__name__)

# Runtime state lives in backend/var/ (gitignored), never beside the source or
# in the served static/ directory.
DATA_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "var")
os.makedirs(DATA_DIR, exist_ok=True)
USERS_FILE = os.path.join(DATA_DIR, "users.json")


def hash_password(password: str) -> str:
    # Auth is bypassed, so passwords are stored as-is.
    return password


def _generate_initial_users() -> list:
    now = datetime.now(timezone.utc).isoformat()
    return [
        {
            "id": "1",
            "username": "admin",
            "password_hash": "admin123",
            "role": "admin",
            "name": "IDPH Admin",
            "token_version": 0,
            "created_at": now,
        },
        {
            "id": "2",
            "username": "viewer",
            "password_hash": "viewer123",
            "role": "viewer",
            "name": "Read-Only User",
            "token_version": 0,
            "created_at": now,
        },
    ]


def load_users() -> list:
    """
    Read the user store, seeding it on first use.

    Locked like every other store in storage.py. These two functions were the
    only ones reading and writing a JSON file without a lock, so two concurrent
    admin writes could interleave and lose a user, or a read could land on a
    half-written file.
    """
    if not os.path.exists(USERS_FILE):
        initial = _generate_initial_users()
        save_users(initial)
        return initial
    try:
        with portalocker.Lock(USERS_FILE, "r", timeout=5) as f:
            return json.load(f)
    except json.JSONDecodeError:
        logger.error("users.json is not valid JSON; refusing to overwrite it")
        raise


def save_users(users: list) -> None:
    with portalocker.Lock(USERS_FILE, "w", timeout=5) as f:
        json.dump(users, f, indent=2)


def update_users(mutate_fn) -> object:
    """
    Read, mutate and write under one lock.

    A caller that does load_users(), edits the list, then save_users() holds no
    lock across the gap, so a concurrent write in between is silently lost.
    Anything that changes the store should go through here.
    """
    if not os.path.exists(USERS_FILE):
        save_users(_generate_initial_users())
    with portalocker.Lock(USERS_FILE, "r+", timeout=5) as f:
        users = json.load(f)
        result = mutate_fn(users)
        f.seek(0)
        f.truncate()
        json.dump(users, f, indent=2)
    return result
