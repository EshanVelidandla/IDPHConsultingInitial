import json
import os
from typing import Any, Callable

import portalocker

DATA_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "static")
os.makedirs(DATA_DIR, exist_ok=True)


def _path(name: str) -> str:
    return os.path.join(DATA_DIR, f"{name}.json")


def load(name: str, default: Any = None) -> Any:
    p = _path(name)
    if not os.path.exists(p):
        data = default if default is not None else []
        _save_raw(p, data)
        return data
    with portalocker.Lock(p, "r", timeout=5) as f:
        return json.load(f)


def save(name: str, data: Any) -> None:
    _save_raw(_path(name), data)


def load_and_save(name: str, mutate_fn: Callable) -> Any:
    """Atomically load, mutate in-place, and save. Returns the mutate_fn return value."""
    p = _path(name)
    if not os.path.exists(p):
        with open(p, "w") as f:
            json.dump([], f)
    with portalocker.Lock(p, "r+", timeout=5) as f:
        data = json.load(f)
        result = mutate_fn(data)
        f.seek(0)
        f.truncate()
        json.dump(data, f, indent=2)
    return result


def _save_raw(path: str, data: Any) -> None:
    with portalocker.Lock(path, "w", timeout=5) as f:
        json.dump(data, f, indent=2)
