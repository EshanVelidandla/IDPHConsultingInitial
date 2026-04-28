import json
import os
from typing import Any

DATA_DIR = os.path.dirname(os.path.abspath(__file__))


def _path(name: str) -> str:
    return os.path.join(DATA_DIR, f"{name}.json")


def load(name: str, default: Any = None) -> Any:
    p = _path(name)
    if not os.path.exists(p):
        data = default if default is not None else []
        _save_raw(p, data)
        return data
    with open(p) as f:
        return json.load(f)


def save(name: str, data: Any) -> None:
    _save_raw(_path(name), data)


def _save_raw(path: str, data: Any) -> None:
    with open(path, "w") as f:
        json.dump(data, f, indent=2)
