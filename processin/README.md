# IDPH Mortality Analytics

Interactive mortality data dashboard for the Illinois Department of Public Health. Visualizes age-adjusted death rates across 102 Illinois counties by cause of death, year, and IDPH district.

**Live:** [healthequity.up.railway.app](https://healthequity.up.railway.app)

---

## Stack

| Layer | Tech |
|-------|------|
| Frontend | React + TypeScript, Vite, Leaflet (choropleth map), Recharts, MUI |
| Backend | FastAPI (Python), pandas |
| Auth | JWT (HS256), SHA-256 password hashing with salt, role-based access |
| Deployment | Railway (Docker, single service) |

---

## Local Development

### Backend

```bash
cd backend
python -m venv venv
.\venv\Scripts\Activate.ps1        # Windows
pip install -r requirements.txt

$env:JWT_SECRET = "any-long-random-string-for-local-dev"
uvicorn main:app --reload
# Runs on http://127.0.0.1:8000
```

### Frontend

```bash
cd frontend
npm install
npm run dev
# Runs on http://localhost:5173
# Proxies /api/* → http://127.0.0.1:8000
```

---

## Credentials

| Role | Username | Password | Access |
|------|----------|----------|--------|
| Viewer | `viewer` | `viewer123` | Read-only |
| Admin | `admin` | `idph2024` | Full access including admin panel |

Roles: `viewer` (read-only), `editor` (can create/edit annotations and presets), `admin` (full access + user/dataset management).

To reset a password, run from `backend/`:

```bash
python -c "import hashlib, secrets; s=secrets.token_hex(16); h=hashlib.sha256(f'{s}:NEWPASSWORD'.encode()).hexdigest(); print(f'{s}:{h}')"
```

Paste the output into `backend/users.json` as `password_hash` for the relevant user.

---

## Views

| # | Route | Description |
|---|-------|-------------|
| 01 | `/` | Choropleth map — 102 counties colored by death rate vs. state average |
| 02 | `/insights` | Statewide trend charts by cause |
| 03 | `/scorecard` | Heatmap table — all counties × all years |
| 04 | `/priority` | Quadrant matrix — high rate + worsening trend |
| 05 | `/pulse` | Annotated timeline |
| 06 | `/providers` | Healthcare access density overlay |
| 07 | `/access` | Access × mortality correlation scatter |
| 08 | `/county/:name` | County drill-down — full cause breakdown for a single county |
| 09 | `/admin` | Admin panel — user management, dataset upload, audit log (admin only) |

All views require authentication. `/admin` requires the `admin` role.

---

## Features

- **Annotations** — editors and admins can pin notes to counties/causes; stored in `backend/annotations.json`
- **Presets** — save and restore filter combinations; stored in `backend/presets.json`
- **Thresholds** — admin-configurable alert thresholds by cause; stored in `backend/thresholds.json`
- **Audit log** — all mutating actions are logged with user and timestamp; last 500 entries kept in `backend/audit.json`
- **CSV export** — download filtered data via `GET /export/csv?cause={cause}`
- **Rate limiting** — login locked after 5 failed attempts per 5-minute window per username

---

## Deployment

Deployed via Railway using the `Dockerfile` in `processin/`. Push to `main` on GitHub triggers an automatic redeploy.

Required Railway environment variables:

```
JWT_SECRET       # long random string, min 32 chars
ALLOWED_ORIGINS  # comma-separated frontend origins
```

---

## Data

Source: IDPH Vital Statistics — age-adjusted death rates per 100,000 residents, 2009–2022. County-level data for 102 Illinois counties across 15+ causes of death.
