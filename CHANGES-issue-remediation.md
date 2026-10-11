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

Nothing remains partially fixed. The three items listed here previously were
closed in a later pass:

| # | What was outstanding | How it was closed |
| --- | --- | --- |
| 11 | Requests did not cancel on rapid cause changes | Ten fetch effects across six views now drop their result if the component moved on, so a slower earlier response cannot overwrite a newer one |
| 14 | Keyboard access, form labels, scatter shape redundancy | See below |
| 16 | The shared data hook existed but no view used it | All eight views now fetch through one cached client |

### #16 in detail

The fetching hooks were dead code: `useDeathRates`, `useAllDeathRates` and
`useProviderData` were imported by zero files while all nine components called
`axios.get` directly. They have been replaced by `getCached` and the
`fetchDeathRates` / `fetchProviderData` / `fetchGeoJson` / `fetchAnnotations`
helpers, which return the same shape axios did and so dropped into the existing
call sites unchanged. Every view fetch is now deduplicated and cached, which
matters most for Scorecard, the county profile and Access, each of which asks
for all fifteen causes on mount.

### #14 in detail

| Item | Status |
| --- | --- |
| Colour-only encoding on the map | Fixed: high and low tints now differ in lightness (ratio 1.90, was 1.00) and the high band carries a dashed border |
| Contrast | Fixed: `--ink-4` and `--ink-5` raised to meet AA |
| Keyboard: clickable divs and table cells | Fixed: sortable headers carry `aria-sort` and a tab stop, county rows and cause rows are focusable, the admin role badge is a real button |
| Keyboard: Leaflet counties | Fixed: all 102 county paths take a tab stop, announce their name, and open on Enter or Space, with focus styled like hover |
| Focus outlines | Fixed: restored on the map and its layers |
| Form labels were `<div>`s | Fixed: 15 field wrappers are now `<label>` elements containing their control |
| Scatter shape redundancy | Fixed: both scatters use four distinct shapes, drawn from the same table that supplies the legend |
| Chart dots are mouse-only | Not fixed. Recharts marks have no keyboard affordance; the equivalent data is reachable through the tables in the same views |

One deliberate non-change: the scorecard's ~1,600 heat cells are clickable but
are not tab stops. Making them focusable would bury a keyboard user. Each
county row is one tab stop and opens the county profile, where every cause is
a focusable row, so the same destination is two stops away.

### Follow-up pass (2026-10-10)

A code review against the issues found leftovers in four issues marked closed above. They are now fixed:

| # | Leftover | Fix |
| --- | --- | --- |
| 5 | Scorecard, county profile and Pulse still treated a real zero rate as "no data" (`val > 0`), and the county profile dropped 2008 by name | Null versus zero goes through `toRate` everywhere; a county with no deaths from a cause shows -100%, not n/a |
| 7 | Scorecard showed zero-provider counties as `n/a` and coloured the HPSA code (0/1/2) against a state average | Zeros shown as 0.0; HPSA shown as None / Whole / Partial and sorted by severity; county profile uses the latest provider year instead of a fixed 2022 |
| 11 | Priority slider, Pulse years, Insights trend and the shared trend start were fixed at 2009 while the data starts in 2008; the Access correlation matrix was all-or-nothing; 12 fetches swallowed errors | `trendBase()` reads the served range; Priority uses the shared slider; every year label comes from the data; the matrix loads with `allSettled` and names missing causes; every failed load now shows a message |
| 16 | About 180 MB of AHRF files the pipeline never reads were committed | Untracked and gitignored (still on disk); `data/source/ahrf/README.md` lists the six files the pipeline reads. Provider tables rebuild byte-identically. History still holds the old files |

Note: the trend window now starts in 2008, the first published year, instead of 2009. Priority classifications and trend arrows can shift slightly as a result.

## Open

| # | Why |
| --- | --- |
| 1 | Authentication model is NCSA's call: campus SSO, application JWT, or read-only deployment. The user store now locks its writes, so that part is ready either way. |
| 8 | Rotation versus history rewrite is NCSA's call. Nothing in history is a live credential once auth is rebuilt. |
| 18 (district list) | `IDPH_DISTRICTS` defines 9 districts; only IDPH can confirm that against their published regions. |

Everything else in issues 2 through 18 is closed.
