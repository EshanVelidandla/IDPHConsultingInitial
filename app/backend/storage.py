"""
Small JSON document store for runtime state.

Runtime state lives in backend/var/, not in backend/static/. static/ holds
pipeline output that is committed and served, and the app never writes to it;
var/ holds things the running app writes (annotations, thresholds, presets,
users, audit log, uploaded datasets and their backups) and is gitignored.
Keeping them apart stops runtime writes from landing in version control and
makes it obvious which directory needs a mounted volume in a container.
IDPH_VAR_DIR moves the whole directory, which is how tests stay off the real one.

Every store is guarded by a sidecar <name>.lock rather than by locking the JSON
file itself. portalocker unlocks before it closes the handle, so a write made
through the locked handle could still be in Python's buffer when the next holder
read the file. Here the data reaches disk through a temp file and os.replace
while the lock is held, so a holder only ever sees a complete document, and a
crash mid-write leaves the previous one intact.
"""

import json
import os
from typing import Any, Callable

import portalocker

DATA_DIR = os.environ.get("IDPH_VAR_DIR") or os.path.join(
    os.path.dirname(os.path.abspath(__file__)), "var"
)
os.makedirs(DATA_DIR, exist_ok=True)


def _path(name: str) -> str:
    return os.path.join(DATA_DIR, f"{name}.json")


def _lock(path: str) -> portalocker.Lock:
    # Critical sections are milliseconds. At portalocker's default 0.25s poll,
    # waiters mostly sleep through a free lock and a small burst hits the timeout.
    return portalocker.Lock(f"{os.path.splitext(path)[0]}.lock", timeout=5, check_interval=0.01)


def _read_json(path: str) -> Any:
    with open(path, "r") as f:
        return json.load(f)


def _write_atomic(path: str, data: Any) -> None:
    """Call with the lock held. The temp name is fixed because the lock makes it exclusive."""
    tmp = f"{path}.tmp"
    with open(tmp, "w") as f:
        json.dump(data, f, indent=2)
        f.flush()
        os.fsync(f.fileno())
    os.replace(tmp, path)


def locked_read(path: str) -> Any:
    """
    Read a JSON file under its lock. A decode error raises.

    Readers lock too: on Windows os.replace fails against a handle that is open.
    """
    with _lock(path):
        return _read_json(path)


def locked_write(path: str, data: Any) -> None:
    with _lock(path):
        _write_atomic(path, data)


def locked_update(path: str, mutate_fn: Callable, seed: Callable[[], Any] = list) -> Any:
    """
    Load, mutate in place and save under one lock. Returns mutate_fn's result.

    A missing file starts from seed(), decided under the lock, so first-time
    creation cannot overwrite what a concurrent request has just written. If
    mutate_fn raises, nothing is written.
    """
    with _lock(path):
        data = _read_json(path) if os.path.exists(path) else seed()
        result = mutate_fn(data)
        _write_atomic(path, data)
    return result


def load(name: str, default: Any = None) -> Any:
    """
    Read a document, or return the default if it does not exist yet.

    Reading never creates the file. The previous version wrote a default on
    every miss, which gave GET endpoints a write side effect and meant a
    read-only deployment could not serve them.

    A file that exists but cannot be parsed raises. Returning the default would
    show a corrupt store to the client as an empty one.
    """
    path = _path(name)
    if not os.path.exists(path):
        return [] if default is None else default
    return locked_read(path)


def save(name: str, data: Any) -> None:
    locked_write(_path(name), data)


def load_and_save(name: str, mutate_fn: Callable) -> Any:
    """Atomically load, mutate in place, and save. Returns mutate_fn's result."""
    return locked_update(_path(name), mutate_fn)
