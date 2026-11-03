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

import storage

logger = logging.getLogger(__name__)

# Runtime state lives in backend/var/ (gitignored), never beside the source or
# in the served static/ directory.
USERS_FILE = os.path.join(storage.DATA_DIR, "users.json")


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
    Read the user store, or the seed users if it does not exist yet.

    Reading never creates the file, the same rule as storage.load. The seed is
    only saved by update_users, on the first real change.

    Locked like every other store, through the same primitives in storage.py.
    """
    if not os.path.exists(USERS_FILE):
        return _generate_initial_users()
    try:
        return storage.locked_read(USERS_FILE)
    except json.JSONDecodeError:
        logger.error("users.json is not valid JSON; refusing to overwrite it")
        raise


def save_users(users: list) -> None:
    storage.locked_write(USERS_FILE, users)


def update_users(mutate_fn) -> object:
    """
    Read, mutate and write under one lock.

    A caller that does load_users(), edits the list, then save_users() holds no
    lock across the gap, so a concurrent write in between is silently lost.
    Anything that changes the store should go through here.
    """
    return storage.locked_update(USERS_FILE, mutate_fn, _generate_initial_users)
