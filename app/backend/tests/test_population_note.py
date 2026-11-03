"""
The /meta population note has to state the seam the served table really has.

The Census README and the pipeline docstring described the 2019-2020 vintage
change as a slight step up. It is neither slight nor one direction. This test
recomputes the figures from the served table, so the note fails loudly rather
than going stale if the denominators are ever rebuilt on another series.

Run: python -m pytest app/backend/tests -q
"""

import csv
import os
import sys

from fastapi.testclient import TestClient

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

import main  # noqa: E402

client = TestClient(main.app)

NOT_COUNTIES = {"ILLINOIS", "Chicago", "Suburban Cook"}


def _seam():
    path = os.path.join(main.data_dir, "population_by_county_year.csv")
    with open(path, newline="") as f:
        return {r["County"]: int(r["2020"]) / int(r["2019"]) - 1 for r in csv.DictReader(f)}


def test_meta_population_note_states_the_measured_seam():
    note = client.get("/meta").json()["population_note"]
    seam = _seam()
    counties = [v for k, v in seam.items() if k not in NOT_COUNTIES]
    assert len(counties) == 102
    above = sum(abs(v) > 0.03 for v in counties)
    up = sum(v > 0.03 for v in counties)
    assert f"{above} of 102 counties" in note
    assert f"{above - up} down" in note
    assert f"{up} up" in note
    assert f"Cook {seam['Cook'] * 100:+.2f}%" in note
    assert f"Illinois {seam['ILLINOIS'] * 100:+.2f}%" in note
    assert "2019-2020" in note
    assert "\u2014" not in note
