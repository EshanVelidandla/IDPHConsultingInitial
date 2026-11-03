"""
Regression tests for the JSON stores under concurrent requests (issue #20).

Three defects motivated these:

  1. portalocker unlocks before it closes the handle, so a write made through
     the locked handle could still be in Python's buffer when the next holder
     read the file. A race does not show this on Windows, because portalocker's
     Windows unlock happens to flush a text handle first. So the first test does
     not race: it reads the bytes on disk at the moment release is called.
  2. First-time creation ran outside the lock and could reset the store over
     writes that had already been acknowledged.
  3. A corrupt store was reported to the client as an empty one.

Run: python -m pytest app/backend/tests -q
"""

import json
import os
import sys
import threading

import portalocker
import pytest
from fastapi.testclient import TestClient

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

import auth  # noqa: E402
import main  # noqa: E402
import storage  # noqa: E402

THREADS = 8
RUNS = 20


@pytest.fixture
def var_dir(tmp_path, monkeypatch):
    monkeypatch.setattr(storage, "DATA_DIR", str(tmp_path))
    monkeypatch.setattr(auth, "USERS_FILE", str(tmp_path / "users.json"))
    return tmp_path


def _in_threads(count, work):
    """Run work(i) in parallel from a common start. Returns (finished indexes, errors)."""
    barrier = threading.Barrier(count)
    finished, errors = [], []

    def _run(i):
        barrier.wait()
        try:
            work(i)
            finished.append(i)
        except Exception as e:
            errors.append(e)

    threads = [threading.Thread(target=_run, args=(i,)) for i in range(count)]
    for t in threads:
        t.start()
    for t in threads:
        t.join()
    return finished, errors


# 1. Bytes on disk when the lock is released

def _watch_write(monkeypatch, path):
    """Record fsync, replace and release in order, and the file's bytes at release."""
    events, on_disk = [], []
    real_fsync, real_replace, real_release = os.fsync, os.replace, portalocker.Lock.release

    def fsync(fd):
        events.append("fsync")
        real_fsync(fd)

    def replace(src, dst):
        events.append("replace")
        real_replace(src, dst)

    def release(self):
        # Before the real release, so this sees what the next holder would see
        # however portalocker orders its unlock and close.
        events.append("release")
        try:
            with open(path, "rb") as f:
                on_disk.append(f.read())
        except OSError as e:
            on_disk.append(e)
        real_release(self)

    monkeypatch.setattr(os, "fsync", fsync)
    monkeypatch.setattr(os, "replace", replace)
    monkeypatch.setattr(portalocker.Lock, "release", release)
    return events, on_disk


@pytest.mark.parametrize("exists", [True, False], ids=["existing", "fresh"])
@pytest.mark.parametrize("write", ["save", "load_and_save", "save_users", "update_users"])
def test_data_is_on_disk_before_the_lock_is_released(var_dir, monkeypatch, write, exists):
    is_user_store = write in ("save_users", "update_users")
    path = var_dir / ("users.json" if is_user_store else "doc.json")
    if exists:
        path.write_text(json.dumps([{"id": "seed"}]))

    row = {"id": "x" * 50_000}  # larger than any buffer, so a partial write would show
    events, on_disk = _watch_write(monkeypatch, str(path))

    if write == "save":
        storage.save("doc", [row])
    elif write == "load_and_save":
        storage.load_and_save("doc", lambda d: d.append(row))
    elif write == "save_users":
        auth.save_users([row])
    else:
        auth.update_users(lambda u: u.append(row))

    assert isinstance(on_disk[0], bytes), on_disk[0]
    assert on_disk[0], "the file was empty when the lock was released"
    assert row in json.loads(on_disk[0])
    assert events == ["fsync", "replace", "release"]


def test_a_failed_replace_leaves_the_previous_document(var_dir, monkeypatch):
    storage.save("doc", [1])

    def fail(src, dst):
        raise OSError("disk full")

    with monkeypatch.context() as m:
        m.setattr(os, "replace", fail)
        with pytest.raises(OSError):
            storage.save("doc", [2])

    assert storage.load("doc") == [1]


def test_an_unserialisable_write_leaves_the_previous_document(var_dir):
    storage.save("doc", [1])
    with pytest.raises(TypeError):
        storage.save("doc", [object()])
    assert storage.load("doc") == [1]


def test_a_mutation_that_raises_writes_nothing_and_frees_the_lock(var_dir):
    storage.save("doc", [1])

    def fail(_):
        raise ValueError

    with pytest.raises(ValueError):
        storage.load_and_save("doc", fail)
    assert storage.load("doc") == [1]
    storage.load_and_save("doc", lambda d: d.append(2))
    assert storage.load("doc") == [1, 2]


# 2. Create-if-missing under the lock

def test_fresh_user_store_keeps_every_acknowledged_user(var_dir):
    for run in range(RUNS):
        path = var_dir / "users.json"
        if path.exists():
            path.unlink()

        finished, _ = _in_threads(
            THREADS,
            lambda i: auth.update_users(lambda u: u.append({"username": f"user{i}"})),
        )

        stored = {u["username"] for u in auth.load_users()}
        assert stored == {"admin", "viewer"} | {f"user{i}" for i in finished}, f"run {run}"
        assert len(finished) == THREADS, f"run {run}"


def test_first_read_of_user_store_does_not_reset_a_concurrent_write(var_dir):
    def work(i):
        if i % 2:
            auth.load_users()
        else:
            auth.update_users(lambda u: u.append({"username": f"user{i}"}))

    for run in range(RUNS):
        path = var_dir / "users.json"
        if path.exists():
            path.unlink()

        _, errors = _in_threads(THREADS, work)

        assert not errors, f"run {run}: {errors}"
        stored = {u["username"] for u in auth.load_users()}
        assert {f"user{i}" for i in range(0, THREADS, 2)} <= stored, f"run {run}"


def test_fresh_document_keeps_every_acknowledged_row(var_dir):
    for run in range(RUNS):
        path = var_dir / "doc.json"
        if path.exists():
            path.unlink()

        finished, _ = _in_threads(
            THREADS, lambda i: storage.load_and_save("doc", lambda d: d.append(i))
        )

        assert sorted(storage.load("doc")) == sorted(finished), f"run {run}"
        assert len(finished) == THREADS, f"run {run}"


def test_readers_never_see_an_empty_or_partial_store(var_dir):
    storage.save("doc", [0] * 300)
    done = threading.Event()
    bad = []

    def read():
        while not done.is_set():
            try:
                rows = storage.load("doc")
                if len(rows) < 300:
                    bad.append(len(rows))
            except Exception as e:
                bad.append(e)

    reader = threading.Thread(target=read)
    reader.start()
    try:
        _, errors = _in_threads(
            THREADS,
            lambda i: [storage.load_and_save("doc", lambda d: d.append(i)) for _ in range(5)],
        )
    finally:
        done.set()
        reader.join()

    assert not errors
    assert not bad
    assert len(storage.load("doc")) == 300 + THREADS * 5


# 3. Corrupt and missing files

def test_corrupt_document_raises(var_dir):
    (var_dir / "doc.json").write_text("{not json")
    with pytest.raises(json.JSONDecodeError):
        storage.load("doc", [])


def test_corrupt_document_is_not_overwritten_by_an_update(var_dir):
    (var_dir / "doc.json").write_text("{not json")
    with pytest.raises(json.JSONDecodeError):
        storage.load_and_save("doc", lambda d: d.append(1))
    assert (var_dir / "doc.json").read_text() == "{not json"


def test_corrupt_user_store_raises(var_dir):
    (var_dir / "users.json").write_text("{not json")
    with pytest.raises(json.JSONDecodeError):
        auth.load_users()


def test_corrupt_store_is_a_500_not_an_empty_list(var_dir):
    (var_dir / "annotations.json").write_text("{not json")
    response = TestClient(main.app, raise_server_exceptions=False).get("/annotations")
    assert response.status_code == 500


def test_missing_document_returns_the_default_and_creates_nothing(var_dir):
    assert storage.load("doc") == []
    assert storage.load("doc", {"a": 1}) == {"a": 1}
    assert os.listdir(var_dir) == []
