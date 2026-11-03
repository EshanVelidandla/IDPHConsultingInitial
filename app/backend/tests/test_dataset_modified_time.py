"""
/admin/datasets labels `modified` with a trailing Z, so the value must be UTC.

datetime.fromtimestamp(ts) without a zone gives local time, which then reads as
UTC with the wall clock off by the host's offset. A host whose local zone is UTC
cannot show that bug, so this test only catches it on a host with a real offset.

Run: python -m pytest app/backend/tests -q
"""

import os
import sys
from datetime import datetime, timezone

from fastapi.testclient import TestClient

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

import main  # noqa: E402

# 2020-01-15 12:00:00 UTC. A fixed mtime keeps the expected text exact.
MTIME = 1579089600


def test_modified_is_utc_with_a_single_z(tmp_path, monkeypatch):
    table = tmp_path / "Total_Deaths_death_rates_by_county_year.csv"
    table.write_text("County,2022\nAdams,1\n", encoding="utf-8")
    os.utime(table, (MTIME, MTIME))
    monkeypatch.setattr(main, "death_rates_dir", str(tmp_path))
    monkeypatch.setattr(main, "DATASET_OVERLAY_DIR", str(tmp_path / "overlay"))

    rows = TestClient(main.app).get("/admin/datasets").json()

    modified = next(r["modified"] for r in rows if r["filename"] == table.name)
    assert modified == "2020-01-15T12:00:00Z"
    parsed = datetime.fromisoformat(modified.replace("Z", "+00:00"))
    assert parsed == datetime.fromtimestamp(MTIME, timezone.utc)


def test_source_says_whether_an_upload_shadows_the_committed_table(tmp_path, monkeypatch):
    overlay = tmp_path / "overlay"
    overlay.mkdir()
    name = "{}_death_rates_by_county_year.csv"
    (tmp_path / name.format("Total_Deaths")).write_text("County,2022\nAdams,1\n", encoding="utf-8")
    (tmp_path / name.format("Accidents")).write_text("County,2022\nAdams,1\n", encoding="utf-8")
    (overlay / name.format("Accidents")).write_text("County,2022\nAdams,2\n", encoding="utf-8")
    monkeypatch.setattr(main, "death_rates_dir", str(tmp_path))
    monkeypatch.setattr(main, "DATASET_OVERLAY_DIR", str(overlay))

    rows = TestClient(main.app).get("/admin/datasets").json()

    assert {r["cause"]: r["source"] for r in rows} == {"Accidents": "uploaded", "Total_Deaths": "committed"}
