/**
 * Shared data access for the dashboard.
 *
 * Seven components used to fetch /death_rates independently with no cache, and
 * three of them pulled all fifteen causes on mount through Promise.all, so one
 * missing dataset blanked the whole page. Requests also had no cancellation,
 * so switching cause quickly could let a stale response overwrite a newer one.
 *
 * This module gives one in-memory cache keyed by URL, per-cause error isolation
 * and abort on unmount, so views can load partially and say which parts failed.
 */

import { useCallback, useEffect, useRef, useState } from 'react';
import axios from 'axios';
import { API_BASE, causes } from './constants';
import type { Row } from './analytics';

const cache = new Map<string, Promise<unknown>>();

function fetchCached<T>(url: string): Promise<T> {
  const hit = cache.get(url);
  if (hit) return hit as Promise<T>;
  const p = axios.get<T>(url).then((r) => r.data);
  cache.set(url, p);
  // A failed request must not be cached, or the view can never recover.
  p.catch(() => cache.delete(url));
  return p;
}

/** Drop everything cached. Called after an admin upload or delete. */
export function invalidateDataCache(): void {
  cache.clear();
}

export interface Meta {
  year_min: number;
  year_max: number;
  counties: string[];
  available_causes: string[];
  rate_basis: string;
  rate_label: string;
  rate_note: string;
  provider_metrics: Record<string, ProviderProvenance>;
}

export interface ProviderProvenance {
  label: string;
  kind: 'rate' | 'categorical';
  categories?: Record<string, string>;
  source_years: number[];
  imputed_years: number[];
  method: string;
}

const META_FALLBACK: Meta = {
  year_min: 2008,
  year_max: 2022,
  counties: [],
  available_causes: causes,
  rate_basis: 'crude',
  rate_label: 'Crude rate per 100,000',
  rate_note: 'Crude rates, not age-adjusted.',
  provider_metrics: {},
};

/** Server-declared year range, county list and rate wording. */
export function useMeta(): { meta: Meta; loading: boolean } {
  const [meta, setMeta] = useState<Meta>(META_FALLBACK);
  const [loading, setLoading] = useState(true);
  useEffect(() => {
    let live = true;
    fetchCached<Partial<Meta>>(`${API_BASE}/meta`)
      .then((d) => { if (live) setMeta({ ...META_FALLBACK, ...d }); })
      .catch(() => { /* fall back to the defaults above */ })
      .finally(() => { if (live) setLoading(false); });
    return () => { live = false; };
  }, []);
  return { meta, loading };
}

/** Inclusive list of years, from the server's declared range. */
export function yearRange(meta: Meta): number[] {
  const out: number[] = [];
  for (let y = meta.year_min; y <= meta.year_max; y++) out.push(y);
  return out;
}

export interface DatasetState {
  rows: Row[];
  loading: boolean;
  error: string | null;
}

/** One cause's rate table. */
export function useDeathRates(cause: string | null): DatasetState {
  const [state, setState] = useState<DatasetState>({ rows: [], loading: !!cause, error: null });
  const latest = useRef(0);

  useEffect(() => {
    if (!cause) { setState({ rows: [], loading: false, error: null }); return; }
    const token = ++latest.current;
    setState((s) => ({ ...s, loading: true, error: null }));
    fetchCached<Row[]>(`${API_BASE}/death_rates?cause=${encodeURIComponent(cause)}`)
      .then((rows) => {
        // Ignore a response that a newer request has already superseded.
        if (token === latest.current) setState({ rows, loading: false, error: null });
      })
      .catch(() => {
        if (token === latest.current) {
          setState({ rows: [], loading: false, error: `Could not load ${cause}` });
        }
      });
  }, [cause]);

  return state;
}

export interface MultiCauseState {
  byCause: Record<string, Row[]>;
  loading: boolean;
  /** Causes that failed. The rest still render. */
  failed: string[];
}

/**
 * Several causes at once, each settled independently.
 *
 * Promise.allSettled rather than Promise.all: an admin can delete a dataset,
 * and losing one cause should grey out one card, not the whole page.
 */
export function useAllDeathRates(causeList: string[]): MultiCauseState {
  const [state, setState] = useState<MultiCauseState>({ byCause: {}, loading: true, failed: [] });
  const key = causeList.join(',');

  useEffect(() => {
    let live = true;
    setState((s) => ({ ...s, loading: true }));
    Promise.allSettled(
      causeList.map((c) => fetchCached<Row[]>(`${API_BASE}/death_rates?cause=${encodeURIComponent(c)}`)),
    ).then((results) => {
      if (!live) return;
      const byCause: Record<string, Row[]> = {};
      const failed: string[] = [];
      results.forEach((r, i) => {
        if (r.status === 'fulfilled') byCause[causeList[i]] = r.value;
        else failed.push(causeList[i]);
      });
      setState({ byCause, loading: false, failed });
    });
    return () => { live = false; };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [key]);

  return state;
}

/** One provider metric's table. */
export function useProviderData(metric: string | null): DatasetState {
  const [state, setState] = useState<DatasetState>({ rows: [], loading: !!metric, error: null });
  const latest = useRef(0);

  useEffect(() => {
    if (!metric) { setState({ rows: [], loading: false, error: null }); return; }
    const token = ++latest.current;
    setState((s) => ({ ...s, loading: true, error: null }));
    fetchCached<Row[]>(`${API_BASE}/provider_data?metric=${encodeURIComponent(metric)}`)
      .then((rows) => { if (token === latest.current) setState({ rows, loading: false, error: null }); })
      .catch(() => {
        if (token === latest.current) setState({ rows: [], loading: false, error: `Could not load ${metric}` });
      });
  }, [metric]);

  return state;
}

export interface HpsaSummaryRow {
  Year: number;
  not_designated: number;
  whole_county: number;
  part_of_county: number;
  counties_designated: number;
  pct_counties_designated: number | null;
}

/** Statewide HPSA counts by category. Replaces averaging the category codes. */
export function useHpsaSummary(): { rows: HpsaSummaryRow[]; loading: boolean } {
  const [rows, setRows] = useState<HpsaSummaryRow[]>([]);
  const [loading, setLoading] = useState(true);
  useEffect(() => {
    let live = true;
    fetchCached<HpsaSummaryRow[]>(`${API_BASE}/provider_summary`)
      .then((d) => { if (live) setRows(d); })
      .catch(() => { /* the view falls back to hiding the summary */ })
      .finally(() => { if (live) setLoading(false); });
    return () => { live = false; };
  }, []);
  return { rows, loading };
}

/**
 * County -> year -> population, matching the pipeline's own denominators.
 * Replaces the static 2020-only table the UI used for every year.
 */
export function usePopulation(): { pop: Record<string, Record<number, number>>; loading: boolean } {
  const [pop, setPop] = useState<Record<string, Record<number, number>>>({});
  const [loading, setLoading] = useState(true);
  useEffect(() => {
    let live = true;
    fetchCached<Array<Record<string, string | number>>>(`${API_BASE}/population`)
      .then((rows) => {
        if (!live) return;
        const out: Record<string, Record<number, number>> = {};
        for (const r of rows) {
          const county = String(r.County);
          out[county] = {};
          for (const [k, v] of Object.entries(r)) {
            if (/^\d{4}$/.test(k) && v !== null) out[county][Number(k)] = Number(v);
          }
        }
        setPop(out);
      })
      .catch(() => { /* views fall back to hiding population-scaled figures */ })
      .finally(() => { if (live) setLoading(false); });
    return () => { live = false; };
  }, []);
  return { pop, loading };
}

/** Stable callback for views that need to force a refetch after a mutation. */
export function useInvalidate(): () => void {
  return useCallback(() => invalidateDataCache(), []);
}
