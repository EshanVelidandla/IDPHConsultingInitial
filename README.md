# Illinois County Mortality Analytics

A full-stack geospatial analytics platform surfacing cause-of-death trends and healthcare provider access across all 102 Illinois counties from 2008 to 2022. Built in collaboration with the Illinois Department of Public Health (IDPH) to inform statewide resource allocation decisions.

## Overview

- **ETL pipeline**: Python scripts extract structured death data from IDPH annual PDF reports, normalize it across 15 disease categories, and output county-year pivot tables. A separate HRSA pipeline processes Area Health Resource Files (AHRF) into 5 provider-density metrics.
- **Backend**: FastAPI server with JWT authentication, role-based access control, and endpoints for death rate data, provider metrics, annotations, thresholds, presets, and CSV export.
- **Frontend**: React + TypeScript SPA with seven analytical views, a county drill-down profile, shared global filters, and an admin panel.

## Views

| # | View | Description |
|---|---|---|
| 01 | Map | Leaflet choropleth across 102 counties; click county to open drill-down |
| 02 | Insights | Statewide trend chart, county distribution, top/bottom county rankings |
| 03 | Scorecard | Heatmap table -- all counties x all causes, sortable by ratio vs. state |
| 04 | Priority | Scatter quadrant matrix (rate vs. trend slope) for prioritization |
| 05 | Pulse | Annotated timeline with intervention markers and threshold alerts |
| 06 | Providers | County choropleth and rankings for 5 healthcare access metrics |
| 07 | Access x Mortality | Scatter correlation analysis between provider density and death rates, with Pearson r and regression fit |
| -- | County Profile | Per-county drill-down: cause breakdown bar chart, trend overlay, excess deaths, full cause table |
| -- | Admin | Dataset upload/management, user management, audit log (admin only) |

## Disease Categories

| Category |
|---|
| Total Deaths |
| Diseases of Heart |
| Malignant Neoplasms (Cancer) |
| Accidents (Unintentional Injuries) |
| COVID-19 |
| Cerebrovascular Diseases |
| Chronic Lower Respiratory Diseases |
| Alzheimer's Disease |
| Diabetes Mellitus |
| Nephritis, Nephrotic Syndrome & Nephrosis |
| Influenza & Pneumonia |
| Intentional Self-Harm (Suicide) |
| Septicemia |
| Chronic Liver Disease & Cirrhosis |
| All Other Causes |

## Provider Metrics (HRSA AHRF)

| Metric | Description |
|---|---|
| Primary Care Physicians per 100k | Non-federal PCPs excluding hospital residents |
| Total Active MDs per 100k | All non-federal active physicians |
| Psychiatry MDs per 100k | Active psychiatrists |
| Hospital Beds per 100k | AHA survey beds (2010, 2015, 2020; interpolated otherwise) |
| HPSA Primary Care Designation | 0 = none, 1 = whole-county shortage area, 2 = partial |

## Project Structure

```
ResearchWork/
├── Counties/                        # Early ETL scripts + per-county CSVs
│   ├── cleaning.py                  # Text line reformatter for pre-2012 reports
│   ├── fileconversion.py            # TXT to CSV converter (2009-2011)
│   ├── sandbox.py                   # Text parsing utility
│   └── *_death_data.csv             # Raw per-county data files (102 counties)
│
├── One More time/                   # PDF ETL pipeline (2008-2022)
│   ├── extract_pdf_data.py          # Robust pdfplumber-based extractor (any year)
│   ├── repair_pipeline.py           # End-to-end repair: re-extract -> rates -> CSVs
│   ├── improved_pdf_converter.py    # Earlier primary PDF-to-CSV extractor
│   ├── pdf_to_csv_converter.py      # Baseline PDF extractor
│   ├── process_death_rates.py       # Pivots per-year CSVs into cause-year tables
│   ├── clean_death_rates.py         # Validates and normalizes county tables
│   ├── pdf_debug.py                 # PDF content inspection utility
│   ├── text_to_csv_*.py             # Year-specific text parsers (2008, 2015, 2018)
│   └── csv_output/                  # Intermediate per-year CSVs (2008-2022)
│
├── death_rate_tables/               # Canonical processed output (15 cause files)
│   └── *_death_rates_by_county_year.csv
│
├── processin/                       # Full-stack web application
│   ├── backend/
│   │   ├── main.py                  # FastAPI server
│   │   ├── auth.py                  # JWT auth, password hashing, rate limiting
│   │   ├── storage.py               # JSON persistence layer
│   │   ├── requirements.txt
│   │   └── static/
│   │       ├── illinois-counties.geojson
│   │       ├── death_rate_tables/   # Cause-year CSVs served by the API
│   │       ├── provider_tables/     # HRSA-derived provider metric CSVs (5 files)
│   │       ├── process_hrsa.py      # HRSA AHRF processor (produces provider_tables/)
│   │       └── hrsa_raw/            # Raw AHRF files by year (2008-2023, Git LFS)
│   └── frontend/
│       ├── src/
│       │   ├── App.tsx              # Root layout, sidebar, global filters, presets
│       │   ├── auth/
│       │   │   └── AuthContext.tsx  # JWT auth context + protected routes
│       │   ├── data/
│       │   │   ├── constants.ts     # Cause labels, provider metrics, calcSlope
│       │   │   └── population.ts    # 2020 census population by county
│       │   └── components/
│       │       ├── MapView.tsx           # Choropleth map + county hover chart
│       │       ├── InsightsView.tsx      # Statewide trend, top counties, distribution
│       │       ├── CountyScorecard.tsx   # All-county heatmap table
│       │       ├── PriorityMatrix.tsx    # Scatter quadrant (rate vs. slope)
│       │       ├── PulseView.tsx         # Annotated timeline + thresholds
│       │       ├── ProvidersView.tsx     # Provider density choropleth and rankings
│       │       ├── AccessMortalityView.tsx  # Provider x mortality correlation scatter
│       │       └── CountyDrillDown.tsx   # Per-county profile with cause breakdown
│       ├── package.json
│       └── vite.config.ts
│
└── README.md
```

## ETL Pipeline

### Mortality data (IDPH PDFs)

**Stage 1: PDF extraction** (run from `One More time/`)
```bash
python extract_pdf_data.py
```
Robust pdfplumber-based extractor; handles any year 2008-2022 including column-scramble years (2020-2022).

**Stage 2: Pivot to cause tables** (run from `One More time/`)
```bash
python process_death_rates.py
```
Merges per-year CSVs into county-year pivot tables, one file per disease category. Outputs to `processin/backend/static/death_rate_tables/`.

**Stage 3: Normalize** (run from `One More time/`)
```bash
python clean_death_rates.py
```
Fixes county name inconsistencies, removes invalid entries, and prepends a statewide Illinois summary row to each table.

**Full repair run** (re-extracts all years from PDFs and recomputes rates):
```bash
cd "One More time"
python repair_pipeline.py
```

### Provider data (HRSA AHRF)

**Process AHRF files** (run from `processin/backend/static/`)
```bash
python process_hrsa.py
```
Reads fixed-width `.asc` files from `hrsa_raw/` for each year and outputs 5 county-year CSVs to `provider_tables/`. Covers 2008-2022; hospital beds are interpolated for non-survey years.

## Getting the Data (Git LFS)

The raw HRSA `.asc` files (~95-100 MB each) are stored in Git LFS. A standard `git clone` downloads only the pointer files -- not the actual data. To get everything:

**1. Install Git LFS** (one-time, per machine)
```bash
# macOS
brew install git-lfs

# Ubuntu/Debian
sudo apt install git-lfs

# Windows — download from https://git-lfs.com or via winget:
winget install GitHub.GitLFS
```

**2. Enable LFS for your account** (one-time, per machine)
```bash
git lfs install
```

**3. Clone with LFS files**
```bash
git clone https://github.com/EshanVelidandla/IDPHConsultingInitial.git
```
LFS files are pulled automatically after LFS is installed.

**Already cloned without LFS?** Fetch the large files retroactively:
```bash
git lfs pull
```

**Verify LFS files downloaded correctly:**
```bash
git lfs ls-files
```
Each line should show a hash prefix -- if you see `(missing)` instead, re-run `git lfs pull`.

> Note: You do not need the raw HRSA `.asc` files to run the web app. The processed `provider_tables/` CSVs are plain text and are committed directly to the repo. LFS is only required if you want to re-run `process_hrsa.py` to regenerate those tables.

## Running the App

**Backend**
```bash
cd processin/backend
pip install -r requirements.txt
uvicorn main:app --reload
```
API runs at `http://127.0.0.1:8000`.

**Frontend**
```bash
cd processin/frontend
npm install
npm run dev
```
Dev server runs at `http://localhost:5173`.

## API Endpoints

| Method | Path | Auth | Description |
|---|---|---|---|
| POST | `/auth/login` | Public | Returns JWT token |
| GET | `/auth/me` | User | Current user info |
| GET | `/geojson` | User | Illinois county GeoJSON boundaries |
| GET | `/death_rates?cause=<cause>` | User | County-year death rates for a cause |
| GET | `/provider_data?metric=<metric>` | User | County-year provider metric data |
| GET | `/export/csv?cause=<cause>` | User | Download cause dataset as CSV |
| GET/POST | `/annotations` | User/Editor | County-cause annotations |
| PUT/DELETE | `/annotations/:id` | Editor | Update or delete annotation |
| GET/POST | `/thresholds` | User/Admin | Alert thresholds by cause |
| DELETE | `/thresholds/:cause` | Admin | Remove threshold |
| GET/POST/DELETE | `/presets` | User | Saved filter presets |
| GET | `/admin/datasets` | Admin | List uploaded cause datasets |
| POST | `/admin/upload?cause=<cause>` | Admin | Upload replacement CSV |
| DELETE | `/admin/datasets/:cause` | Admin | Delete a dataset |
| GET/POST/PUT/DELETE | `/admin/users` | Admin | User management |
| GET | `/admin/audit` | Admin | Audit log (last 500 entries) |

## Auth & Roles

| Role | Capabilities |
|---|---|
| viewer | Read-only access to all data and views |
| editor | viewer + create/update/delete annotations |
| admin | editor + user management, dataset upload, thresholds, audit log |

## Tech Stack

| Layer | Technology |
|---|---|
| ETL | Python, pandas, pdfplumber |
| Backend | FastAPI, uvicorn, python-jose (JWT) |
| Frontend | React 18, TypeScript, Vite |
| Routing | React Router v6 |
| Mapping | Leaflet.js, react-leaflet |
| Charts | Recharts, D3 |
| HTTP | Axios |
| Storage | Git LFS (HRSA raw .asc files) |
| Data (mortality) | IDPH Statewide Causes of Death by Resident County (2008-2022) |
| Data (providers) | HRSA Area Health Resource Files (AHRF) 2008-2023 |

## Data Notes

- **Mortality source**: Illinois Department of Public Health, Statewide Leading Causes of Death by Resident County, published annually.
- **Coverage**: 2008-2022, 102 Illinois counties (plus Chicago and Suburban Cook subdivisions as separate rows).
- Some county-year cells are suppressed in the source data (low counts). These appear as `0` in the processed CSVs. The county drill-down automatically falls back to the most recent non-suppressed year for each cause rather than showing "no data."
- **Provider source**: HRSA Area Health Resource Files (AHRF), a county-level dataset published annually covering provider counts, hospital capacity, and shortage designations.
- Hospital bed counts are from the AHA survey (available only for 2010, 2015, 2020); intermediate years are linearly interpolated.
- HPSA designation gaps between 2010 and 2015 are forward-filled from the 2010 value.
- Raw AHRF `.asc` files are stored in Git LFS due to file size (95-100 MB each).
