"""
User store for the IDPH Mortality Analytics app.

NOTE: Authentication is bypassed for local use — every request is treated as
the built-in admin (see get_current_user in main.py). Passwords are stored
as plain text and never verified. Do not deploy this build to a public host.
"""

import json
import os
from datetime import datetime

DATA_DIR = os.path.dirname(os.path.abspath(__file__))
USERS_FILE = os.path.join(DATA_DIR, "users.json")


def hash_password(password: str) -> str:
    # Auth is bypassed — passwords are stored as-is.
    return password


def _generate_initial_users() -> list:
    now = datetime.utcnow().isoformat() + "Z"
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
    if not os.path.exists(USERS_FILE):
        initial = _generate_initial_users()
        save_users(initial)
        return initial
    with open(USERS_FILE) as f:
        return json.load(f)


def save_users(users: list) -> None:
    with open(USERS_FILE, "w") as f:
        json.dump(users, f, indent=2)
