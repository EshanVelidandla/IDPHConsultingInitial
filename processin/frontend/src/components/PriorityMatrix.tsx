import { useState, useEffect, useMemo } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  ScatterChart, Scatter, XAxis, YAxis, CartesianGrid, Tooltip,
  ResponsiveContainer, ReferenceLine, Cell,
} from 'recharts';
import axios from 'axios';
import { causeLabels, causes, EXCLUDED_COUNTIES, API_BASE, calcSlope, providerMetricLabels, providerMetrics, providerMetricInverted } from '../data/constants';
import type { SharedState } from '../App';

interface DeathRate   { County: string; [key: string]: number | string; }
interface ProviderRow { County: string; [year: string]: number | string; }
interface CountyPoint { county: string; x: number; y: number; rate: number; stateRate: number; provRatio: number; }

interface ViewProps { shared: SharedState; setShared: (s: SharedState) => void; }

const D_HIGH = '#B23A2E';
const D_MID = '#C68B3C';
const D_LOW = '#4F7A4D';
const INK = '#1C1B18';
const INK_3 = '#6B675F';
const INK_4 = '#9A968C';
const RULE = '#E6E3DC';
const ACCENT = '#1F5C5A';

function dotColor(x: number, y: number): string {
  if (x > 1.0 && y > 0) return D_HIGH;
  if (x <= 1.0 && y > 0) return D_MID;
  if (x > 1.0 && y <= 0) return ACCENT;
  return D_LOW;
}

const CustomDot = (props: { cx?: number; cy?: number; payload?: CountyPoint; hasProvider?: boolean }) => {
  const { cx = 0, cy = 0, payload, hasProvider } = props;
  if (!payload) return null;
  const color = dotColor(payload.x, payload.y);
  // When provider metric active: larger dot = less access (inverted ratio)
  const r = hasProvider && payload.provRatio > 0
    ? Math.max(3, Math.min(14, 8 / payload.provRatio))
    : 5;
  return (
    <circle cx={cx} cy={cy} r={r}
      fill={color} fillOpacity={0.75}
      stroke="#FFFFFF" strokeWidth={1.2}
      style={{ cursor: 'pointer' }} />
  );
};

const CustomTooltip = ({ active, payload, selectedYear, providerMetric }: { active?: boolean; payload?: { payload: CountyPoint }[]; selectedYear: number; providerMetric?: string }) => {
  if (!active || !payload?.length) return null;
  const d = payload[0].payload;
  const pct = ((d.x - 1) * 100).toFixed(1);
  const color = dotColor(d.x, d.y);
  return (
    <div style={{
      background: '#FFFFFF',
      border: `1px solid ${RULE}`,
      padding: '12px 14px',
      minWidth: 200,
      fontFamily: "'IBM Plex Mono',monospace",
      fontSize: 11,
      borderTop: `3px solid ${color}`,
      boxShadow: '0 4px 16px rgba(0,0,0,0.1)',
    }}>
      <div style={{ fontSize: 13, fontWeight: 500, color: INK, marginBottom: 8, fontFamily: "'Inter Tight',sans-serif" }}>
        {d.county} County
      </div>
      <div style={{ display: 'flex', justifyContent: 'space-between', gap: 16, marginBottom: 4 }}>
        <span style={{ color: INK_3 }}>Rate vs state ({selectedYear})</span>
        <span style={{ color: Number(pct) > 0 ? D_HIGH : D_LOW }}>{Number(pct) > 0 ? '+' : ''}{pct}%</span>
      </div>
      <div style={{ display: 'flex', justifyContent: 'space-between', gap: 16, marginBottom: 4 }}>
        <span style={{ color: INK_3 }}>Slope (2009–{selectedYear})</span>
        <span style={{ color: d.y > 0 ? D_HIGH : D_LOW }}>{d.y > 0 ? '+' : ''}{d.y.toFixed(2)}/yr</span>
      </div>
      <div style={{ display: 'flex', justifyContent: 'space-between', gap: 16, paddingTop: 6, borderTop: `1px solid ${RULE}` }}>
        <span style={{ color: INK_3 }}>Rate ({selectedYear})</span>
        <span style={{ color: INK }}>{d.rate.toFixed(1)} /100k</span>
      </div>
      {providerMetric && d.provRatio > 0 && (
        <div style={{ display: 'flex', justifyContent: 'space-between', gap: 16, marginTop: 4 }}>
          <span style={{ color: INK_3 }}>Access (vs state)</span>
          <span style={{ color: d.provRatio < 0.8 ? D_HIGH : d.provRatio > 1.2 ? D_LOW : INK }}>
            {d.provRatio > 0 ? `${((d.provRatio - 1) * 100) > 0 ? '+' : ''}${((d.provRatio - 1) * 100).toFixed(0)}%` : '—'}
          </span>
        </div>
      )}
      <div style={{ marginTop: 8, color: INK_4, fontSize: 10, letterSpacing: '0.06em', textTransform: 'uppercase' }}>
        Click to drill in →
      </div>
    </div>
  );
};

const PriorityMatrix = ({ shared, setShared }: ViewProps) => {
  const navigate = useNavigate();
  const { selectedCause, selectedYear } = shared;
  const [deathData, setDeathData] = useState<DeathRate[]>([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [providerMetric, setProviderMetric] = useState('');
  const [providerData, setProviderData] = useState<ProviderRow[]>([]);

  const cause = selectedCause || 'Diseases_of_Heart';

  useEffect(() => {
    setLoading(true);
    axios.get(`${API_BASE}/death_rates?cause=${cause}`)
      .then(r => { setDeathData(r.data); setError(null); })
      .catch(() => setError('Failed to load data.'))
      .finally(() => setLoading(false));
  }, [cause]);

  useEffect(() => {
    if (!providerMetric) { setProviderData([]); return; }
    axios.get(`${API_BASE}/provider_data?metric=${providerMetric}`)
      .then(r => setProviderData(r.data))
      .catch(() => setProviderData([]));
  }, [providerMetric]);

  const points = useMemo<CountyPoint[]>(() => {
    if (!deathData.length) return [];
    const yrStr = selectedYear.toString();
    const stateRow = deathData.find(d => d.County === 'ILLINOIS');
    if (!stateRow) return [];
    const stateRate = Number(stateRow[yrStr]);
    if (!stateRate) return [];
    const stateProvVal = Number(providerData.find(d => d.County === 'ILLINOIS')?.[yrStr]) || 0;
    const inverted = providerMetricInverted[providerMetric] ?? false;
    return deathData
      .filter(d => !EXCLUDED_COUNTIES.includes(d.County))
      .map(d => {
        const countyRate = Number(d[yrStr]);
        if (!countyRate) return null;
        const slope = calcSlope(d as Record<string, number | string>, 2009, selectedYear);
        const countyProvVal = Number(providerData.find(p => p.County === d.County)?.[yrStr]) || 0;
        // provRatio: >1 = better access, <1 = worse. For inverted metrics flip it.
        const provRatio = stateProvVal > 0 && countyProvVal > 0
          ? (inverted ? stateProvVal / countyProvVal : countyProvVal / stateProvVal)
          : 0;
        return { county: d.County, x: countyRate / stateRate, y: slope, rate: countyRate, stateRate, provRatio };
      })
      .filter(Boolean) as CountyPoint[];
  }, [deathData, selectedYear, providerData, providerMetric]);

  const priorityCount = useMemo(() => points.filter(p => p.x > 1.2 && p.y > 0).length, [points]);

  return (
    <div className="view fade-in" style={{ display: 'flex', flexDirection: 'column', overflow: 'hidden' }}>
      {/* View head */}
      <div className="view-head">
        <div className="titles">
          <div className="eyebrow eyebrow-ink">Priority Matrix</div>
          <h1 className="h-display" style={{ marginTop: 8 }}>Where to intervene first.</h1>
          <p className="body" style={{ marginTop: 12, maxWidth: 540, color: 'var(--ink-3)' }}>
            Each county plotted by its current rate (vs. state average) and its trajectory (slope from 2009). Upper-right quadrant warrants immediate attention.
          </p>
        </div>
        <div className="ix">
          <div className="field">
            <div className="field-label">Cause</div>
            <select className="sel" style={{ width: 260 }}
              value={selectedCause}
              onChange={e => setShared({ ...shared, selectedCause: e.target.value })}>
              <option value="">— Select cause —</option>
              {causes.map(c => <option key={c} value={c}>{causeLabels[c]}</option>)}
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
          <div className="field">
            <div className="field-label">Bubble size</div>
            <select className="sel" style={{ width: 220 }}
              value={providerMetric}
              onChange={e => setProviderMetric(e.target.value)}>
              <option value="">— None —</option>
              {providerMetrics.map(m => <option key={m} value={m}>{providerMetricLabels[m]}</option>)}
            </select>
          </div>
          {priorityCount > 0 && !loading && (
            <div className="chip priority" style={{ alignSelf: 'flex-end', marginBottom: 2 }}>
              {priorityCount} priority {priorityCount === 1 ? 'county' : 'counties'}
            </div>
          )}
        </div>
      </div>

      {error && <div className="error-banner" style={{ margin: '16px 40px' }}>{error}</div>}

      {/* Chart + right rail */}
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 300px', flex: 1, overflow: 'hidden' }}>
        {/* Scatter plot */}
        <div style={{ padding: '32px 40px', position: 'relative', overflow: 'hidden' }}>
          {loading ? (
            <div className="loading-center"><div className="spinner" /><span>Loading…</span></div>
          ) : (
            <>
              {/* Quadrant watermarks */}
              {points.length > 0 && (
                <>
                  <div style={{ position: 'absolute', top: 44, right: 50, opacity: 0.15, pointerEvents: 'none', fontSize: 9, fontFamily: 'var(--mono)', color: D_HIGH, letterSpacing: '0.12em', textTransform: 'uppercase', textAlign: 'right' }}>
                    High · Worsening
                  </div>
                  <div style={{ position: 'absolute', top: 44, left: 58, opacity: 0.15, pointerEvents: 'none', fontSize: 9, fontFamily: 'var(--mono)', color: D_MID, letterSpacing: '0.12em', textTransform: 'uppercase' }}>
                    Low · Worsening
                  </div>
                  <div style={{ position: 'absolute', bottom: 56, right: 50, opacity: 0.15, pointerEvents: 'none', fontSize: 9, fontFamily: 'var(--mono)', color: ACCENT, letterSpacing: '0.12em', textTransform: 'uppercase', textAlign: 'right' }}>
                    High · Improving
                  </div>
                  <div style={{ position: 'absolute', bottom: 56, left: 58, opacity: 0.15, pointerEvents: 'none', fontSize: 9, fontFamily: 'var(--mono)', color: D_LOW, letterSpacing: '0.12em', textTransform: 'uppercase' }}>
                    Low · Improving
                  </div>
                </>
              )}
              <ResponsiveContainer width="100%" height="100%">
                <ScatterChart margin={{ top: 20, right: 32, bottom: 48, left: 48 }}>
                  <CartesianGrid strokeDasharray="3 3" stroke={RULE} />
                  <XAxis type="number" dataKey="x" name="Rate ratio" domain={['auto', 'auto']}
                    tickFormatter={v => `${((v - 1) * 100).toFixed(0)}%`}
                    label={{ value: `Rate vs. state average (${selectedYear})`, position: 'insideBottom', offset: -28, fontSize: 11, fill: INK_4 }}
                    tick={{ fontSize: 10, fontFamily: "'IBM Plex Mono',monospace", fill: INK_4 }} />
                  <YAxis type="number" dataKey="y" name="Annual slope"
                    tickFormatter={v => `${v > 0 ? '+' : ''}${Number(v).toFixed(1)}`}
                    label={{ value: `Annual rate change 2009–${selectedYear} (/100k/yr)`, angle: -90, position: 'insideLeft', offset: 8, fontSize: 11, fill: INK_4 }}
                    tick={{ fontSize: 10, fontFamily: "'IBM Plex Mono',monospace", fill: INK_4 }} />
                  <ReferenceLine x={1} stroke={INK_4} strokeDasharray="6 4" strokeWidth={1} />
                  <ReferenceLine y={0} stroke={INK_4} strokeDasharray="6 4" strokeWidth={1} />
                  <Tooltip content={<CustomTooltip selectedYear={selectedYear} providerMetric={providerMetric} />} cursor={{ fill: 'transparent' }} />
                  <Scatter data={points} shape={<CustomDot hasProvider={!!providerMetric} />}
                    onClick={(d: unknown) => navigate(`/county/${encodeURIComponent((d as CountyPoint).county)}`)}>
                    {points.map((p, i) => <Cell key={i} fill={dotColor(p.x, p.y)} />)}
                  </Scatter>
                </ScatterChart>
              </ResponsiveContainer>
            </>
          )}
        </div>

        {/* Right rail */}
        <div style={{ borderLeft: `1px solid ${RULE}`, padding: '32px 24px', display: 'flex', flexDirection: 'column', gap: 28, overflowY: 'auto' }}>
          <div>
            <div className="eyebrow" style={{ marginBottom: 8 }}>How to read</div>
            <p className="caption">
              Each dot is a county. X-axis: current rate ÷ state rate (right = above average). Y-axis: long-term slope; positive = worsening.
            </p>
          </div>

          <div>
            <div className="eyebrow" style={{ marginBottom: 10 }}>Quadrants</div>
            <div style={{ display: 'flex', flexDirection: 'column', gap: 0 }}>
              {[
                { color: D_HIGH, label: 'Priority', desc: 'High & worsening — intervene now' },
                { color: D_MID, label: 'Watch', desc: 'Below average but trending up' },
                { color: ACCENT, label: 'Recovering', desc: 'Above average but improving' },
                { color: D_LOW, label: 'Stable', desc: 'Below average and improving' },
              ].map(({ color, label, desc }, i) => (
                <div key={label} style={{ display: 'grid', gridTemplateColumns: '10px 1fr', gap: 12, padding: '10px 0', borderTop: i === 0 ? 'none' : `1px solid ${RULE}` }}>
                  <span style={{ width: 8, height: 8, background: color, borderRadius: '50%', marginTop: 5, flexShrink: 0 }} />
                  <div>
                    <div style={{ color: INK, fontSize: 13 }}>{label}</div>
                    <div className="caption" style={{ marginTop: 2 }}>{desc}</div>
                  </div>
                </div>
              ))}
            </div>
          </div>

          {priorityCount > 0 && points.length > 0 && (
            <div>
              <div className="eyebrow" style={{ marginBottom: 10 }}>
                Priority counties
                <span className="chip priority" style={{ marginLeft: 8 }}>{priorityCount}</span>
              </div>
              <div style={{ display: 'flex', flexDirection: 'column', gap: 0 }}>
                {points
                  .filter(p => p.x > 1.2 && p.y > 0)
                  .sort((a, b) => b.x - a.x)
                  .slice(0, 8)
                  .map((p, i) => (
                    <div key={p.county} style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', padding: '7px 0', borderTop: i === 0 ? 'none' : `1px solid ${RULE}`, cursor: 'pointer' }}
                      onClick={() => navigate(`/county/${encodeURIComponent(p.county)}`)}>
                      <span style={{ fontSize: 12.5, color: INK }}>{p.county}</span>
                      <span className="num" style={{ fontSize: 10.5, color: D_HIGH }}>+{((p.x - 1) * 100).toFixed(0)}%</span>
                    </div>
                  ))}
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

export default PriorityMatrix;
