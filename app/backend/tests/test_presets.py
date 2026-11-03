"""
Preset validation. A preset moves the whole app to its year and district when
loaded, so an out-of-range value must be refused when it is saved.

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

VALID = {"name": "Sangamon review", "cause": "Total_Deaths", "year": 2022, "district": 3}


@pytest.fixture(autouse=True)
def temp_store(tmp_path, monkeypatch):
    """Runtime state goes to a temp directory, never to backend/var."""
    monkeypatch.setattr(storage, "DATA_DIR", str(tmp_path))


@pytest.mark.parametrize("change", [
    {"name": ""},
    {"name": "   "},
    {"year": 2099},
    {"year": 2007},
    {"year": 2023},
    {"district": 42},
    {"district": 0},
    {"district": 10},
])
def test_bad_preset_is_refused_and_not_stored(change):
    assert client.post("/presets", json={**VALID, **change}).status_code == 422
    assert storage.load("presets", []) == []


@pytest.mark.parametrize("change", [
    {},
    {"year": 2008},
    {"district": 1},
    {"district": 9},
    {"district": None},
])
def test_valid_preset_is_saved(change):
    assert client.post("/presets", json={**VALID, **change}).status_code == 200
    assert len(storage.load("presets", [])) == 1


def test_name_is_trimmed():
    assert client.post("/presets", json={**VALID, "name": "  Sangamon  "}).json()["name"] == "Sangamon"
