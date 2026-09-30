"""
Regression tests for the published numbers.

These exist because the review found nine years of cause columns mapped to the
wrong causes and every rate divided by a wrong denominator, and nothing in the
repo would have caught either. Each test pins a value that can be checked by
eye against the source PDF or a Census table.

Run: python -m pytest app/pipeline/tests -q
"""

import csv
import os
import sys

import pytest

HERE = os.path.dirname(os.path.abspath(__file__))
PIPELINE = os.path.dirname(HERE)
REPO = os.path.join(PIPELINE, "..", "..")
sys.path.insert(0, PIPELINE)

import extract_pdf_data as ex  # noqa: E402

RATES = os.path.join(REPO, "app", "backend", "static", "death_rate_tables")
PROVIDERS = os.path.join(REPO, "app", "backend", "static", "provider_tables")
POP_FILE = os.path.join(REPO, "data", "reference", "population_by_county_year.csv")
PDF_DIR = os.path.join(REPO, "data", "source", "idph_death_reports")

YEARS = [str(y) for y in range(2008, 2023)]


def _table(path):
    with open(path, newline="") as f:
        return {r["County"]: r for r in csv.DictReader(f)}


def _rate(cause, county, year):
    raw = _table(os.path.join(RATES, f"{cause}_death_rates_by_county_year.csv"))[county][str(year)]
    return None if raw == "" else float(raw)


# ── Column schemas ────────────────────────────────────────────────────────────

def test_every_year_has_a_verified_schema():
    assert sorted(ex.YEAR_SCHEMAS) == list(range(2008, 2023))


def test_unknown_year_raises_instead_of_guessing():
    # The old get_schema fell back to the nearest year with a warning, which
    # would have silently parsed a 2023 report with the 2022 column order.
    with pytest.raises(ex.SchemaError):
        ex.get_schema(2023)


@pytest.mark.parametrize("year,expected", [
    # Verified against the printed header of each source PDF. The volatile
    # stretch is positions 3-5.
    (2008, [ex.STROKE, ex.CLRD, ex.ACCIDENT]),
    (2009, [ex.CLRD, ex.STROKE, ex.ACCIDENT]),
    (2010, [ex.STROKE, ex.CLRD, ex.ACCIDENT]),
    (2013, [ex.CLRD, ex.STROKE, ex.ACCIDENT]),
    (2016, [ex.STROKE, ex.CLRD, ex.ACCIDENT]),
    (2017, [ex.STROKE, ex.ACCIDENT, ex.CLRD]),
    (2018, [ex.ACCIDENT, ex.STROKE, ex.CLRD]),
    (2022, [ex.ACCIDENT, ex.COVID, ex.STROKE]),
])
def test_volatile_columns_match_the_pdfs(year, expected):
    assert ex.YEAR_SCHEMAS[year][3:6] == expected


def test_2010_and_2011_put_kidney_disease_before_diabetes():
    for year in (2010, 2011):
        assert ex.YEAR_SCHEMAS[year][7] == ex.KIDNEY
        assert ex.YEAR_SCHEMAS[year][8] == ex.DIABETES


def test_2021_last_column_is_liver_disease_not_influenza():
    assert ex.YEAR_SCHEMAS[2021][-1] == ex.LIVER


# ── Parser hardening ──────────────────────────────────────────────────────────

def test_stray_comma_does_not_crash():
    # `_parse_nums('Adams 843 , 199')` used to raise ValueError.
    assert ex._parse_nums("Adams 843 , 199") == [843.0, 199.0]


def test_suppression_marker_holds_its_column():
    # A '*' used to be dropped, shifting every later value one column left.
    assert ex._parse_nums("Pope 45 12 * 3") == [45.0, 12.0, None, 3.0]


def test_row_with_too_few_values_raises():
    with pytest.raises(ex.SchemaError):
        ex._build_row("Pope", [1.0, 2.0, 3.0], ex.YEAR_SCHEMAS[2022], 2022)


@pytest.mark.skipif(not os.path.isdir(PDF_DIR), reason="source PDFs not present")
def test_header_guard_rejects_a_wrong_schema(monkeypatch):
    """The guard must fail the run rather than warn, or it is useless."""
    pdf = next(
        os.path.join(PDF_DIR, f) for f in os.listdir(PDF_DIR) if "2009" in f and f.endswith(".pdf")
    )
    wrong = list(ex.YEAR_SCHEMAS[2009])
    wrong[3], wrong[4] = wrong[4], wrong[3]
    with pytest.raises(ex.SchemaError):
        ex.verify_header_order(pdf, 2009, wrong)


# ── Denominators ──────────────────────────────────────────────────────────────

def test_population_table_covers_every_county_and_year():
    pop = _table(POP_FILE)
    assert len(pop) == 105  # 102 counties + Chicago + Suburban Cook + ILLINOIS
    for county, row in pop.items():
        for year in YEARS:
            assert row[year] not in ("", None), f"{county} {year} missing"


def test_suburban_cook_is_cook_minus_chicago():
    pop = _table(POP_FILE)
    for year in YEARS:
        cook = int(pop["Cook"][year])
        chicago = int(pop["Chicago"][year])
        assert int(pop["Suburban Cook"][year]) == cook - chicago


def test_statewide_population_excludes_the_cook_subdivisions():
    """Summing Cook, Chicago and Suburban Cook would count Cook twice."""
    pop = _table(POP_FILE)
    for year in ("2008", "2015", "2022"):
        counties = sum(
            int(row[year]) for name, row in pop.items()
            if name not in ("ILLINOIS", "Chicago", "Suburban Cook")
        )
        assert int(pop["ILLINOIS"][year]) == counties


def test_illinois_population_matches_census():
    # Census Population Estimates, Illinois: 12,747,038 (2008 intercensal) and
    # 12,671,821 (vintage 2019). If these drift, the source files changed.
    pop = _table(POP_FILE)
    assert int(pop["ILLINOIS"]["2008"]) == 12_747_038
    assert int(pop["ILLINOIS"]["2019"]) == 12_671_821


# ── Published rates ───────────────────────────────────────────────────────────

def test_suburban_cook_rate_is_physically_possible():
    # This row read 13,497 per 100k in 2008 because it had been given the mean
    # county population (152,386) instead of its own 2.46 million.
    for year in YEARS:
        rate = _rate("Total_Deaths", "Suburban Cook", year)
        assert rate is not None and 400 < rate < 1500, f"{year}: {rate}"


def test_all_cause_rates_are_plausible_everywhere():
    table = _table(os.path.join(RATES, "Total_Deaths_death_rates_by_county_year.csv"))
    for county, row in table.items():
        for year in YEARS:
            rate = float(row[year])
            assert 100 < rate < 3000, f"{county} {year} = {rate}"


def test_known_county_year_recomputes():
    """Adams 2008: 843 deaths (PDF) over 66,943 people (Census) = 1259.29."""
    pop = _table(POP_FILE)
    expected = round(843 / int(pop["Adams"]["2008"]) * 100_000, 2)
    assert _rate("Total_Deaths", "Adams", 2008) == expected


def test_2009_stroke_and_clrd_are_not_swapped():
    """
    The 2009 PDF prints CLRD 5,298 then stroke 5,243. Before the schema fix the
    served tables had those two the other way round, plus accidents in CLRD's
    column.
    """
    pop = _table(POP_FILE)
    denom = int(pop["ILLINOIS"]["2009"])
    assert _rate("Cerebrovascular_Diseases", "ILLINOIS", 2009) == round(5243 / denom * 100_000, 2)
    assert _rate("Chronic_Lower_Respiratory_Diseases", "ILLINOIS", 2009) == round(5298 / denom * 100_000, 2)
    assert _rate("Accidents", "ILLINOIS", 2009) == round(3958 / denom * 100_000, 2)


def test_2018_accidents_come_before_stroke():
    """The 2018 PDF prints accidents 6,013 then stroke 5,853."""
    pop = _table(POP_FILE)
    denom = int(pop["ILLINOIS"]["2018"])
    assert _rate("Accidents", "ILLINOIS", 2018) == round(6013 / denom * 100_000, 2)
    assert _rate("Cerebrovascular_Diseases", "ILLINOIS", 2018) == round(5853 / denom * 100_000, 2)


# ── Missing data ──────────────────────────────────────────────────────────────

@pytest.mark.parametrize("cause,year", [
    ("Intentional_Self_Harm", "2018"),
    ("Chronic_Liver_Disease_Cirrhosis", "2018"),
    ("All_Other_Causes", "2018"),
    ("COVID_19", "2015"),
])
def test_unpublished_causes_are_blank_not_zero(cause, year):
    """A cause IDPH stopped publishing must read as no data, never as 0."""
    assert _rate(cause, "ILLINOIS", year) is None


def test_no_cause_is_entirely_zero_in_any_year():
    for fname in os.listdir(RATES):
        if not fname.endswith(".csv"):
            continue
        table = _table(os.path.join(RATES, fname))
        for year in YEARS:
            values = [table[c][year] for c in table]
            present = [float(v) for v in values if v != ""]
            assert not (present and all(v == 0 for v in present)), f"{fname} {year} all zero"


# ── Provider metrics ──────────────────────────────────────────────────────────

def test_provider_state_row_is_population_weighted():
    """
    Plain-mean Illinois had 105.7 MDs per 100k while Cook alone had 447,
    because Pope County counted the same as Cook.
    """
    mds = _table(os.path.join(PROVIDERS, "total_active_mds_per_100k_by_county_year.csv"))
    pop = _table(POP_FILE)
    year = "2019"
    num = den = 0.0
    for county, row in mds.items():
        if county == "ILLINOIS" or row[year] == "":
            continue
        people = int(pop[county][year])
        num += float(row[year]) / 100_000 * people
        den += people
    assert float(mds["ILLINOIS"][year]) == pytest.approx(num / den * 100_000, abs=0.5)
    assert float(mds["ILLINOIS"][year]) > 200  # a plain mean gives ~106


def test_hpsa_has_no_state_average():
    """Category codes must not be averaged into a statewide number."""
    hpsa = _table(os.path.join(PROVIDERS, "hpsa_primary_care_designation_by_county_year.csv"))
    assert all(hpsa["ILLINOIS"][y] == "" for y in YEARS)


def test_hpsa_summary_counts_add_up():
    path = os.path.join(PROVIDERS, "hpsa_primary_care_summary_by_year.csv")
    with open(path, newline="") as f:
        for row in csv.DictReader(f):
            total = int(row["not_designated"]) + int(row["whole_county"]) + int(row["part_of_county"])
            assert total == 102, f"{row['Year']}: {total} counties"
            assert int(row["counties_designated"]) == int(row["whole_county"]) + int(row["part_of_county"])


def test_provenance_marks_interpolated_years_honestly():
    """
    Beds and psychiatry come from three AHRF survey years. The old validator
    counted every filled cell as observed and reported no gaps at all.
    """
    import json
    with open(os.path.join(PROVIDERS, "metric_provenance.json")) as f:
        prov = json.load(f)
    assert prov["hospital_beds_per_100k"]["source_years"] == [2010, 2015, 2020]
    assert len(prov["hospital_beds_per_100k"]["imputed_years"]) == 12
    # 2013 and 2014 are the only HPSA years not recoverable from the repo.
    assert prov["hpsa_primary_care_designation"]["imputed_years"] == [2013, 2014]


def test_zero_provider_counties_are_kept():
    """Counties with no primary care physicians are the point, not noise."""
    pc = _table(os.path.join(PROVIDERS, "primary_care_physicians_per_100k_by_county_year.csv"))
    zeros = [c for c, row in pc.items() if c != "ILLINOIS" and row["2019"] == "0.0"]
    assert zeros, "expected some counties with zero primary care physicians"
