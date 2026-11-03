"""
Regression tests for #28: a dataset upload must be a complete, plausible rate
table before it can replace anything.

The reviewer's repros: uploading "County\\nbar" replaced the Accidents table, and
a "County,1999,2030" header moved /meta to 1999-2030 for every view, because
/meta took its range from the alphabetically first table. That same first table
also supplied the annotation county allowlist at the next restart.

Every test runs against a temp copy of the tables, so a bad upload cannot reach
the committed ones.

Run: python -m pytest app/backend/tests -q
"""

import hashlib
import os
import shutil
import sys

import pytest
from fastapi.testclient import TestClient

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

import main  # noqa: E402

client = TestClient(main.app)

REAL_TABLES = main.death_rates_dir
REAL_POPULATION = os.path.join(main.data_dir, "population_by_county_year.csv")
SUFFIX = "_death_rates_by_county_year.csv"
YEARS = [str(y) for y in range(2008, 2023)]


def _digest(folder: str) -> dict[str, str]:
    return {
        name: hashlib.sha256(open(os.path.join(folder, name), "rb").read()).hexdigest()
        for name in sorted(os.listdir(folder))
    }


@pytest.fixture(autouse=True)
def real_tables_untouched():
    """Backstop: nothing in this file may change the committed tables."""
    before = _digest(REAL_TABLES)
    yield
    assert _digest(REAL_TABLES) == before


@pytest.fixture
def tables(tmp_path, monkeypatch):
    folder = tmp_path / "tables"
    shutil.copytree(REAL_TABLES, folder)
    monkeypatch.setattr(main, "death_rates_dir", str(folder))
    monkeypatch.setattr(main, "DATASET_OVERLAY_DIR", str(tmp_path / "overlay"))
    monkeypatch.setattr(main, "DATASET_BACKUP_DIR", str(tmp_path / "backups"))
    monkeypatch.setattr(main, "AUDIT_FILE", str(tmp_path / "audit.jsonl"))
    monkeypatch.setattr(main, "_TABLE_CACHE", {})
    return folder


def _overlay(tables):
    """Where an accepted upload lands: beside the committed copy, never over it."""
    return tables.parent / "overlay"


def _upload(cause: str, contents: bytes):
    return client.post(
        f"/admin/upload?cause={cause}",
        files={"file": ("upload.csv", contents, "text/csv")},
    )


def _real(cause: str) -> bytes:
    with open(os.path.join(REAL_TABLES, cause + SUFFIX), "rb") as f:
        return f.read()


def _table(rate: str = "50.5", counties=None, years=YEARS) -> bytes:
    """A complete table with the same value in every cell."""
    counties = sorted(main.VALID_COUNTIES) if counties is None else counties
    lines = [",".join(["County", *years])]
    lines += [",".join([c, *[rate] * len(years)]) for c in counties]
    return ("\n".join(lines) + "\n").encode()


def _with_cell(contents: bytes, value: str) -> bytes:
    """Change only the first year of the first data row."""
    lines = contents.decode().split("\n")
    cells = lines[1].split(",")
    cells[1] = value
    lines[1] = ",".join(cells)
    return "\n".join(lines).encode()


# ── The reviewer's repros ─────────────────────────────────────

@pytest.mark.parametrize("contents", [
    b"County\nbar\n",
    b"County,1999,2030\nAdams,-5,oops\n",
])
def test_reviewer_uploads_are_refused_and_change_nothing(tables, contents):
    target = tables / ("Accidents" + SUFFIX)
    table_before = target.read_bytes()
    meta_before = client.get("/meta").json()

    r = _upload("Accidents", contents)

    assert r.status_code == 400, r.text
    assert target.read_bytes() == table_before
    assert client.get("/meta").json() == meta_before
    assert not os.path.exists(main.DATASET_BACKUP_DIR), "a refused upload must not take a backup"


def test_meta_years_do_not_depend_on_any_table(tables):
    """A table that got in by another route must still not move the range."""
    (tables / ("Accidents" + SUFFIX)).write_text("County,1999,2030\nAdams,1,2\n")
    meta = client.get("/meta").json()
    assert (meta["year_min"], meta["year_max"]) == (2008, 2022)


def test_allowlist_ignores_the_rate_tables(tmp_path, monkeypatch):
    """A replaced table used to change the valid counties at the next start."""
    static = tmp_path / "static"
    (static / "death_rate_tables").mkdir(parents=True)
    (static / "death_rate_tables" / ("Accidents" + SUFFIX)).write_text("County\nbar\n")
    shutil.copy(REAL_POPULATION, static)
    shutil.copy(os.path.join(main.data_dir, "illinois-counties.geojson"), static)
    monkeypatch.setattr(main, "__file__", str(tmp_path / "main.py"))

    names = set(main._load_county_names().values())

    assert len(names) == 105
    assert "bar" not in names
    assert {"DuPage", "Chicago", "Suburban Cook", "ILLINOIS"} <= names


def test_allowlist_keeps_the_data_spelling():
    """The GeoJSON's uppercase names must not displace the data's spelling."""
    with open(REAL_POPULATION, encoding="utf-8") as f:
        population = {line.split(",")[0] for line in f.read().splitlines()[1:] if line}
    assert main.VALID_COUNTIES == frozenset(population)
    assert len(main.VALID_COUNTIES) == 105


# ── Uploads that must be accepted ─────────────────────────────

@pytest.mark.parametrize("cause", sorted(main.VALID_CAUSES))
def test_every_real_table_is_accepted(tables, cause):
    """Also fails when a pipeline rebuild adds a year or moves out of band."""
    assert main.validate_rate_csv(_real(cause), cause) == []


def test_copy_of_a_real_table_uploads_and_serves(tables):
    contents = _real("Accidents")
    r = _upload("Accidents", contents)
    assert r.status_code == 200, r.text
    assert r.json()["rows"] == 105
    assert r.json()["backup"]
    assert (_overlay(tables) / ("Accidents" + SUFFIX)).read_bytes() == contents
    assert (tables / ("Accidents" + SUFFIX)).read_bytes() == contents, "committed copy untouched"
    assert len(client.get("/death_rates?cause=Accidents").json()) == 105


def test_allowlist_holds_after_an_upload(tables):
    assert _upload("Accidents", _real("Accidents")).status_code == 200
    assert len(set(main._load_county_names().values())) == 105


def test_upload_replaces_what_is_served(tables):
    """The table cache must not keep serving the previous version."""
    client.get("/death_rates?cause=Accidents")
    assert _upload("Accidents", _table("77.5")).status_code == 200
    rows = client.get("/death_rates?cause=Accidents").json()
    assert {row["2015"] for row in rows} == {77.5}


def test_bom_and_crlf_are_accepted(tables):
    """Excel's "CSV UTF-8" writes both. The BOM must not reach the County key."""
    contents = b"\xef\xbb\xbf" + _table().replace(b"\n", b"\r\n")
    assert _upload("Accidents", contents).status_code == 200
    assert not (_overlay(tables) / ("Accidents" + SUFFIX)).read_bytes().startswith(b"\xef\xbb\xbf")
    rows = client.get("/death_rates?cause=Accidents").json()
    assert len(rows) == 105
    assert "County" in rows[0]


def test_empty_cells_stay_null(tables):
    """Unpublished years are blank in real tables, such as COVID_19 before 2020."""
    r = _upload("Accidents", _with_cell(_table(), ""))
    assert r.status_code == 200, r.text
    rows = client.get("/death_rates?cause=Accidents").json()
    assert sum(row["2008"] is None for row in rows) == 1


def test_trailing_blank_lines_are_ignored():
    assert main.validate_rate_csv(_table() + b"\n\n", "Accidents") == []


def test_rows_may_arrive_in_any_order():
    assert main.validate_rate_csv(_table(counties=sorted(main.VALID_COUNTIES, reverse=True)), "Accidents") == []


def test_zero_is_a_real_value():
    assert main.validate_rate_csv(_table("0"), "Accidents") == []


# ── Shape of the file ─────────────────────────────────────────

@pytest.mark.parametrize("header", [
    "County," + ",".join(f"{y}.0" for y in YEARS),  # pandas float-style years
    "County," + ",".join(YEARS[:-1]),               # 2022 missing
    "County," + ",".join([*YEARS, "2023"]),         # year outside the range
    "County," + ",".join([*YEARS[:-1], "2021"]),    # duplicate year
    ",".join(["County", *reversed(YEARS)]),         # wrong order
    ",".join([*YEARS, "County"]),                   # County not first
    "county," + ",".join(YEARS),                    # wrong case
    ";".join(["County", *YEARS]),                   # wrong delimiter
])
def test_wrong_columns_are_refused(header):
    body = _table().decode().split("\n", 1)[1]
    problems = main.validate_rate_csv(f"{header}\n{body}".encode(), "Accidents")
    assert problems and "column" in problems[0].lower()


@pytest.mark.parametrize("contents", [b"", b"\n\n", b"\xef\xbb\xbf"])
def test_empty_files_are_refused(contents):
    assert main.validate_rate_csv(contents, "Accidents")


def test_non_utf8_is_refused():
    problems = main.validate_rate_csv(b"County\n\xff\xfe\n", "Accidents")
    assert problems and "UTF-8" in problems[0]


def test_ragged_rows_are_refused():
    lines = _table().decode().split("\n")
    lines[1] += ",99"
    lines[2] = lines[2].rsplit(",", 1)[0]
    problems = main.validate_rate_csv("\n".join(lines).encode(), "Accidents")
    assert len(problems) == 2
    assert all("columns" in p for p in problems)


# ── County set ────────────────────────────────────────────────

def test_missing_county_is_named():
    counties = [c for c in sorted(main.VALID_COUNTIES) if c != "DuPage"]
    problems = main.validate_rate_csv(_table(counties=counties), "Accidents")
    assert len(problems) == 1
    assert "DuPage" in problems[0]


def test_unknown_county_is_named():
    counties = sorted(main.VALID_COUNTIES) + ["Atlantis"]
    problems = main.validate_rate_csv(_table(counties=counties), "Accidents")
    assert len(problems) == 1
    assert "Atlantis" in problems[0]


def test_duplicate_county_is_named():
    counties = sorted(main.VALID_COUNTIES) + ["Adams"]
    problems = main.validate_rate_csv(_table(counties=counties), "Accidents")
    assert len(problems) == 1
    assert "Adams" in problems[0]


@pytest.mark.parametrize("wrong", ["DUPAGE", "dupage", "DuPage ", " DuPage"])
def test_county_spelling_must_be_exact(wrong):
    """Case or spacing variants would silently fail every lookup by name."""
    counties = [wrong if c == "DuPage" else c for c in sorted(main.VALID_COUNTIES)]
    assert main.validate_rate_csv(_table(counties=counties), "Accidents")


# ── Cells ─────────────────────────────────────────────────────

@pytest.mark.parametrize("cell", [
    "oops", "NA", "N/A", "null", "nan", "NaN", "inf", "-inf", "Infinity",
    "1_000", "1,000", "12.5%", "0x10", " ", " 12.5", "12.5 ",
])
def test_non_numeric_cells_are_refused(cell):
    # A comma in a cell has to be quoted, or the row would just be ragged.
    value = f'"{cell}"' if "," in cell else cell
    problems = main.validate_rate_csv(_with_cell(_table(), value), "Accidents")
    assert len(problems) == 1
    assert "not a number" in problems[0]


@pytest.mark.parametrize("cell", ["-0.01", "-5"])
def test_negative_cells_are_refused(cell):
    problems = main.validate_rate_csv(_with_cell(_table(), cell), "Accidents")
    assert len(problems) == 1
    assert "negative" in problems[0]


def test_a_table_with_no_numbers_is_refused():
    """Every cell may be blank individually, but that would erase the table."""
    problems = main.validate_rate_csv(_table(""), "Accidents")
    assert len(problems) == 1
    assert "no values" in problems[0]


@pytest.mark.parametrize("cell", ["99.99", "3000.01"])
def test_all_cause_band_applies_to_total_deaths(cell):
    problems = main.validate_rate_csv(_with_cell(_table("500"), cell), "Total_Deaths")
    assert len(problems) == 1
    assert "outside" in problems[0]


@pytest.mark.parametrize("cell", ["100", "3000"])
def test_all_cause_band_includes_its_limits(cell):
    assert main.validate_rate_csv(_with_cell(_table("500"), cell), "Total_Deaths") == []


def test_all_cause_band_does_not_apply_to_other_causes():
    assert main.validate_rate_csv(_table("5000"), "Accidents") == []
    assert main.validate_rate_csv(_table("0"), "Accidents") == []


def test_all_cause_band_matches_the_pipeline():
    """The band is copied from the pipeline, so catch the two drifting apart."""
    root = os.path.dirname(os.path.dirname(os.path.abspath(main.__file__)))
    with open(os.path.join(root, "pipeline", "deaths_pipeline.py"), encoding="utf-8") as f:
        source = f.read()
    assert f"ALL_CAUSE_RATE_MIN = {main.ALL_CAUSE_RATE_MIN}" in source
    assert f"ALL_CAUSE_RATE_MAX = {main.ALL_CAUSE_RATE_MAX:_}" in source


# ── The 400 detail ────────────────────────────────────────────

def test_detail_is_a_string_with_at_most_five_problems(tables):
    """AdminPanel renders detail as a React child, so a list would crash it."""
    lines = _table().decode().split("\n")
    for i in range(1, 9):
        cells = lines[i].split(",")
        cells[1] = "oops"
        lines[i] = ",".join(cells)

    r = _upload("Accidents", "\n".join(lines).encode())

    assert r.status_code == 400
    detail = r.json()["detail"]
    assert isinstance(detail, str)
    assert detail.count("not a number") == 5
    assert "3 more" in detail


# ── The write ─────────────────────────────────────────────────

def test_failed_swap_leaves_the_table_intact(tables, monkeypatch):
    overlay = _overlay(tables)
    assert _upload("Accidents", _real("Accidents")).status_code == 200
    target = overlay / ("Accidents" + SUFFIX)
    before = target.read_bytes()
    names_before = sorted(os.listdir(overlay))

    def boom(*_args, **_kwargs):
        raise OSError("disk trouble")

    monkeypatch.setattr(main.os, "replace", boom)
    with pytest.raises(OSError):
        _upload("Accidents", _table())

    assert target.read_bytes() == before
    assert sorted(os.listdir(overlay)) == names_before, "the temp file must be removed"


def test_successful_upload_leaves_no_temp_file(tables):
    assert _upload("Accidents", _table()).status_code == 200
    assert os.listdir(_overlay(tables)) == ["Accidents" + SUFFIX]


def test_new_table_is_never_written_in_place(tables, monkeypatch):
    """Readers must see the old file or the new one, never a partial write."""
    overlay = _overlay(tables)
    target = str(overlay / ("Accidents" + SUFFIX))
    swaps = []
    real_replace = os.replace

    def spy(src, dst):
        with open(src, "rb") as f:
            swaps.append((os.path.dirname(src), dst, f.read()))
        real_replace(src, dst)

    monkeypatch.setattr(main.os, "replace", spy)
    contents = _table()
    assert _upload("Accidents", contents).status_code == 200
    assert swaps == [(str(overlay), target, contents)]
