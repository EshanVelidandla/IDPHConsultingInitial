# Illinois County Mortality Analytics

A full-stack geospatial analytics platform surfacing cause-of-death trends across all 102 Illinois counties from 2009 to 2022. Built in collaboration with the Illinois Department of Public Health (IDPH) to inform statewide resource allocation decisions.

## Overview

- **ETL pipeline**: Python scripts extract structured death data from IDPH annual PDF reports, normalize it across 15 disease categories, and output county-year pivot tables.
- **Backend**: FastAPI server with JWT authentication, role-based access control, and endpoints for death rate data, annotations, thresholds, presets, and CSV export.
- **Frontend**: React + TypeScript SPA with five analytical views, a county drill-down profile, shared global filters, and an admin panel.

## Views

| # | View | Description |
|---|---|---|
| 01 | Map | Leaflet choropleth across 102 counties; click county to open drill-down |
| 02 | Insights | Statewide trend chart, county distribution, top/bottom county rankings |
| 03 | Scorecard | Heatmap table — all counties × all causes, sortable by ratio vs. state |
| 04 | Priority | Scatter quadrant matrix (rate vs. trend slope) for prioritization |
| 05 | Pulse | Annotated timeline with intervention markers and threshold alerts |
| — | County Profile | Per-county drill-down: cause breakdown bar chart, trend overlay, excess deaths, full cause table |
| 06 | Admin | Dataset upload/management, user management, audit log (admin only) |

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
│   ├── improved_pdf_converter.py    # Primary PDF-to-CSV extractor
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
│   │       └── death_rate_tables/   # Cause-year CSVs served by the API
│   └── frontend/
│       ├── src/
│       │   ├── App.tsx              # Root layout, sidebar, global filters, presets
│       │   ├── auth/
│       │   │   └── AuthContext.tsx  # JWT auth context + protected routes
│       │   ├── data/
│       │   │   ├── constants.ts     # Cause labels, IDPH districts, calcSlope
│       │   │   └── population.ts    # 2020 census population by county
│       │   └── components/
│       │       ├── MapView.tsx      # Choropleth map + county hover chart
│       │       ├── InsightsView.tsx # Statewide trend, top counties, distribution
│       │       ├── CountyScorecard.tsx  # All-county heatmap table
│       │       ├── PriorityMatrix.tsx   # Scatter quadrant (rate vs. slope)
│       │       ├── PulseView.tsx        # Annotated timeline + thresholds
│       │       └── CountyDrillDown.tsx  # Per-county profile with cause breakdown
│       ├── package.json
│       └── vite.config.ts
│
└── README.md
```

## ETL Pipeline

**Stage 1: PDF extraction** (run from `One More time/`)
```bash
python improved_pdf_converter.py
```
Reads all IDPH annual PDF reports and outputs one CSV per year to `csv_output/`.

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
| ETL | Python, pandas, PyPDF2 |
| Backend | FastAPI, uvicorn, python-jose (JWT) |
| Frontend | React 18, TypeScript, Vite |
| Routing | React Router v6 |
| Mapping | Leaflet.js, react-leaflet |
| Charts | Recharts, D3 |
| HTTP | Axios |
| Data | IDPH Statewide Causes of Death by Resident County (2009-2022) |

## Data Notes

- Source: Illinois Department of Public Health, Statewide Leading Causes of Death by Resident County, published annually.
- Coverage: 2009-2022, 102 Illinois counties (plus Chicago and Suburban Cook subdivisions as separate rows).
- Some county-year cells are suppressed in the source data (low counts). These appear as `0` in the processed CSVs. The county drill-down automatically falls back to the most recent non-suppressed year for each cause rather than showing "no data."
- The `2008` column is excluded from all analysis as it was not consistently reported across counties.
