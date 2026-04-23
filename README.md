# Illinois County Death Rate Dashboard

A full-stack geospatial analytics platform surfacing cause-of-death trends across all 102 Illinois counties from 2008 to 2023. Built in collaboration with the Illinois Department of Public Health (IDPH) to inform statewide resource allocation decisions.

## Overview

- **ETL pipeline**: Python scripts extract structured death data from IDPH annual PDF reports, normalize it across 15+ disease categories, and output county-year pivot tables.
- **Backend**: FastAPI server exposing a GeoJSON endpoint and per-cause death rate tables.
- **Frontend**: React + Leaflet.js choropleth map with hover-based county breakdowns and an Insights view with statewide trend charts and county distribution analysis.

## Disease Categories

| Category |
|---|
| Diseases of Heart |
| Malignant Neoplasms |
| Accidents |
| COVID-19 |
| Cerebrovascular Diseases |
| Chronic Lower Respiratory Diseases |
| Alzheimer's Disease |
| Diabetes Mellitus |
| Nephritis, Nephrotic Syndrome & Nephrosis |
| Influenza and Pneumonia |
| Intentional Self-Harm (Suicide) |
| Septicemia |
| Chronic Liver Disease & Cirrhosis |
| All Other Causes |
| Total Deaths |

## Project Structure

```
ResearchWork/
├── Counties/                        # Early ETL scripts + 2023 per-county CSVs
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
│   │   ├── requirements.txt
│   │   └── static/
│   │       ├── illinois-counties.geojson
│   │       └── death_rate_tables/   # Cause-year CSVs served by the API
│   └── frontend/
│       ├── src/
│       │   ├── App.tsx              # Root layout with sidebar navigation
│       │   └── components/
│       │       ├── MapView.tsx      # Choropleth map + county hover chart
│       │       └── InsightsView.tsx # Statewide trend, top counties, distribution
│       ├── package.json
│       └── vite.config.ts
│
├── FInal stuff/                     # Intermediate data workspace
├── project clean up/                # Processed data staging area
└── README.md
```

## ETL Pipeline

The pipeline runs in three stages:

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
API runs at `http://127.0.0.1:8000`. Endpoints:
- `GET /geojson` — Illinois county boundaries
- `GET /death_rates?cause=<CauseName>` — County-year death rates for a given cause

**Frontend**
```bash
cd processin/frontend
npm install
npm start
```
Dev server runs at `http://localhost:5173`.

## Tech Stack

| Layer | Technology |
|---|---|
| ETL | Python, pandas, PyPDF2 |
| Backend | FastAPI, uvicorn |
| Frontend | React 18, TypeScript, Vite |
| Mapping | Leaflet.js, react-leaflet |
| Charts | Recharts |
| UI | Material UI |
| Data | IDPH Statewide Causes of Death by Resident County (2008-2023) |

## Data Source

Illinois Department of Public Health — Statewide Leading Causes of Death by Resident County, published annually. Coverage: 2008-2023, 102 Illinois counties + Chicago and Suburban Cook subdivisions.
