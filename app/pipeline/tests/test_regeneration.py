"""
Tests that run the pipeline code itself, not the CSVs it last produced.

The tests in test_pipeline.py mostly read committed tables, so they would stay
green if compute_rates, build_population or process_hrsa broke. These rebuild
the tables from the committed sources into a temp folder and compare them with
the committed copies, cell by cell.

Fast:      python -m pytest app/pipeline/tests -q
Rebuild:   PIPELINE_REGEN=1 python -m pytest app/pipeline/tests -q -k regen
"""

import csv
import json
import os
import shutil
import subprocess
import sys

import pandas as pd
import pytest

HERE = os.path.dirname(os.path.abspath(__file__))
PIPELINE = os.path.dirname(HERE)
REPO = os.path.normpath(os.path.join(PIPELINE, "..", ".."))
sys.path.insert(0, PIPELINE)

import deaths_pipeline as dp  # noqa: E402
import process_hrsa  # noqa: E402
from extract_pdf_data import VALID_COUNTIES  # noqa: E402

RATE_TABLES = os.path.join("app", "backend", "static", "death_rate_tables")
PROVIDER_TABLES = os.path.join("app", "backend", "static", "provider_tables")
COUNTS = os.path.join("data", "extracted", "death_counts_by_year")
POPULATION_FILES = [
    os.path.join("data", "reference", "population_by_county_year.csv"),
    os.path.join("app", "backend", "static", "population_by_county_year.csv"),
]
# Every .asc file process_hrsa reads.
AHRF_FILES = [
    os.path.join(process_hrsa.RAW, "21-22", "DATA", "ahrf2022.asc"),
    os.path.join(process_hrsa.RAW, "09-10", "ahrf2009.asc"),
    os.path.join(process_hrsa.RAW, "12-13", "ahrf2012.asc"),
]

LFS_POINTER = (
    "version https://git-lfs.github.com/spec/v1\n"
    "oid sha256:0000000000000000000000000000000000000000000000000000000000000000\n"
    "size 103074225\n"
)


# ── Comparing by value ────────────────────────────────────────────────────────

def _same_value(a: str, b: str) -> bool:
    if a == b:
        return True
    try:
        return float(a) == float(b)
    except ValueError:
        return False


def _csv_rows(path: str) -> list[list[str]]:
    # newline="" lets csv.reader accept LF and CRLF alike, and a Windows
    # checkout with autocrlf holds CRLF copies of LF blobs.
    with open(path, newline="", encoding="utf-8") as f:
        return list(csv.reader(f))


def csv_differences(generated: str, committed: str) -> list[str]:
    """Each cell that differs in value. Line endings and '1' vs '1.0' do not count."""
    new, old = _csv_rows(generated), _csv_rows(committed)
    name = os.path.basename(committed)
    if len(new) != len(old):
        return [f"{name}: {len(new)} rows, committed has {len(old)}"]
    diffs = []
    for i, (new_row, old_row) in enumerate(zip(new, old)):
        if len(new_row) != len(old_row):
            diffs.append(f"{name} row {i}: {len(new_row)} cells, committed has {len(old_row)}")
            continue
        for j, (a, b) in enumerate(zip(new_row, old_row)):
            if not _same_value(a, b):
                diffs.append(f"{name} {old_row[0]!r} {old[0][j]!r}: generated {a!r}, committed {b!r}")
    return diffs


def file_differences(generated: str, committed: str) -> list[str]:
    if not os.path.exists(committed):
        return [f"{os.path.basename(committed)}: not committed"]
    if generated.endswith(".json"):
        with open(generated, encoding="utf-8") as g, open(committed, encoding="utf-8") as c:
            same = json.load(g) == json.load(c)
        return [] if same else [f"{os.path.basename(committed)}: JSON differs"]
    return csv_differences(generated, committed)


def tree_differences(generated_dir: str, committed_dir: str) -> list[str]:
    """Compare two folders that must hold the same files, file by file."""
    new, old = set(os.listdir(generated_dir)), set(os.listdir(committed_dir))
    diffs = [f"{f}: generated but not committed" for f in sorted(new - old)]
    diffs += [f"{f}: committed but not generated" for f in sorted(old - new)]
    for fname in sorted(new & old):
        diffs += file_differences(os.path.join(generated_dir, fname), os.path.join(committed_dir, fname))
    return diffs


def test_comparison_ignores_line_endings_and_number_format(tmp_path):
    a, b = tmp_path / "a.csv", tmp_path / "b.csv"
    a.write_bytes(b"County,2008\nPope,1.0\nBond,\n")
    b.write_bytes(b"County,2008\r\nPope,1\r\nBond,\r\n")
    assert csv_differences(str(a), str(b)) == []


def test_comparison_tells_blank_from_zero(tmp_path):
    # Blank means IDPH did not publish it, so 0 in its place is a real change.
    a, b = tmp_path / "a.csv", tmp_path / "b.csv"
    a.write_bytes(b"County,2008\nPope,0.0\n")
    b.write_bytes(b"County,2008\nPope,\n")
    assert len(csv_differences(str(a), str(b))) == 1


def test_comparison_catches_one_flipped_committed_value(tmp_path):
    """The rebuild comparison has to fail if one committed value moves."""
    source = os.path.join(REPO, RATE_TABLES)
    identical = tmp_path / "identical"
    shutil.copytree(source, identical)
    assert tree_differences(str(identical), source) == []

    target = identical / "Total_Deaths_death_rates_by_county_year.csv"
    rows = _csv_rows(str(target))
    adams = next(r for r in rows if r[0] == "Adams")
    adams[1] = str(float(adams[1]) + 0.01)
    with open(target, "w", newline="", encoding="utf-8") as f:
        csv.writer(f).writerows(rows)

    diffs = tree_differences(str(identical), source)
    assert len(diffs) == 1
    assert "Adams" in diffs[0] and "2008" in diffs[0]


# ── compute_rates on known inputs ─────────────────────────────────────────────

def _synthetic_inputs():
    """Every county at 50,000 people and 500 deaths, except Adams and Pope."""
    real = sorted(VALID_COUNTIES - {"ILLINOIS", *dp.COOK_SUBDIVISIONS})
    assert len(real) == 102
    people = {c: 50_000 for c in VALID_COUNTIES}
    people.update({"Adams": 80_000, "Pope": 4_000})
    people["ILLINOIS"] = sum(people[c] for c in real)
    pop = pd.DataFrame({y: people for y in dp.YEARS})

    all_dfs = {}
    for year in dp.YEARS:
        rows = []
        for county in real + dp.COOK_SUBDIVISIONS:
            deaths = {"Adams": 800.0, "Pope": 2.0}.get(county, 500.0)
            rows.append({"County": county, "Total_Deaths": deaths, "Diseases_of_Heart": deaths / 2})
        state = sum(r["Total_Deaths"] for r in rows if r["County"] in real)
        rows.append({"County": "ILLINOIS", "Total_Deaths": state, "Diseases_of_Heart": state / 2})
        all_dfs[year] = pd.DataFrame(rows)
    return all_dfs, pop, people


def _cell(pivots, cause, county, year):
    df = pivots[cause]
    return df.loc[df["County"] == county, str(year)].iloc[0]


def test_compute_rates_divides_by_that_county_and_years_population():
    all_dfs, pop, _ = _synthetic_inputs()
    pop.at["Adams", 2015] = 100_000
    pivots = dp.compute_rates(all_dfs, pop)
    assert _cell(pivots, "Total_Deaths", "Adams", 2014) == 1000.0
    assert _cell(pivots, "Total_Deaths", "Adams", 2015) == 800.0
    assert _cell(pivots, "Total_Deaths", "Pope", 2014) == 50.0
    assert _cell(pivots, "Diseases_of_Heart", "Adams", 2014) == 500.0


def test_compute_rates_state_row_uses_published_count_over_state_population():
    all_dfs, pop, people = _synthetic_inputs()
    df = all_dfs[2010]
    df.loc[df["County"] == "ILLINOIS", "Total_Deaths"] = 51_000.0
    pivots = dp.compute_rates(all_dfs, pop)
    expected = round(51_000.0 / people["ILLINOIS"] * 100_000, 2)
    assert _cell(pivots, "Total_Deaths", "ILLINOIS", 2010) == expected
    assert pivots["Total_Deaths"].iloc[0]["County"] == "ILLINOIS"


def test_compute_rates_leaves_unpublished_causes_blank_not_zero():
    all_dfs, pop, _ = _synthetic_inputs()
    pivots = dp.compute_rates(all_dfs, pop)
    assert sorted(pivots) == sorted(dp.ALL_CAUSES)
    assert pivots["COVID_19"][[str(y) for y in dp.YEARS]].isna().all().all()


# ── Git LFS pointers ──────────────────────────────────────────────────────────

def _pointer_release_tree(root, content: str | None = LFS_POINTER) -> None:
    for parts in (("21-22", "DATA", "ahrf2022.asc"), ("09-10", "ahrf2009.asc"), ("12-13", "ahrf2012.asc")):
        path = root.joinpath(*parts)
        path.parent.mkdir(parents=True, exist_ok=True)
        if content is not None:
            path.write_text(content)


def test_lfs_pointer_failure_names_the_cause_and_the_fix(tmp_path, monkeypatch):
    # A clone without git-lfs used to stop at "expected 102 IL counties ... got
    # 0", which says nothing about why.
    _pointer_release_tree(tmp_path)
    monkeypatch.setattr(process_hrsa, "RAW", str(tmp_path))
    monkeypatch.setattr(process_hrsa, "OUT_DIR", str(tmp_path / "out"))
    with pytest.raises(SystemExit) as exc:
        process_hrsa.main()
    message = str(exc.value)
    assert "Git LFS pointer" in message
    assert "git lfs pull" in message
    assert "got 0" not in message
    assert not (tmp_path / "out").exists()


def test_missing_ahrf_file_names_the_fix(tmp_path, monkeypatch):
    _pointer_release_tree(tmp_path, content=None)
    monkeypatch.setattr(process_hrsa, "RAW", str(tmp_path))
    monkeypatch.setattr(process_hrsa, "OUT_DIR", str(tmp_path / "out"))
    with pytest.raises(SystemExit) as exc:
        process_hrsa.main()
    assert "git lfs pull" in str(exc.value)


def test_a_real_data_file_passes_the_pointer_check(tmp_path):
    real = tmp_path / "ahrf.asc"
    real.write_text("01001AHRF 01001   20222221232094Alabama\n")
    process_hrsa.require_real_asc(str(real))


def test_importing_the_pipeline_writes_nothing(tmp_path):
    """Importing process_hrsa used to create the provider tables folder."""
    code = "import build_population, deaths_pipeline, process_hrsa, validate_death_rates"
    env = {**os.environ, "PIPELINE_OUTPUT_ROOT": str(tmp_path / "out"), "PYTHONPATH": PIPELINE}
    subprocess.run([sys.executable, "-c", code], cwd=tmp_path, env=env, check=True)
    assert not (tmp_path / "out").exists()


def test_output_root_redirects_only_the_outputs(tmp_path):
    """Sources must still come from the repo, or the rebuild proves nothing."""
    code = (
        "import build_population as b, deaths_pipeline as d, process_hrsa as h, validate_death_rates as v\n"
        "for p in (b.OUT_FILE, b.SERVED_COPY, d.COUNTS_DIR, d.TABLES_DIR, d.POP_FILE, h.OUT_DIR,\n"
        "          v.TABLES_DIR, v.POP_FILE):\n"
        "    print('OUT', p)\n"
        "for p in (b.CENSUS_DIR, d.PDF_DIR, h.RAW):\n"
        "    print('SRC', p)\n"
    )
    root = str(tmp_path / "out")
    env = {**os.environ, "PIPELINE_OUTPUT_ROOT": root, "PYTHONPATH": PIPELINE}
    out = subprocess.run(
        [sys.executable, "-c", code], cwd=tmp_path, env=env, check=True, capture_output=True, text=True,
    ).stdout
    lines = [line.split(" ", 1) for line in out.splitlines()]
    assert len(lines) == 11
    for kind, path in lines:
        assert path.startswith(root) == (kind == "OUT"), path


# ── Full rebuild ──────────────────────────────────────────────────────────────

def _lfs_pointer_or_missing() -> list[str]:
    return [p for p in AHRF_FILES if process_hrsa.asc_problem(p)]


regen = pytest.mark.skipif(
    os.environ.get("PIPELINE_REGEN") != "1",
    reason="full rebuild takes about a minute; set PIPELINE_REGEN=1 to run it",
)


def _committed_mtimes() -> dict[str, int]:
    found = {}
    for sub in (RATE_TABLES, PROVIDER_TABLES, COUNTS):
        folder = os.path.join(REPO, sub)
        for fname in os.listdir(folder):
            found[os.path.join(sub, fname)] = os.stat(os.path.join(folder, fname)).st_mtime_ns
    for rel in POPULATION_FILES:
        found[rel] = os.stat(os.path.join(REPO, rel)).st_mtime_ns
    return found


def _run_stages(root, flag: str) -> None:
    env = {**os.environ, "PIPELINE_OUTPUT_ROOT": str(root), "PYTHONIOENCODING": "utf-8"}
    done = subprocess.run(
        [sys.executable, "run_pipeline.py", flag], cwd=PIPELINE, env=env,
        capture_output=True, text=True, encoding="utf-8", timeout=3600,
    )
    assert done.returncode == 0, f"run_pipeline {flag} failed:\n{done.stdout[-3000:]}\n{done.stderr[-3000:]}"


@pytest.fixture(scope="module")
def deaths_rebuild(tmp_path_factory):
    root = tmp_path_factory.mktemp("regen_deaths")
    before = _committed_mtimes()
    _run_stages(root, "--deaths")
    assert _committed_mtimes() == before, "the rebuild wrote into the repo"
    return root


@pytest.fixture(scope="module")
def provider_rebuild(tmp_path_factory):
    bad = _lfs_pointer_or_missing()
    if bad:
        pytest.skip(f"AHRF .asc files are Git LFS pointers or missing ({len(bad)} of "
                    f"{len(AHRF_FILES)}); run 'git lfs install && git lfs pull'")
    root = tmp_path_factory.mktemp("regen_providers")
    before = _committed_mtimes()
    _run_stages(root, "--hrsa")
    assert _committed_mtimes() == before, "the rebuild wrote into the repo"
    return root


@regen
@pytest.mark.slow
def test_regen_population_matches_committed(deaths_rebuild):
    for rel in POPULATION_FILES:
        assert csv_differences(str(deaths_rebuild / rel), os.path.join(REPO, rel)) == []


@regen
@pytest.mark.slow
def test_regen_death_rate_tables_match_committed(deaths_rebuild):
    generated = deaths_rebuild / RATE_TABLES
    assert len(os.listdir(generated)) == 15
    assert tree_differences(str(generated), os.path.join(REPO, RATE_TABLES)) == []


@regen
@pytest.mark.slow
def test_regen_death_counts_match_committed(deaths_rebuild):
    generated = deaths_rebuild / COUNTS
    names = sorted(os.listdir(generated))
    assert names == [f"death_data_{y}.csv" for y in range(2008, 2023)]
    diffs = []
    for fname in names:
        diffs += file_differences(str(generated / fname), os.path.join(REPO, COUNTS, fname))
    assert diffs == []


@regen
@pytest.mark.slow
def test_regen_provider_tables_match_committed(provider_rebuild):
    generated = provider_rebuild / PROVIDER_TABLES
    assert tree_differences(str(generated), os.path.join(REPO, PROVIDER_TABLES)) == []
