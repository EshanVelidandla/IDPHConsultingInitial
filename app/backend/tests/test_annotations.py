"""
Annotation regression tests.

PUT /annotations/{id} assigned body.cause without the check POST applies, so an
edit could store any string as a cause. Writes are redirected to a temp
directory, so these never touch backend/var/.

Run: python -m pytest app/backend/tests -q
"""

import os
import sys

import pytest
from fastapi.testclient import TestClient

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

import main  # noqa: E402
import storage  # noqa: E402

client = TestClient(main.app)

BAD_CAUSE = "<script>x</script>"
CAUSE_A, CAUSE_B = sorted(main.VALID_CAUSES)[:2]


@pytest.fixture(autouse=True)
def temp_store(monkeypatch, tmp_path):
    monkeypatch.setattr(storage, "DATA_DIR", str(tmp_path))
    monkeypatch.setattr(main, "AUDIT_FILE", str(tmp_path / "audit.jsonl"))


def _create(county="DuPage", cause=CAUSE_A):
    r = client.post("/annotations", json={"county": county, "cause": cause, "text": "note"})
    assert r.status_code == 200, r.text
    return r.json()


def _stored(annotation_id):
    return next(a for a in client.get("/annotations").json() if a["id"] == annotation_id)


def test_edit_rejects_an_unknown_cause_and_stores_nothing():
    created = _create()
    r = client.put(f"/annotations/{created['id']}", json={"cause": BAD_CAUSE})
    assert r.status_code == 400
    assert _stored(created["id"]) == created


def test_edit_with_an_unknown_cause_does_not_apply_other_fields():
    created = _create()
    r = client.put(f"/annotations/{created['id']}", json={"cause": BAD_CAUSE, "text": "changed"})
    assert r.status_code == 400
    assert _stored(created["id"])["text"] == "note"


def test_edit_accepts_a_valid_cause():
    created = _create()
    r = client.put(f"/annotations/{created['id']}", json={"cause": CAUSE_B})
    assert r.status_code == 200
    assert _stored(created["id"])["cause"] == CAUSE_B


def test_edit_with_null_still_clears_the_cause():
    created = _create()
    r = client.put(f"/annotations/{created['id']}", json={"cause": None})
    assert r.status_code == 200
    assert _stored(created["id"])["cause"] is None


def test_edit_without_a_cause_leaves_it_alone():
    created = _create()
    r = client.put(f"/annotations/{created['id']}", json={"text": "changed"})
    assert r.status_code == 200
    assert _stored(created["id"])["cause"] == CAUSE_A


def test_create_still_rejects_an_unknown_cause_with_400():
    r = client.post("/annotations", json={"county": "DuPage", "cause": BAD_CAUSE, "text": "note"})
    assert r.status_code == 400


def test_statewide_row_stays_an_annotation_target():
    """Kept on purpose, a statewide note is legitimate. The form labels the value."""
    assert "ILLINOIS" in client.get("/meta").json()["counties"]
    assert _create(county="ILLINOIS")["county"] == "ILLINOIS"
