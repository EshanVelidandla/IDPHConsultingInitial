import { useState, useEffect, useMemo } from 'react';
import {
  LineChart, Line, BarChart, Bar, XAxis, YAxis, CartesianGrid,
  Tooltip, ResponsiveContainer, ReferenceLine, Cell,
  ScatterChart, Scatter,
} from 'recharts';
import axios from 'axios';
import { causeLabels, causes, EXCLUDED_COUNTIES, API_BASE, providerMetricLabels, providerMetrics, providerMetricInverted } from '../data/constants';
import { countyPop2020 } from '../data/population';
import type { SharedState } from '../App';

interface ProviderRow { County: string; [year: string]: number | string; }

function pearsonR(xs: number[], ys: number[]): number {
  const n = xs.length;
  if (n < 3) return 0;
  const sx = xs.reduce((s, x) => s + x, 0), sy = ys.reduce((s, y) => s + y, 0);
  const sxy = xs.reduce((s, x, i) => s + x * ys[i], 0);
  const sx2 = xs.reduce((s, x) => s + x * x, 0), sy2 = ys.reduce((s, y) => s + y * y, 0);
  const num = n * sxy - sx * sy;
  const den = Math.sqrt((n * sx2 - sx * sx) * (n * sy2 - sy * sy));
  return den === 0 ? 0 : +(num / den).toFixed(3);
}

interface DeathRate { County: string; [key: string]: number | string; }

interface ViewProps { shared: SharedState; setShared: (s: SharedState) => void; }

// Design tokens for Recharts SVG attributes
const D_HIGH = '#B23A2E';
const D_LOW = '#4F7A4D';
const D_MID = '#C68B3C';
const INK = '#1C1B18';
const INK_3 = '#6B675F';
const INK_4 = '#9A968C';
const RULE = '#E6E3DC';

const TIP_STYLE = {
  fontSize: 11,
  fontFamily: "'IBM Plex Mono', monospace",
  border: 'none',
  boxShadow: '0 4px 16px rgba(0,0,0,0.1)',
  borderRadius: 0,
  background: '#FFFFFF',
};

function YearScrub({ value, onChange }: { value: number; onChange: (v: number) => void }) {
  return (
    <div className="year-scrub" style={{ width: 220 }}>
      <div style={{ display: 'flex', alignItems: 'baseline', justifyContent: 'space-between', marginBottom: 4 }}>
        <span className="eyebrow">Year</span>
        <span className="num" style={{ fontSize: 18, color: 'var(--ink)', fontWeight: 500 }}>{value}</span>
      </div>
      <input type="range" className="range" min={2009} max={2022} value={value}
        onChange={e => onChange(Number(e.target.value))} />
      <div style={{ display: 'flex', justifyContent: 'space-between', marginTop: 4, fontFamily: 'var(--mono)', fontSize: 9.5, color: 'var(--ink-4)' }}>
        {[2009, 2012, 2015, 2018, 2022].map(y => <span key={y}>{y}</span>)}
      </div>
    </div>
  );
}

const InsightsView = ({ shared, setShared }: ViewProps) => {
  const { selectedCause, selectedYear } = shared;
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [deathData, setDeathData] = useState<DeathRate[]>([]);
  const [showBottom, setShowBottom] = useState(false);
  const [corrMetric, setCorrMetric] = useState('primary_care_physicians_per_100k');
  const [providerData, setProviderData] = useState<ProviderRow[]>([]);
  const [providerLoading, setProviderLoading] = useState(false);

  useEffect(() => {
    if (!selectedCause) return;
    setLoading(true);
    axios.get(`${API_BASE}/death_rates?cause=${selectedCause}`)
      .then(r => { setDeathData(r.data); setError(null); })
      .catch(() => setError('Failed to load data. Ensure the backend is running.'))
      .finally(() => setLoading(false));
  }, [selectedCause]);

  useEffect(() => {
    setProviderLoading(true);
    axios.get(`${API_BASE}/provider_data?metric=${corrMetric}`)
      .then(r => setProviderData(r.data))
      .catch(() => {})
      .finally(() => setProviderLoading(false));
  }, [corrMetric]);

  const latestYear = (() => {
    const row = deathData.find(d => d.County === 'ILLINOIS');
    if (!row) return null;
    return Object.keys(row).filter(k => k !== 'County' && k !== '2008').sort().pop() ?? null;
  })();

  const stateRate = Number(deathData.find(d => d.County === 'ILLINOIS')?.[selectedYear.toString()]) || 0;

  const statewideTrend = useMemo(() => {
    const row = deathData.find(d => d.County === 'ILLINOIS');
    if (!row) return [];
    return Object.entries(row)
      .filter(([k]) => k !== 'County' && k !== '2008')
      .map(([year, val]) => ({ year, rate: Number(val) > 0 ? Number(val) : null }))
      .sort((a, b) => a.year.localeCompare(b.year));
  }, [deathData]);

  const countyBand = useMemo(() => {
    if (!deathData.length) return {};
    const years = statewideTrend.map(d => d.year);
    const result: Record<string, { min: number; max: number }> = {};
    years.forEach(y => {
      const vals = deathData
        .filter(d => !EXCLUDED_COUNTIES.includes(d.County))
        .map(d => Number(d[y]))
        .filter(v => v > 0);
      if (vals.length) result[y] = { min: Math.min(...vals), max: Math.max(...vals) };
    });
    return result;
  }, [deathData, statewideTrend]);

  const trendWithBand = useMemo(() =>
    statewideTrend.map(d => ({
      ...d,
      low: countyBand[d.year]?.min ?? null,
      high: countyBand[d.year]?.max ?? null,
    })),
    [statewideTrend, countyBand]
  );

  const topCounties = useMemo(() => {
    if (!latestYear) return [];
    const sorted = deathData
      .filter(d => !EXCLUDED_COUNTIES.includes(d.County))
      .map(d => ({ county: d.County, rate: Number(d[selectedYear.toString()]) || 0 }))
      .filter(d => d.rate > 0)
      .sort((a, b) => b.rate - a.rate);
    return showBottom ? sorted.slice(-5).reverse() : sorted.slice(0, 5);
  }, [deathData, selectedYear, showBottom, latestYear]);

  const distribution = useMemo(() => {
    if (!stateRate) return [];
    const cats = [
      { label: 'Much higher', sub: '> 40% above', color: D_HIGH, min: 1.4, max: Infinity },
      { label: 'Higher', sub: '20–40% above', color: '#C85A4E', min: 1.2, max: 1.4 },
      { label: 'Near average', sub: '± 20%', color: D_MID, min: 0.8, max: 1.2 },
      { label: 'Lower', sub: '20–40% below', color: '#5A9458', min: 0.6, max: 0.8 },
      { label: 'Much lower', sub: '> 40% below', color: D_LOW, min: 0, max: 0.6 },
    ];
    return cats.map(cat => {
      const count = deathData
        .filter(d => !EXCLUDED_COUNTIES.includes(d.County))
        .filter(d => {
          const rate = Number(d[selectedYear.toString()]);
          if (!rate) return false;
          const ratio = rate / stateRate;
          return ratio >= cat.min && ratio < cat.max;
        }).length;
      return { ...cat, count };
    });
  }, [deathData, stateRate, selectedYear]);

  const stateTrend = useMemo(() => {
    const row = deathData.find(d => d.County === 'ILLINOIS');
    if (!row) return null;
    const r2009 = Number(row['2009']);
    const rLatest = latestYear ? Number(row[latestYear]) : 0;
    if (!r2009 || !rLatest) return null;
    return { pct: ((rLatest - r2009) / r2009) * 100, from: r2009, to: rLatest };
  }, [deathData, latestYear]);

  const highest = useMemo(() => {
    if (!latestYear) return null;
    return deathData
      .filter(d => !EXCLUDED_COUNTIES.includes(d.County))
      .map(d => ({ county: d.County, rate: Number(d[selectedYear.toString()]) || 0 }))
      .filter(d => d.rate > 0)
      .sort((a, b) => b.rate - a.rate)[0] ?? null;
  }, [deathData, selectedYear, latestYear]);

  const lowest = useMemo(() => {
    if (!latestYear) return null;
    return deathData
      .filter(d => !EXCLUDED_COUNTIES.includes(d.County))
      .map(d => ({ county: d.County, rate: Number(d[selectedYear.toString()]) || 0 }))
      .filter(d => d.rate > 0)
      .sort((a, b) => a.rate - b.rate)[0] ?? null;
  }, [deathData, selectedYear, latestYear]);

  const aboveAvg = useMemo(() => {
    if (!stateRate) return null;
    return deathData.filter(d => !EXCLUDED_COUNTIES.includes(d.County))
      .filter(d => Number(d[selectedYear.toString()]) > stateRate).length;
  }, [deathData, stateRate, selectedYear]);

  const mortalityBurden = useMemo(() => {
    if (!stateRate || !deathData.length) return [];
    return deathData
      .filter(d => !EXCLUDED_COUNTIES.includes(d.County))
      .map(d => {
        const rate = Number(d[selectedYear.toString()]) || 0;
        if (!rate) return null;
        const pop = countyPop2020[d.County] ?? 0;
        const excess = Math.round(((rate - stateRate) * pop) / 100000);
        return excess > 0 ? { county: d.County, excessDeaths: excess, rate } : null;
      })
      .filter((d): d is { county: string; excessDeaths: number; rate: number } => d !== null)
      .sort((a, b) => b.excessDeaths - a.excessDeaths)
      .slice(0, 10);
  }, [deathData, stateRate, selectedYear]);

  const trajectory = useMemo(() => {
    if (!deathData.length) return { improved: [], declined: [] };
    const rows = deathData
      .filter(d => !EXCLUDED_COUNTIES.includes(d.County))
      .map(d => {
        const r09 = Number(d['2009']) || 0;
        const r22 = Number(d['2022']) || 0;
        if (!r09 || !r22) return null;
        return { county: d.County, change: r22 - r09 };
      })
      .filter((d): d is { county: string; change: number } => d !== null)
      .sort((a, b) => a.change - b.change);
    return {
      improved: rows.slice(0, 8).map(d => ({ county: d.county, change: Math.abs(d.change) })),
      declined: rows.slice(-8).reverse().map(d => ({ county: d.county, change: d.change })),
    };
  }, [deathData]);

  const covidImpact = useMemo(() => {
    if (!deathData.length) return [];
    return deathData
      .filter(d => !EXCLUDED_COUNTIES.includes(d.County))
      .map(d => {
        const r19 = Number(d['2019']) || 0;
        const r22 = Number(d['2022']) || 0;
        if (!r19 || !r22) return null;
        return { county: d.County, change: +(r22 - r19).toFixed(1), pct: +((r22 - r19) / r19 * 100).toFixed(1) };
      })
      .filter((d): d is { county: string; change: number; pct: number } => d !== null)
      .sort((a, b) => b.change - a.change)
      .slice(0, 12);
  }, [deathData]);

  const corrScatter = useMemo(() => {
    if (!deathData.length || !providerData.length) return [];
    const yrStr = selectedYear.toString();
    return deathData
      .filter(d => !EXCLUDED_COUNTIES.includes(d.County))
      .map(d => {
        const x = Number(providerData.find(p => p.County === d.County)?.[yrStr]) || 0;
        const y = Number(d[yrStr]) || 0;
        return x > 0 && y > 0 ? { county: d.County, x, y } : null;
      })
      .filter(Boolean) as { county: string; x: number; y: number }[];
  }, [deathData, providerData, selectedYear]);

  const corrR = useMemo(() => {
    if (corrScatter.length < 3) return null;
    return pearsonR(corrScatter.map(p => p.x), corrScatter.map(p => p.y));
  }, [corrScatter]);

  const inverted = providerMetricInverted[corrMetric] ?? false;
  const stateProvVal = useMemo(
    () => Number(providerData.find(d => d.County === 'ILLINOIS')?.[selectedYear.toString()]) || 0,
    [providerData, selectedYear]
  );

  const hasData = selectedCause && deathData.length > 0;

  return (
    <div className="view fade-in" style={{ overflowY: 'auto' }}>
      {/* View head */}
      <div className="view-head">
        <div className="titles">
          <div className="eyebrow eyebrow-ink">Mortality Insights</div>
          <h1 className="h-display" style={{ marginTop: 8 }}>Statewide patterns &amp;<br />county trajectories.</h1>
          <p className="body" style={{ marginTop: 12, maxWidth: 540, color: 'var(--ink-3)' }}>
            Pick a cause of death to see how its rate has moved statewide since 2009, how each county compares to the Illinois average, and which counties are on an improving or worsening trajectory. Scrub the year slider to update all charts at once.
          </p>
        </div>
        <div className="ix">
          <div className="field">
            <div className="field-label">Cause of death</div>
            <select className="sel" style={{ width: 260 }}
              value={selectedCause}
              onChange={e => setShared({ ...shared, selectedCause: e.target.value })}>
              <option value="">— Select cause —</option>
              {causes.map(c => <option key={c} value={c}>{causeLabels[c]}</option>)}
            </select>
          </div>
          <YearScrub value={selectedYear} onChange={v => setShared({ ...shared, selectedYear: v })} />
        </div>
      </div>

      {error && <div className="error-banner">{error}</div>}

      {!hasData && !loading ? (
        <div className="empty" style={{ margin: '48px 40px' }}>
          <div className="empty-eyebrow">No cause selected</div>
          <div className="empty-title">Select a cause of death to begin</div>
          <div className="empty-body">Choose a cause from the dropdown above to see the statewide trend line, county distribution, year-over-year changes, and which counties are improving or worsening.</div>
        </div>
      ) : loading ? (
        <div className="loading-center"><div className="spinner" /><span>Loading data…</span></div>
      ) : (
        <>
          {/* KPI strip */}
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', borderBottom: '1px solid var(--rule)' }}>
            <div className="stat fade-in fade-in-1">
              <div className="stat-label">Highest county rate</div>
              <div className="stat-value num" style={{ color: D_HIGH }}>{highest ? highest.rate.toFixed(1) : '—'}</div>
              <div className="stat-meta"><span>{highest?.county ?? '—'} · {selectedYear}</span></div>
            </div>
            <div className="stat fade-in fade-in-2">
              <div className="stat-label">Lowest county rate</div>
              <div className="stat-value num" style={{ color: D_LOW }}>{lowest ? lowest.rate.toFixed(1) : '—'}</div>
              <div className="stat-meta"><span>{lowest?.county ?? '—'} · {selectedYear}</span></div>
            </div>
            <div className="stat fade-in fade-in-3">
              <div className="stat-label">State trend 2009–2022</div>
              <div className="stat-value num" style={{ color: stateTrend ? (stateTrend.pct < 0 ? D_LOW : D_HIGH) : 'var(--ink-5)' }}>
                {stateTrend ? `${stateTrend.pct > 0 ? '+' : ''}${stateTrend.pct.toFixed(1)}%` : '—'}
              </div>
              <div className="stat-meta"><span>{stateTrend ? `${stateTrend.from.toFixed(1)} → ${stateTrend.to.toFixed(1)} /100k` : ''}</span></div>
            </div>
            <div className="stat fade-in fade-in-4">
              <div className="stat-label">Counties above state avg</div>
              <div className="stat-value num">{aboveAvg ?? '—'}</div>
              <div className="stat-meta"><span>of 102 · {selectedYear}</span></div>
            </div>
          </div>

          {/* Body */}
          <div style={{ padding: '32px 40px', display: 'flex', flexDirection: 'column', gap: 32 }}>

            {/* Statewide trend */}
            <div className="panel">
              <div className="panel-head">
                <div className="titles">
                  <div className="eyebrow">Statewide trend</div>
                  <div className="h3">Age-adjusted death rate, 2009 – {latestYear ?? 2022}</div>
                </div>
                <span className="caption" style={{ color: 'var(--ink-4)' }}>Band = county min/max</span>
              </div>
              <div className="panel-body">
                <div style={{ height: 240 }}>
                  <ResponsiveContainer width="100%" height="100%">
                    <LineChart data={trendWithBand} margin={{ top: 8, right: 16, left: 0, bottom: 0 }}>
                      <CartesianGrid strokeDasharray="3 3" stroke={RULE} />
                      <XAxis dataKey="year" tick={{ fontSize: 10, fontFamily: "'IBM Plex Mono',monospace", fill: INK_4 }} />
                      <YAxis tick={{ fontSize: 10, fill: INK_4 }} label={{ value: 'per 100k', angle: -90, position: 'insideLeft', fontSize: 10, fill: INK_4, dx: -4 }} />
                      <Tooltip contentStyle={TIP_STYLE}
                        formatter={(v: unknown) => [`${Number(v).toFixed(1)} per 100k`, 'IL State Rate']} />
                      <Line type="monotone" dataKey="high" stroke={RULE} strokeWidth={1} dot={false} name="County max" />
                      <Line type="monotone" dataKey="low" stroke={RULE} strokeWidth={1} dot={false} name="County min" />
                      <Line type="monotone" dataKey="rate" stroke={INK} strokeWidth={2}
                        dot={{ r: 3, fill: INK }} activeDot={{ r: 5, fill: INK }} connectNulls={false} name="IL avg" />
                    </LineChart>
                  </ResponsiveContainer>
                </div>
              </div>
            </div>

            {/* Provider correlation scatter */}
            <div className="panel">
              <div className="panel-head">
                <div className="titles">
                  <div className="eyebrow">Access correlation · {selectedYear}</div>
                  <div className="h3">Provider density vs. {causeLabels[selectedCause] ?? 'mortality'} rate</div>
                </div>
                <div style={{ display: 'flex', alignItems: 'center', gap: 12 }}>
                  <select className="sel" style={{ width: 240, fontSize: 12 }}
                    value={corrMetric} onChange={e => setCorrMetric(e.target.value)}>
                    {providerMetrics.map(m => <option key={m} value={m}>{providerMetricLabels[m]}</option>)}
                  </select>
                  {corrR !== null && (
                    <span className="num" style={{ fontSize: 12, color: Math.abs(corrR) > 0.4 ? (corrR < 0 ? D_LOW : D_HIGH) : D_MID, whiteSpace: 'nowrap' }}>
                      r = {corrR > 0 ? '+' : ''}{corrR.toFixed(3)}
                    </span>
                  )}
                </div>
              </div>
              <div className="panel-body">
                {providerLoading ? (
                  <div className="loading-center"><div className="spinner" /></div>
                ) : (
                  <div style={{ height: 260 }}>
                    <ResponsiveContainer width="100%" height="100%">
                      <ScatterChart margin={{ top: 8, right: 24, bottom: 40, left: 40 }}>
                        <CartesianGrid strokeDasharray="3 3" stroke={RULE} />
                        <XAxis type="number" dataKey="x" name={providerMetricLabels[corrMetric]}
                          domain={['auto', 'auto']}
                          label={{ value: providerMetricLabels[corrMetric], position: 'insideBottom', offset: -26, fontSize: 10, fill: INK_4 }}
                          tick={{ fontSize: 9, fontFamily: "'IBM Plex Mono',monospace", fill: INK_4 }} />
                        <YAxis type="number" dataKey="y" name="Death rate /100k"
                          label={{ value: '/100k', angle: -90, position: 'insideLeft', offset: 8, fontSize: 10, fill: INK_4 }}
                          tick={{ fontSize: 9, fill: INK_4 }} />
                        {stateRate > 0 && <ReferenceLine y={stateRate} stroke={INK_4} strokeDasharray="4 3" strokeWidth={1} />}
                        {stateProvVal > 0 && <ReferenceLine x={stateProvVal} stroke={INK_4} strokeDasharray="4 3" strokeWidth={1} />}
                        <Tooltip contentStyle={TIP_STYLE}
                          formatter={(v: unknown, name: unknown) => [
                            `${Number(v).toFixed(1)}`,
                            name === 'x' ? providerMetricLabels[corrMetric] : 'Mortality /100k',
                          ]}
                          labelFormatter={() => ''} />
                        <Scatter data={corrScatter} name="counties">
                          {corrScatter.map((d, i) => {
                            const goodAccess = inverted ? d.x < stateProvVal : d.x > stateProvVal;
                            const highMort = d.y > stateRate;
                            const fill = highMort && !goodAccess ? D_HIGH : highMort ? D_MID : goodAccess ? D_LOW : INK_3;
                            return <Cell key={i} fill={fill} fillOpacity={0.8} />;
                          })}
                        </Scatter>
                      </ScatterChart>
                    </ResponsiveContainer>
                  </div>
                )}
                <p className="tiny" style={{ marginTop: 6 }}>
                  Dashed lines = statewide averages. {corrR !== null ? `r = ${corrR.toFixed(3)} (${corrScatter.length} counties).` : ''} Visit the Access × Mortality tab for full regression analysis.
                </p>
              </div>
            </div>

            {/* Top/Bottom + Distribution */}
            <div style={{ display: 'grid', gridTemplateColumns: '1.2fr 1fr', gap: 32 }}>
              <div className="panel">
                <div className="panel-head">
                  <div className="titles">
                    <div className="eyebrow">County ranking</div>
                    <div className="h3">{showBottom ? 'Five lowest' : 'Five highest'} counties</div>
                  </div>
                  <div className="seg">
                    <button className={`seg-btn${!showBottom ? ' active' : ''}`} onClick={() => setShowBottom(false)}>Highest</button>
                    <button className={`seg-btn${showBottom ? ' active' : ''}`} onClick={() => setShowBottom(true)}>Lowest</button>
                  </div>
                </div>
                <div className="panel-body">
                  <div style={{ height: 200 }}>
                    <ResponsiveContainer width="100%" height="100%">
                      <BarChart data={topCounties} layout="vertical" margin={{ top: 0, right: 16, left: 8, bottom: 0 }}>
                        <CartesianGrid strokeDasharray="3 3" stroke={RULE} horizontal={false} />
                        <XAxis type="number" tick={{ fontSize: 10, fontFamily: "'IBM Plex Mono',monospace", fill: INK_4 }} />
                        <YAxis dataKey="county" type="category" tick={{ fontSize: 11, fill: INK_3 }} width={88} />
                        <Tooltip contentStyle={TIP_STYLE} formatter={(v: unknown) => [`${Number(v).toFixed(1)} /100k`, 'Rate']} />
                        <Bar dataKey="rate" radius={[0, 2, 2, 0]}>
                          {topCounties.map((_, i) => <Cell key={i} fill={showBottom ? D_LOW : D_HIGH} />)}
                        </Bar>
                      </BarChart>
                    </ResponsiveContainer>
                  </div>
                </div>
              </div>

              <div className="panel">
                <div className="panel-head">
                  <div className="titles">
                    <div className="eyebrow">Distribution</div>
                    <div className="h3">Counties vs. state average · {selectedYear}</div>
                  </div>
                </div>
                <div className="panel-body">
                  <div style={{ display: 'flex', flexDirection: 'column', gap: 0 }}>
                    {distribution.map(({ label, sub, color, count }, i) => (
                      <div key={label} style={{ display: 'grid', gridTemplateColumns: '12px 1fr 32px', alignItems: 'center', padding: '10px 0', borderTop: i === 0 ? 'none' : `1px solid ${RULE}`, gap: 12 }}>
                        <span style={{ width: 10, height: 10, background: color, display: 'inline-block' }} />
                        <div>
                          <div style={{ color: INK, fontSize: 12.5 }}>{label}</div>
                          <div className="num" style={{ fontSize: 10, color: INK_4, marginTop: 1 }}>{sub}</div>
                        </div>
                        <span className="num" style={{ color: count > 0 ? INK : 'var(--ink-5)', fontSize: 13, textAlign: 'right' }}>{count || '—'}</span>
                      </div>
                    ))}
                  </div>
                </div>
              </div>
            </div>

            {/* Burden */}
            {mortalityBurden.length > 0 && (
              <div className="panel">
                <div className="panel-head">
                  <div className="titles">
                    <div className="eyebrow">Burden analysis</div>
                    <div className="h3">Excess deaths, population-adjusted</div>
                  </div>
                  <span className="caption">Top 10 by excess deaths/yr · {selectedYear}</span>
                </div>
                <div className="panel-body">
                  <div style={{ height: 260 }}>
                    <ResponsiveContainer width="100%" height="100%">
                      <BarChart data={mortalityBurden} layout="vertical" margin={{ top: 0, right: 24, left: 8, bottom: 0 }}>
                        <CartesianGrid strokeDasharray="3 3" stroke={RULE} horizontal={false} />
                        <XAxis type="number" tick={{ fontSize: 10, fontFamily: "'IBM Plex Mono',monospace", fill: INK_4 }} />
                        <YAxis dataKey="county" type="category" tick={{ fontSize: 10, fill: INK_3 }} width={88} />
                        <Tooltip contentStyle={TIP_STYLE}
                          formatter={(v: unknown) => [`+${Number(v).toLocaleString()} deaths/yr`, 'Excess burden']} />
                        <Bar dataKey="excessDeaths" radius={[0, 2, 2, 0]}>
                          {mortalityBurden.map((_, i) => <Cell key={i} fill={i < 3 ? D_HIGH : '#C85A4E'} />)}
                        </Bar>
                      </BarChart>
                    </ResponsiveContainer>
                  </div>
                  <p className="tiny" style={{ marginTop: 8 }}>
                    Excess deaths = (county rate − state rate) × county population / 100,000. Source: 2020 US Census.
                  </p>
                </div>
              </div>
            )}

            {/* Trajectory */}
            <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 32 }}>
              <div className="panel">
                <div className="panel-head">
                  <div className="titles">
                    <div className="eyebrow">Trajectory · improved</div>
                    <div className="h3">Largest decreases 2009–2022</div>
                  </div>
                </div>
                <div className="panel-body">
                  <div style={{ height: 220 }}>
                    <ResponsiveContainer width="100%" height="100%">
                      <BarChart data={trajectory.improved} layout="vertical" margin={{ top: 0, right: 16, left: 8, bottom: 0 }}>
                        <CartesianGrid strokeDasharray="3 3" stroke={RULE} horizontal={false} />
                        <XAxis type="number" tick={{ fontSize: 10, fill: INK_4 }}
                          tickFormatter={v => `-${Number(v).toFixed(0)}`} />
                        <YAxis dataKey="county" type="category" tick={{ fontSize: 10, fill: INK_3 }} width={85} />
                        <Tooltip contentStyle={TIP_STYLE}
                          formatter={(v: unknown) => [`−${Number(v).toFixed(1)} /100k`, 'Decrease']} />
                        <Bar dataKey="change" fill={D_LOW} radius={[0, 2, 2, 0]} />
                      </BarChart>
                    </ResponsiveContainer>
                  </div>
                </div>
              </div>

              <div className="panel">
                <div className="panel-head">
                  <div className="titles">
                    <div className="eyebrow">Trajectory · declined</div>
                    <div className="h3">Largest increases 2009–2022</div>
                  </div>
                </div>
                <div className="panel-body">
                  <div style={{ height: 220 }}>
                    <ResponsiveContainer width="100%" height="100%">
                      <BarChart data={trajectory.declined} layout="vertical" margin={{ top: 0, right: 16, left: 8, bottom: 0 }}>
                        <CartesianGrid strokeDasharray="3 3" stroke={RULE} horizontal={false} />
                        <XAxis type="number" tick={{ fontSize: 10, fill: INK_4 }}
                          tickFormatter={v => `+${Number(v).toFixed(0)}`} />
                        <YAxis dataKey="county" type="category" tick={{ fontSize: 10, fill: INK_3 }} width={85} />
                        <Tooltip contentStyle={TIP_STYLE}
                          formatter={(v: unknown) => [`+${Number(v).toFixed(1)} /100k`, 'Increase']} />
                        <Bar dataKey="change" fill={D_HIGH} radius={[0, 2, 2, 0]} />
                      </BarChart>
                    </ResponsiveContainer>
                  </div>
                </div>
              </div>
            </div>

            {/* COVID-era impact */}
            {covidImpact.length > 0 && (
              <div className="panel">
                <div className="panel-head">
                  <div className="titles">
                    <div className="eyebrow">COVID-era impact</div>
                    <div className="h3">Rate shift 2019 → 2022</div>
                  </div>
                  <span className="caption">Sorted by absolute change</span>
                </div>
                <div className="panel-body">
                  <div style={{ height: 300 }}>
                    <ResponsiveContainer width="100%" height="100%">
                      <BarChart data={covidImpact} margin={{ top: 4, right: 16, left: 8, bottom: 48 }}>
                        <CartesianGrid strokeDasharray="3 3" stroke={RULE} />
                        <XAxis dataKey="county" tick={{ fontSize: 8.5, fontFamily: "'IBM Plex Mono',monospace", fill: INK_4 }}
                          angle={-45} textAnchor="end" interval={0} />
                        <YAxis tick={{ fontSize: 10, fill: INK_4 }}
                          tickFormatter={v => `${v > 0 ? '+' : ''}${Number(v).toFixed(0)}`} />
                        <ReferenceLine y={0} stroke={INK_3} strokeWidth={1.5} />
                        <Tooltip contentStyle={TIP_STYLE}
                          formatter={(v: unknown, _: unknown, props: { payload?: { pct?: number } }) =>
                            [`${Number(v) > 0 ? '+' : ''}${Number(v).toFixed(1)} /100k (${(props.payload?.pct ?? 0) > 0 ? '+' : ''}${(props.payload?.pct ?? 0).toFixed(1)}%)`, 'Rate change']} />
                        <Bar dataKey="change" radius={[2, 2, 0, 0]}>
                          {covidImpact.map((d, i) => <Cell key={i} fill={d.change > 0 ? D_HIGH : D_LOW} />)}
                        </Bar>
                      </BarChart>
                    </ResponsiveContainer>
                  </div>
                </div>
              </div>
            )}

            {/* Methodology footer */}
            <div style={{ paddingTop: 24, borderTop: `1px solid ${RULE}`, display: 'grid', gridTemplateColumns: '1fr 1fr 1fr', gap: 32 }}>
              <div>
                <div className="eyebrow" style={{ marginBottom: 8 }}>Methodology</div>
                <p className="caption">Age-adjusted to 2000 US standard. Suppressed when count &lt; 5 (NCHS guidance).</p>
              </div>
              <div>
                <div className="eyebrow" style={{ marginBottom: 8 }}>Coverage</div>
                <p className="caption">102 counties · {2022 - 2009 + 1} years · {causes.length} cause categories.</p>
              </div>
              <div>
                <div className="eyebrow" style={{ marginBottom: 8 }}>Source</div>
                <p className="caption">IDPH Vital Statistics warehouse. Cook County total includes Chicago and Suburban Cook subdivisions.</p>
              </div>
            </div>
          </div>
        </>
      )}
    </div>
  );
};

export default InsightsView;
