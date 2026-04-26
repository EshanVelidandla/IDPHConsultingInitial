# Handoff: IDPH Mortality Analytics — Editorial Redesign

## Overview

Visual + UX redesign of the **Illinois Department of Public Health Mortality Analytics Platform** — a public-health analytics tool for surfacing county-level death rates, trends, and intervention priorities across 102 Illinois counties (2009–2022).

The redesign reframes the existing React/MUI app from a navy-sidebar dashboard into an **editorial, Apple-minimal civic data tool**: warm-paper surfaces, ink-black typography, single quiet accent color, hairline rules, and a serif display face for narrative weight.

## About the Design Files

The files in this bundle are **design references created in HTML** — prototypes showing intended look and behavior, not production code to copy directly.

Your task is to **recreate these designs inside the existing `frontend/` codebase** (React 18 + TypeScript + Vite + MUI + Recharts + Leaflet — see `frontend/package.json` in the original repo). Re-skin the existing components to match the new visual system; do not replace the routing, data layer, or component architecture. The empty/placeholder data states in the prototype are intentional — drop your real API responses (`/death_rates`, `/geojson`) into the same component slots.

## Fidelity

**High-fidelity.** The prototype is pixel-precise on:
- Color palette (exact hex)
- Typography stack (Inter Tight / Fraunces / IBM Plex Mono — Google Fonts)
- Spacing scale, hairline rule weights, panel/stat block layouts
- Component anatomy (sidebar, top strip, view headers, KPI strips, panel heads)

**Approximate / suggestive on:**
- Map projection — the prototype uses a hand-placed tile-grid because real GeoJSON wasn't available. The production app already loads real IL counties via Leaflet + `/geojson`; **keep Leaflet**, but apply the new color tokens and the editorial chrome (legend, tooltip, search) shown in the mock.
- Chart bodies — rendered as hatched placeholders. Production should use Recharts (already a dependency) styled per the new tokens.

## Screens / Views

The app has a **220px left rail** (collapses to 64px icon-rail under 1100px) + **top strip** + **view canvas**. Five top-level views:

### 01 · Map (Choropleth)
- **Purpose**: Entry point. See where mortality is concentrated on the IL map for a chosen cause + year.
- **Layout**: Two-column inside view — `1fr` map column + `320px` right rail.
- **View header** (36px 40px 28px padding, bottom border): eyebrow ("Choropleth · 102 counties") + display H1 ("Mortality across Illinois") in Fraunces 44px + 13.5px description; right side has 3 controls — **Cause select**, **District select**, **Year scrub** (220px wide).
- **Map area**: 32px 40px padding; Leaflet container; floating search bar top-left (search icon + 280px input + datalist of county names) + reset button top-right; bottom-left attribution row ("Tile-grid projection · Source · IDPH Vital Statistics").
- **County polygons**: fill from `--paper-2` baseline; colored using diverging scale (see Tokens) keyed to `rate / stateRate` ratio; priority counties get `--d-high` 1.4px stroke with `3 2` dash array; non-district counties drop to `0.18` opacity.
- **Hover tooltip**: 220px min-width white panel, 1px rule border, no shadow. Title 13px / 500. Mono rows: "Rate / 100k", "vs. state avg", "2009 → {year}". 28px sparkline below. Footer eyebrow ("Click to drill in").
- **Right rail**: "Reading the map" prose intro → "Scale" legend (4 rows: High / Near average / Low / Suppressed) → "Priority counties" list (3 rows with sparklines).

### 02 · Insights
- **Purpose**: Statewide analytics canvas — KPIs, trends, distribution, burden, COVID impact.
- **View header**: H1 wraps to 2 lines using Fraunces. Cause select + segmented control with 4 tabs (Overview / Burden / Trajectory / COVID era).
- **KPI strip**: 4 columns, full bleed across canvas, 1px bottom border, vertical hairlines between stats. Each `Stat` block: mono uppercase 10.5px label, Fraunces 32px value (or mono 28px if numeric), 11.5px meta line.
- **Statewide trend panel**: `1fr 240px` grid — chart on left, "Annotations" list on right (year + event description rows separated by hairlines).
- **Two-up row**: `1.2fr 1fr` — Top/bottom 5 with bar visualization (24px gutter | name | bar | value), Distribution stacked rows (5 categories with color swatch + label + sub).
- **Burden panel** (full-width), Trajectory two-up (improved/declined), COVID-era panel (full-width diverging bars).
- **Methodology footer**: 3 columns, mono uppercase eyebrows + 12.5px caption text.

### 03 · Scorecard
- **Purpose**: 102 counties × 15 causes heatmap table. Sortable, searchable.
- **View header**: Search input (with leading magnifier) + year scrub.
- **Legend strip**: 16px 40px padding, single row — eyebrow + 5 color/range chips + methodology caption right-aligned.
- **Table**: sticky `<thead>` (background `--paper`, mono uppercase 10px column labels), sticky first column (county name in Inter Tight 13px, white background). Body cells are mono 11.5px, right-aligned, with the cell's heatmap fill behind. Row hover swaps to `--paper-2`.

### 04 · Priority Matrix
- **Purpose**: Quadrant scatter — rate vs state (X) × cumulative slope 2009→year (Y). Identify "high & worsening" intervention targets.
- **Layout**: `1fr 320px` — plot left, legend rail right.
- **Plot**: 800×560 SVG. Outer 0.5px frame. Crosshair through (430, 280). Quadrant watermarks in mono 10px, low opacity, color-coded by quadrant meaning. Axis labels in mono uppercase. Dots: 5.5r, 1.5px white stroke, fill from quadrant color.
- **Right rail**: "How to read" → "Quadrants" 4-row list (Priority / Watch / Recovering / Stable) → "Highlighted counties" empty-state.

### 05 · Pulse (novel addition)
- **Purpose**: Narrative timeline view. Scrub through years; see annotated events; small-multiples grid of 14 yearly mini-maps.
- **Sections** (top to bottom):
  1. Header with display H1 ("Fourteen years, read year by year.")
  2. **Timeline ribbon**: huge year readout (Fraunces 56px), positioned event dots (2009 baseline, 2014 ACA, 2019 floor, 2020 COVID, 2022 latest), range slider underneath. Past events get filled `--ink` dots; future are hollow.
  3. **Active annotation block**: `1fr 1.4fr` — left: event title (Fraunces 28px) + body, right: 2×2 stat grid for that year.
  4. **Small multiples**: 7-column grid, 14 mini-map tiles (each shows abstracted county-grid with year + value).

### County Drilldown (linked from map)
- KPI strip + trend overlay panel + cause breakdown (horizontal diverging bars) + top burden causes (3 cards with sparklines) + demographics 4-stat strip.
- Back button (top-left, ghost, with chevron) returns to map.

## Sidebar (persistent)

- **220px wide**, paper background, 1px right border.
- **Brand block** (top, hairline border below): Fraunces 22px "IDPH" + 9.5px mono uppercase "Mortality Analytics" subtitle.
- **Nav** (5 items): each is `nav-num` (mono 10px "01"–"05") + 14px line icon + 13px label. Active item: ink color, mono num goes ink, 2px black indicator on left edge (-14px from item).
- **Foot block** (border-top): three rows — "Years 2009 – 2022", "Counties 102", "Build v3.0" — mono 10.5px.

## Top Strip (persistent, below sidebar's neighbor)

- 1px bottom border, paper background.
- Left: breadcrumb of eyebrow chips — "Illinois Department of Public Health · {Active view name} · {sub}".
- Right: 3 action buttons (Filters / Share / Export) — 18px horizontal padding, 12px font, hairline left border between each, hover swaps to `--paper-2`.

## Interactions & Behavior

- **Cause select**: changes data fed to map, insights, scorecard, priority. Shared state.
- **Year scrub**: `<input type="range">` styled with 1px track + 12px ink thumb. Live recompute on change.
- **District filter**: dims (opacity 0.18) non-district counties on map.
- **Search**: type-ahead via `<datalist>`; on selection, `searchTarget` updates and the map flies to that county (Leaflet `flyToBounds`, 0.8s duration, 40px padding).
- **Hover (map)**: 200ms color transitions; tooltip follows cursor with 14px offset.
- **Click county polygon**: navigate to drilldown route.
- **Sortable scorecard columns**: click any `<th>` to sort; arrow indicator on active column.
- **Tab segmented control** (Insights view): 4 tabs swap which panel-cluster is featured.
- **Pulse timeline**: clicking a dot or scrubbing the slider updates the annotation block + highlights the matching mini-multiple.

## Animations & Transitions

All motion uses `cubic-bezier(0.32, 0.72, 0, 1)` (--ease) or `cubic-bezier(0.16, 1, 0.3, 1)` (--ease-out).
- Page entrance: `fadeUp` 0.4s ease-out — `opacity 0→1` + `translateY 4px→0`.
- Hover state changes: 120ms.
- Map color transitions: 200ms.
- Range thumb active: scales 1.2× on grab.

## State Management

The prototype uses a single `shared` state object passed to every view:

```ts
{
  selectedCause: string,        // cause id e.g. "Diseases_of_Heart"
  selectedYear: number,         // 2009..2022
  selectedDistrict: number | '',// 1..9 or empty
  searchTarget: string,         // county name
  activeCounty: string,         // for drilldown
  route: string,                // current view id
}
```

Views read from + write to this object. In the production codebase, hoist this into a React context or keep the existing `react-router-dom` setup with URL-synced search params.

## Design Tokens

### Color

```css
/* Surfaces */
--paper:       #FBFAF7;   /* page background, warm off-white */
--paper-2:     #F5F3EE;   /* secondary surface, hovers */
--card:        #FFFFFF;
--rule:        #E6E3DC;   /* default hairline */
--rule-2:      #D9D5CC;   /* slightly stronger hairline */
--rule-strong: #1C1B18;   /* editorial heavy rule */

/* Ink */
--ink:    #1C1B18;   /* primary text, near-black */
--ink-2:  #3A3833;   /* body */
--ink-3:  #6B675F;   /* secondary */
--ink-4:  #9A968C;   /* tertiary / muted */
--ink-5:  #C4C0B6;   /* disabled / placeholder */

/* Accent (single, restrained) */
--accent:      #1F5C5A;   /* deep teal-ink */
--accent-2:    #2E7E7B;
--accent-tint: #E8EFEE;

/* Diverging data scale */
--d-high:      #B23A2E;   --d-high-tint: #F2E4E1;
--d-mid:       #C68B3C;   --d-mid-tint:  #F5ECDD;
--d-low:       #4F7A4D;   --d-low-tint:  #E4ECDF;
--d-null:      #C4C0B6;   --d-null-tint: #EFEDE7;
```

The choropleth uses 5 bands: `< 0.6 / 0.6–0.8 / 0.8–1.2 / 1.2–1.4 / > 1.4` of the rate-to-state ratio. Mid-tier intermediates blend with `#7A9C5A` (low side) and `#D46A5A` (high side).

### Typography

```css
--sans:  'Inter Tight', -apple-system, sans-serif;  /* UI */
--mono:  'IBM Plex Mono', ui-monospace, monospace;  /* numerals + eyebrows */
--serif: 'Fraunces', 'Times New Roman', serif;      /* display only */
```

Type ramp:
- `.h-display` — Fraunces 44px / 1.05 / -0.025em
- `.h1`        — Inter Tight 26px / 500 / -0.02em
- `.h2`        — Inter Tight 18px / 500
- `.h3`        — Inter Tight 13px / 500
- `.body`      — 13.5px / 1.55, color `--ink-2`
- `.caption`   — 12px, color `--ink-3`
- `.tiny`      — 11px, color `--ink-4`
- `.eyebrow`   — Mono 10.5px / 450 / 0.14em / uppercase, color `--ink-4` (or `--ink` with `.eyebrow-ink`)
- `.num`       — Mono with `font-variant-numeric: tabular-nums`

Apply Inter Tight `font-feature-settings: 'ss01', 'cv11'` globally for the alt-`a`/`g` glyphs that match the editorial vibe.

### Spacing & Layout

- Base unit: 4px (8/12/14/16/18/20/24/28/32/40/48/56 commonly used).
- Sidebar: 220px (collapses to 64px under 1100px).
- View header padding: 36px 40px 28px.
- Panel head padding: 14px 18px 12px; body: 18px.
- Stat block: 18px 20px, with 1px right border between siblings.
- KPI strip: full-width grid of 4, no gap, hairline borders only.

### Borders & Shadows

- **Border radius**: `0` everywhere except (a) range thumb (50%), (b) chips/buttons keep crisp 0px corners. **No rounded corners on cards.**
- **Shadows**: avoided. The only shadow is a 1px subtle one on the tooltip (`0 1px 0 rgba(28,27,24,0.04)`).

### Iconography

- Custom inline-SVG line icons (1.2 stroke, 14×14 viewBox 0 0 16 16). See `atoms.jsx → Icon`. Replace with whatever icon set the codebase already uses (Feather / Lucide / MUI outlined) — keep them at 1.2px stroke weight to match.

## Assets

- **Fonts** are loaded from Google Fonts inside `styles.css`:
  ```
  Inter Tight (300/400/450/500/600/700)
  IBM Plex Mono (400/450/500)
  Fraunces (variable, opsz 9..144, 400/500)
  ```
- No bitmap or icon assets — all UI imagery is inline SVG.
- Map geometry: production should keep using the existing `/geojson` endpoint and Leaflet — **do not** ship the tile-grid layout shown in the prototype (it's a stand-in for an empty data state).

## Empty / Placeholder States

Throughout the prototype, every data-bound slot renders an intentional empty state — `—` (em-dash) for numbers, hatched diagonal-stripe blocks for chart bodies, dashed-baseline sparklines for trend lines. **Preserve this pattern in production** for true loading/no-data states; it's part of the visual system, not a placeholder to hide.

```css
.empty {
  border: 1px dashed var(--rule-2);
  background: repeating-linear-gradient(-45deg,
    transparent 0, transparent 8px,
    rgba(28,27,24,0.015) 8px, rgba(28,27,24,0.015) 16px);
}
```

## Files in this Bundle

| File | Purpose |
|---|---|
| `IDPH Mortality Analytics.html` | Entry point — wires up React + Babel + all view scripts |
| `styles.css` | All design tokens + component styles. **Source of truth.** |
| `data.js` | Cause taxonomy, county list, district mapping, year range |
| `il-grid.js` | Tile-grid coordinates (prototype only — replace with real Leaflet GeoJSON) |
| `atoms.jsx` | Shared atoms: `Eyebrow`, `Panel`, `Stat`, `Field`, `YearScrub`, `SparkPlaceholder`, `HatchBlock`, `EmptyData`, `Icon` set |
| `view-map.jsx` | Choropleth view |
| `view-insights.jsx` | Analytics canvas |
| `view-scorecard.jsx` | Heatmap table |
| `view-priority.jsx` | Quadrant scatter |
| `view-drilldown.jsx` | County profile |
| `app.jsx` | Sidebar, top strip, routing, Pulse view, Tweaks panel wiring |
| `tweaks-panel.jsx` | Floating tweaks panel (development helper — strip from prod) |

## Notes for the implementer

- The existing `frontend/` codebase uses **MUI + Emotion**. You can keep MUI's `<Box>`, `<Select>`, `<Slider>` etc., but **theme them aggressively** to match the new tokens (provide a custom `ThemeProvider` with the palette/typography overrides). Don't ship MUI's default rounded corners or filled-purple primary.
- **Recharts** is already in deps — restyle its tooltips, axes, and grid to use `--rule` (0.5px), `--ink-4` for tick labels (mono 10px), and remove default tooltip backgrounds in favor of the white-card-with-hairline style shown in `view-map.jsx`'s tooltip.
- **Leaflet** map: use the CartoDB Light Matter (no labels) tile layer for the editorial feel. County `style()` function should map ratio → `--d-*` token. Priority polygons get the dashed `--d-high` stroke described above.
- **Accessibility**: the prototype uses 1.5px outline + 2px offset focus rings (`var(--ink)`). Maintain WCAG AA — all `--ink-*` colors against `--paper` clear 4.5:1 except `--ink-5` (placeholder-only).
