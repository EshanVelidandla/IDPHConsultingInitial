"""
Failure guards in deaths_pipeline.py.

A future change in how a PDF spells a county used to blank that county in the
published tables while the run exited 0 and printed a success message. These
tests start from the committed counts, break them on purpose and expect the run
to stop before anything is written.

Adams is about 0.7% of the state, so losing it trips the statewide cross-check
first. Hardin is about 0.05%, under any useful threshold, so only the county-set
check in audit can catch it. Both paths are tested.

Run: python -m pytest app/pipeline/tests -q
"""

import os
import sys

import numpy as np
import pandas as pd
import pytest

HERE = os.path.dirname(os.path.abspath(__file__))
PIPELINE = os.path.dirname(HERE)
sys.path.insert(0, PIPELINE)

import deaths_pipeline as dp  # noqa: E402

# Captured at import, because some tests point the module at a temp folder.
COMMITTED_COUNTS = os.path.normpath(dp.COUNTS_DIR)
COMMITTED_TABLES = os.path.normpath(dp.TABLES_DIR)


def _counts():
    return {
        year: pd.read_csv(os.path.join(COMMITTED_COUNTS, f"death_data_{year}.csv"))
        for year in dp.YEARS
    }


def _without(all_dfs, county, year=2019):
    df = all_dfs[year]
    all_dfs[year] = df[df["County"] != county].copy()
    return all_dfs


@pytest.fixture
def pop():
    return dp.load_population()


@pytest.fixture
def temp_outputs(monkeypatch, tmp_path):
    counts = tmp_path / "counts"
    tables = tmp_path / "tables"
    monkeypatch.setattr(dp, "COUNTS_DIR", str(counts))
    monkeypatch.setattr(dp, "TABLES_DIR", str(tables))
    return counts, tables


def _written(*dirs):
    return [f for d in dirs if d.exists() for f in os.listdir(d)]


# ── Today's data must pass ────────────────────────────────────────────────────

def test_committed_counts_pass_every_guard(pop):
    all_dfs = _counts()
    dp.audit(all_dfs, dp.compute_rates(all_dfs, pop))


# ── Missing county-years ──────────────────────────────────────────────────────

def test_audit_raises_on_a_missing_county_year(pop):
    all_dfs = _counts()
    pivots = dp.compute_rates(all_dfs, pop)
    _without(all_dfs, "Adams")
    with pytest.raises(ValueError, match=r"2019.*Adams"):
        dp.audit(all_dfs, pivots)


def test_small_county_passes_the_drift_check_but_fails_audit(pop):
    all_dfs = _without(_counts(), "Hardin")
    pivots = dp.compute_rates(all_dfs, pop)
    assert pd.isna(pivots["Total_Deaths"].set_index("County").at["Hardin", "2019"])
    with pytest.raises(ValueError, match=r"2019.*Hardin"):
        dp.audit(all_dfs, pivots)


def test_audit_raises_on_a_blank_all_cause_cell(pop):
    # A row can be present with nothing in it, which the county set cannot see.
    all_dfs = _counts()
    df = all_dfs[2019]
    df.loc[df["County"] == "Hardin", "Total_Deaths"] = np.nan
    pivots = dp.compute_rates(all_dfs, pop)
    with pytest.raises(ValueError, match=r"Hardin.*2019"):
        dp.audit(all_dfs, pivots)


def test_success_message_counts_only_the_cells_it_checked(pop, capsys):
    all_dfs = _counts()
    pivots = dp.compute_rates(all_dfs, pop)
    total = pivots["Total_Deaths"]
    year_cols = [c for c in total.columns if c != "County"]
    expected = int(total[year_cols].notna().sum().sum())
    capsys.readouterr()
    dp.audit(all_dfs, pivots)
    assert f"All {expected} all-cause cells" in capsys.readouterr().out


# ── Denominators ──────────────────────────────────────────────────────────────

def test_county_with_no_population_row_raises(pop):
    with pytest.raises(ValueError, match="Adams"):
        dp.compute_rates(_counts(), pop.drop(index="Adams"))


@pytest.mark.parametrize("bad", [0, np.nan])
def test_county_with_an_unusable_population_raises(pop, bad):
    pop = pop.astype(float)
    pop.at["Adams", 2019] = bad
    with pytest.raises(ValueError, match=r"Adams.*2019"):
        dp.compute_rates(_counts(), pop)


# ── Statewide cross-check ─────────────────────────────────────────────────────

def test_drift_above_threshold_raises_and_names_the_missing_county(pop):
    # Adams 2019 moves the county sum by -0.75%.
    with pytest.raises(ValueError, match=r"2019.*-0\.7\d%.*Adams"):
        dp.compute_rates(_without(_counts(), "Adams"), pop)


def test_drift_threshold_applies_with_every_county_present(pop):
    all_dfs = _counts()
    df = all_dfs[2019]
    published = df.loc[df["County"] == "ILLINOIS", "Total_Deaths"].iloc[0]
    df.loc[df["County"] == "ILLINOIS", "Total_Deaths"] = published * 1.01
    with pytest.raises(ValueError, match="2019"):
        dp.compute_rates(all_dfs, pop)


def test_missing_statewide_row_raises(pop):
    # Without a published total the cross-check has nothing to compare against
    # and the ILLINOIS row would be blank, so it must not pass quietly.
    with pytest.raises(ValueError, match=r"2019.*ILLINOIS"):
        dp.compute_rates(_without(_counts(), "ILLINOIS"), pop)


# ── A failed run leaves the outputs alone ─────────────────────────────────────

@pytest.mark.parametrize("county", ["Adams", "Hardin"])
def test_failed_run_writes_nothing(monkeypatch, temp_outputs, county):
    broken = _without(_counts(), county)
    monkeypatch.setattr(dp, "extract_all_years", lambda: broken)
    with pytest.raises(ValueError, match=county):
        dp.main()
    assert _written(*temp_outputs) == []


def test_extraction_alone_writes_nothing(monkeypatch, temp_outputs):
    committed = _counts()
    monkeypatch.setattr(dp, "_pdf_for_year", lambda year: f"{year}.pdf")
    monkeypatch.setattr(dp, "extract_year", lambda pdf, year: committed[year])
    assert sorted(dp.extract_all_years()) == dp.YEARS
    assert _written(*temp_outputs) == []


def test_clean_run_writes_counts_and_unchanged_tables(monkeypatch, temp_outputs):
    counts, tables = temp_outputs
    committed = _counts()
    monkeypatch.setattr(dp, "extract_all_years", lambda: committed)
    dp.main()
    assert sorted(os.listdir(counts)) == [f"death_data_{y}.csv" for y in dp.YEARS]
    assert len(os.listdir(tables)) == len(dp.ALL_CAUSES)
    for fname in os.listdir(tables):
        pd.testing.assert_frame_equal(
            pd.read_csv(tables / fname),
            pd.read_csv(os.path.join(COMMITTED_TABLES, fname)),
        )
