import { useState, useEffect, useMemo } from 'react';
import {
  LineChart, Line, BarChart, Bar, XAxis, YAxis, CartesianGrid,
  Tooltip, ResponsiveContainer, Cell, ReferenceLine,
} from 'recharts';
import axios from 'axios';
import { providerMetricLabels, providerMetrics, EXCLUDED_COUNTIES, API_BASE, HPSA_METRIC } from '../data/constants';
import type { SharedState } from '../App';
import YearScrub from './YearScrub';
import { useMeta, useHpsaSummary } from '../data/useDataset';
import { asRows, toRate } from '../data/analytics';

interface ProviderRow { County: string; [year: string]: number | string; }
interface ViewProps { shared: SharedState; setShared: (s: SharedState) => void; }

const D_HIGH = '#B23A2E';
const D_MID  = '#C68B3C';
const D_LOW  = '#4F7A4D';
const INK_3 = '#6B675F';
const INK_4 = '#9A968C';
const RULE  = '#E6E3DC';
const ACCENT = '#1F5C5A';

const TIP_STYLE = {
  fontSize: 11, fontFamily: "'IBM Plex Mono', monospace",
  border: 'none', boxShadow: '0 4px 16px rgba(0,0,0,0.1)',
  borderRadius: 0, background: '#FFFFFF',
};

const ALL_YEARS = Array.from({ length: 15 }, (_, i) => 2008 + i);

/**
 * HPSA codes are categories, not a scale: 0 = not designated, 1 = whole
 * county, 2 = part of the county. The view used to treat them as ordered and
 * "inverted", so "part of county" ranked as worse than "whole county", and it
 * averaged and ranked them. Where the metric is HPSA the view now reports
 * category counts instead of rankings and averages.
 */
function isHpsa(metric: string) { return metric === HPSA_METRIC; }

const HPSA_CATEGORY_LABEL: Record<number, string> = {
  0: 'Not designated',
  1: 'Whole county',
  2: 'Part of county',
};

function metricColor(val: number, stateVal: number, inverted: boolean): string {
  if (!val || !stateVal) return INK_4;
  const r = inverted ? stateVal / val : val / stateVal;
  if (r >= 1.2) return D_LOW;
  if (r <= 0.8) return D_HIGH;
  return D_MID;
}

const ProvidersView = ({ shared, setShared }: ViewProps) => {
  const { selectedYear } = shared;
  const [metric, setMetric] = useState('primary_care_physicians_per_100k');
  const [providerData, setProviderData] = useState<ProviderRow[]>([]);
  const [hpsaData, setHpsaData] = useState<ProviderRow[]>([]);
  const [loading, setLoading] = useState(false);
  const [showBottom, setShowBottom] = useState(false);

  useEffect(() => {
    setLoading(true);
    const reqs = [
      axios.get(`${API_BASE}/provider_data?metric=${metric}`),
      ...(isHpsa(metric) ? [] : [axios.get(`${API_BASE}/provider_data?metric=hpsa_primary_care_designation`)]),
    ];
    Promise.all(reqs)
      .then(([pr, hr]) => {
        setProviderData(asRows(pr.data));
        setHpsaData(asRows(hr ? hr.data : pr.data));
      })
      .catch(() => {})
      .finally(() => setLoading(false));
  }, [metric]);

  const isHpsaMetric = isHpsa(metric);
  const yearStr = selectedYear.toString();
  const { meta } = useMeta();
  const { rows: hpsaSummary } = useHpsaSummary();
  const yearMin = shared.dataYearRange?.min ?? meta.year_min;
  const yearMax = shared.dataYearRange?.max ?? meta.year_max;

  // Which years of this metric are real measurements, straight from the
  // pipeline's provenance file. The page used to claim "Physician counts:
  // annual" while beds and psychiatry came from only three survey years.
  const provenanceNote = useMemo(() => {
    const p = meta.provider_metrics[metric];
    if (!p) return 'Source years unavailable.';
    if (!p.imputed_years.length) return `${p.label}: measured every year.`;
    return `${p.label}: measured in ${p.source_years.join(', ')}. `
      + `${p.imputed_years.length} of ${p.source_years.length + p.imputed_years.length} years are filled in (${p.method}).`;
  }, [meta, metric]);

  const isImputedYear = useMemo(
    () => (meta.provider_metrics[metric]?.imputed_years ?? []).includes(selectedYear),
    [meta, metric, selectedYear],
  );

  const stateRow = useMemo(() => providerData.find(d => d.County === 'ILLINOIS'), [providerData]);
  const stateVal = useMemo(() => Number(stateRow?.[yearStr]) || 0, [stateRow, yearStr]);

  // Statewide trend with county band
  const trend = useMemo(() => {
    if (!stateRow) return [];
    return ALL_YEARS.map(y => {
      const yr = y.toString();
      const vals = providerData
        .filter(d => !EXCLUDED_COUNTIES.includes(d.County))
        .map(d => Number(d[yr]))
        .filter(v => v > 0);
      return {
        year: yr,
        state: Number(stateRow[yr]) || null,
        low: vals.length ? Math.min(...vals) : null,
        high: vals.length ? Math.max(...vals) : null,
      };
    });
  }, [stateRow, providerData]);

  // County rankings for selected year
  const rankedCounties = useMemo(() => {
    if (isHpsaMetric) return [];  // categories are not ranked
    const rows = providerData
      .filter(d => !EXCLUDED_COUNTIES.includes(d.County))
      .map(d => ({ county: d.County, val: toRate(d as never, yearStr) }))
      // A county with zero providers is a real observation and the most
      // important one here. Only a missing value is dropped; the old
      // `val > 0` filter removed every provider desert from the ranking.
      .filter((d): d is { county: string; val: number } => d.val !== null)
      .sort((a, b) => b.val - a.val);
    return showBottom ? rows.slice(-10).reverse() : rows.slice(0, 10);
  }, [providerData, yearStr, isHpsaMetric, showBottom]);

  // HPSA designation counts per year
  const hpsaTrend = useMemo(() => {
    const src = isHpsa(metric) ? providerData : hpsaData;
    return ALL_YEARS.map(y => {
      const yr = y.toString();
      const designated = src
        .filter(d => !EXCLUDED_COUNTIES.includes(d.County))
        .filter(d => Number(d[yr]) > 0).length;
      return { year: yr, designated };
    });
  }, [hpsaData, providerData, metric]);

  // Provider desert: bottom 25% by metric (or HPSA-designated if HPSA metric)
  const deserts = useMemo(() => {
    if (isHpsaMetric) return [];
    const rows = providerData
      .filter(d => !EXCLUDED_COUNTIES.includes(d.County))
      .map(d => ({
        county: d.County,
        val: toRate(d as never, yearStr),
        hpsa: toRate(hpsaData.find(h => h.County === d.County) as never, yearStr) ?? 0,
      }))
      .filter((d): d is { county: string; val: number; hpsa: number } => d.val !== null);
    return rows.sort((a, b) => a.val - b.val).slice(0, 20);
  }, [providerData, hpsaData, yearStr, isHpsaMetric]);

  // KPI stats
  const highest = useMemo(() => {
    if (isHpsaMetric) return undefined;
    return providerData
      .filter(d => !EXCLUDED_COUNTIES.includes(d.County))
      .map(d => ({ county: d.County, val: toRate(d as never, yearStr) }))
      .filter((d): d is { county: string; val: number } => d.val !== null)
      .sort((a, b) => b.val - a.val)[0];
  }, [providerData, yearStr, isHpsaMetric]);

  const lowest = useMemo(() => {
    if (isHpsaMetric) return undefined;
    return providerData
      .filter(d => !EXCLUDED_COUNTIES.includes(d.County))
      .map(d => ({ county: d.County, val: toRate(d as never, yearStr) }))
      .filter((d): d is { county: string; val: number } => d.val !== null)
      .sort((a, b) => a.val - b.val)[0];
  }, [providerData, yearStr, isHpsaMetric]);

  const hpsaCount = useMemo(() => {
    const src = isHpsa(metric) ? providerData : hpsaData;
    return src.filter(d => !EXCLUDED_COUNTIES.includes(d.County) && Number(d[yearStr]) > 0).length;
  }, [hpsaData, providerData, yearStr, metric]);

  const formatVal = (v: number) => isHpsa(metric) ? v.toFixed(0) : v.toFixed(1);

  return (
    <div className="view fade-in" style={{ overflowY: 'auto' }}>
      {/* View head */}
      <div className="view-head">
        <div className="titles">
          <div className="eyebrow eyebrow-ink">Healthcare Access · 102 counties</div>
          <h1 className="h-display" style={{ marginTop: 8 }}>Provider density<br /><span style={{ color: 'var(--ink-3)' }}>across Illinois.</span></h1>
          <p className="body" style={{ marginTop: 12, maxWidth: 540, color: 'var(--ink-3)' }}>
            Shows how physician availability, hospital bed capacity, and primary care shortage designations vary across Illinois counties from 2008 to 2022. Counties below the state average are flagged in red. Use the metric selector to switch between provider types, and the year slider to see how access has changed over time.
          </p>
        </div>
        <div className="ix">
          <div className="field">
            <div className="field-label">Provider metric</div>
            <select className="sel" style={{ width: 280 }} value={metric} onChange={e => setMetric(e.target.value)}>
              {providerMetrics.map(m => <option key={m} value={m}>{providerMetricLabels[m]}</option>)}
            </select>
          </div>
          <YearScrub value={selectedYear} shared={shared}
            onChange={v => setShared({ ...shared, selectedYear: v })} />
        </div>
      </div>

      {loading ? (
        <div className="loading-center"><div className="spinner" /><span>Loading provider data…</span></div>
      ) : (
        <>
          {/* KPI strip */}
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', borderBottom: '1px solid var(--rule)' }}>
            <div className="stat fade-in fade-in-1">
              <div className="stat-label">State avg · {selectedYear}</div>
              <div className="stat-value num">{stateVal > 0 ? formatVal(stateVal) : '—'}</div>
              <div className="stat-meta">
                <span>{providerMetricLabels[metric]}</span>
                {isImputedYear && (
                  <span title={provenanceNote} style={{ marginLeft: 6, fontSize: 9, letterSpacing: '0.06em', textTransform: 'uppercase', color: D_MID }}>
                    Interpolated
                  </span>
                )}
              </div>
            </div>
            <div className="stat fade-in fade-in-2">
              <div className="stat-label">Best access county</div>
              <div className="stat-value num" style={{ color: D_LOW }}>{highest ? formatVal(highest.val) : '—'}</div>
              <div className="stat-meta"><span>{highest?.county ?? '—'} · {selectedYear}</span></div>
            </div>
            <div className="stat fade-in fade-in-3">
              <div className="stat-label">Lowest access county</div>
              <div className="stat-value num" style={{ color: D_HIGH }}>{lowest ? formatVal(lowest.val) : '—'}</div>
              <div className="stat-meta"><span>{lowest?.county ?? '—'} · {selectedYear}</span></div>
            </div>
            <div className="stat fade-in fade-in-4">
              <div className="stat-label">HPSA-designated counties</div>
              <div className="stat-value num" style={{ color: hpsaCount > 40 ? D_HIGH : D_MID }}>{hpsaCount}</div>
              <div className="stat-meta"><span>of 102 · primary care · {selectedYear}</span></div>
            </div>
          </div>

          <div style={{ padding: '32px 40px', display: 'flex', flexDirection: 'column', gap: 32 }}>

            {/* Statewide provider trend */}
            <div className="panel">
              <div className="panel-head">
                <div className="titles">
                  <div className="eyebrow">Statewide trend</div>
                  <div className="h3">{providerMetricLabels[metric]} · 2008–2022</div>
                </div>
                <span className="caption" style={{ color: 'var(--ink-4)' }}>Band = county min/max</span>
              </div>
              <div className="panel-body">
                <div style={{ height: 240 }}>
                  <ResponsiveContainer width="100%" height="100%">
                    <LineChart data={trend} margin={{ top: 8, right: 16, left: 0, bottom: 0 }}>
                      <CartesianGrid strokeDasharray="3 3" stroke={RULE} />
                      <XAxis dataKey="year" tick={{ fontSize: 10, fontFamily: "'IBM Plex Mono',monospace", fill: INK_4 }} />
                      <YAxis tick={{ fontSize: 10, fill: INK_4 }} />
                      <Tooltip contentStyle={TIP_STYLE}
                        formatter={(v: number, name: string) => [
                          formatVal(v),
                          name === 'state' ? 'IL avg' : name === 'high' ? 'County max' : 'County min',
                        ] as [string, string]} />
                      <Line type="monotone" dataKey="high" stroke={RULE} strokeWidth={1} dot={false} name="high" />
                      <Line type="monotone" dataKey="low" stroke={RULE} strokeWidth={1} dot={false} name="low" />
                      <Line type="monotone" dataKey="state" stroke={ACCENT} strokeWidth={2}
                        dot={{ r: 3, fill: ACCENT }} activeDot={{ r: 5 }} connectNulls={false} name="state" />
                      <ReferenceLine x={yearStr} stroke={INK_4} strokeDasharray="4 3" strokeWidth={1} />
                    </LineChart>
                  </ResponsiveContainer>
                </div>
              </div>
            </div>

            {/* County ranking + HPSA trend */}
            <div style={{ display: 'grid', gridTemplateColumns: '1.2fr 1fr', gap: 32 }}>
              {!isHpsaMetric && (
              <div className="panel">
                <div className="panel-head">
                  <div className="titles">
                    <div className="eyebrow">County ranking · {selectedYear}</div>
                    <div className="h3">{showBottom ? 'Ten lowest access' : 'Ten highest access'} counties</div>
                  </div>
                  <div className="seg">
                    <button className={`seg-btn${!showBottom ? ' active' : ''}`} onClick={() => setShowBottom(false)}>
                      Best
                    </button>
                    <button className={`seg-btn${showBottom ? ' active' : ''}`} onClick={() => setShowBottom(true)}>
                      Worst
                    </button>
                  </div>
                </div>
                <div className="panel-body">
                  <div style={{ height: 260 }}>
                    <ResponsiveContainer width="100%" height="100%">
                      <BarChart data={rankedCounties} layout="vertical" margin={{ top: 0, right: 16, left: 8, bottom: 0 }}>
                        <CartesianGrid strokeDasharray="3 3" stroke={RULE} horizontal={false} />
                        <XAxis type="number" tick={{ fontSize: 10, fontFamily: "'IBM Plex Mono',monospace", fill: INK_4 }} />
                        <YAxis dataKey="county" type="category" tick={{ fontSize: 10, fill: INK_3 }} width={88} />
                        <Tooltip contentStyle={TIP_STYLE}
                          formatter={(v: unknown) => [formatVal(Number(v)), providerMetricLabels[metric]]} />
                        <Bar dataKey="val" radius={[0, 2, 2, 0]}>
                          {rankedCounties.map((d, i) => (
                            <Cell key={i} fill={metricColor(d.val, stateVal, false)} />
                          ))}
                        </Bar>
                        {stateVal > 0 && (
                          <ReferenceLine x={stateVal} stroke={INK_4} strokeDasharray="4 3" strokeWidth={1}
                            label={{ value: 'IL avg', position: 'top', fontSize: 9, fill: INK_4 }} />
                        )}
                      </BarChart>
                    </ResponsiveContainer>
                  </div>
                </div>
              </div>

              )}
              <div className="panel">
                <div className="panel-head">
                  <div className="titles">
                    <div className="eyebrow">HPSA primary care designations</div>
                    <div className="h3">Counties in shortage · 2008–2022</div>
                  </div>
                </div>
                <div className="panel-body">
                  <div style={{ height: 260 }}>
                    <ResponsiveContainer width="100%" height="100%">
                      <BarChart data={hpsaTrend} margin={{ top: 0, right: 8, left: 0, bottom: 0 }}>
                        <CartesianGrid strokeDasharray="3 3" stroke={RULE} />
                        <XAxis dataKey="year" tick={{ fontSize: 9, fontFamily: "'IBM Plex Mono',monospace", fill: INK_4 }}
                          interval={2} />
                        <YAxis tick={{ fontSize: 10, fill: INK_4 }}
                          label={{ value: 'Counties', angle: -90, position: 'insideLeft', fontSize: 10, fill: INK_4, dx: 4 }} />
                        <Tooltip contentStyle={TIP_STYLE}
                          formatter={(v: unknown) => [`${v} counties`, 'HPSA-designated']} />
                        <Bar dataKey="designated" radius={[2, 2, 0, 0]}>
                          {hpsaTrend.map((d, i) => (
                            <Cell key={i} fill={d.designated > 50 ? D_HIGH : d.designated > 35 ? D_MID : D_LOW} />
                          ))}
                        </Bar>
                      </BarChart>
                    </ResponsiveContainer>
                  </div>
                  <p className="tiny" style={{ marginTop: 8 }}>
                    HPSA = Health Professional Shortage Area. Designation indicates insufficient primary care supply relative to population need.
                  </p>
                </div>
              </div>
            </div>

            {isHpsaMetric && (
              <div className="panel">
                <div className="panel-head">
                  <div className="titles">
                    <div className="eyebrow">HPSA primary care designation · {selectedYear}</div>
                    <div className="h3">Counties by designation category</div>
                  </div>
                </div>
                <div className="panel-body">
                  <p className="caption" style={{ marginBottom: 12 }}>
                    Designation is a category, not a score. "Part of county" is a different
                    finding from "whole county", not a worse one, so these are counted rather
                    than averaged or ranked.
                  </p>
                  <table className="tbl" style={{ width: '100%' }}>
                    <thead>
                      <tr>
                        <th style={{ textAlign: 'left', paddingLeft: 20 }}>Year</th>
                        <th>{HPSA_CATEGORY_LABEL[0]}</th>
                        <th>{HPSA_CATEGORY_LABEL[1]}</th>
                        <th>{HPSA_CATEGORY_LABEL[2]}</th>
                        <th>Designated</th>
                      </tr>
                    </thead>
                    <tbody>
                      {hpsaSummary.map(r => (
                        <tr key={r.Year} style={{ fontWeight: r.Year === selectedYear ? 600 : 400 }}>
                          <td className="col-left" style={{ paddingLeft: 20 }}>{r.Year}</td>
                          <td><span className="num">{r.not_designated}</span></td>
                          <td><span className="num">{r.whole_county}</span></td>
                          <td><span className="num">{r.part_of_county}</span></td>
                          <td><span className="num">
                            {r.counties_designated}
                            {r.pct_counties_designated !== null && ` (${r.pct_counties_designated}%)`}
                          </span></td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>
              </div>
            )}

            {/* Provider desert table */}
            {!isHpsaMetric && (
            <div className="panel">
              <div className="panel-head">
                <div className="titles">
                  <div className="eyebrow">Provider access · lowest 20 counties · {selectedYear}</div>
                  <div className="h3">Fewest providers</div>
                </div>
              </div>
              <div className="panel-body" style={{ padding: 0 }}>
                <table className="tbl" style={{ width: '100%' }}>
                  <thead>
                    <tr>
                      <th style={{ textAlign: 'left', paddingLeft: 20 }}>County</th>
                      <th>{providerMetricLabels[metric]}</th>
                      <th>vs. state avg</th>
                      <th>HPSA</th>
                      <th>Access tier</th>
                    </tr>
                  </thead>
                  <tbody>
                    {deserts.map((d, i) => {
                      const ratio = stateVal > 0 ? d.val / stateVal : 0;
                      const pct = stateVal > 0 ? ((ratio - 1) * 100) : 0;
                      const tierColor = ratio < 0.6 ? D_HIGH : ratio < 0.8 ? '#C85A4E' : D_MID;
                      const tier = ratio < 0.6 ? 'Critical' : ratio < 0.8 ? 'Low' : 'Below avg';
                      return (
                        <tr key={d.county}>
                          <td className="col-left" style={{ paddingLeft: 20 }}>
                            <div style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
                              <span style={{ fontFamily: 'var(--mono)', fontSize: 10, color: INK_4, width: 20 }}>{i + 1}</span>
                              {d.county}
                            </div>
                          </td>
                          <td><span className="num">{formatVal(d.val)}</span></td>
                          <td>
                            <span className="num" style={{ color: pct < 0 ? D_HIGH : D_LOW }}>
                              {pct > 0 ? '+' : ''}{pct.toFixed(0)}%
                            </span>
                          </td>
                          {!isHpsa(metric) && (
                            <td>
                              {d.hpsa > 0 ? (
                                <span style={{ fontSize: 10, padding: '2px 6px', background: '#F2E4E1', color: D_HIGH, fontFamily: 'var(--mono)', letterSpacing: '0.06em', textTransform: 'uppercase' }}>
                                  {d.hpsa === 1 ? 'Whole' : 'Partial'}
                                </span>
                              ) : (
                                <span style={{ color: 'var(--ink-5)', fontSize: 10 }}>—</span>
                              )}
                            </td>
                          )}
                          <td>
                            <span style={{ fontSize: 10, padding: '2px 6px', background: `${tierColor}22`, color: tierColor, fontFamily: 'var(--mono)', letterSpacing: '0.06em', textTransform: 'uppercase' }}>
                              {tier}
                            </span>
                          </td>
                        </tr>
                      );
                    })}
                  </tbody>
                </table>
              </div>
              <div style={{ padding: '10px 20px', borderTop: `1px solid ${RULE}` }}>
                <span className="tiny">Source: HRSA Area Health Resources File · {providerMetricLabels[metric]} · {selectedYear}</span>
              </div>
            </div>
            )}

            {/* Methodology */}
            <div style={{ paddingTop: 24, borderTop: `1px solid ${RULE}`, display: 'grid', gridTemplateColumns: '1fr 1fr 1fr', gap: 32 }}>
              <div>
                <div className="eyebrow" style={{ marginBottom: 8 }}>Data source</div>
                <p className="caption">HRSA Area Health Resources Files (AHRF) county file. {provenanceNote}</p>
              </div>
              <div>
                <div className="eyebrow" style={{ marginBottom: 8 }}>Coverage</div>
                <p className="caption">102 Illinois counties · {yearMin}–{yearMax}. {provenanceNote}</p>
              </div>
              <div>
                <div className="eyebrow" style={{ marginBottom: 8 }}>HPSA</div>
                <p className="caption">Health Professional Shortage Area: federal designation indicating a county has insufficient primary care providers relative to population need.</p>
              </div>
            </div>
          </div>
        </>
      )}
    </div>
  );
};

export default ProvidersView;
