import { useState, useEffect, useMemo } from 'react';
import {
  Scatter, XAxis, YAxis, CartesianGrid, Tooltip,
  ResponsiveContainer, ReferenceLine, Cell, LineChart, Line,
  ComposedChart,
} from 'recharts';
import axios from 'axios';
import {
  causeLabels, causes, providerMetricLabels, providerMetrics,
  EXCLUDED_COUNTIES, API_BASE, providerMetricInverted,
} from '../data/constants';
import type { SharedState } from '../App';

interface DeathRow   { County: string; [year: string]: number | string; }
interface ProviderRow { County: string; [year: string]: number | string; }
interface ViewProps   { shared: SharedState; setShared: (s: SharedState) => void; }

const D_HIGH  = '#B23A2E';
const D_MID   = '#C68B3C';
const D_LOW   = '#4F7A4D';
const INK     = '#1C1B18';
const INK_3   = '#6B675F';
const INK_4   = '#9A968C';
const RULE    = '#E6E3DC';
const ACCENT  = '#1F5C5A';

const TIP_STYLE = {
  fontSize: 11, fontFamily: "'IBM Plex Mono', monospace",
  border: 'none', boxShadow: '0 4px 16px rgba(0,0,0,0.1)',
  borderRadius: 0, background: '#FFFFFF',
};

// ── Statistics helpers ──────────────────────────────────────────────────────

function pearsonR(xs: number[], ys: number[]): number {
  const n = xs.length;
  if (n < 3) return 0;
  const sx  = xs.reduce((s, x) => s + x, 0);
  const sy  = ys.reduce((s, y) => s + y, 0);
  const sxy = xs.reduce((s, x, i) => s + x * ys[i], 0);
  const sx2 = xs.reduce((s, x) => s + x * x, 0);
  const sy2 = ys.reduce((s, y) => s + y * y, 0);
  const num = n * sxy - sx * sy;
  const den = Math.sqrt((n * sx2 - sx * sx) * (n * sy2 - sy * sy));
  return den === 0 ? 0 : num / den;
}

function linReg(xs: number[], ys: number[]): { slope: number; intercept: number } {
  const n  = xs.length;
  const sx  = xs.reduce((s, x) => s + x, 0);
  const sy  = ys.reduce((s, y) => s + y, 0);
  const sxy = xs.reduce((s, x, i) => s + x * ys[i], 0);
  const sx2 = xs.reduce((s, x) => s + x * x, 0);
  const slope     = (n * sxy - sx * sy) / (n * sx2 - sx * sx);
  const intercept = (sy - slope * sx) / n;
  return { slope: isFinite(slope) ? slope : 0, intercept: isFinite(intercept) ? intercept : 0 };
}

function pValue(r: number, n: number): string {
  if (n < 4) return 'n/a';
  const t = Math.abs(r) * Math.sqrt(n - 2) / Math.sqrt(1 - r * r);
  if (t > 3.5) return '< 0.001';
  if (t > 2.9) return '< 0.01';
  if (t > 2.0) return '< 0.05';
  return '> 0.05';
}

// ── Scatter dot ─────────────────────────────────────────────────────────────

interface ScatterPoint { county: string; x: number; y: number; hpsa: number; }

function dotColor(hpsa: number, y: number, stateY: number): string {
  const aboveAvg = y > stateY;
  if (hpsa > 0 && aboveAvg) return D_HIGH;
  if (hpsa > 0 && !aboveAvg) return D_MID;
  if (!aboveAvg) return D_LOW;
  return ACCENT;
}

const CustomDot = (props: { cx?: number; cy?: number; payload?: ScatterPoint; stateY?: number }) => {
  const { cx = 0, cy = 0, payload, stateY = 0 } = props;
  if (!payload) return null;
  return (
    <circle cx={cx} cy={cy} r={5}
      fill={dotColor(payload.hpsa, payload.y, stateY)}
      fillOpacity={0.85} stroke="#FFF" strokeWidth={1.2}
      style={{ cursor: 'default' }} />
  );
};

const ScatterTip = ({ active, payload, metricLabel }: { active?: boolean; payload?: { payload: ScatterPoint }[]; metricLabel: string }) => {
  if (!active || !payload?.length) return null;
  const d = payload[0].payload;
  return (
    <div style={{ background: '#FFF', border: `1px solid ${RULE}`, padding: '12px 14px', minWidth: 200,
      fontFamily: "'IBM Plex Mono',monospace", fontSize: 11,
      borderTop: `3px solid ${dotColor(d.hpsa, d.y, 0)}`,
      boxShadow: '0 4px 16px rgba(0,0,0,0.1)' }}>
      <div style={{ fontSize: 13, fontWeight: 500, color: INK, marginBottom: 8, fontFamily: "'Inter Tight',sans-serif" }}>
        {d.county} County
      </div>
      <div style={{ display: 'flex', justifyContent: 'space-between', gap: 16, marginBottom: 4 }}>
        <span style={{ color: INK_3 }}>{metricLabel}</span>
        <span style={{ color: INK }}>{d.x.toFixed(1)}</span>
      </div>
      <div style={{ display: 'flex', justifyContent: 'space-between', gap: 16, marginBottom: 4 }}>
        <span style={{ color: INK_3 }}>Mortality /100k</span>
        <span style={{ color: INK }}>{d.y.toFixed(1)}</span>
      </div>
      {d.hpsa > 0 && (
        <div style={{ marginTop: 6, fontSize: 10, color: D_HIGH, textTransform: 'uppercase', letterSpacing: '0.06em' }}>
          ● HPSA designated
        </div>
      )}
    </div>
  );
};

// ── Component ────────────────────────────────────────────────────────────────

const AccessMortalityView = ({ shared, setShared }: ViewProps) => {
  const { selectedYear } = shared;
  const [cause,  setCause]  = useState('Diseases_of_Heart');
  const [metric, setMetric] = useState('primary_care_physicians_per_100k');
  const [mortalityData, setMortalityData] = useState<DeathRow[]>([]);
  const [providerData,  setProviderData]  = useState<ProviderRow[]>([]);
  const [hpsaData,      setHpsaData]      = useState<ProviderRow[]>([]);
  const [allMortality,  setAllMortality]  = useState<Record<string, DeathRow[]>>({});
  const [loading, setLoading] = useState(false);

  // Fetch mortality + provider on cause/metric change
  useEffect(() => {
    setLoading(true);
    Promise.all([
      axios.get(`${API_BASE}/death_rates?cause=${cause}`),
      axios.get(`${API_BASE}/provider_data?metric=${metric}`),
      axios.get(`${API_BASE}/provider_data?metric=hpsa_primary_care_designation`),
    ]).then(([mr, pr, hr]) => {
      setMortalityData(mr.data);
      setProviderData(pr.data);
      setHpsaData(hr.data);
    }).catch(() => {})
      .finally(() => setLoading(false));
  }, [cause, metric]);

  // Fetch all causes for correlation matrix (lazy — only on tab mount)
  useEffect(() => {
    Promise.all(
      causes.map(c => axios.get(`${API_BASE}/death_rates?cause=${c}`).then(r => ({ c, data: r.data as DeathRow[] })))
    ).then(results => {
      const m: Record<string, DeathRow[]> = {};
      results.forEach(({ c, data }) => { m[c] = data; });
      setAllMortality(m);
    }).catch(() => {});
  }, []);

  const yearStr  = selectedYear.toString();
  const inverted = providerMetricInverted[metric] ?? false;

  const stateDeathRate = useMemo(
    () => Number(mortalityData.find(d => d.County === 'ILLINOIS')?.[yearStr]) || 0,
    [mortalityData, yearStr]
  );

  // Build scatter points for selected year
  const scatterPoints = useMemo<ScatterPoint[]>(() => {
    if (!mortalityData.length || !providerData.length) return [];
    return mortalityData
      .filter(d => !EXCLUDED_COUNTIES.includes(d.County))
      .map(d => {
        const x = Number(providerData.find(p => p.County === d.County)?.[yearStr]) || 0;
        const y = Number(d[yearStr]) || 0;
        const hpsa = Number(hpsaData.find(h => h.County === d.County)?.[yearStr]) || 0;
        if (!x || !y) return null;
        return { county: d.County, x, y, hpsa };
      })
      .filter(Boolean) as ScatterPoint[];
  }, [mortalityData, providerData, hpsaData, yearStr]);

  // Pearson r, r², slope, intercept, p
  const stats = useMemo(() => {
    if (scatterPoints.length < 3) return { r: 0, r2: 0, slope: 0, intercept: 0, p: 'n/a', n: 0 };
    const xs = scatterPoints.map(p => p.x);
    const ys = scatterPoints.map(p => p.y);
    const r = pearsonR(xs, ys);
    const { slope, intercept } = linReg(xs, ys);
    return { r, r2: r * r, slope, intercept, p: pValue(r, xs.length), n: xs.length };
  }, [scatterPoints]);

  // Regression line points spanning x range
  const regressionLine = useMemo(() => {
    if (!scatterPoints.length) return [];
    const xs = scatterPoints.map(p => p.x);
    const xMin = Math.min(...xs), xMax = Math.max(...xs);
    return [
      { x: xMin, y: stats.intercept + stats.slope * xMin },
      { x: xMax, y: stats.intercept + stats.slope * xMax },
    ];
  }, [scatterPoints, stats]);

  // r over time (2009-2022)
  const rOverTime = useMemo(() => {
    if (!mortalityData.length || !providerData.length) return [];
    return Array.from({ length: 14 }, (_, i) => 2009 + i).map(yr => {
      const ys = yr.toString();
      const pts = mortalityData
        .filter(d => !EXCLUDED_COUNTIES.includes(d.County))
        .map(d => {
          const x = Number(providerData.find(p => p.County === d.County)?.[ys]) || 0;
          const y = Number(d[ys]) || 0;
          return x > 0 && y > 0 ? { x, y } : null;
        })
        .filter(Boolean) as { x: number; y: number }[];
      if (pts.length < 3) return { year: ys, r: null };
      const r = pearsonR(pts.map(p => p.x), pts.map(p => p.y));
      return { year: ys, r: +r.toFixed(3) };
    });
  }, [mortalityData, providerData]);

  // Correlation of selected provider metric vs every cause (for selected year)
  const causeCorrelations = useMemo(() => {
    if (!Object.keys(allMortality).length || !providerData.length) return [];
    return causes.map(c => {
      const rows = (allMortality[c] ?? []).filter(d => !EXCLUDED_COUNTIES.includes(d.County));
      const pairs = rows.map(d => {
        const x = Number(providerData.find(p => p.County === d.County)?.[yearStr]) || 0;
        const y = Number(d[yearStr]) || 0;
        return x > 0 && y > 0 ? { x, y } : null;
      }).filter(Boolean) as { x: number; y: number }[];
      if (pairs.length < 3) return { cause: c, r: 0, label: causeLabels[c] };
      const r = pearsonR(pairs.map(p => p.x), pairs.map(p => p.y));
      return { cause: c, r: +r.toFixed(3), label: causeLabels[c] };
    }).sort((a, b) => Math.abs(b.r) - Math.abs(a.r));
  }, [allMortality, providerData, yearStr]);

  // Quadrant county table: 4 groups by (above/below state avg) × (above/below state provider)
  const stateProvVal = useMemo(
    () => Number(providerData.find(d => d.County === 'ILLINOIS')?.[yearStr]) || 0,
    [providerData, yearStr]
  );

  const quadrants = useMemo(() => {
    const q = { pp: [] as string[], pn: [] as string[], np: [] as string[], nn: [] as string[] };
    scatterPoints.forEach(pt => {
      const aboveMort = pt.y > stateDeathRate;
      const aboveProv = inverted ? pt.x < stateProvVal : pt.x > stateProvVal;
      if (aboveMort && !aboveProv) q.pp.push(pt.county); // high mort, low access
      else if (aboveMort && aboveProv) q.pn.push(pt.county); // high mort, high access
      else if (!aboveMort && !aboveProv) q.np.push(pt.county); // low mort, low access
      else q.nn.push(pt.county); // low mort, high access
    });
    return q;
  }, [scatterPoints, stateDeathRate, stateProvVal, inverted]);

  const rColor = (r: number) => {
    const a = Math.abs(r);
    if (a > 0.6) return r < 0 ? D_LOW : D_HIGH;
    if (a > 0.3) return D_MID;
    return INK_4;
  };

  return (
    <div className="view fade-in" style={{ overflowY: 'auto' }}>
      {/* View head */}
      <div className="view-head">
        <div className="titles">
          <div className="eyebrow eyebrow-ink">Access × Mortality · Correlation analysis</div>
          <h1 className="h-display" style={{ marginTop: 8 }}>Does access predict<br /><span style={{ color: 'var(--ink-3)' }}>mortality?</span></h1>
          <p className="body" style={{ marginTop: 12, maxWidth: 540, color: 'var(--ink-3)' }}>
            Tests whether counties with fewer doctors or hospital beds tend to have higher death rates. Each dot is a county; the trend line shows the strength of that relationship across all 102 counties. Select a cause of death and a provider metric to explore the connection, or switch to the temporal tab to see how both have changed over time.
          </p>
        </div>
        <div className="ix">
          <div className="field">
            <div className="field-label">Cause of death</div>
            <select className="sel" style={{ width: 260 }} value={cause} onChange={e => setCause(e.target.value)}>
              {causes.map(c => <option key={c} value={c}>{causeLabels[c]}</option>)}
            </select>
          </div>
          <div className="field">
            <div className="field-label">Provider metric</div>
            <select className="sel" style={{ width: 280 }} value={metric} onChange={e => setMetric(e.target.value)}>
              {providerMetrics.map(m => <option key={m} value={m}>{providerMetricLabels[m]}</option>)}
            </select>
          </div>
          <div style={{ width: 220 }}>
            <div style={{ display: 'flex', alignItems: 'baseline', justifyContent: 'space-between', marginBottom: 4 }}>
              <span className="eyebrow">Year</span>
              <span className="num" style={{ fontSize: 18, color: 'var(--ink)', fontWeight: 500 }}>{selectedYear}</span>
            </div>
            <input type="range" className="range" min={2009} max={2022} value={selectedYear}
              onChange={e => setShared({ ...shared, selectedYear: Number(e.target.value) })} />
            <div style={{ display: 'flex', justifyContent: 'space-between', marginTop: 4, fontFamily: 'var(--mono)', fontSize: 9.5, color: 'var(--ink-4)' }}>
              {[2009, 2012, 2015, 2018, 2022].map(y => <span key={y}>{y}</span>)}
            </div>
          </div>
        </div>
      </div>

      {loading ? (
        <div className="loading-center"><div className="spinner" /><span>Loading data…</span></div>
      ) : (
        <>
          {/* KPI strip */}
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', borderBottom: '1px solid var(--rule)' }}>
            <div className="stat fade-in fade-in-1">
              <div className="stat-label">Pearson r · {selectedYear}</div>
              <div className="stat-value num" style={{ color: rColor(stats.r) }}>
                {stats.r !== 0 ? stats.r.toFixed(3) : '—'}
              </div>
              <div className="stat-meta">
                <span>{stats.r > 0 ? 'Positive' : stats.r < 0 ? 'Negative' : ''} correlation · {stats.n} counties</span>
              </div>
            </div>
            <div className="stat fade-in fade-in-2">
              <div className="stat-label">R² (variance explained)</div>
              <div className="stat-value num">{stats.r2 > 0 ? `${(stats.r2 * 100).toFixed(1)}%` : '—'}</div>
              <div className="stat-meta"><span>of mortality variance explained by access</span></div>
            </div>
            <div className="stat fade-in fade-in-3">
              <div className="stat-label">Regression slope</div>
              <div className="stat-value num" style={{ color: stats.slope < 0 ? D_LOW : D_HIGH }}>
                {stats.slope !== 0 ? `${stats.slope > 0 ? '+' : ''}${stats.slope.toFixed(2)}` : '—'}
              </div>
              <div className="stat-meta"><span>deaths/100k per unit provider metric</span></div>
            </div>
            <div className="stat fade-in fade-in-4">
              <div className="stat-label">p-value</div>
              <div className="stat-value num" style={{ color: stats.p === '< 0.001' || stats.p === '< 0.01' ? D_LOW : stats.p === '< 0.05' ? D_MID : INK_4 }}>
                {stats.p !== 'n/a' ? stats.p : '—'}
              </div>
              <div className="stat-meta"><span>t-test · df = {stats.n - 2}</span></div>
            </div>
          </div>

          <div style={{ padding: '32px 40px', display: 'flex', flexDirection: 'column', gap: 32 }}>

            {/* Main scatter with regression line */}
            <div className="panel">
              <div className="panel-head">
                <div className="titles">
                  <div className="eyebrow">Correlation scatter · {selectedYear}</div>
                  <div className="h3">{providerMetricLabels[metric]} vs. {causeLabels[cause]}</div>
                </div>
                <div style={{ display: 'flex', gap: 16, alignItems: 'center' }}>
                  {[
                    { color: D_HIGH,  label: 'High mort · low access (HPSA)' },
                    { color: D_MID,   label: 'High mort · ok access (HPSA)' },
                    { color: ACCENT,  label: 'Low mort · low access' },
                    { color: D_LOW,   label: 'Low mort · ok access' },
                  ].map(({ color, label }) => (
                    <span key={label} style={{ display: 'flex', alignItems: 'center', gap: 5, fontSize: 10, fontFamily: 'var(--mono)', color: INK_3 }}>
                      <span style={{ width: 8, height: 8, borderRadius: '50%', background: color, flexShrink: 0 }} />
                      {label}
                    </span>
                  ))}
                </div>
              </div>
              <div className="panel-body">
                <div style={{ height: 360 }}>
                  <ResponsiveContainer width="100%" height="100%">
                    <ComposedChart margin={{ top: 16, right: 32, bottom: 48, left: 48 }}>
                      <CartesianGrid strokeDasharray="3 3" stroke={RULE} />
                      <XAxis type="number" dataKey="x" name={providerMetricLabels[metric]}
                        domain={['auto', 'auto']}
                        label={{ value: providerMetricLabels[metric], position: 'insideBottom', offset: -30, fontSize: 11, fill: INK_4 }}
                        tick={{ fontSize: 10, fontFamily: "'IBM Plex Mono',monospace", fill: INK_4 }} />
                      <YAxis type="number" dataKey="y" name="Death rate /100k"
                        label={{ value: `${causeLabels[cause]} /100k`, angle: -90, position: 'insideLeft', offset: 8, fontSize: 10, fill: INK_4 }}
                        tick={{ fontSize: 10, fontFamily: "'IBM Plex Mono',monospace", fill: INK_4 }} />
                      {stateDeathRate > 0 && (
                        <ReferenceLine y={stateDeathRate} stroke={INK_4} strokeDasharray="5 3" strokeWidth={1}
                          label={{ value: 'IL avg mortality', position: 'right', fontSize: 9, fill: INK_4 }} />
                      )}
                      {stateProvVal > 0 && (
                        <ReferenceLine x={stateProvVal} stroke={INK_4} strokeDasharray="5 3" strokeWidth={1}
                          label={{ value: 'IL avg provider', position: 'top', fontSize: 9, fill: INK_4 }} />
                      )}
                      <Tooltip content={<ScatterTip metricLabel={providerMetricLabels[metric]} />} cursor={{ fill: 'transparent' }} />
                      <Scatter data={scatterPoints} shape={<CustomDot stateY={stateDeathRate} />}>
                        {scatterPoints.map((p, i) => <Cell key={i} fill={dotColor(p.hpsa, p.y, stateDeathRate)} />)}
                      </Scatter>
                      {/* Regression line as scatter */}
                      {regressionLine.length === 2 && (
                        <Line
                          data={regressionLine} dataKey="y" type="linear"
                          stroke={INK} strokeWidth={1.5} strokeDasharray="6 3"
                          dot={false} legendType="none" />
                      )}
                    </ComposedChart>
                  </ResponsiveContainer>
                </div>
                <p className="tiny" style={{ marginTop: 8 }}>
                  Dashed line: OLS regression. r = {stats.r.toFixed(3)}, p {stats.p}. Each dot = one county.
                  {inverted ? ' Note: for HPSA, higher value = greater shortage.' : ''}
                </p>
              </div>
            </div>

            {/* r over time + cause correlations */}
            <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 32 }}>
              <div className="panel">
                <div className="panel-head">
                  <div className="titles">
                    <div className="eyebrow">Correlation over time</div>
                    <div className="h3">Pearson r · 2009–2022</div>
                  </div>
                </div>
                <div className="panel-body">
                  <div style={{ height: 220 }}>
                    <ResponsiveContainer width="100%" height="100%">
                      <LineChart data={rOverTime} margin={{ top: 8, right: 16, left: 0, bottom: 0 }}>
                        <CartesianGrid strokeDasharray="3 3" stroke={RULE} />
                        <XAxis dataKey="year" tick={{ fontSize: 10, fontFamily: "'IBM Plex Mono',monospace", fill: INK_4 }} interval={2} />
                        <YAxis domain={[-1, 1]} tick={{ fontSize: 10, fill: INK_4 }}
                          tickFormatter={v => v.toFixed(1)}
                          label={{ value: 'r', angle: -90, position: 'insideLeft', fontSize: 11, fill: INK_4, dx: 4 }} />
                        <Tooltip contentStyle={TIP_STYLE}
                          formatter={(v: unknown) => [Number(v).toFixed(3), 'Pearson r']} />
                        <ReferenceLine y={0} stroke={INK_4} strokeWidth={1} />
                        <ReferenceLine y={0.3} stroke={RULE} strokeDasharray="3 3" strokeWidth={1} />
                        <ReferenceLine y={-0.3} stroke={RULE} strokeDasharray="3 3" strokeWidth={1} />
                        <Line type="monotone" dataKey="r" stroke={ACCENT} strokeWidth={2}
                          dot={(p) => {
                            if (!p || p.cx == null) return <g />;
                            const r = p.payload?.r ?? 0;
                            return <circle key={p.key} cx={p.cx} cy={p.cy} r={3} fill={rColor(r)} stroke="none" />;
                          }}
                          connectNulls={false} />
                      </LineChart>
                    </ResponsiveContainer>
                  </div>
                  <p className="tiny" style={{ marginTop: 8 }}>
                    Dashed reference lines at r = ±0.3 (moderate correlation threshold).
                  </p>
                </div>
              </div>

              <div className="panel">
                <div className="panel-head">
                  <div className="titles">
                    <div className="eyebrow">Correlation by cause · {selectedYear}</div>
                    <div className="h3">r: {providerMetricLabels[metric]} vs each cause</div>
                  </div>
                </div>
                <div className="panel-body" style={{ overflowY: 'auto', maxHeight: 280 }}>
                  {causeCorrelations.length === 0 ? (
                    <div className="loading-center"><div className="spinner" /></div>
                  ) : (
                    <div style={{ display: 'flex', flexDirection: 'column', gap: 0 }}>
                      {causeCorrelations.map(({ cause: c, r, label }, i) => {
                        const barW = Math.abs(r) * 100;
                        const barColor = rColor(r);
                        return (
                          <div key={c} style={{ display: 'grid', gridTemplateColumns: '140px 1fr 44px', alignItems: 'center',
                            padding: '8px 0', borderTop: i === 0 ? 'none' : `1px solid ${RULE}`, gap: 10 }}>
                            <span style={{ fontSize: 11, color: c === cause ? INK : INK_3, fontWeight: c === cause ? 600 : 400,
                              overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap' }} title={label}>
                              {label}
                            </span>
                            <div style={{ position: 'relative', height: 8, background: RULE, overflow: 'hidden' }}>
                              <div style={{
                                position: 'absolute',
                                left: r < 0 ? `${50 - barW / 2}%` : '50%',
                                width: `${barW / 2}%`,
                                height: '100%', background: barColor,
                              }} />
                              <div style={{ position: 'absolute', left: '50%', top: 0, bottom: 0, width: 1, background: INK_4 }} />
                            </div>
                            <span className="num" style={{ fontSize: 11, color: barColor, textAlign: 'right' }}>
                              {r > 0 ? '+' : ''}{r.toFixed(2)}
                            </span>
                          </div>
                        );
                      })}
                    </div>
                  )}
                </div>
              </div>
            </div>

            {/* County quadrant breakdown */}
            <div className="panel">
              <div className="panel-head">
                <div className="titles">
                  <div className="eyebrow">County quadrant breakdown · {selectedYear}</div>
                  <div className="h3">Access vs. mortality relative to state average</div>
                </div>
              </div>
              <div className="panel-body">
                <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 0, border: `1px solid ${RULE}` }}>
                  {[
                    { key: 'pp' as const, label: 'High mortality · Low access', color: D_HIGH, desc: 'Priority intervention' },
                    { key: 'pn' as const, label: 'High mortality · High access', color: D_MID,  desc: 'Access not the driver' },
                    { key: 'np' as const, label: 'Low mortality · Low access',  color: ACCENT,  desc: 'Access shortage, resilient' },
                    { key: 'nn' as const, label: 'Low mortality · High access', color: D_LOW,  desc: 'Well-served' },
                  ].map(({ key, label, color, desc }, qi) => (
                    <div key={key} style={{
                      padding: '20px 24px',
                      borderRight: qi % 2 === 0 ? `1px solid ${RULE}` : 'none',
                      borderBottom: qi < 2 ? `1px solid ${RULE}` : 'none',
                    }}>
                      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'baseline', marginBottom: 8 }}>
                        <div>
                          <div style={{ fontSize: 12.5, color: INK, fontWeight: 500 }}>{label}</div>
                          <div style={{ fontSize: 10, color: INK_4, marginTop: 2, fontFamily: 'var(--mono)', textTransform: 'uppercase', letterSpacing: '0.06em' }}>{desc}</div>
                        </div>
                        <span className="num" style={{ fontSize: 24, color, marginLeft: 16 }}>{quadrants[key].length}</span>
                      </div>
                      <div style={{ display: 'flex', flexWrap: 'wrap', gap: 4, marginTop: 8 }}>
                        {quadrants[key].slice(0, 12).map(county => (
                          <span key={county} style={{ fontSize: 10, padding: '2px 6px', background: `${color}18`, color, fontFamily: 'var(--mono)' }}>
                            {county}
                          </span>
                        ))}
                        {quadrants[key].length > 12 && (
                          <span style={{ fontSize: 10, color: INK_4, fontFamily: 'var(--mono)' }}>
                            +{quadrants[key].length - 12} more
                          </span>
                        )}
                      </div>
                    </div>
                  ))}
                </div>
              </div>
            </div>

            {/* Footnote */}
            <div style={{ paddingTop: 24, borderTop: `1px solid ${RULE}`, display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 32 }}>
              <div>
                <div className="eyebrow" style={{ marginBottom: 8 }}>Interpretation</div>
                <p className="caption">A negative r between provider density and mortality rate indicates counties with more providers have lower death rates. Correlation does not imply causation — rural counties may have both fewer providers and higher mortality due to underlying socioeconomic factors.</p>
              </div>
              <div>
                <div className="eyebrow" style={{ marginBottom: 8 }}>Statistical note</div>
                <p className="caption">p-values estimated via two-tailed t-test (df = n−2). R² indicates the proportion of mortality variance explained by the provider metric alone, holding no other variables constant.</p>
              </div>
            </div>
          </div>
        </>
      )}
    </div>
  );
};

export default AccessMortalityView;
