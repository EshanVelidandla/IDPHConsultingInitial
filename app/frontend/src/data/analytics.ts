/**
 * Shared analytics primitives.
 *
 * Before this module, "priority" meant three different things in three views:
 * the map sloped from 2015, PriorityMatrix sloped from 2009, dots turned red
 * above a ratio of 1.0 but were counted as priority only above 1.2, and the
 * Access x Mortality legend described a different colour scheme than the one
 * that coloured the dots. Every view now classifies through
 * `classifyCounty` and every legend is generated from `PRIORITY_BANDS`, so a
 * label and a colour cannot drift apart again.
 *
 * Nulls: rate tables now carry null for "IDPH did not publish this", which is
 * different from zero. `toRate` is the single place that distinction is made.
 */

import type { ProviderProvenance } from './useDataset';

/**
 * Fallback start of the trend window, used only until /meta has loaded. Views
 * call `trendBase(shared.dataYearRange)` so the window starts at the first year
 * the pipeline actually published. It used to be a fixed 2009 while the data
 * began in 2008, so every trend silently dropped the first year.
 */
export const TREND_BASE_YEAR = 2008;

/** First year of the trend window: the earliest year in the served data. */
export function trendBase(range: { min: number } | null | undefined): number {
  return range?.min ?? TREND_BASE_YEAR;
}

/** A county is "above state" once it exceeds the state rate by this factor. */
export const HIGH_RATIO = 1.2;
/** ...and "below state" once it falls under this one. */
export const LOW_RATIO = 0.8;

export const D_HIGH = '#B23A2E';
export const D_HIGH_TINT = '#DB9E95';
export const D_MID = '#C68B3C';
export const D_MID_TINT = '#EFDCBB';
export const D_LOW = '#4F7A4D';
export const D_LOW_TINT = '#E4F0D8';
export const D_NULL = '#C4C0B6';
export const D_NULL_TINT = '#E0DDD5';
export const INK = '#1C1B18';
export const INK_2 = '#3A3833';
export const INK_3 = '#6B675F';
export const INK_4 = '#716D64';
export const RULE = '#E6E3DC';

/** Shared Recharts tooltip styling, previously copy-pasted into six files. */
export const TIP_STYLE = {
  background: '#FBFAF7',
  border: `1px solid ${RULE}`,
  borderRadius: 2,
  fontFamily: 'var(--mono)',
  fontSize: 11,
  color: INK,
} as const;

export type Row = Record<string, unknown> & { County: string };

/**
 * Read one year's rate off a row.
 *
 * Returns null for a cell IDPH did not publish. Callers must not treat that as
 * zero: doing so is what made suicide and liver disease appear to fall to no
 * deaths at all from 2015 onward.
 */
export function toRate(row: Row | undefined, year: number | string): number | null {
  if (!row) return null;
  const raw = row[String(year)];
  if (raw === null || raw === undefined || raw === '') return null;
  const n = Number(raw);
  return Number.isFinite(n) ? n : null;
}

/**
 * One year's rates keyed by lower-case county name, for geometry lookups.
 * A real zero stays 0 and an unpublished cell stays null.
 */
export function rateMapOf(
  rows: ReadonlyArray<{ County: string }>,
  year: number | string,
  excluded: readonly string[],
): Record<string, number | null> {
  const m: Record<string, number | null> = {};
  rows.forEach((d) => {
    if (!excluded.includes(d.County)) m[d.County.toLowerCase()] = toRate(d as Row, year);
  });
  return m;
}

/** Counties with a published value for a year, zeros included. */
export function ratedCounties(
  rows: ReadonlyArray<{ County: string }>,
  year: number | string,
  excluded: readonly string[],
): Array<{ county: string; rate: number }> {
  const out: Array<{ county: string; rate: number }> = [];
  rows.forEach((d) => {
    if (excluded.includes(d.County)) return;
    const rate = toRate(d as Row, year);
    if (rate !== null) out.push({ county: d.County, rate });
  });
  return out;
}

/** County minimum and maximum for a year, or null if none was published. */
export function rateRange(
  rows: ReadonlyArray<{ County: string }>,
  year: number | string,
  excluded: readonly string[],
): { min: number; max: number } | null {
  const vals = ratedCounties(rows, year, excluded).map((d) => d.rate);
  return vals.length ? { min: Math.min(...vals), max: Math.max(...vals) } : null;
}

/** Years present in a rate table, ascending. */
export function yearsOf(rows: Row[]): number[] {
  if (!rows.length) return [];
  return Object.keys(rows[0])
    .filter((k) => /^\d{4}$/.test(k))
    .map(Number)
    .sort((a, b) => a - b);
}

/** The statewide row. Every view used to re-implement this lookup. */
export function stateRow(rows: Row[]): Row | undefined {
  return rows.find((r) => r.County === 'ILLINOIS');
}

/**
 * Least-squares slope in rate units per year, over [from, to].
 *
 * Returns null rather than 0 when there are fewer than two points. The old
 * version returned 0, so on the map every year from 2009 to 2015 produced an
 * empty priority list that looked like a real "no counties" answer.
 */
export function calcSlope(row: Row | undefined, from: number, to: number): number | null {
  if (!row) return null;
  const pts: Array<[number, number]> = [];
  const [lo, hi] = from <= to ? [from, to] : [to, from];
  for (let y = lo; y <= hi; y++) {
    const v = toRate(row, y);
    if (v !== null) pts.push([y, v]);
  }
  if (pts.length < 2) return null;
  const n = pts.length;
  const sx = pts.reduce((a, [x]) => a + x, 0);
  const sy = pts.reduce((a, [, y]) => a + y, 0);
  const sxy = pts.reduce((a, [x, y]) => a + x * y, 0);
  const sxx = pts.reduce((a, [x]) => a + x * x, 0);
  const denom = n * sxx - sx * sx;
  return denom === 0 ? null : (n * sxy - sx * sy) / denom;
}

/** First year on the newer Census population series. See /meta population_note. */
export const POPULATION_SEAM_YEAR = 2020;

/**
 * Does a trend over [from, to] span the 2019-2020 population series change?
 *
 * With a row, it also needs published data on both sides, the same points
 * `calcSlope` would fit: COVID-19 starts in 2020, so its trends never cross.
 */
export function crossesPopulationSeam(from: number, to: number, row?: Row): boolean {
  const [lo, hi] = from <= to ? [from, to] : [to, from];
  if (lo >= POPULATION_SEAM_YEAR || hi < POPULATION_SEAM_YEAR) return false;
  if (!row) return true;
  let before = false, after = false;
  for (let y = lo; y <= hi; y++) {
    if (toRate(row, y) === null) continue;
    if (y < POPULATION_SEAM_YEAR) before = true;
    else after = true;
  }
  return before && after;
}

/** Pearson correlation over complete pairs. Null if fewer than three pairs. */
export function pearsonR(xs: number[], ys: number[]): number | null {
  const pairs = xs.map((x, i) => [x, ys[i]] as const).filter(([x, y]) => Number.isFinite(x) && Number.isFinite(y));
  const n = pairs.length;
  if (n < 3) return null;
  const mx = pairs.reduce((a, [x]) => a + x, 0) / n;
  const my = pairs.reduce((a, [, y]) => a + y, 0) / n;
  let num = 0, dx = 0, dy = 0;
  for (const [x, y] of pairs) {
    num += (x - mx) * (y - my);
    dx += (x - mx) ** 2;
    dy += (y - my) ** 2;
  }
  const denom = Math.sqrt(dx * dy);
  return denom === 0 ? null : num / denom;
}

export type QuadrantKey = 'priority' | 'watch' | 'recovering' | 'stable' | 'nodata';

/**
 * Priority Matrix quadrant for a rate ratio and a slope. The split is at
 * HIGH_RATIO, the same line `classifyCounty` uses, not at the state rate.
 */
export function quadrantOf(x: number, y: number | null): QuadrantKey {
  if (y === null) return 'nodata';
  if (x > HIGH_RATIO) return y > 0 ? 'priority' : 'recovering';
  return y > 0 ? 'watch' : 'stable';
}

/**
 * Legend wording, generated from the split `quadrantOf` applies. It used to say
 * "at or below the state rate" while the code split at 1.2x, so a county 15%
 * above the state rate was described as at or below it. A slope of exactly 0
 * falls on the improving side, hence "flat or improving".
 */
export const QUADRANT_DESC: Record<QuadrantKey, string> = {
  priority:   `Above ${HIGH_RATIO}x state and worsening`,
  watch:      `At or below ${HIGH_RATIO}x state but worsening`,
  recovering: `Above ${HIGH_RATIO}x state but flat or improving`,
  stable:     `At or below ${HIGH_RATIO}x state and flat or improving`,
  nodata:     'Too few years to fit a trend',
};

/**
 * One cell of the mortality by access overlay, as `<mortality>-<access>`.
 *
 * Only a true null is 'nodata'. A real zero rate is low mortality, and zero
 * providers is low access: those counties used to fall through to plain
 * mortality tints that appeared nowhere in the legend. HPSA is a category with
 * no statewide value, so its access reading is designated (1 or 2, low) against
 * not designated (0, high).
 */
export type BivariateCell = 'high-low' | 'high-high' | 'low-low' | 'low-high' | 'nodata';

export function bivariateCell(
  rate: number | null,
  stateRate: number | null,
  provVal: number | null,
  stateProvVal: number | null,
  categorical: boolean,
): BivariateCell {
  if (rate === null || provVal === null || stateRate === null || stateRate <= 0) return 'nodata';
  if (!categorical && (stateProvVal === null || stateProvVal <= 0)) return 'nodata';
  const mortality = rate / stateRate > 1 ? 'high' : 'low';
  const goodAccess = categorical ? provVal === 0 : provVal / (stateProvVal as number) > 1;
  return `${mortality}-${goodAccess ? 'high' : 'low'}`;
}

/**
 * How a provider value for this year was obtained, or null if it was measured.
 *
 * Reads the pipeline's provenance rather than a list of years here, so a later
 * backfill relabels every view without a code change. Also null when provenance
 * has not loaded or does not name the metric: no label is better than a guess.
 */
export function imputedNote(
  provenance: Record<string, ProviderProvenance> | null | undefined,
  metric: string,
  year: number | string,
): string | null {
  const p = provenance?.[metric];
  const y = Number(year);
  if (!p || !p.imputed_years.includes(y)) return null;
  const before = p.source_years.filter((s) => s < y);
  const after = p.source_years.filter((s) => s > y);
  const prev = before.length ? before[before.length - 1] : null;
  const next = after.length ? after[0] : null;
  if (p.kind === 'rate' && prev !== null && next !== null) {
    return `${y} interpolated between ${prev} and ${next}`;
  }
  const from = prev ?? next;
  return from === null ? `${y} not measured` : `${y} carried from ${from}`;
}

export type Band = 'high' | 'near' | 'low' | 'nodata';

/**
 * The single classification every map, legend and table reads from.
 * Order matters: legends render in this order.
 */
export const PRIORITY_BANDS: Array<{
  band: Band;
  label: string;
  sub: string;
  fill: string;
  border: string;
  /** Border dash pattern. A second, non-colour channel for the same reading. */
  dash?: string;
  /** Outline color on the map and legend, when it has to differ from border. */
  line?: string;
}> = [
  // The high and low tints used to be #EDCAC5 and #C2D9B0, whose luminance
  // ratio was 1.00: identical lightness, differing only in red against green,
  // which is invisible to a red-green colour blind reader. They now differ in
  // lightness as well, and high carries a dashed border on top of that.
  // Near and no-data tints differ by only 1.01, so no-data carries its own
  // dashed outline, in a gray that reads 3.9:1 against its fill. D_NULL only
  // reached 1.34, which left the dash invisible.
  { band: 'high',   label: 'Above state',  sub: `More than ${Math.round((HIGH_RATIO - 1) * 100)}% above the state rate`, fill: D_HIGH_TINT, border: D_HIGH, dash: '5 3' },
  { band: 'near',   label: 'Near state',   sub: `Within ${Math.round((HIGH_RATIO - 1) * 100)}% of the state rate`,       fill: D_MID_TINT,  border: D_MID  },
  { band: 'low',    label: 'Below state',  sub: `More than ${Math.round((1 - LOW_RATIO) * 100)}% below the state rate`,  fill: D_LOW_TINT,  border: D_LOW  },
  { band: 'nodata', label: 'No data',      sub: 'Not published for this county and year',                                fill: D_NULL_TINT, border: D_NULL, dash: '3 3', line: INK_4 },
];

export function bandOf(rate: number | null, state: number | null): Band {
  if (rate === null || state === null || state <= 0) return 'nodata';
  const ratio = rate / state;
  if (ratio > HIGH_RATIO) return 'high';
  if (ratio < LOW_RATIO) return 'low';
  return 'near';
}

export function bandStyle(band: Band) {
  return PRIORITY_BANDS.find((b) => b.band === band) ?? PRIORITY_BANDS[3];
}

/** Map fill for one county. A real zero is "low"; only null is "no data". */
export function tileColor(rate: number | null, state: number | null): string {
  return bandStyle(bandOf(rate, state || null)).fill;
}

export interface CountyClass {
  county: string;
  rate: number | null;
  ratio: number | null;
  slope: number | null;
  band: Band;
  /** Above the state rate and still rising. The one definition of priority. */
  isPriority: boolean;
}

/**
 * Classify one county for a given year against the state rate.
 * `trendFrom` defaults to TREND_BASE_YEAR so every view fits the same window.
 */
export function classifyCounty(
  row: Row,
  year: number,
  state: number | null,
  trendFrom: number = TREND_BASE_YEAR,
): CountyClass {
  const rate = toRate(row, year);
  const slope = calcSlope(row, Math.min(trendFrom, year), year);
  const ratio = rate !== null && state ? rate / state : null;
  const band = bandOf(rate, state);
  return {
    county: row.County,
    rate,
    ratio,
    slope,
    band,
    isPriority: band === 'high' && slope !== null && slope > 0,
  };
}


/**
 * Coerce a list response into an array.
 *
 * Every view keeps its rows in array state and then calls .filter or .map on
 * them during render. A response that is not an array for any reason therefore
 * throws inside render and blanks the entire page rather than one panel. This
 * is the one place that is guarded.
 */
export function asRows<T>(data: unknown): T[] {
  if (Array.isArray(data)) return data as T[];
  if (typeof data === 'string') {
    try {
      const parsed = JSON.parse(data);
      if (Array.isArray(parsed)) return parsed as T[];
    } catch {
      /* fall through */
    }
  }
  return [];
}
