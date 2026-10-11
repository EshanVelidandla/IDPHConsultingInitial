import { useState, useEffect, useMemo, useCallback } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip,
  ResponsiveContainer,
} from 'recharts';
import type { TooltipProps } from 'recharts';
import { causeLabels, causes, EXCLUDED_COUNTIES, IDPH_DISTRICTS, providerMetricLabels, providerMetrics, VIEW_HUES } from '../data/constants';
import { IL_GRID } from '../data/ilGrid';
import type { SharedState } from '../App';
import { asRows, bandOf, bandStyle, toRate, yearsOf } from '../data/analytics';
import YearTimeline from './YearTimeline';
import type { TimelineEvent } from './YearTimeline';
import { fetchDeathRates, fetchProviderData } from '../data/useDataset';

interface DeathRate { County: string; [key: string]: number | string; }
interface ProviderRow { County: string; [year: string]: number | string; }
interface ViewProps { shared: SharedState; setShared: (s: SharedState) => void; }

const D_HIGH = '#B23A2E';
const D_LOW = '#4F7A4D';
const D_NULL_TINT = '#EFEDE7';
const INK = '#1C1B18';
const HUE = VIEW_HUES['/pulse'].hue;
const INK_4 = '#9A968C';
const RULE = '#E6E3DC';

// The selected mini-map uses the band's full-strength colour; the others use
// its tint. Both classify through the shared band table, so these grids read
// the same way as the main map and its legend. They used to carry their own
// hardcoded red/green pair with no lightness difference between high and low.
function tileColorRich(rate: number, stateRate: number): string {
  return bandStyle(bandOf(rate || null, stateRate || null)).border;
}

function tileColor(rate: number, stateRate: number): string {
  return bandStyle(bandOf(rate || null, stateRate || null)).fill;
}

// `short` is the timeline label and is written out rather than derived. The
// timeline used to show the first word of `t`, which rendered
// "Last pre-pandemic year" as the meaningless "Last".
const EVENTS: Record<number, TimelineEvent> = {
  2009: { short: 'Baseline', t: 'Baseline year', d: 'Tracking begins. Statewide all-cause rate is the starting reference.' },
  2014: { short: 'ACA', t: 'ACA full implementation', d: 'Medicaid expansion in IL; uninsured rate drops sharply.' },
  2019: { short: 'Pre-COVID', t: 'Last pre-pandemic year', d: 'The final year before COVID-19 affects the series.' },
  2020: { short: 'COVID-19', t: 'COVID-19 onset', d: 'Sharpest single-year increase in IL mortality on record.' },
  2022: { short: 'Latest', t: 'Latest available', d: 'Rate remains elevated above pre-pandemic baseline.' },
};

const TIP_STYLE = {
  fontSize: 11, fontFamily: "'IBM Plex Mono',monospace",
  border: 'none', boxShadow: '0 4px 16px rgba(0,0,0,0.1)',
  borderRadius: 0, background: '#FFFFFF',
};


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
  const [error, setError] = useState<string | null>(null);

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
    fetchDeathRates('Total_Deaths')
      .then(r => setDeathData(asRows(r.data)))
      .catch(() => setError('Failed to load statewide mortality data. Ensure the backend is running.'))
      .finally(() => setLoading(false));
  }, []);

  // Load multi-county cause data on demand
  useEffect(() => {
    setMultiLoading(true);
    // A slower earlier request must not land after a newer one and
    // overwrite it. Switching cause or metric quickly can otherwise leave
    // the view showing the answer to a request it has already moved on from.
    let live = true;
    fetchDeathRates(multiCause)
      .then(r => { if (live) setMultiData(asRows(r.data)); })
      .catch(() => { if (live) setError(`Failed to load ${causeLabels[multiCause] ?? multiCause} for the county comparison.`); })
      .finally(() => { if (live) setMultiLoading(false); });
    return () => { live = false; };
  }, [multiCause]);

  useEffect(() => {
    if (!providerMetric) { setProviderData([]); return; }
    // A slower earlier request must not land after a newer one and
    // overwrite it. Switching cause or metric quickly can otherwise leave
    // the view showing the answer to a request it has already moved on from.
    let live = true;
    fetchProviderData(providerMetric)
      .then(r => { if (live) setProviderData(asRows(r.data)); })
      .catch(() => { if (live) setProviderData([]); });
    return () => { live = false; };
  }, [providerMetric]);

  const statewideTrend = useMemo(() => {
    const row = deathData.find(d => d.County === 'ILLINOIS');
    if (!row) return [];
    return Object.entries(row)
      .filter(([k]) => /^\d{4}$/.test(k))
      .map(([yr]) => ({ year: Number(yr), rate: toRate(row as never, yr) }))
      .sort((a, b) => a.year - b.year);
  }, [deathData]);

  const stateRate = useMemo(() => {
    const row = deathData.find(d => d.County === 'ILLINOIS');
    return Number(row?.[year.toString()]) || 0;
  }, [deathData, year]);

  // Rates for any year, not just the selected one. The mini-map grid needs all
  // fourteen; it used to read the selected year's map for every panel, so the
  // other thirteen rendered flat grey.
  const ratesByYear = useMemo<Record<number, Record<string, number | null>>>(() => {
    const out: Record<number, Record<string, number | null>> = {};
    deathData.forEach(d => {
      if (EXCLUDED_COUNTIES.includes(d.County)) return;
      Object.keys(d).filter(k => /^\d{4}$/.test(k)).forEach(yr => {
        const y = Number(yr);
        (out[y] ??= {})[d.County] = toRate(d as never, yr);
      });
    });
    return out;
  }, [deathData]);

  const yearRateMap = useCallback(
    (y: number): Record<string, number | null> => ratesByYear[y] ?? {},
    [ratesByYear],
  );

  const rateMap = useMemo<Record<string, number>>(() => {
    const m: Record<string, number> = {};
    Object.entries(yearRateMap(year)).forEach(([county, rate]) => {
      if (rate !== null) m[county] = rate;
    });
    return m;
  }, [yearRateMap, year]);

  const aboveAvg = useMemo(() => {
    if (!stateRate) return null;
    return Object.entries(rateMap).filter(([, rate]) => rate > stateRate).length;
  }, [rateMap, stateRate]);

  const yearRate = statewideTrend.find(d => d.year === year)?.rate ?? null;
  const prevYearRate = statewideTrend.find(d => d.year === year - 1)?.rate ?? null;
  const deltaYoY = yearRate && prevYearRate ? ((yearRate - prevYearRate) / prevYearRate * 100) : null;

  const activeEvent = EVENTS[year] ?? null;

  // Years come from the loaded series rather than a hardcoded 2009..2022, so
  // the scale always matches what the pipeline published.
  const timelineYears = useMemo(
    () => statewideTrend.map(d => d.year),
    [statewideTrend],
  );

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
    // Years come from this series itself, not a fixed 2009..2022.
    return yearsOf(multiData as never).map(yr => {
      const yrStr = yr.toString();
      const point: Record<string, string | number | null> = { year: yrStr };
      visibleRows.forEach(row => {
        point[row.County] = toRate(row as never, yrStr);
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
      {error && <div className="error-banner" role="alert">{error}</div>}
      <div className="view-head">
        <div className="titles">
          <div className="eyebrow eyebrow-ink">Pulse · Annotated timeline</div>
          <h1 className="h-display" style={{ marginTop: 8 }}>
            Fourteen years,<br />
            <span style={{ color: 'var(--ink-3)' }}>read year by year.</span>
          </h1>
          <p className="body" style={{ marginTop: 12, maxWidth: 540, color: 'var(--ink-3)' }}>
            A year-by-year view of Illinois mortality from {timelineYears[0]} to {timelineYears[timelineYears.length - 1]}. Drag the timeline to move through years and see how the county map shifts. Key events are marked as reference points: ACA implementation, the last pre-pandemic year, and the onset of COVID-19. Use the multi-county chart below to compare specific counties side by side.
          </p>
        </div>
      </div>

      {/* Timeline ribbon */}
      <div style={{ padding: '40px 48px 24px', borderBottom: `1px solid ${RULE}` }}>
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'baseline', marginBottom: 18 }}>
          <span className="eyebrow">Timeline</span>
          <span className="num" style={{ fontSize: 56, fontFamily: 'var(--serif)', color: INK, lineHeight: 1, letterSpacing: '-0.03em' }}>{year}</span>
        </div>

        <YearTimeline
          years={timelineYears}
          value={year}
          onChange={setYear}
          events={EVENTS}
        />
      </div>

      {/* Active annotation + snapshot */}
      <div style={{ padding: '40px 48px', display: 'grid', gridTemplateColumns: '1fr 1.4fr', gap: 56, alignItems: 'start', borderBottom: `1px solid ${RULE}` }}>
        <div>
          <span className="eyebrow" style={{ marginBottom: 10, display: 'block' }}>What happened</span>
          {activeEvent ? (
            <>
              <div style={{ fontFamily: 'var(--serif)', fontSize: 26, color: INK, letterSpacing: '-0.018em', lineHeight: 1.2, marginBottom: 12 }}>
                {activeEvent.t}
              </div>
              <p className="body" style={{ color: 'var(--ink-2)' }}>{activeEvent.d}</p>
            </>
          ) : (
            <p className="body" style={{ color: 'var(--ink-3)' }}>
              No annotated event for {year}.
            </p>
          )}
        </div>
        <div>
          <span className="eyebrow" style={{ marginBottom: 12, display: 'block' }}>Snapshot · {year}</span>
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(2, 1fr)', border: `1px solid ${RULE}` }}>
            <div className="stat">
              <div className="stat-label">State rate / 100k</div>
              <div className="stat-value num">{yearRate ? yearRate.toFixed(1) : 'n/a'}</div>
              <div className="stat-meta"><span>All causes</span></div>
            </div>
            <div className="stat">
              <div className="stat-label">Counties above avg</div>
              <div className="stat-value num">{aboveAvg ?? 'n/a'}</div>
              <div className="stat-meta"><span>of 102</span></div>
            </div>
            <div className="stat">
              <div className="stat-label">Δ from prior year</div>
              <div className="stat-value num" style={{ color: deltaYoY != null ? (deltaYoY > 0 ? D_HIGH : D_LOW) : undefined }}>
                {deltaYoY != null ? `${deltaYoY > 0 ? '+' : ''}${deltaYoY.toFixed(1)}%` : 'n/a'}
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

      {/* All-cause mortality trend. Fixed: the chart does not follow the slider. */}
      <div style={{ padding: '40px 48px', borderBottom: `1px solid ${RULE}` }}>
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'baseline', marginBottom: 20 }}>
          <div>
            <span className="eyebrow" style={{ display: 'block', marginBottom: 4 }}>All-cause mortality · fixed reference</span>
            <div className="h2">Total deaths rate · Illinois {timelineYears[0]}–{timelineYears[timelineYears.length - 1]}</div>
          </div>
          <span className="caption" style={{ color: 'var(--ink-3)' }}>Crude rate per 100,000</span>
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
                <Line type="monotone" dataKey="rate" stroke={HUE} strokeWidth={2}
                  dot={(p) => {
                    if (!p || p.cx == null || p.cy == null) return <g />;
                    const isSelected = p.payload?.year === year;
                    return <circle key={p.key} cx={p.cx} cy={p.cy} r={isSelected ? 5 : 3}
                      fill={isSelected ? D_HIGH : HUE} stroke="none" />;
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
            <div className="h2">All counties by cause · {timelineYears[0]}–{timelineYears[timelineYears.length - 1]}</div>
          </div>
          <div style={{ display: 'flex', gap: 12, alignItems: 'flex-end', flexWrap: 'wrap' }}>
            <label className="field">
              <span className="field-label">Cause</span>
              <select className="sel" style={{ width: 220 }}
                value={multiCause}
                onChange={e => setMultiCause(e.target.value)}>
                {causes.map(c => <option key={c} value={c}>{causeLabels[c]}</option>)}
              </select>
            </label>
            <label className="field">
              <span className="field-label">District filter</span>
              <select className="sel" style={{ width: 200 }}
                value={multiDistrict}
                onChange={e => setMultiDistrict(e.target.value)}>
                <option value="">All counties</option>
                {Object.entries(IDPH_DISTRICTS).map(([num, { name }]) => (
                  <option key={num} value={num}>D{num} · {name.split(': ')[1]}</option>
                ))}
              </select>
            </label>
            <label className="field">
              <span className="field-label">Provider overlay</span>
              <select className="sel" style={{ width: 220 }}
                value={providerMetric}
                onChange={e => setProviderMetric(e.target.value)}>
                <option value="">None</option>
                {providerMetrics.map(m => <option key={m} value={m}>{providerMetricLabels[m]}</option>)}
              </select>
            </label>
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

      {/* Mini-map small multiples. The selected year is drawn at full strength. */}
      <div style={{ padding: '40px 48px' }}>
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'baseline', marginBottom: 24 }}>
          <div>
            <span className="eyebrow" style={{ display: 'block', marginBottom: 4 }}>Small multiples</span>
            <div className="h2">The state, year by year</div>
          </div>
          <span className="caption">{statewideTrend.length} mini-maps · {statewideTrend[0]?.year ?? 2008} → {statewideTrend[statewideTrend.length - 1]?.year ?? 2022} · All-cause mortality</span>
        </div>

        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(7, 1fr)', gap: 16 }}>
          {statewideTrend.map(({ year: y }) => {
            const isActive = y === year;
            const yStateRate = statewideTrend.find(d => d.year === y)?.rate ?? 0;

            return (
              <div key={y}
                role="button"
                tabIndex={0}
                aria-label={`Show ${y} map`}
                aria-pressed={isActive}
                onClick={() => setYear(y)}
                onKeyDown={e => { if (e.key === 'Enter' || e.key === ' ') { e.preventDefault(); setYear(y); } }}
                style={{ cursor: 'pointer' }}>
                <div style={{
                  position: 'relative',
                  border: `${isActive ? '2px' : '1px'} solid ${isActive ? HUE : RULE}`,
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
                      const rate = yearRateMap(y)[name] ?? null;
                      const fill = rate === null
                        ? D_NULL_TINT
                        : isActive
                          ? tileColorRich(rate, yStateRate)
                          : tileColor(rate, yStateRate);
                      const px = col * MINI_STEP;
                      const py = row * MINI_STEP;
                      const h = isCook ? MINI_TILE * 2 + MINI_GAP : MINI_TILE;
                      return (
                        <rect key={name} x={px} y={py} width={MINI_TILE} height={h}
                          fill={fill} stroke="#FBFAF7" strokeWidth={0.3} />
                      );
                    })}
                  </svg>
                </div>
                <div style={{ marginTop: 5, display: 'flex', justifyContent: 'space-between', alignItems: 'baseline' }}>
                  <span className="num" style={{
                    fontSize: isActive ? 11.5 : 10.5,
                    fontWeight: isActive ? 600 : 400,
                    color: isActive ? HUE : INK_4,
                  }}>{y}</span>
                  <span className="num" style={{ fontSize: 9.5, color: isActive ? INK_4 : '#C0BCB4' }}>
                    {yStateRate > 0 ? yStateRate.toFixed(0) : 'n/a'}
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
