# Illinois Mortality and Provider Access Dashboard

County-level mortality and healthcare-access analytics for the Illinois
Department of Public Health, built with the Center for Health Informatics at
the UIUC School of Information Sciences.

The dashboard shows crude death rates by cause for all 102 Illinois counties
(plus Chicago and Suburban Cook as separate IDPH reporting units) for 2008 to
2022, alongside provider supply measures from the HRSA Area Health Resources
File.

## Repository layout

```
app/
  backend/          FastAPI service
    main.py         API: rates, providers, population, annotations, admin
    auth.py         user store (authentication is currently bypassed, see below)
    storage.py      small JSON document store for runtime state
    static/         data the API serves (pipeline output, committed)
    var/            runtime state written by the app (gitignored)
  frontend/         React + TypeScript + Vite single-page app
    src/data/       shared analytics, data hooks and constants
    src/components/ views
  pipeline/         data preparation, run in order by run_pipeline.py
    build_population.py    Census files    -> population table
    extract_pdf_data.py    IDPH PDFs       -> county death counts
    deaths_pipeline.py     counts + pop    -> death rate tables
    validate_death_rates.py                -> read-only checks
    process_hrsa.py        AHRF files      -> provider tables
    tests/                 regression tests on the published numbers

data/
  source/
    idph_death_reports/  15 IDPH annual PDFs, 2008-2022 (committed)
    ahrf/                HRSA AHRF fixed-width data and SAS layouts
    census/              Census population estimate files
  reference/
    population_by_county_year.csv   the denominators every rate divides by
  extracted/
    death_counts_by_year/           per-year county death counts from the PDFs
  archive/
    county_extracts/                earlier per-county extracts, kept for reference
```

## Running it

Backend:

```bash
cd app/backend
python -m venv venv && source venv/Scripts/activate   # Windows: venv\Scripts\activate
pip install -r requirements.txt
uvicorn main:app --reload --port 8000
```

Frontend, in a second terminal:

```bash
cd app/frontend
npm install
VITE_API_BASE=http://127.0.0.1:8000 npm run dev      # http://localhost:5173
```

`VITE_API_BASE` is required in development because the SPA and the API run on
different ports. In production the SPA is built directly into `app/backend/ui/`
and served from the same origin, so `API_BASE` stays empty.

To build for single-origin serving:

```bash
cd app/frontend && npm run build
```

## Rebuilding the data

```bash
cd app/pipeline
pip install -r requirements.txt
python run_pipeline.py
```

Every stage is a pure function of committed inputs. Nothing reads its own
previous output, so two runs from a clean checkout produce identical numbers.

Run the tests before trusting a change to any stage:

```bash
python -m pytest app/pipeline/tests -q    # the published numbers
python -m pytest app/backend/tests -q     # API and SPA routing
```

The routing suite covers the single-origin deployment: every client route must
return the SPA, every API route must answer, and an unknown API path must
return a JSON 404 rather than the page with a 200.

## Methodology

**Rates are crude, not age-adjusted.** The pipeline computes deaths divided by
county population times 100,000. The IDPH county reports publish totals only,
with no age breakdown, so age standardisation is not possible from this source.
Counties with older populations therefore read higher than they would on an
age-adjusted basis. Adding true age-adjusted rates would need an IDPH vital
records extract or CDC WONDER.

**Denominators** come from the Census Population Estimates Program, committed
under `data/source/census/` and compiled by `build_population.py`. The vintage
changes at 2010 and 2020 because Census rebases after each decennial count.

**Chicago and Suburban Cook** are IDPH reporting units, not Census geographies.
IDPH reports Cook County three ways: the whole county, Chicago, and the
suburban remainder. Census publishes the county and the city but not the
remainder, so Suburban Cook is derived as Cook minus Chicago, from the same
vintage in both terms. Statewide figures use the 102 real counties only, so
Cook is not counted twice.

**Statewide rates** use IDPH's own published ILLINOIS count over the state
population. `deaths_pipeline.py` cross-checks that against the sum of the 102
counties and reports the drift, which currently runs under 0.1% in every year.

**Missing data is blank, never zero.** IDPH stopped publishing several causes
partway through the series: suicide and chronic liver disease after 2014, "all
other causes" after 2012, septicemia after 2019. Those cells are empty end to
end, and the UI renders them as "no data". Nothing in this dataset is
suppressed for small counts.

**Column order changes between report years.** `YEAR_SCHEMAS` in
`extract_pdf_data.py` maps each year's printed column order, verified against
every source PDF. `verify_header_order()` re-checks the schema against each
PDF's own header at extraction time and fails the run on a mismatch.

**Provider metrics are not all annual.** Total MDs and primary care physicians
come from twelve and eleven AHRF years respectively; hospital beds and
psychiatry come from only 2010, 2015 and 2020. `metric_provenance.json` records
which years are measured and which are interpolated, and the UI labels the
difference. HPSA designation is a category (0 not designated, 1 whole county,
2 part of county), so it is counted rather than averaged or ranked.

## Authentication

Authentication is currently bypassed: `get_current_user` in `main.py` returns a
built-in admin, so every request has full access including the admin write
endpoints. This build is for local use only and must not be deployed to a
public host as it stands. Restoring real authentication, and deciding between
campus SSO and application-level JWT, is tracked with NCSA.

Treat every credential that ever appeared in this repository's history as
compromised and rotate it.

## Data sources

- Illinois Department of Public Health, Causes of Death by Resident County,
  annual reports 2008 through 2022.
- HRSA Area Health Resources Files, county file.
- US Census Bureau Population Estimates Program: 2000-2010 intercensal,
  vintage 2019, and vintage 2023 county and place estimates.
