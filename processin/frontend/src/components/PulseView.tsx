import { useState, useEffect, useMemo, useCallback } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip,
  ResponsiveContainer,
} from 'recharts';
import type { TooltipProps } from 'recharts';
import axios from 'axios';
import { causeLabels, causes, EXCLUDED_COUNTIES, API_BASE, IDPH_DISTRICTS, providerMetricLabels, providerMetrics } from '../data/constants';
import { IL_GRID } from '../data/ilGrid';
import type { SharedState } from '../App';

interface DeathRate { County: string; [key: string]: number | string; }
interface ProviderRow { County: string; [year: string]: number | string; }
interface ViewProps { shared: SharedState; setShared: (s: SharedState) => void; }

const D_HIGH = '#B23A2E';
const D_HIGH_TINT = '#F2E4E1';
const D_LOW = '#4F7A4D';
const D_NULL_TINT = '#EFEDE7';
const INK = '#1C1B18';
const INK_4 = '#9A968C';
const RULE = '#E6E3DC';

// Richer (more saturated) tile colors for the selected mini-map
function tileColorRich(rate: number, stateRate: number): string {
  if (!rate || !stateRate) return '#C8C4BC';
  const r = rate / stateRate;
  if (r > 1.2) return '#C84A3E';
  if (r < 0.8) return '#3D7A3B';
  return '#C07820';
}

// Standard tints used when data exists but map is not active (fallback)
function tileColor(rate: number, stateRate: number): string {
  if (!rate || !stateRate) return D_NULL_TINT;
  const r = rate / stateRate;
  if (r > 1.2) return D_HIGH_TINT;
  if (r < 0.8) return '#C8DBB8';
  return '#EBD6B0';
}

const EVENTS: Record<number, { t: string; d: string }> = {
  2009: { t: 'Baseline year', d: 'Tracking begins. Statewide all-cause rate is the starting reference.' },
  2014: { t: 'ACA full implementation', d: 'Medicaid expansion in IL; uninsured rate drops sharply.' },
  2019: { t: 'Pre-pandemic floor', d: 'All-cause mortality at lowest point in the decade.' },
  2020: { t: 'COVID-19 onset', d: 'Sharpest single-year increase in IL mortality on record.' },
  2022: { t: 'Latest available', d: 'Rate remains elevated above pre-pandemic baseline.' },
};

const TIP_STYLE = {
  fontSize: 11, fontFamily: "'IBM Plex Mono',monospace",
  border: 'none', boxShadow: '0 4px 16px rgba(0,0,0,0.1)',
  borderRadius: 0, background: '#FFFFFF',
};

const ALL_YEARS = Array.from({ length: 14 }, (_, i) => 2009 + i);

// Distinct palette for multi-county lines
const MULTI_PALETTE = [
  '#4472C4', '#ED7D31', '#5A9648', '#FFC000', '#7B5EA7',
  '#C84A3E', '#4ECDC4', '#E67E22', '#2980B9', '#8E44AD',
  '#27AE60', '#C0392B', '#16A085', '#D35400', '#2C3E50',
  '#7F8C8D',
];

const PulseView = (_props: ViewProps) => {
  const navigate = useNavigate();
  const [year, setYear] = useState(2022);
  const [deathData, setDeathData] = useState<DeathRate[]>([]);
  const [loading, setLoading] = useState(false);

  // Multi-county chart state
  const [multiCause, setMultiCause] = useState('Total_Deaths');
  const [multiDistrict, setMultiDistrict] = useState('');
  const [multiData, setMultiData] = useState<DeathRate[]>([]);
  const [multiLoading, setMultiLoading] = useState(false);
  const [hoveredCounty, setHoveredCounty] = useState<string | null>(null);
  const [providerMetric, setProviderMetric] = useState('');
  const [providerData, setProviderData] = useState<ProviderRow[]>([]);

  // Load Total Deaths for mini-map and fixed trend chart
  useEffect(() => {
    setLoading(true);
    axios.get(`${API_BASE}/death_rates?cause=Total_Deaths`)
      .then(r => setDeathData(r.data))
      .catch(() => {})
      .finally(() => setLoading(false));
  }, []);

  // Load multi-county cause data on demand
  useEffect(() => {
    setMultiLoading(true);
    axios.get(`${API_BASE}/death_rates?cause=${multiCause}`)
      .then(r => setMultiData(r.data))
      .catch(() => {})
      .finally(() => setMultiLoading(false));
  }, [multiCause]);

  useEffect(() => {
    if (!providerMetric) { setProviderData([]); return; }
    axios.get(`${API_BASE}/provider_data?metric=${providerMetric}`)
      .then(r => setProviderData(r.data))
      .catch(() => setProviderData([]));
  }, [providerMetric]);

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

  const activeEvent = EVENTS[year] ?? EVENTS[2022];

  // Mini-map tile constants
  const MINI_TILE = 8;
  const MINI_GAP = 0.5;
  const MINI_STEP = MINI_TILE + MINI_GAP;
  const GRID_ENTRIES = Object.entries(IL_GRID).filter(([n]) => n !== 'Cook_N');
  const MAX_COL = Math.max(...GRID_ENTRIES.map(([, [x]]) => x));
  const MAX_ROW = Math.max(...GRID_ENTRIES.map(([, [, y]]) => y));
  const MINI_W = (MAX_COL + 1.5) * MINI_STEP;
  const MINI_H = (MAX_ROW + 1.5) * MINI_STEP;

  // Multi-county chart: build county list and time-series data
  const countyLines = useMemo(() => {
    if (!multiData.length) return [];
    const districtCounties = multiDistrict
      ? IDPH_DISTRICTS[Number(multiDistrict)]?.counties ?? []
      : null;
    return multiData
      .filter(d => {
        if (EXCLUDED_COUNTIES.includes(d.County)) return false;
        if (districtCounties && !districtCounties.includes(d.County)) return false;
        return true;
      })
      .map(d => d.County);
  }, [multiData, multiDistrict]);

  const multiChartData = useMemo(() => {
    if (!multiData.length) return [];
    const districtCounties = multiDistrict
      ? IDPH_DISTRICTS[Number(multiDistrict)]?.counties ?? []
      : null;
    const visibleRows = multiData.filter(d => {
      if (EXCLUDED_COUNTIES.includes(d.County)) return false;
      if (districtCounties && !districtCounties.includes(d.County)) return false;
      return true;
    });
    return ALL_YEARS.map(yr => {
      const yrStr = yr.toString();
      const point: Record<string, string | number | null> = { year: yrStr };
      visibleRows.forEach(row => {
        const val = Number(row[yrStr]);
        point[row.County] = val > 0 ? val : null;
        if (providerData.length) {
          const provRow = providerData.find(p => p.County === row.County);
          const pVal = provRow ? Number(provRow[yrStr]) : 0;
          point[`${row.County}__prov`] = pVal > 0 ? pVal : null;
        }
      });
      return point;
    });
  }, [multiData, multiDistrict, providerData]);

  const handleLineEnter = useCallback((county: string) => setHoveredCounty(county), []);
  const handleLineLeave = useCallback(() => setHoveredCounty(null), []);

  // Custom tooltip for multi-county chart
  const MultiCountyTooltip = useCallback((props: TooltipProps<number, string>) => {
    const { active, payload, label } = props;
    if (!active || !payload?.length) return null;
    const mortKey = hoveredCounty ?? payload.find(p => p.name && !String(p.name).endsWith('__prov'))?.name;
    const hovered = mortKey ? payload.find(p => p.name === mortKey) : null;
    if (!hovered || hovered.value == null) return null;
    const provEntry = providerMetric ? payload.find(p => p.name === `${mortKey}__prov`) : null;
    return (
      <div style={{ ...TIP_STYLE, padding: '8px 12px' }}>
        <div style={{ fontWeight: 500, marginBottom: 4, fontSize: 12 }}>{mortKey}</div>
        <div style={{ color: INK_4 }}>{label} · {Number(hovered.value).toFixed(1)} /100k</div>
        {provEntry?.value != null && (
          <div style={{ color: INK_4, marginTop: 2 }}>
            {providerMetricLabels[providerMetric]}: {Number(provEntry.value).toFixed(1)}
          </div>
        )}
        <div style={{ marginTop: 6, fontSize: 9, color: INK_4, textTransform: 'uppercase', letterSpacing: '0.06em' }}>
          Click dot → Scorecard
        </div>
      </div>
    );
  }, [hoveredCounty, providerMetric]);

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
            A year-by-year view of Illinois mortality from 2009 to 2022. Drag the timeline to move through years and see how the county map shifts. Key events — ACA implementation, the pre-pandemic low, COVID onset — are marked as reference points. Use the multi-county chart below to compare specific counties side by side.
          </p>
        </div>
      </div>

      {/* Timeline ribbon — all 14 year dots */}
      <div style={{ padding: '40px 48px 24px', borderBottom: `1px solid ${RULE}` }}>
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'baseline', marginBottom: 18 }}>
          <span className="eyebrow">Timeline</span>
          <span className="num" style={{ fontSize: 56, fontFamily: 'var(--serif)', color: INK, lineHeight: 1, letterSpacing: '-0.03em' }}>{year}</span>
        </div>

        <div style={{ position: 'relative', paddingTop: 44, paddingBottom: 16 }}>
          {/* baseline */}
          <div style={{ position: 'absolute', left: 0, right: 0, top: '50%', height: 1, background: 'var(--rule-2)' }} />

          {/* Dots for all 14 years */}
          {ALL_YEARS.map(y => {
            const pct = ((y - 2009) / (2022 - 2009)) * 100;
            const isActive = year === y;
            const isPast = year >= y;
            const hasAnnotation = y in EVENTS;
            return (
              <div key={y} style={{
                position: 'absolute', left: `${pct}%`, top: 0,
                transform: 'translateX(-50%)', textAlign: 'center',
              }}>
                <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center' }}>
                  {/* Annotation label (only for annotated years) */}
                  <div style={{ height: 18, display: 'flex', alignItems: 'flex-end', justifyContent: 'center' }}>
                    {hasAnnotation && (
                      <span style={{
                        fontFamily: 'var(--mono)', fontSize: 9,
                        color: isActive ? INK : INK_4,
                        whiteSpace: 'nowrap',
                        fontWeight: isActive ? 600 : 400,
                        letterSpacing: '0.04em',
                      }}>
                        {EVENTS[y].t.split(' ')[0]}
                      </span>
                    )}
                  </div>
                  <div style={{ height: 4 }} />
                  <div
                    onClick={() => setYear(y)}
                    style={{
                      width: isActive ? 14 : hasAnnotation ? 9 : 7,
                      height: isActive ? 14 : hasAnnotation ? 9 : 7,
                      background: isPast ? INK : 'var(--card)',
                      border: `1px solid ${isPast ? INK : INK_4}`,
                      borderRadius: '50%',
                      cursor: 'pointer',
                      transition: 'all 0.15s ease',
                    }}
                  />
                  <div style={{
                    marginTop: 6,
                    fontFamily: 'var(--mono)',
                    fontSize: isActive ? 10 : 9,
                    fontWeight: isActive ? 600 : 400,
                    color: isActive ? INK : INK_4,
                    letterSpacing: '0.04em',
                    whiteSpace: 'nowrap',
                  }}>
                    {y}
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

      {/* Fixed all-cause mortality trend (mod #10 — chart does not change with slider) */}
      <div style={{ padding: '40px 48px', borderBottom: `1px solid ${RULE}` }}>
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'baseline', marginBottom: 20 }}>
          <div>
            <span className="eyebrow" style={{ display: 'block', marginBottom: 4 }}>All-cause mortality · fixed reference</span>
            <div className="h2">Total deaths rate · Illinois 2009–2022</div>
          </div>
          <span className="caption" style={{ color: 'var(--ink-4)' }}>Age-adjusted per 100,000</span>
        </div>
        <div style={{ height: 200 }}>
          {loading ? (
            <div className="loading-center"><div className="spinner" /></div>
          ) : (
            <ResponsiveContainer width="100%" height="100%">
              <LineChart data={statewideTrend} margin={{ top: 4, right: 16, left: 0, bottom: 0 }}>
                <CartesianGrid strokeDasharray="3 3" stroke={RULE} />
                <XAxis dataKey="year" tick={{ fontSize: 10, fontFamily: "'IBM Plex Mono',monospace", fill: INK_4 }} />
                <YAxis tick={{ fontSize: 10, fill: INK_4 }}
                  label={{ value: '/100k', angle: -90, position: 'insideLeft', fontSize: 10, fill: INK_4, dx: 4 }} />
                <Tooltip contentStyle={TIP_STYLE}
                  formatter={(v: unknown) => [`${Number(v).toFixed(1)} /100k`, 'IL all-cause']} />
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

      {/* Multi-county cause chart (mods #9 + #12) */}
      <div style={{ padding: '40px 48px', borderBottom: `1px solid ${RULE}` }}>
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-end', marginBottom: 20, flexWrap: 'wrap', gap: 12 }}>
          <div>
            <span className="eyebrow" style={{ display: 'block', marginBottom: 4 }}>County comparison</span>
            <div className="h2">All counties by cause · 2009–2022</div>
          </div>
          <div style={{ display: 'flex', gap: 12, alignItems: 'flex-end', flexWrap: 'wrap' }}>
            <div className="field">
              <div className="field-label">Cause</div>
              <select className="sel" style={{ width: 220 }}
                value={multiCause}
                onChange={e => setMultiCause(e.target.value)}>
                {causes.map(c => <option key={c} value={c}>{causeLabels[c]}</option>)}
              </select>
            </div>
            <div className="field">
              <div className="field-label">District filter</div>
              <select className="sel" style={{ width: 200 }}
                value={multiDistrict}
                onChange={e => setMultiDistrict(e.target.value)}>
                <option value="">All counties</option>
                {Object.entries(IDPH_DISTRICTS).map(([num, { name }]) => (
                  <option key={num} value={num}>D{num} · {name.split(' — ')[1]}</option>
                ))}
              </select>
            </div>
            <div className="field">
              <div className="field-label">Provider overlay</div>
              <select className="sel" style={{ width: 220 }}
                value={providerMetric}
                onChange={e => setProviderMetric(e.target.value)}>
                <option value="">— None —</option>
                {providerMetrics.map(m => <option key={m} value={m}>{providerMetricLabels[m]}</option>)}
              </select>
            </div>
          </div>
        </div>
        <div style={{ height: 320 }}>
          {multiLoading ? (
            <div className="loading-center"><div className="spinner" /></div>
          ) : (
            <ResponsiveContainer width="100%" height="100%">
              <LineChart data={multiChartData} margin={{ top: 4, right: providerMetric ? 48 : 16, left: 0, bottom: 0 }}>
                <CartesianGrid strokeDasharray="3 3" stroke={RULE} />
                <XAxis dataKey="year" tick={{ fontSize: 10, fontFamily: "'IBM Plex Mono',monospace", fill: INK_4 }} />
                <YAxis yAxisId="mort" tick={{ fontSize: 10, fill: INK_4 }}
                  label={{ value: '/100k', angle: -90, position: 'insideLeft', fontSize: 10, fill: INK_4, dx: 4 }} />
                {providerMetric && (
                  <YAxis yAxisId="prov" orientation="right" tick={{ fontSize: 9, fill: INK_4 }}
                    label={{ value: providerMetricLabels[providerMetric], angle: 90, position: 'insideRight', fontSize: 9, fill: INK_4, dx: -4 }} />
                )}
                <Tooltip content={MultiCountyTooltip} />
                {countyLines.map((county, idx) => (
                  <Line
                    key={county}
                    yAxisId="mort"
                    type="monotone"
                    dataKey={county}
                    name={county}
                    stroke={MULTI_PALETTE[idx % MULTI_PALETTE.length]}
                    opacity={hoveredCounty === null || hoveredCounty === county ? 1 : 0.1}
                    strokeWidth={hoveredCounty === county ? 2.5 : 1}
                    dot={false}
                    connectNulls={false}
                    onMouseEnter={() => handleLineEnter(county)}
                    onMouseLeave={handleLineLeave}
                    activeDot={{
                      r: 5,
                      cursor: 'pointer',
                      onClick: () => navigate('/scorecard', { state: { highlightCounty: county } }),
                    }}
                  />
                ))}
                {providerMetric && countyLines.map((county, idx) => (
                  <Line
                    key={`${county}__prov`}
                    yAxisId="prov"
                    type="monotone"
                    dataKey={`${county}__prov`}
                    name={`${county}__prov`}
                    stroke={MULTI_PALETTE[idx % MULTI_PALETTE.length]}
                    strokeDasharray="5 3"
                    strokeWidth={1}
                    opacity={hoveredCounty === null || hoveredCounty === county ? 0.65 : 0.06}
                    dot={false}
                    connectNulls={false}
                    legendType="none"
                  />
                ))}
              </LineChart>
            </ResponsiveContainer>
          )}
        </div>
        <p className="tiny" style={{ marginTop: 8, color: 'var(--ink-4)' }}>
          Hover a line to highlight · click a dot to open that county in Scorecard ·
          {countyLines.length} {multiDistrict ? `District ${multiDistrict}` : 'IL'} counties shown
        </p>
      </div>

      {/* Mini-map small multiples (mod #11 — richer active colors, dimmer inactive) */}
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
                  border: `${isActive ? '2px' : '1px'} solid ${isActive ? INK : RULE}`,
                  padding: isActive ? 3 : 4,
                  background: isActive ? 'var(--paper)' : 'var(--paper-2)',
                  transition: 'all 0.12s ease',
                  boxShadow: isActive ? '0 2px 8px rgba(0,0,0,0.12)' : 'none',
                }}>
                  <svg
                    viewBox={`0 0 ${MINI_W} ${MINI_H}`}
                    style={{ width: '100%', display: 'block', opacity: isActive ? 1 : 0.45 }}
                  >
                    {Object.entries(IL_GRID).filter(([n]) => n !== 'Cook_N').map(([name, [col, row]]) => {
                      const isCook = name === 'Cook';
                      const rate = rateMap[name] || 0;
                      const fill = isActive && deathData.length > 0
                        ? tileColorRich(rate, yStateRate)
                        : tileColor(rate, yStateRate);
                      const px = col * MINI_STEP;
                      const py = row * MINI_STEP;
                      const h = isCook ? MINI_TILE * 2 + MINI_GAP : MINI_TILE;
                      return (
                        <rect key={name} x={px} y={py} width={MINI_TILE} height={h}
                          fill={isActive && deathData.length > 0 ? fill : '#D4D0C8'}
                          stroke="#FBFAF7" strokeWidth={0.3} />
                      );
                    })}
                  </svg>
                </div>
                <div style={{ marginTop: 5, display: 'flex', justifyContent: 'space-between', alignItems: 'baseline' }}>
                  <span className="num" style={{
                    fontSize: isActive ? 11.5 : 10.5,
                    fontWeight: isActive ? 600 : 400,
                    color: isActive ? INK : INK_4,
                  }}>{y}</span>
                  <span className="num" style={{ fontSize: 9.5, color: isActive ? INK_4 : '#C0BCB4' }}>
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
