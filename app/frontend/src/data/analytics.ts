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

/** Earliest year to use when fitting a trend line, for every view. */
export const TREND_BASE_YEAR = 2009;

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
 * The most recent year this row actually has data for, at or before `upTo`.
 * Views must display this, because it is often not the year the user picked.
 */
export function latestYearWithData(row: Row | undefined, years: number[], upTo?: number): number | null {
  if (!row) return null;
  const candidates = years.filter((y) => (upTo === undefined ? true : y <= upTo));
  for (let i = candidates.length - 1; i >= 0; i--) {
    if (toRate(row, candidates[i]) !== null) return candidates[i];
  }
  return null;
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
}> = [
  // The high and low tints used to be #EDCAC5 and #C2D9B0, whose luminance
  // ratio was 1.00: identical lightness, differing only in red against green,
  // which is invisible to a red-green colour blind reader. They now differ in
  // lightness as well, and high carries a dashed border on top of that.
  { band: 'high',   label: 'Above state',  sub: `More than ${Math.round((HIGH_RATIO - 1) * 100)}% above the state rate`, fill: D_HIGH_TINT, border: D_HIGH, dash: '5 3' },
  { band: 'near',   label: 'Near state',   sub: `Within ${Math.round((HIGH_RATIO - 1) * 100)}% of the state rate`,       fill: D_MID_TINT,  border: D_MID  },
  { band: 'low',    label: 'Below state',  sub: `More than ${Math.round((1 - LOW_RATIO) * 100)}% below the state rate`,  fill: D_LOW_TINT,  border: D_LOW  },
  { band: 'nodata', label: 'No data',      sub: 'Not published for this county and year',                                fill: D_NULL_TINT, border: D_NULL, dash: '1 3' },
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

/** "No data" rather than "0.00" for a missing value. */
export function fmtRate(v: number | null, digits = 1): string {
  return v === null ? 'No data' : v.toFixed(digits);
}

export function fmtSigned(v: number | null, digits = 2): string {
  return v === null ? 'n/a' : `${v >= 0 ? '+' : ''}${v.toFixed(digits)}`;
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
