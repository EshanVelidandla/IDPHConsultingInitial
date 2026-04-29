import { useState, useEffect } from 'react';
import { useParams, useNavigate, useLocation } from 'react-router-dom';
import {
  BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip,
  ResponsiveContainer, Cell, LineChart, Line, Legend, LabelList,
} from 'recharts';
import axios from 'axios';
import { causeLabels, causes, API_BASE, calcSlope, providerMetricLabels, providerMetrics, providerMetricInverted } from '../data/constants';
import { countyPop2020 } from '../data/population';
import type { SharedState } from '../App';

interface DeathRate  { County: string; [key: string]: number | string; }
interface ProvRow    { County: string; [year: string]: number | string; }
type AllData = Record<string, DeathRate[]>;
interface ViewProps { shared: SharedState; setShared: (s: SharedState) => void; }

const D_HIGH = '#B23A2E';
const D_HIGH_TINT = '#F2E4E1';
const D_MID = '#C68B3C';
const D_LOW = '#4F7A4D';
const D_LOW_TINT = '#E4ECDF';
const INK = '#1C1B18';
const INK_3 = '#6B675F';
const INK_4 = '#9A968C';
const RULE = '#E6E3DC';
const GREY_BAR = '#C8C5BC';
const NO_DATA_BAR = '#E8E5DE';

const TIP_STYLE = {
  fontSize: 11,
  fontFamily: "'IBM Plex Mono',monospace",
  border: 'none',
  boxShadow: '0 4px 16px rgba(0,0,0,0.1)',
  borderRadius: 0,
  background: '#FFFFFF',
};

const CountyDrillDown = (_props: ViewProps) => {
  const { countyName } = useParams<{ countyName: string }>();
  const navigate = useNavigate();
  const location = useLocation();
  const decoded = decodeURIComponent(countyName ?? '');

  // Pre-select cause if navigated from Scorecard cell click
  const incomingCause = (location.state as { selectedCause?: string } | null)?.selectedCause ?? null;

  const [allData, setAllData] = useState<AllData>({});
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [selectedCause, setSelectedCause] = useState<string | null>(incomingCause);
  const [providerRows, setProviderRows] = useState<Record<string, ProvRow[]>>({});
  const [provLoading, setProvLoading] = useState(false);

  useEffect(() => {
    setLoading(true);
    Promise.all(
      causes.map(cause =>
        axios.get(`${API_BASE}/death_rates?cause=${cause}`).then(r => ({ cause, data: r.data as DeathRate[] }))
      )
    ).then(results => {
      const map: AllData = {};
      results.forEach(({ cause, data }) => { map[cause] = data; });
      setAllData(map);
    }).catch(() => setError('Failed to load county data.'))
      .finally(() => setLoading(false));
  }, []);

  useEffect(() => {
    setProvLoading(true);
    Promise.all(
      providerMetrics.map(m =>
        axios.get(`${API_BASE}/provider_data?metric=${m}`).then(r => ({ m, data: r.data as ProvRow[] }))
      )
    ).then(results => {
      const map: Record<string, ProvRow[]> = {};
      results.forEach(({ m, data }) => { map[m] = data; });
      setProviderRows(map);
    }).catch(() => {})
      .finally(() => setProvLoading(false));
  }, []);

  const getDataYears = (data: DeathRate[]) =>
    Object.keys(data.find(d => d.County === 'ILLINOIS') ?? {})
      .filter(k => k !== 'County' && k !== '2008').sort();

  const getLatestNonZeroYear = (row: DeathRate | undefined, years: string[]) => {
    if (!row) return null;
    for (const y of [...years].reverse()) {
      if (Number(row[y]) > 0) return y;
    }
    return null;
  };

  // All 15 causes — include even those with no county data (show placeholder)
  const causeSummary = causes.map(cause => {
    const data = allData[cause] ?? [];
    const years = getDataYears(data);
    const latestYear = years[years.length - 1] ?? '2022';
    const stateRow = data.find(d => d.County === 'ILLINOIS');
    const countyRow = data.find(d => d.County === decoded);
    // Use latest year where county has non-zero data; fall back to state's latest year
    const countyYear = getLatestNonZeroYear(countyRow, years) ?? latestYear;
    const stateRate = Number(stateRow?.[countyYear]) || 0;
    const countyRate = Number(countyRow?.[countyYear]) || 0;
    const ratio = stateRate > 0 && countyRate > 0 ? countyRate / stateRate : 0;
    const slope = countyRow ? calcSlope(countyRow as Record<string, number | string>, 2015, 2022) : 0;
    const hasData = countyRate > 0;
    return { cause, countyRate, stateRate, ratio, slope, latestYear: countyYear, hasData };
  }).filter(d => d.stateRate > 0); // keep causes that have any statewide data

  // Sort for bar chart: selected first, then by ratio desc, zero-data at bottom
  const barChartData = [...causeSummary]
    .sort((a, b) => {
      if (a.cause === selectedCause) return -1;
      if (b.cause === selectedCause) return 1;
      if (!a.hasData && b.hasData) return 1;
      if (a.hasData && !b.hasData) return -1;
      return b.ratio - a.ratio;
    })
    .map(d => ({
      cause: causeLabels[d.cause]
        .replace(' (Cancer)', '')
        .replace(' (Suicide)', '')
        .replace(' (Unintentional Injuries)', ''),
      causeKey: d.cause,
      County: d.hasData ? d.countyRate : null,
      State: d.stateRate,
      ratio: d.ratio,
      hasData: d.hasData,
    }));

  const trendData = (() => {
    if (!selectedCause) return [];
    const data = allData[selectedCause] ?? [];
    const countyRow = data.find(d => d.County === decoded);
    const stateRow = data.find(d => d.County === 'ILLINOIS');
    if (!countyRow) return [];
    const years = Object.keys(countyRow).filter(k => k !== 'County' && k !== '2008').sort();
    return years.map(year => ({
      year,
      County: Number(countyRow[year]) > 0 ? Number(countyRow[year]) : null,
      State: Number(stateRow?.[year]) > 0 ? Number(stateRow?.[year]) : null,
    }));
  })();

  const pop = countyPop2020[decoded];
  const topCauses = [...causeSummary].filter(d => d.hasData).sort((a, b) => b.ratio - a.ratio).slice(0, 3);

  const totalRow = causeSummary.find(d => d.cause === 'Total_Deaths');
  const excessDeaths = (() => {
    if (!totalRow?.stateRate || !pop) return 0;
    return ((totalRow.countyRate - totalRow.stateRate) / 100000) * pop;
  })();

  const trendSlope = selectedCause
    ? calcSlope(allData[selectedCause]?.find(d => d.County === decoded) as Record<string, number | string> ?? {}, 2015, 2022)
    : 0;

  // Custom label for zero-data bars
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const renderNoDataLabel = (props: any) => {
    const { x = 0, y = 0, height = 0, index = 0 } = props as { x: number; y: number; height: number; index: number };
    const d = barChartData[index];
    if (!d || d.hasData) return null;
    return (
      <text
        key={`nolabel-${index}`}
        x={Number(x) + 6}
        y={Number(y) + Number(height) / 2 + 4}
        fontSize={9.5}
        fill={INK_4}
        fontFamily="'IBM Plex Mono',monospace"
      >
        no data
      </text>
    );
  };

  if (loading) return <div className="loading-center"><div className="spinner" /><span>Loading county data…</span></div>;
  if (error) return <div className="error-banner" style={{ margin: 32 }}>{error}</div>;

  return (
    <div className="view fade-in" style={{ overflowY: 'auto' }}>
      {/* View head */}
      <div className="view-head">
        <div className="titles">
          <button className="btn btn-sm btn-ghost" style={{ marginBottom: 16 }}
            onClick={() => navigate(-1)}>
            <svg width="14" height="14" viewBox="0 0 16 16" fill="none" stroke="currentColor" strokeWidth="1.2">
              <path d="M10 3L5 8l5 5"/>
            </svg>
            Back
          </button>
          <div className="eyebrow eyebrow-ink">County Profile</div>
          <h1 className="h-display" style={{ marginTop: 8 }}>{decoded} County</h1>
          {pop && (
            <p className="body" style={{ marginTop: 10, color: 'var(--ink-3)' }}>
              Population {pop.toLocaleString()} (2020 census) · 2009–2022 mortality data
            </p>
          )}
        </div>
        <div className="ix">
          <div className="field">
            <div className="field-label">Trend cause</div>
            <select className="sel" style={{ width: 240 }}
              value={selectedCause || ''}
              onChange={e => setSelectedCause(e.target.value || null)}>
              <option value="">— Select to view trend —</option>
              {causes.map(c => <option key={c} value={c}>{causeLabels[c]}</option>)}
            </select>
          </div>
        </div>
      </div>

      {/* KPI strip */}
      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', borderBottom: `1px solid ${RULE}` }}>
        <div className="stat">
          <div className="stat-label">Population (2020)</div>
          <div className="stat-value num">{pop ? (pop / 1000).toFixed(0) + 'k' : '—'}</div>
          <div className="stat-meta"><span>US Census</span></div>
        </div>
        <div className="stat">
          <div className="stat-label">All-cause rate / 100k</div>
          <div className="stat-value num">{(totalRow?.countyRate ?? 0) > 0 ? (totalRow?.countyRate ?? 0).toFixed(1) : '—'}</div>
          <div className="stat-meta"><span>Latest year</span></div>
        </div>
        <div className="stat">
          <div className="stat-label">Excess deaths · annual</div>
          <div className="stat-value num" style={{ color: excessDeaths > 0 ? D_HIGH : excessDeaths < 0 ? D_LOW : undefined }}>
            {Math.abs(excessDeaths) > 0.5 ? `${excessDeaths > 0 ? '+' : ''}${excessDeaths.toFixed(1)}` : '—'}
          </div>
          <div className="stat-meta"><span>vs. state avg</span></div>
        </div>
        <div className="stat">
          <div className="stat-label">Top cause vs. state</div>
          <div className="stat-value" style={{ fontSize: 18, fontFamily: 'var(--sans)' }}>
            {topCauses[0] ? causeLabels[topCauses[0].cause].split(' ')[0] : '—'}
          </div>
          <div className="stat-meta" style={{ color: topCauses[0]?.ratio > 1.2 ? D_HIGH : D_LOW }}>
            {topCauses[0]?.ratio > 0 ? `${((topCauses[0].ratio - 1) * 100 > 0 ? '+' : '')}${((topCauses[0].ratio - 1) * 100).toFixed(0)}%` : ''}
          </div>
        </div>
      </div>

      {/* Body */}
      <div style={{ padding: '32px 40px', display: 'flex', flexDirection: 'column', gap: 32 }}>

        {/* Top causes chips */}
        {topCauses.length > 0 && (
          <div style={{ display: 'flex', gap: 8, alignItems: 'center', flexWrap: 'wrap' }}>
            <span className="eyebrow" style={{ marginRight: 4 }}>Highest burden causes</span>
            {topCauses.map(({ cause, ratio }) => (
              <button key={cause}
                className={`chip${cause === selectedCause ? ' active' : ' priority'}`}
                onClick={() => setSelectedCause(cause === selectedCause ? null : cause)}>
                {causeLabels[cause].split('(')[0].trim()}
                {ratio > 0 && <span style={{ marginLeft: 4 }}>{ratio > 1 ? '+' : ''}{((ratio - 1) * 100).toFixed(0)}%</span>}
              </button>
            ))}
          </div>
        )}

        {/* All-causes profile bar chart */}
        <div className="panel">
          <div className="panel-head">
            <div className="titles">
              <div className="eyebrow">Cause breakdown</div>
              <div className="h3">{decoded} vs. Illinois — all causes</div>
            </div>
            <span className="caption">
              {selectedCause
                ? <span style={{ color: D_HIGH, fontSize: 11 }}>Selected · {causeLabels[selectedCause]?.split('(')[0].trim()}</span>
                : 'Click bar to see trend below'}
            </span>
          </div>
          <div className="panel-body">
            <div style={{ height: Math.max(320, barChartData.length * 30) }}>
              <ResponsiveContainer width="100%" height="100%">
                <BarChart
                  data={barChartData}
                  layout="vertical"
                  margin={{ top: 0, right: 48, left: 0, bottom: 0 }}
                  onClick={(data) => data?.activePayload?.[0] && setSelectedCause(data.activePayload[0].payload.causeKey)}
                >
                  <CartesianGrid strokeDasharray="3 3" stroke={RULE} horizontal={false} />
                  <XAxis type="number" tick={{ fontSize: 10, fontFamily: "'IBM Plex Mono',monospace", fill: INK_4 }} />
                  <YAxis dataKey="cause" type="category" tick={{ fontSize: 10.5, fill: INK_3 }} width={158} />
                  <Tooltip contentStyle={TIP_STYLE}
                    formatter={(v: unknown, name: string) => [`${Number(v).toFixed(1)} /100k`, name === 'County' ? decoded : 'IL avg']} />
                  <Bar dataKey="County" name="County" radius={[0, 2, 2, 0]} style={{ cursor: 'pointer' }}>
                    {barChartData.map((d, i) => (
                      <Cell
                        key={i}
                        fill={
                          d.causeKey === selectedCause ? INK :
                          !d.hasData ? NO_DATA_BAR :
                          GREY_BAR
                        }
                      />
                    ))}
                    <LabelList content={renderNoDataLabel} />
                  </Bar>
                  <Bar dataKey="State" name="IL avg" fill={RULE} radius={[0, 2, 2, 0]} />
                  <Legend wrapperStyle={{ fontSize: 11, fontFamily: "'Inter Tight',sans-serif" }}
                    formatter={(v: string) => v === 'County' ? decoded : 'IL avg'} />
                </BarChart>
              </ResponsiveContainer>
            </div>
          </div>
        </div>

        {/* Trend line for selected cause */}
        {selectedCause && trendData.length > 0 && (
          <div className="panel">
            <div className="panel-head">
              <div className="titles">
                <div className="eyebrow">Trend overlay</div>
                <div className="h3">{causeLabels[selectedCause]} — {decoded} vs. Illinois</div>
              </div>
              <span className="num" style={{ fontSize: 11.5, color: trendSlope > 0 ? D_HIGH : D_LOW }}>
                {trendSlope > 0 ? '↑ +' : '↓ '}{trendSlope.toFixed(2)}/yr
              </span>
            </div>
            <div className="panel-body">
              <div style={{ height: 220 }}>
                <ResponsiveContainer width="100%" height="100%">
                  <LineChart data={trendData} margin={{ top: 4, right: 20, left: 0, bottom: 0 }}>
                    <CartesianGrid strokeDasharray="3 3" stroke={RULE} />
                    <XAxis dataKey="year" tick={{ fontSize: 10, fontFamily: "'IBM Plex Mono',monospace", fill: INK_4 }} />
                    <YAxis tick={{ fontSize: 10, fill: INK_4 }}
                      label={{ value: '/100k', angle: -90, position: 'insideLeft', fontSize: 10, fill: INK_4, dx: 4 }} />
                    <Tooltip contentStyle={TIP_STYLE}
                      formatter={(v: unknown, name: string) => [`${Number(v).toFixed(1)} /100k`, name === 'County' ? decoded : 'IL avg']} />
                    <Legend wrapperStyle={{ fontSize: 11 }} formatter={(v: string) => v === 'County' ? decoded : 'IL avg'} />
                    <Line type="monotone" dataKey="County" stroke={INK} strokeWidth={2.5}
                      dot={{ r: 3, fill: INK }} activeDot={{ r: 5 }} connectNulls={false} />
                    <Line type="monotone" dataKey="State" stroke={INK_4} strokeWidth={1.5}
                      strokeDasharray="5 3" dot={false} connectNulls={false} />
                  </LineChart>
                </ResponsiveContainer>
              </div>
            </div>
          </div>
        )}

        {/* Mortality burden callout */}
        {Math.abs(excessDeaths) > 0.5 && (
          <div style={{
            padding: '20px 24px',
            background: excessDeaths > 0 ? D_HIGH_TINT : D_LOW_TINT,
            borderLeft: `4px solid ${excessDeaths > 0 ? D_HIGH : D_LOW}`,
            display: 'flex',
            alignItems: 'baseline',
            gap: 16,
          }}>
            <span className="num" style={{ fontSize: 28, color: excessDeaths > 0 ? D_HIGH : D_LOW, lineHeight: 1 }}>
              {excessDeaths > 0 ? '+' : ''}{excessDeaths.toFixed(1)}
            </span>
            <div>
              <div style={{ fontSize: 13, color: INK, fontWeight: 500 }}>
                estimated {excessDeaths > 0 ? 'excess' : 'fewer'} deaths per year vs. state average
              </div>
              <div className="caption" style={{ marginTop: 4 }}>
                (county rate − state rate) × {pop ? pop.toLocaleString() : 'population'} ÷ 100,000 · Total Deaths · latest year
              </div>
            </div>
          </div>
        )}

        {/* Provider access panel */}
        <div className="panel">
          <div className="panel-head">
            <div className="titles">
              <div className="eyebrow">Healthcare access</div>
              <div className="h3">{decoded} vs. Illinois · latest year</div>
            </div>
            {!provLoading && (() => {
              const hpsaRows = providerRows['hpsa_primary_care_designation'] ?? [];
              const hpsaVal = Number(hpsaRows.find(r => r.County === decoded)?.['2022']) || 0;
              if (!hpsaVal) return null;
              return (
                <span style={{ fontSize: 11, fontFamily: 'var(--mono)', padding: '3px 8px',
                  background: D_HIGH_TINT, color: D_HIGH, letterSpacing: '0.06em', textTransform: 'uppercase' }}>
                  {hpsaVal === 1 ? 'HPSA · Whole county' : 'HPSA · Partial'}
                </span>
              );
            })()}
          </div>
          <div className="panel-body-flat">
            {provLoading ? (
              <div className="loading-center" style={{ minHeight: 80 }}><div className="spinner" /></div>
            ) : (
              <table className="tbl">
                <thead>
                  <tr>
                    <th className="col-left">Metric</th>
                    <th style={{ textAlign: 'right' }}>{decoded}</th>
                    <th style={{ textAlign: 'right' }}>IL avg</th>
                    <th style={{ textAlign: 'right' }}>vs. state</th>
                  </tr>
                </thead>
                <tbody>
                  {providerMetrics.filter(m => m !== 'hpsa_primary_care_designation').map(m => {
                    const rows = providerRows[m] ?? [];
                    const yr = '2022';
                    const countyVal = Number(rows.find(r => r.County === decoded)?.[yr]) || 0;
                    const stateVal  = Number(rows.find(r => r.County === 'ILLINOIS')?.[yr]) || 0;
                    const inverted  = providerMetricInverted[m] ?? false;
                    const ratio     = stateVal > 0 && countyVal > 0 ? countyVal / stateVal : 0;
                    const good      = inverted ? ratio < 1 : ratio > 1;
                    const neutral   = ratio >= 0.9 && ratio <= 1.1;
                    const color     = neutral ? INK_4 : good ? D_LOW : D_HIGH;
                    return (
                      <tr key={m}>
                        <td className="col-left">{providerMetricLabels[m]}</td>
                        <td>{countyVal > 0 ? countyVal.toFixed(1) : '—'}</td>
                        <td style={{ color: INK_4 }}>{stateVal > 0 ? stateVal.toFixed(1) : '—'}</td>
                        <td style={{ color }}>
                          {ratio > 0 ? `${ratio > 1 ? '+' : ''}${((ratio - 1) * 100).toFixed(0)}%` : '—'}
                        </td>
                      </tr>
                    );
                  })}
                </tbody>
              </table>
            )}
          </div>
        </div>

        {/* Cause table — all causes */}
        <div className="panel">
          <div className="panel-head">
            <div className="titles">
              <div className="eyebrow">All causes</div>
              <div className="h3">Full cause breakdown vs. state</div>
            </div>
          </div>
          <div className="panel-body-flat">
            <table className="tbl">
              <thead>
                <tr>
                  <th className="col-left">Cause</th>
                  <th style={{ textAlign: 'right' }}>{decoded}</th>
                  <th style={{ textAlign: 'right' }}>IL avg</th>
                  <th style={{ textAlign: 'right' }}>Ratio</th>
                  <th style={{ textAlign: 'right' }}>Slope</th>
                </tr>
              </thead>
              <tbody>
                {causeSummary
                  .sort((a, b) => {
                    if (!a.hasData && b.hasData) return 1;
                    if (a.hasData && !b.hasData) return -1;
                    return b.ratio - a.ratio;
                  })
                  .map(d => (
                    <tr key={d.cause} onClick={() => d.hasData && setSelectedCause(d.cause)}
                      style={{ cursor: d.hasData ? 'pointer' : 'default', opacity: d.hasData ? 1 : 0.5 }}>
                      <td className="col-left">{causeLabels[d.cause]}</td>
                      <td>{d.countyRate > 0 ? d.countyRate.toFixed(1) : '—'}</td>
                      <td style={{ color: INK_4 }}>{d.stateRate.toFixed(1)}</td>
                      <td style={{ color: d.ratio > 1.2 ? D_HIGH : d.ratio < 0.8 ? D_LOW : D_MID }}>
                        {d.ratio > 0 ? `${d.ratio > 1 ? '+' : ''}${((d.ratio - 1) * 100).toFixed(0)}%` : '—'}
                      </td>
                      <td style={{ color: d.slope > 0 ? D_HIGH : d.slope < 0 ? D_LOW : INK_4 }}>
                        {d.slope !== 0 ? `${d.slope > 0 ? '+' : ''}${d.slope.toFixed(2)}` : '—'}
                      </td>
                    </tr>
                  ))}
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  );
};

export default CountyDrillDown;
