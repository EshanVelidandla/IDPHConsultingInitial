# What changed in the published numbers

Regenerated tables against the pre-fix baseline. ILLINOIS row, 2019.

| Cause | Before | After | Change |
| --- | --- | --- | --- |
| Accidents | 53.20 | 48.03 | -10% |
| All Other Causes | 0.00 | no data | cause not published in 2019 |
| Alzheimers Disease | 32.74 | 31.16 | -5% |
| COVID 19 | 0.00 | no data | cause not published in 2019 |
| Cerebrovascular Diseases | 54.34 | 48.49 | -11% |
| Chronic Liver Disease Cirrhosis | 0.00 | no data | cause not published in 2019 |
| Chronic Lower Respiratory Diseases | 44.49 | 43.66 | -2% |
| Diabetes Mellitus | 24.93 | 22.27 | -11% |
| Diseases of Heart | 225.48 | 202.46 | -10% |
| Influenza and Pneumonia | 18.57 | 16.62 | -11% |
| Intentional Self Harm | 0.00 | no data | cause not published in 2019 |
| Malignant Neoplasms | 207.40 | 188.41 | -9% |
| Nephritis Nephrotic Syndrome Nephrosis | 22.40 | 20.11 | -10% |
| Septicemia | 14.69 | 13.78 | -6% |
| Total Deaths | 944.47 | 859.68 | -9% |

## Worst individual corrections

| County | Year | Before | After |
| --- | --- | --- | --- |
| Suburban Cook | 2008 | 13,496.6 | 834.5 |
| Suburban Cook | 2020 | 17,237.8 | 1,042.3 |
| Alexander | 2008 | 2,118.3 | 1,311.9 |
| Cook | 2008 | 770.2 | 787.1 |
| ILLINOIS | 2019 | 944.5 | 859.7 |

# A separate bug found while testing: the production build called /api/*

Not one of the eighteen issues, but it broke every view in the single-origin
build and is worth flagging to NCSA before deployment.

`app/frontend/.env` held `VITE_API_BASE=/api`. Vite loads `.env` for builds as
well as for the dev server, so every production bundle called `/api/meta`,
`/api/geojson` and so on. In development the old Vite proxy rewrote `/api` away
and it worked. In the single-origin build there is no proxy, so those paths fell
through to the backend's SPA catch-all, which answered **index.html with a 200**.
Views received HTML where they expected JSON: the map reported invalid geometry,
the sidebar read "Years undefined - undefined", and panels rendered empty.

`.env` is gitignored, which is why neither the review nor a fresh clone would
ever see it, and why the failure only appears in a production build.

Three changes:

1. `.env` deleted. The dev-only value moved to `.env.development`, which Vite
   loads for `npm run dev` and never for `npm run build`, so it cannot reach a
   production bundle. Production resolves `API_BASE` to `''` (same origin).
2. The SPA catch-all no longer answers API-shaped paths with HTML. Anything
   under a known API prefix, or any request asking for JSON, gets a JSON 404.
   Serving a 200 for an unknown endpoint is what kept this invisible.
3. The dead `/api` proxy is gone from `vite.config.ts`, and the build writes
   straight into `app/backend/ui/` instead of being copied over a live server.

# Issue status

Verified: 35 pipeline tests pass, frontend typecheck clean, `npm audit` reports
zero vulnerabilities, every API endpoint returns 200, statewide counts
cross-check against the sum of the 102 counties within 0.08% in every year.

## Fixed

| # | What was done |
| --- | --- |
| 2 | Real denominators. `build_population.py` compiles Census county and place estimates into `population_by_county_year.csv`. `_derive_population` deleted; the pipeline hard-fails without the file. Suburban Cook 2008 goes from 13,497 to 834.5 per 100k. |
| 3 | Statewide rate is IDPH's own published ILLINOIS count over state population; Cook is no longer triple-counted. The mean-of-rates override in the clean stage is gone (that file is now a read-only validator). |
| 4 | All five "age-adjusted" labels say crude; `/meta` carries `rate_label` and `rate_note` so the wording lives in one place. Excess deaths use year-matched population from `/population`. |
| 5 | Missing data is null end to end: CSV, API, UI. The false "Suppressed · count < 5" legend is gone. County drill-down shows the year each figure comes from. |
| 6 | Suppression markers hold their column position; stray commas no longer crash; unexpected token counts raise instead of padding with zeros; unknown years raise instead of guessing. |
| 7 | Provider state rows are population-weighted (Illinois MDs 105.7 → 310.2 per 100k). HPSA is categorical: no state average, a category-count summary instead. HPSA 2011-2012 backfilled from real AHRF data. `metric_provenance.json` records measured vs interpolated years and the UI labels them. Zero-provider counties are kept. |
| 9 | Source PDFs committed with a `.gitignore` exception; population committed; requirements pinned; blanket warnings filter removed; duplicate check moved before de-duplication; 35 regression tests added. |
| 10 | County allowlist built from the data and matched case-insensitively; all ten rejected counties now work. Annotation form uses a select, surfaces API errors, and sends county and cause on edit. Feedback colour keyed on outcome. |
| 12 | One definition of priority in `data/analytics.ts`; legends generated from the same table that colours the marks; the false "lowest point in the decade" claim removed; scorecard trend thresholds scaled per cause. |
| 13 | Runtime state moved to `app/backend/var/` (gitignored); reads no longer create files; uploads and deletes keep timestamped backups; `.gitignore` rewritten to match reality. |
| 15 | CSP allows the Google Fonts stylesheet and font files. |
| 17 | All fifteen year schemas corrected and verified against the PDFs. `verify_header_order()` re-checks each PDF's printed header at extraction time and fails the run on a mismatch. |
| 18 | Dependency advisories cleared (15 → 0). Provider-table provenance confirmed reproducible. Dev proxy resolved by documenting `VITE_API_BASE` rather than wiring `/api`. |

## Partially fixed

| # | Done | Left |
| --- | --- | --- |
| 11 | Logout route, per-cause loading, duplicate audit fetch, year sliders from `/meta`, Pulse small multiples, map search highlight, Admin nav number | Request cancellation exists in the shared hooks but the views that still call axios directly do not use it yet |
| 14 | Contrast tokens lifted to AA, focus outlines restored, map carries a non-colour channel, keyboard access on Map, Priority, Scorecard and Pulse targets, real labels in the admin form | `CountyDrillDown.tsx:457` and `App.tsx:152` click targets; `field-label` divs outside the admin panel; scatter plots still have no shape redundancy |
| 16 | Unused MUI and Emotion removed, types moved to devDependencies, map remount fixed, duplicate imports removed, backend CSV reads cached, dead exports deleted | Six views still call axios directly instead of the shared `useDeathRates` hook, so the new cache is only partly adopted |

## Open

| # | Why |
| --- | --- |
| 1 | Authentication model is NCSA's call: campus SSO, application JWT, or read-only deployment. |
| 8 | Rotation versus history rewrite is NCSA's call. Nothing in history is a live credential once auth is rebuilt. |
| 18 (district list) | `IDPH_DISTRICTS` defines 9 districts; only IDPH can confirm that against their published regions. |
