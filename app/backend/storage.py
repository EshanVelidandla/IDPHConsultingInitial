"""
Small JSON document store for runtime state.

Runtime state lives in backend/var/, not in backend/static/. static/ holds
pipeline output that is committed and served; var/ holds things the running app
writes (annotations, thresholds, presets, users, audit log) and is gitignored.
Keeping them apart stops runtime writes from landing in version control and
makes it obvious which directory needs a mounted volume in a container.
"""

import json
import os
from typing import Any, Callable

import portalocker

DATA_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "var")
os.makedirs(DATA_DIR, exist_ok=True)


def _path(name: str) -> str:
    return os.path.join(DATA_DIR, f"{name}.json")


def load(name: str, default: Any = None) -> Any:
    """
    Read a document, or return the default if it does not exist yet.

    Reading never creates the file. The previous version wrote a default on
    every miss, which gave GET endpoints a write side effect and meant a
    read-only deployment could not serve them.
    """
    path = _path(name)
    if not os.path.exists(path):
        return [] if default is None else default
    try:
        with portalocker.Lock(path, "r", timeout=5) as f:
            return json.load(f)
    except (json.JSONDecodeError, OSError):
        return [] if default is None else default


def save(name: str, data: Any) -> None:
    _save_raw(_path(name), data)


def load_and_save(name: str, mutate_fn: Callable) -> Any:
    """Atomically load, mutate in place, and save. Returns mutate_fn's result."""
    path = _path(name)
    if not os.path.exists(path):
        with open(path, "w") as f:
            json.dump([], f)
    with portalocker.Lock(path, "r+", timeout=5) as f:
        data = json.load(f)
        result = mutate_fn(data)
        f.seek(0)
        f.truncate()
        json.dump(data, f, indent=2)
    return result


def _save_raw(path: str, data: Any) -> None:
    with portalocker.Lock(path, "w", timeout=5) as f:
        json.dump(data, f, indent=2)
