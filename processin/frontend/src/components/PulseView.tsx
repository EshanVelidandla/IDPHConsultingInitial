import { useState, useEffect, useMemo } from 'react';
import { LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer } from 'recharts';
import axios from 'axios';
import { EXCLUDED_COUNTIES, API_BASE } from '../data/constants';
import { IL_GRID } from '../data/ilGrid';
import type { SharedState } from '../App';

interface DeathRate { County: string; [key: string]: number | string; }
interface ViewProps { shared: SharedState; setShared: (s: SharedState) => void; }

const D_HIGH = '#B23A2E';
const D_HIGH_TINT = '#F2E4E1';
const D_MID_TINT = '#F5ECDD';
const D_LOW = '#4F7A4D';
const D_LOW_TINT = '#E4ECDF';
const D_NULL_TINT = '#EFEDE7';
const INK = '#1C1B18';
const INK_4 = '#9A968C';
const RULE = '#E6E3DC';

const EVENTS = [
  { y: 2009, t: 'Baseline year', d: 'Tracking begins. Statewide all-cause rate is the starting reference.' },
  { y: 2014, t: 'ACA full implementation', d: 'Medicaid expansion in IL; uninsured rate drops sharply.' },
  { y: 2019, t: 'Pre-pandemic floor', d: 'All-cause mortality at lowest point in the decade.' },
  { y: 2020, t: 'COVID-19 onset', d: 'Sharpest single-year increase in IL mortality on record.' },
  { y: 2022, t: 'Latest available', d: 'Rate remains elevated above pre-pandemic baseline.' },
];

function tileColor(rate: number, stateRate: number): string {
  if (!rate || !stateRate) return D_NULL_TINT;
  const r = rate / stateRate;
  if (r > 1.2) return D_HIGH_TINT;
  if (r < 0.8) return D_LOW_TINT;
  return D_MID_TINT;
}

const TIP_STYLE = {
  fontSize: 11, fontFamily: "'IBM Plex Mono',monospace",
  border: 'none', boxShadow: '0 4px 16px rgba(0,0,0,0.1)',
  borderRadius: 0, background: '#FFFFFF',
};

const PulseView = (_props: ViewProps) => {
  const [year, setYear] = useState(2022);
  const [deathData, setDeathData] = useState<DeathRate[]>([]);
  const [loading, setLoading] = useState(false);

  // Load Total Deaths for the mini-map visualizations
  useEffect(() => {
    setLoading(true);
    axios.get(`${API_BASE}/death_rates?cause=Total_Deaths`)
      .then(r => setDeathData(r.data))
      .catch(() => {})
      .finally(() => setLoading(false));
  }, []);

  const statewideTrend = useMemo(() => {
    const row = deathData.find(d => d.County === 'ILLINOIS');
    if (!row) return [];
    return Object.entries(row)
      .filter(([k]) => k !== 'County' && k !== '2008')
      .map(([yr, val]) => ({ year: Number(yr), rate: Number(val) > 0 ? Number(val) : null }))
      .sort((a, b) => a.year - b.year);
  }, [deathData]);

  const stateRate = useMemo(() => {
    const row = deathData.find(d => d.County === 'ILLINOIS');
    return Number(row?.[year.toString()]) || 0;
  }, [deathData, year]);

  const rateMap = useMemo<Record<string, number>>(() => {
    const m: Record<string, number> = {};
    deathData.forEach(d => {
      if (!EXCLUDED_COUNTIES.includes(d.County)) {
        m[d.County] = Number(d[year.toString()]) || 0;
      }
    });
    return m;
  }, [deathData, year]);

  const aboveAvg = useMemo(() => {
    if (!stateRate) return null;
    return Object.entries(rateMap).filter(([, rate]) => rate > stateRate).length;
  }, [rateMap, stateRate]);

  const yearRate = statewideTrend.find(d => d.year === year)?.rate ?? null;
  const prevYearRate = statewideTrend.find(d => d.year === year - 1)?.rate ?? null;
  const deltaYoY = yearRate && prevYearRate ? ((yearRate - prevYearRate) / prevYearRate * 100) : null;

  const activeEvent = EVENTS.find(e => e.y === year) ?? EVENTS[EVENTS.length - 1];

  // Mini-map TILE/STEP constants (smaller for 7-up grid)
  const MINI_TILE = 8;
  const MINI_GAP = 0.5;
  const MINI_STEP = MINI_TILE + MINI_GAP;
  const GRID_ENTRIES = Object.entries(IL_GRID).filter(([n]) => n !== 'Cook_N');
  const MAX_COL = Math.max(...GRID_ENTRIES.map(([, [x]]) => x));
  const MAX_ROW = Math.max(...GRID_ENTRIES.map(([, [, y]]) => y));
  const MINI_W = (MAX_COL + 1.5) * MINI_STEP;
  const MINI_H = (MAX_ROW + 1.5) * MINI_STEP;

  return (
    <div className="view fade-in" style={{ overflowY: 'auto' }}>
      {/* View head */}
      <div className="view-head">
        <div className="titles">
          <div className="eyebrow eyebrow-ink">Pulse · Annotated timeline</div>
          <h1 className="h-display" style={{ marginTop: 8 }}>
            Fourteen years,<br />
            <span style={{ color: 'var(--ink-3)' }}>read year by year.</span>
          </h1>
          <p className="body" style={{ marginTop: 12, maxWidth: 540, color: 'var(--ink-3)' }}>
            A narrative view of Illinois mortality. Scrub through years to see which counties shift, when policies took effect, and how the COVID-era reshaped the map.
          </p>
        </div>
      </div>

      {/* Timeline ribbon */}
      <div style={{ padding: '40px 48px 24px', borderBottom: `1px solid ${RULE}` }}>
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'baseline', marginBottom: 18 }}>
          <span className="eyebrow">Timeline</span>
          <span className="num" style={{ fontSize: 56, fontFamily: 'var(--serif)', color: INK, lineHeight: 1, letterSpacing: '-0.03em' }}>{year}</span>
        </div>

        <div style={{ position: 'relative', paddingTop: 40, paddingBottom: 16 }}>
          {/* baseline */}
          <div style={{ position: 'absolute', left: 0, right: 0, top: '50%', height: 1, background: 'var(--rule-2)' }} />

          {/* event markers */}
          {EVENTS.map((e) => {
            const pct = ((e.y - 2009) / (2022 - 2009)) * 100;
            const isActive = year === e.y;
            const isPast = year >= e.y;
            return (
              <div key={e.y} style={{ position: 'absolute', left: `${pct}%`, top: 0, transform: 'translateX(-50%)', textAlign: 'center' }}>
                <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center' }}>
                  <div style={{ height: 16 }} />
                  <div
                    onClick={() => setYear(e.y)}
                    style={{
                      width: isActive ? 14 : 8, height: isActive ? 14 : 8,
                      background: isPast ? INK : 'var(--card)',
                      border: `1px solid ${isPast ? INK : INK_4}`,
                      borderRadius: '50%',
                      cursor: 'pointer',
                      transition: 'all 0.15s ease',
                    }} />
                  <div style={{ marginTop: 8, fontFamily: 'var(--mono)', fontSize: 10, color: isActive ? INK : INK_4, letterSpacing: '0.06em', whiteSpace: 'nowrap' }}>
                    {e.y}
                  </div>
                </div>
              </div>
            );
          })}

          <input type="range" className="range" min={2009} max={2022} value={year}
            onChange={e => setYear(Number(e.target.value))}
            style={{ position: 'relative', zIndex: 5, marginTop: 4 }} />
        </div>
      </div>

      {/* Active annotation + snapshot */}
      <div style={{ padding: '40px 48px', display: 'grid', gridTemplateColumns: '1fr 1.4fr', gap: 56, alignItems: 'start', borderBottom: `1px solid ${RULE}` }}>
        <div>
          <span className="eyebrow" style={{ marginBottom: 10, display: 'block' }}>What happened</span>
          <div style={{ fontFamily: 'var(--serif)', fontSize: 26, color: INK, letterSpacing: '-0.018em', lineHeight: 1.2, marginBottom: 12 }}>
            {activeEvent.t}
          </div>
          <p className="body" style={{ color: 'var(--ink-2)' }}>{activeEvent.d}</p>
        </div>
        <div>
          <span className="eyebrow" style={{ marginBottom: 12, display: 'block' }}>Snapshot · {year}</span>
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(2, 1fr)', border: `1px solid ${RULE}` }}>
            <div className="stat">
              <div className="stat-label">State rate / 100k</div>
              <div className="stat-value num">{yearRate ? yearRate.toFixed(1) : '—'}</div>
              <div className="stat-meta"><span>All causes</span></div>
            </div>
            <div className="stat">
              <div className="stat-label">Counties above avg</div>
              <div className="stat-value num">{aboveAvg ?? '—'}</div>
              <div className="stat-meta"><span>of 102</span></div>
            </div>
            <div className="stat">
              <div className="stat-label">Δ from prior year</div>
              <div className="stat-value num" style={{ color: deltaYoY != null ? (deltaYoY > 0 ? D_HIGH : D_LOW) : undefined }}>
                {deltaYoY != null ? `${deltaYoY > 0 ? '+' : ''}${deltaYoY.toFixed(1)}%` : '—'}
              </div>
              <div className="stat-meta"><span>Year-over-year change</span></div>
            </div>
            <div className="stat">
              <div className="stat-label">Data source</div>
              <div className="stat-value" style={{ fontSize: 18, fontFamily: 'var(--sans)' }}>IDPH</div>
              <div className="stat-meta"><span>Vital Statistics</span></div>
            </div>
          </div>
        </div>
      </div>

      {/* Statewide trend line */}
      <div style={{ padding: '40px 48px', borderBottom: `1px solid ${RULE}` }}>
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'baseline', marginBottom: 20 }}>
          <div>
            <span className="eyebrow" style={{ display: 'block', marginBottom: 4 }}>Statewide trend</span>
            <div className="h2">All-cause mortality · Illinois 2009–2022</div>
          </div>
        </div>
        <div style={{ height: 200 }}>
          {loading ? (
            <div className="loading-center"><div className="spinner" /></div>
          ) : (
            <ResponsiveContainer width="100%" height="100%">
              <LineChart data={statewideTrend} margin={{ top: 4, right: 16, left: 0, bottom: 0 }}>
                <CartesianGrid strokeDasharray="3 3" stroke={RULE} />
                <XAxis dataKey="year" tick={{ fontSize: 10, fontFamily: "'IBM Plex Mono',monospace", fill: INK_4 }} />
                <YAxis tick={{ fontSize: 10, fill: INK_4 }} />
                <Tooltip contentStyle={TIP_STYLE}
                  formatter={(v: unknown) => [`${Number(v).toFixed(1)} /100k`, 'IL avg']} />
                {/* Year marker */}
                {statewideTrend.map(d => (
                  d.year === year ? (
                    <Line key="marker" data={[d]} type="linear" dataKey="rate"
                      stroke={D_HIGH} strokeWidth={0} dot={{ r: 6, fill: D_HIGH, strokeWidth: 0 }} />
                  ) : null
                ))}
                <Line type="monotone" dataKey="rate" stroke={INK} strokeWidth={2}
                  dot={(p) => {
                    if (!p || p.cx == null || p.cy == null) return <g />;
                    const isSelected = p.payload?.year === year;
                    return <circle key={p.key} cx={p.cx} cy={p.cy} r={isSelected ? 5 : 3}
                      fill={isSelected ? D_HIGH : INK} stroke="none" />;
                  }}
                  connectNulls={false} />
              </LineChart>
            </ResponsiveContainer>
          )}
        </div>
      </div>

      {/* Mini-map small multiples */}
      <div style={{ padding: '40px 48px' }}>
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'baseline', marginBottom: 24 }}>
          <div>
            <span className="eyebrow" style={{ display: 'block', marginBottom: 4 }}>Small multiples</span>
            <div className="h2">The state, year by year</div>
          </div>
          <span className="caption">14 mini-maps · 2009 → 2022 · All-cause mortality</span>
        </div>

        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(7, 1fr)', gap: 16 }}>
          {Array.from({ length: 14 }).map((_, i) => {
            const y = 2009 + i;
            const isActive = y === year;
            const yStateRate = statewideTrend.find(d => d.year === y)?.rate ?? 0;

            return (
              <div key={y} onClick={() => setYear(y)} style={{ cursor: 'pointer' }}>
                <div style={{
                  position: 'relative',
                  border: `1px solid ${isActive ? INK : RULE}`,
                  padding: 4,
                  background: 'var(--paper-2)',
                  transition: 'border-color 0.12s ease',
                }}>
                  <svg viewBox={`0 0 ${MINI_W} ${MINI_H}`} style={{ width: '100%', display: 'block' }}>
                    {Object.entries(IL_GRID).filter(([n]) => n !== 'Cook_N').map(([name, [col, row]]) => {
                      const isCook = name === 'Cook';
                      const rate = rateMap[name] || 0;
                      const fill = yStateRate > 0 ? tileColor(rate, yStateRate) : 'var(--paper-2)';
                      const px = col * MINI_STEP;
                      const py = row * MINI_STEP;
                      const h = isCook ? MINI_TILE * 2 + MINI_GAP : MINI_TILE;
                      return (
                        <rect key={name} x={px} y={py} width={MINI_TILE} height={h}
                          fill={isActive && deathData.length > 0 ? fill : isActive ? '#E6E3DC' : '#EFEDE7'}
                          stroke="#FBFAF7" strokeWidth={0.3} />
                      );
                    })}
                  </svg>
                </div>
                <div style={{ marginTop: 5, display: 'flex', justifyContent: 'space-between', alignItems: 'baseline' }}>
                  <span className="num" style={{ fontSize: 10.5, color: isActive ? INK : INK_4 }}>{y}</span>
                  <span className="num" style={{ fontSize: 9.5, color: INK_4 }}>
                    {yStateRate > 0 ? yStateRate.toFixed(0) : '—'}
                  </span>
                </div>
              </div>
            );
          })}
        </div>
      </div>
    </div>
  );
};

export default PulseView;
