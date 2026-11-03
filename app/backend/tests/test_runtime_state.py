"""
Regression tests for where the running app writes (#13).

Reads must not create files, and uploads and deletes must leave the committed
tables in static/ alone: they go to an overlay under the var directory, which
conftest.py points at a temp directory.

Run: python -m pytest app/backend/tests -q
"""

import hashlib
import io
import os
import shutil
import sys

import pandas as pd
import pytest
from fastapi.testclient import TestClient

BACKEND = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, BACKEND)

import auth  # noqa: E402
import main  # noqa: E402
import storage  # noqa: E402

client = TestClient(main.app)

CAUSE = "Accidents"
SUFFIX = "_death_rates_by_county_year.csv"
OVERLAY_FILE = os.path.join(main.DATASET_OVERLAY_DIR, f"{CAUSE}{SUFFIX}")
TOMBSTONE = os.path.join(main.DATASET_OVERLAY_DIR, f"{CAUSE}.deleted")
MARKER = 123.45


def _static_hashes() -> dict:
    hashes = {}
    for root, _, files in os.walk(main.data_dir):
        for name in files:
            with open(os.path.join(root, name), "rb") as f:
                hashes[os.path.join(root, name)] = hashlib.sha256(f.read()).hexdigest()
    return hashes


def _upload(marker: float = MARKER):
    """Upload the committed table with Adams 2015 changed, so it is otherwise valid."""
    df = pd.read_csv(os.path.join(main.death_rates_dir, f"{CAUSE}{SUFFIX}"))
    df.loc[df["County"] == "Adams", "2015"] = marker
    body = df.to_csv(index=False).encode()
    return client.post(
        f"/admin/upload?cause={CAUSE}",
        files={"file": ("table.csv", io.BytesIO(body), "text/csv")},
    )


def _served_adams_2015(marker_route: str = "/death_rates") -> float:
    rows = client.get(f"{marker_route}?cause={CAUSE}").json()
    return next(r["2015"] for r in rows if r["County"] == "Adams")


@pytest.fixture(autouse=True)
def clean_var():
    """Each test starts from an empty var directory, with static/ checked after."""
    assert os.path.realpath(storage.DATA_DIR) != os.path.realpath(os.path.join(BACKEND, "var"))
    before = _static_hashes()
    shutil.rmtree(storage.DATA_DIR, ignore_errors=True)
    os.makedirs(storage.DATA_DIR)
    main._TABLE_CACHE.clear()
    yield
    assert _static_hashes() == before, "a runtime write reached static/"


def test_all_runtime_paths_follow_the_var_dir():
    root = storage.DATA_DIR
    for path in (auth.USERS_FILE, main.AUDIT_FILE, main.DATASET_BACKUP_DIR, main.DATASET_OVERLAY_DIR):
        assert os.path.dirname(path) == root


def test_listing_users_creates_no_file():
    r = client.get("/admin/users")
    assert r.status_code == 200
    assert {u["username"] for u in r.json()} == {"admin", "viewer"}
    assert not os.path.exists(auth.USERS_FILE)


def test_first_user_write_saves_the_seed_too():
    r = client.post("/admin/users", json={
        "username": "newuser", "name": "New", "role": "viewer", "password": "abc12345!",
    })
    assert r.status_code == 200
    assert os.path.exists(auth.USERS_FILE)
    assert {u["username"] for u in client.get("/admin/users").json()} == {"admin", "viewer", "newuser"}


def test_upload_goes_to_the_overlay_and_is_served():
    committed = _served_adams_2015()
    assert committed != MARKER

    r = _upload()
    assert r.status_code == 200
    assert os.path.exists(OVERLAY_FILE)
    assert _served_adams_2015() == MARKER

    export = client.get(f"/export/csv?cause={CAUSE}")
    assert export.status_code == 200
    assert str(MARKER) in export.text

    listed = next(d for d in client.get("/admin/datasets").json() if d["cause"] == CAUSE)
    assert listed["size_kb"] == round(os.path.getsize(OVERLAY_FILE) / 1024, 1)


def test_delete_hides_the_committed_table_everywhere():
    assert CAUSE in client.get("/meta").json()["available_causes"]

    r = client.delete(f"/admin/datasets/{CAUSE}")
    assert r.status_code == 200
    assert os.path.exists(TOMBSTONE)

    assert client.get(f"/death_rates?cause={CAUSE}").status_code == 404
    assert client.get(f"/export/csv?cause={CAUSE}").status_code == 404
    assert CAUSE not in client.get("/meta").json()["available_causes"]
    assert CAUSE not in {d["cause"] for d in client.get("/admin/datasets").json()}
    assert client.delete(f"/admin/datasets/{CAUSE}").status_code == 404


def test_delete_removes_the_overlay_and_backs_up_the_served_file():
    _upload()
    r = client.delete(f"/admin/datasets/{CAUSE}")
    assert r.status_code == 200
    assert not os.path.exists(OVERLAY_FILE)
    assert client.get(f"/death_rates?cause={CAUSE}").status_code == 404

    backup = pd.read_csv(os.path.join(main.DATASET_BACKUP_DIR, r.json()["backup"]))
    assert backup.loc[backup["County"] == "Adams", "2015"].item() == MARKER


def test_upload_after_delete_brings_the_table_back():
    client.delete(f"/admin/datasets/{CAUSE}")
    r = _upload()
    assert r.status_code == 200
    assert r.json()["backup"] is None
    assert not os.path.exists(TOMBSTONE)
    assert _served_adams_2015() == MARKER
    assert CAUSE in client.get("/meta").json()["available_causes"]


def test_a_second_upload_replaces_the_first_in_the_cache():
    _upload()
    assert _served_adams_2015() == MARKER
    _upload(marker=678.9)
    assert _served_adams_2015() == 678.9
