import { useState, useEffect, useMemo } from 'react';
import {
  LineChart, Line, BarChart, Bar, XAxis, YAxis, CartesianGrid,
  Tooltip, ResponsiveContainer, ReferenceLine, Cell,
  ScatterChart, Scatter,
} from 'recharts';
import { causeLabels, causes, EXCLUDED_COUNTIES, providerMetricLabels, providerMetricInverted, VIEW_HUES, continuousProviderMetrics } from '../data/constants';
import { fetchDeathRates, fetchProviderData, useMeta, usePopulation } from '../data/useDataset';
import { asRows, TREND_BASE_YEAR, crossesPopulationSeam, toRate, yearsOf, rateRange, ratedCounties, TIP_STYLE, pearsonR, INK_4, imputedNote } from '../data/analytics';
import type { SharedState } from '../App';
import YearScrub from './YearScrub';

interface ProviderRow { County: string; [year: string]: number | string; }

interface DeathRate { County: string; [key: string]: number | string; }

interface ViewProps { shared: SharedState; setShared: (s: SharedState) => void; }

// Design tokens for Recharts SVG attributes
const D_HIGH = '#B23A2E';
const D_LOW = '#4F7A4D';
const D_MID = '#C68B3C';
const INK = '#1C1B18';
const HUE = VIEW_HUES['/insights'].hue;
const INK_3 = '#6B675F';
const RULE = '#E6E3DC';

// The last full year before COVID-19, so a fixed reference rather than a data bound.
const COVID_BASE_YEAR = 2019;


const InsightsView = ({ shared, setShared }: ViewProps) => {
  const { selectedCause, selectedYear } = shared;
  const { pop: countyPop } = usePopulation();
  const { meta } = useMeta();
  // Series endpoints come from the data range the server reports, so the copy
  // and the charts cannot drift apart from what was actually loaded.
  const firstYear = shared.dataYearRange?.min ?? TREND_BASE_YEAR;
  const lastYear = shared.dataYearRange?.max ?? 2022;
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [deathData, setDeathData] = useState<DeathRate[]>([]);
  const [showBottom, setShowBottom] = useState(false);
  const [corrMetric, setCorrMetric] = useState('primary_care_physicians_per_100k');
  const [providerData, setProviderData] = useState<ProviderRow[]>([]);
  const [providerLoading, setProviderLoading] = useState(false);

  useEffect(() => {
    // Clearing the cause cancels any request in flight, so nothing else would
    // clear `loading`.
    if (!selectedCause) { setLoading(false); return; }
    setLoading(true);
    // A slower earlier request must not land after a newer one and
    // overwrite it. Switching cause or metric quickly can otherwise leave
    // the view showing the answer to a request it has already moved on from.
    let live = true;
    fetchDeathRates(selectedCause)
      .then(r => { if (live) { setDeathData(asRows(r.data)); setError(null); } })
      .catch(() => { if (live) setError('Failed to load data. Ensure the backend is running.'); })
      .finally(() => { if (live) setLoading(false); });
    return () => { live = false; };
  }, [selectedCause]);

  useEffect(() => {
    setProviderLoading(true);
    // A slower earlier request must not land after a newer one and
    // overwrite it. Switching cause or metric quickly can otherwise leave
    // the view showing the answer to a request it has already moved on from.
    let live = true;
    fetchProviderData(corrMetric)
      .then(r => { if (live) setProviderData(asRows(r.data)); })
      .catch(() => { if (live) setError('Failed to load provider data for the access comparison.'); })
      .finally(() => { if (live) setProviderLoading(false); });
    return () => { live = false; };
  }, [corrMetric]);

  const latestYear = (() => {
    const row = deathData.find(d => d.County === 'ILLINOIS');
    if (!row) return null;
    return Object.keys(row).filter(k => k !== 'County').sort().pop() ?? null;
  })();

  const stateRate = toRate(deathData.find(d => d.County === 'ILLINOIS') as never, selectedYear) ?? 0;

  const statewideTrend = useMemo(() => {
    const row = deathData.find(d => d.County === 'ILLINOIS');
    if (!row) return [];
    return Object.entries(row)
      .filter(([k]) => k !== 'County')
      .map(([year]) => ({ year, rate: toRate(row as never, year) }))
      .sort((a, b) => a.year.localeCompare(b.year));
  }, [deathData]);

  const countyBand = useMemo(() => {
    if (!deathData.length) return {};
    const years = statewideTrend.map(d => d.year);
    const result: Record<string, { min: number; max: number }> = {};
    years.forEach(y => {
      const range = rateRange(deathData, y, EXCLUDED_COUNTIES);
      if (range) result[y] = range;
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
    const sorted = ratedCounties(deathData, selectedYear, EXCLUDED_COUNTIES)
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
          const rate = toRate(d as never, selectedYear);
          if (rate === null) return false;
          const ratio = rate / stateRate;
          return ratio >= cat.min && ratio < cat.max;
        }).length;
      return { ...cat, count };
    });
  }, [deathData, stateRate, selectedYear]);

  const stateTrend = useMemo(() => {
    const row = deathData.find(d => d.County === 'ILLINOIS');
    if (!row) return null;
    // Starts at the first year this cause was published, not a fixed 2009:
    // COVID-19 begins in 2020 and the series as a whole in 2008.
    const fromYear = yearsOf([row as never]).find(y => toRate(row as never, y) !== null);
    const rFirst = fromYear !== undefined ? toRate(row as never, fromYear) : null;
    const rLatest = latestYear ? toRate(row as never, latestYear) : null;
    if (!rFirst || rLatest === null) return null;
    return { pct: ((rLatest - rFirst) / rFirst) * 100, from: rFirst, to: rLatest, fromYear: fromYear!, toYear: latestYear };
  }, [deathData, latestYear]);

  const highest = useMemo(() => {
    if (!latestYear) return null;
    return ratedCounties(deathData, selectedYear, EXCLUDED_COUNTIES)
      .sort((a, b) => b.rate - a.rate)[0] ?? null;
  }, [deathData, selectedYear, latestYear]);

  const lowest = useMemo(() => {
    if (!latestYear) return null;
    return ratedCounties(deathData, selectedYear, EXCLUDED_COUNTIES)
      .sort((a, b) => a.rate - b.rate)[0] ?? null;
  }, [deathData, selectedYear, latestYear]);

  const aboveAvg = useMemo(() => {
    if (!stateRate) return null;
    return ratedCounties(deathData, selectedYear, EXCLUDED_COUNTIES)
      .filter(d => d.rate > stateRate).length;
  }, [deathData, stateRate, selectedYear]);

  // Excess deaths use the population of the year being shown. They used to be
  // scaled by a hardcoded 2020 table for every year from 2008 on, which
  // overstated the burden in shrinking counties early in the series.
  const mortalityBurden = useMemo(() => {
    if (!stateRate || !deathData.length) return [];
    return deathData
      .filter(d => !EXCLUDED_COUNTIES.includes(d.County))
      .map(d => {
        const rate = toRate(d as never, selectedYear);
        if (rate === null) return null;
        const pop = countyPop[d.County]?.[selectedYear];
        if (!pop) return null;
        const excess = Math.round(((rate - stateRate) * pop) / 100000);
        return excess > 0 ? { county: d.County, excessDeaths: excess, rate } : null;
      })
      .filter((d): d is { county: string; excessDeaths: number; rate: number } => d !== null)
      .sort((a, b) => b.excessDeaths - a.excessDeaths)
      .slice(0, 10);
  }, [deathData, stateRate, selectedYear, countyPop]);

  const trajectory = useMemo(() => {
    if (!deathData.length) return { improved: [], declined: [] };
    const rows = deathData
      .filter(d => !EXCLUDED_COUNTIES.includes(d.County))
      .map(d => {
        const first = toRate(d as never, firstYear);
        const last = toRate(d as never, lastYear);
        if (first === null || last === null) return null;
        return { county: d.County, change: last - first };
      })
      .filter((d): d is { county: string; change: number } => d !== null)
      .sort((a, b) => a.change - b.change);
    return {
      improved: rows.slice(0, 8).map(d => ({ county: d.county, change: Math.abs(d.change) })),
      declined: rows.slice(-8).reverse().map(d => ({ county: d.county, change: d.change })),
    };
  }, [deathData, firstYear, lastYear]);

  const covidImpact = useMemo(() => {
    if (!deathData.length) return [];
    return deathData
      .filter(d => !EXCLUDED_COUNTIES.includes(d.County))
      .map(d => {
        const base = toRate(d as never, COVID_BASE_YEAR);
        const latest = toRate(d as never, lastYear);
        if (base === null || latest === null) return null;
        // A real zero in the base year still has a change, but no percentage.
        return {
          county: d.County,
          change: +(latest - base).toFixed(1),
          pct: base > 0 ? +((latest - base) / base * 100).toFixed(1) : null,
        };
      })
      .filter((d): d is { county: string; change: number; pct: number | null } => d !== null)
      .sort((a, b) => b.change - a.change)
      .slice(0, 12);
  }, [deathData, lastYear]);

  const corrScatter = useMemo(() => {
    if (!deathData.length || !providerData.length) return [];
    const yrStr = selectedYear.toString();
    return deathData
      .filter(d => !EXCLUDED_COUNTIES.includes(d.County))
      .map(d => {
        // Zero is a real observation, here as in the Access view: dropping it
        // removed the provider deserts and left the two views disagreeing on n.
        const x = toRate(providerData.find(p => p.County === d.County) as never, yrStr);
        const y = toRate(d as never, yrStr);
        return x !== null && y !== null ? { county: d.County, x, y } : null;
      })
      .filter(Boolean) as { county: string; x: number; y: number }[];
  }, [deathData, providerData, selectedYear]);

  const corrR = useMemo(() => {
    const r = pearsonR(corrScatter.map(p => p.x), corrScatter.map(p => p.y));
    return r === null ? null : +r.toFixed(3);
  }, [corrScatter]);

  const inverted = providerMetricInverted[corrMetric] ?? false;
  const stateProvVal = useMemo(
    () => toRate(providerData.find(d => d.County === 'ILLINOIS') as never, selectedYear) ?? 0,
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
            Pick a cause of death to see how its rate has moved statewide since {firstYear}, how each county compares to the Illinois average, and which counties are on an improving or worsening trajectory. Scrub the year slider to update all charts at once.
          </p>
        </div>
        <div className="ix">
          <label className="field">
            <span className="field-label">Cause of death</span>
            <select className="sel" style={{ width: 260 }}
              value={selectedCause}
              onChange={e => setShared({ ...shared, selectedCause: e.target.value })}>
              <option value="">Select a cause</option>
              {causes.map(c => <option key={c} value={c}>{causeLabels[c]}</option>)}
            </select>
          </label>
          <YearScrub value={selectedYear} shared={shared} onChange={v => setShared({ ...shared, selectedYear: v })} />
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
              <div className="stat-value num" style={{ color: D_HIGH }}>{highest ? highest.rate.toFixed(1) : 'n/a'}</div>
              <div className="stat-meta"><span>{highest?.county ?? 'n/a'} · {selectedYear}</span></div>
            </div>
            <div className="stat fade-in fade-in-2">
              <div className="stat-label">Lowest county rate</div>
              <div className="stat-value num" style={{ color: D_LOW }}>{lowest ? lowest.rate.toFixed(1) : 'n/a'}</div>
              <div className="stat-meta"><span>{lowest?.county ?? 'n/a'} · {selectedYear}</span></div>
            </div>
            <div className="stat fade-in fade-in-3">
              <div className="stat-label">State trend {stateTrend ? `${stateTrend.fromYear}–${stateTrend.toYear}` : ''}</div>
              <div className="stat-value num" style={{ color: stateTrend ? (stateTrend.pct < 0 ? D_LOW : D_HIGH) : 'var(--ink-4)' }}>
                {stateTrend ? `${stateTrend.pct > 0 ? '+' : ''}${stateTrend.pct.toFixed(1)}%` : 'n/a'}
              </div>
              <div className="stat-meta"><span>{stateTrend ? `${stateTrend.from.toFixed(1)} → ${stateTrend.to.toFixed(1)} /100k` : ''}</span></div>
            </div>
            <div className="stat fade-in fade-in-4">
              <div className="stat-label">Counties above state avg</div>
              <div className="stat-value num">{aboveAvg ?? 'n/a'}</div>
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
                  <div className="h3">Crude death rate, {firstYear} – {latestYear ?? lastYear}</div>
                </div>
                <span className="caption" style={{ color: 'var(--ink-4)' }}>Shaded band shows the county minimum and maximum</span>
              </div>
              <div className="panel-body">
                <div style={{ height: 240 }}>
                  <ResponsiveContainer width="100%" height="100%">
                    <LineChart data={trendWithBand} margin={{ top: 8, right: 16, left: 0, bottom: 0 }}>
                      <CartesianGrid strokeDasharray="3 3" stroke={RULE} />
                      <XAxis dataKey="year" tick={{ fontSize: 10, fontFamily: "'IBM Plex Mono',monospace", fill: INK_4 }} />
                      <YAxis tick={{ fontSize: 10, fill: INK_4 }} label={{ value: 'per 100k', angle: -90, position: 'insideLeft', fontSize: 10, fill: INK_4, dx: -4 }} />
                      <Tooltip contentStyle={TIP_STYLE}
                        formatter={(v: unknown, name: unknown) => [`${Number(v).toFixed(1)} per 100k`, String(name)]} />
                      <Line type="monotone" dataKey="high" stroke={RULE} strokeWidth={1} dot={false} name="County max" />
                      <Line type="monotone" dataKey="low" stroke={RULE} strokeWidth={1} dot={false} name="County min" />
                      <Line type="monotone" dataKey="rate" stroke={HUE} strokeWidth={2}
                        dot={{ r: 3, fill: HUE }} activeDot={{ r: 5, fill: HUE }} connectNulls={false} name="IL avg" />
                    </LineChart>
                  </ResponsiveContainer>
                </div>
                {stateTrend && crossesPopulationSeam(stateTrend.fromYear, Number(stateTrend.toYear)) && (
                  <p className="caption" style={{ marginTop: 8 }}>{meta.population_note}</p>
                )}
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
                    {continuousProviderMetrics.map(m => <option key={m} value={m}>{providerMetricLabels[m]}</option>)}
                  </select>
                  {corrR !== null ? (
                    <span className="num" style={{ fontSize: 12, color: Math.abs(corrR) > 0.4 ? (corrR < 0 ? D_LOW : D_HIGH) : D_MID, whiteSpace: 'nowrap' }}>
                      r = {corrR > 0 ? '+' : ''}{corrR.toFixed(3)}
                    </span>
                  ) : (
                    <span className="num" style={{ fontSize: 12, color: INK_4, whiteSpace: 'nowrap' }}>r = n/a</span>
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
                  Dashed lines = statewide averages. {corrR !== null ? `r = ${corrR.toFixed(3)} (${corrScatter.length} counties).` : 'r = n/a.'} {imputedNote(meta.provider_metrics, corrMetric, selectedYear) && `Provider values: ${imputedNote(meta.provider_metrics, corrMetric, selectedYear)}. `}Visit the Access × Mortality tab for full regression analysis.
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
                        <span className="num" style={{ color: count > 0 ? INK : 'var(--ink-4)', fontSize: 13, textAlign: 'right' }}>{count}</span>
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
                    Excess deaths = (county rate − state rate) × that year’s county population / 100,000. Source: US Census population estimates.
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
                    <div className="h3">Largest decreases {firstYear}–{lastYear}</div>
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
                    <div className="h3">Largest increases {firstYear}–{lastYear}</div>
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
            {/* The COVID-era panel below carries this caveat when it renders. */}
            {covidImpact.length === 0 && trajectory.improved.length > 0 && crossesPopulationSeam(firstYear, lastYear) && (
              <p className="caption">{meta.population_note}</p>
            )}

            {/* COVID-era impact */}
            {covidImpact.length > 0 && (
              <div className="panel">
                <div className="panel-head">
                  <div className="titles">
                    <div className="eyebrow">COVID-era impact</div>
                    <div className="h3">Rate shift, {COVID_BASE_YEAR} to {lastYear}</div>
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
                          formatter={(v: unknown, _: unknown, props: { payload?: { pct?: number | null } }) => {
                            const pct = props.payload?.pct ?? null;
                            const pctText = pct === null ? '' : ` (${pct > 0 ? '+' : ''}${pct.toFixed(1)}%)`;
                            return [`${Number(v) > 0 ? '+' : ''}${Number(v).toFixed(1)} /100k${pctText}`, 'Rate change'];
                          }} />
                        <Bar dataKey="change" radius={[2, 2, 0, 0]}>
                          {covidImpact.map((d, i) => <Cell key={i} fill={d.change > 0 ? D_HIGH : D_LOW} />)}
                        </Bar>
                      </BarChart>
                    </ResponsiveContainer>
                  </div>
                  <p className="caption" style={{ marginTop: 8 }}>{meta.population_note}</p>
                </div>
              </div>
            )}

            {/* Methodology footer */}
            <div style={{ paddingTop: 24, borderTop: `1px solid ${RULE}`, display: 'grid', gridTemplateColumns: '1fr 1fr 1fr', gap: 32 }}>
              <div>
                <div className="eyebrow" style={{ marginBottom: 8 }}>Methodology</div>
                <p className="caption">Crude rates: deaths divided by county population, per 100,000. Not age-adjusted, so counties with older populations read higher. Blank cells are causes IDPH did not publish that year, not suppressed small counts.</p>
              </div>
              <div>
                <div className="eyebrow" style={{ marginBottom: 8 }}>Coverage</div>
                <p className="caption">102 counties · {lastYear - firstYear + 1} years · {causes.length} cause categories.</p>
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
