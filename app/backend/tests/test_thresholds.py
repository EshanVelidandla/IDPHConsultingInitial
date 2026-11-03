"""
Thresholds are reference values only: nothing compares them to the data and
nothing sends mail, so the API must not collect or return a notify_email.

Run: python -m pytest app/backend/tests -q
"""

import json
import os
import sys

import pytest
from fastapi.testclient import TestClient

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

import main  # noqa: E402
import storage  # noqa: E402

client = TestClient(main.app)

OLD_RECORD = {
    "id": "old-1",
    "cause": "Total_Deaths",
    "rate": 900.0,
    "notify_email": "a@b.co",
    "created_by": "admin",
    "created_at": "2024-01-01T00:00:00+00:00",
    "updated_at": "2024-01-01T00:00:00+00:00",
}


@pytest.fixture
def store(tmp_path, monkeypatch):
    """Point the document store at a temp directory, never the real var/."""
    monkeypatch.setattr(storage, "DATA_DIR", str(tmp_path))
    return tmp_path


def _seed_old_record(store):
    (store / "thresholds.json").write_text(json.dumps([OLD_RECORD]))


def _stored(store):
    return json.loads((store / "thresholds.json").read_text())


def test_post_without_email_is_accepted(store):
    r = client.post("/thresholds", json={"cause": "Total_Deaths", "rate": 900})
    assert r.status_code == 200
    assert [t["rate"] for t in r.json()] == [900]
    assert "notify_email" not in r.json()[0]
    assert "notify_email" not in _stored(store)[0]


def test_email_from_an_old_client_is_ignored_and_not_stored(store):
    r = client.post(
        "/thresholds",
        json={"cause": "Total_Deaths", "rate": 900, "notify_email": "not-an-address"},
    )
    assert r.status_code == 200
    assert "notify_email" not in r.json()[0]
    assert "notify_email" not in _stored(store)[0]


def test_old_record_loads_without_returning_the_email(store):
    _seed_old_record(store)
    r = client.get("/thresholds")
    assert r.status_code == 200
    assert [t["id"] for t in r.json()] == ["old-1"]
    assert "notify_email" not in r.json()[0]


def test_updating_an_old_record_drops_the_stored_email(store):
    _seed_old_record(store)
    r = client.post("/thresholds", json={"cause": "Total_Deaths", "rate": 950})
    assert r.status_code == 200
    assert r.json()[0]["id"] == "old-1"
    assert r.json()[0]["rate"] == 950
    assert "notify_email" not in r.json()[0]
    assert "notify_email" not in _stored(store)[0]


def test_post_response_hides_the_email_on_other_old_records(store):
    _seed_old_record(store)
    r = client.post("/thresholds", json={"cause": "COVID_19", "rate": 50})
    assert r.status_code == 200
    assert len(r.json()) == 2
    assert all("notify_email" not in t for t in r.json())


def test_old_record_can_be_deleted(store):
    _seed_old_record(store)
    assert client.delete("/thresholds/Total_Deaths").status_code == 200
    assert client.get("/thresholds").json() == []
