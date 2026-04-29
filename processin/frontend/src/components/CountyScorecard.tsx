import { useState, useEffect, useMemo } from 'react';
import { useNavigate, useLocation } from 'react-router-dom';
import axios from 'axios';
import { causeLabels, causes, EXCLUDED_COUNTIES, API_BASE, calcSlope, providerMetricLabels, providerMetricShort, providerMetricInverted } from '../data/constants';
import type { SharedState } from '../App';

interface ProviderRow { County: string; [year: string]: number | string; }

const PROVIDER_COLS = [
  'primary_care_physicians_per_100k',
  'hospital_beds_per_100k',
  'hpsa_primary_care_designation',
] as const;

interface DeathRate { County: string; [key: string]: number | string; }
type AllData = Record<string, DeathRate[]>;

interface ViewProps { shared: SharedState; setShared: (s: SharedState) => void; }

const SHORT: Record<string, string> = {
  Total_Deaths: 'Total', Diseases_of_Heart: 'Heart', Malignant_Neoplasms: 'Cancer',
  Accidents: 'Accidents', COVID_19: 'COVID', Cerebrovascular_Diseases: 'Stroke',
  Chronic_Lower_Respiratory_Diseases: 'CLRD', Alzheimers_Disease: "Alzheimer's",
  Diabetes_Mellitus: 'Diabetes', Nephritis_Nephrotic_Syndrome_Nephrosis: 'Nephritis',
  Influenza_and_Pneumonia: 'Flu/Pneu', Septicemia: 'Septicemia',
  Intentional_Self_Harm: 'Suicide', Chronic_Liver_Disease_Cirrhosis: 'Liver',
  All_Other_Causes: 'Other',
};

const D_HIGH = '#B23A2E';
const D_HIGH_TINT = '#F2E4E1';
const D_MID = '#C68B3C';
const D_LOW = '#4F7A4D';
const D_LOW_TINT = '#E4ECDF';
const INK = '#1C1B18';

function heatBg(ratio: number): string {
  if (!ratio) return 'transparent';
  if (ratio > 1.4) return D_HIGH_TINT;
  if (ratio > 1.2) return '#FBF0EE';
  if (ratio < 0.6) return D_LOW_TINT;
  if (ratio < 0.8) return '#ECF3EB';
  return '#FDF6EE';
}

function heatColor(ratio: number): string {
  if (!ratio) return 'var(--ink-5)';
  if (ratio > 1.4) return D_HIGH;
  if (ratio > 1.2) return '#C85A4E';
  if (ratio < 0.6) return D_LOW;
  if (ratio < 0.8) return '#4A7348';
  return D_MID;
}

// For provider columns: good access = green, poor access = red (inverted for HPSA)
function provHeatBg(val: number, stateVal: number, inverted: boolean): string {
  if (!val || !stateVal) return 'transparent';
  const r = inverted ? stateVal / val : val / stateVal;
  if (r > 1.2) return '#ECF3EB';
  if (r < 0.8) return '#FBF0EE';
  return '#FDF6EE';
}
function provHeatColor(val: number, stateVal: number, inverted: boolean): string {
  if (!val || !stateVal) return 'var(--ink-5)';
  const r = inverted ? stateVal / val : val / stateVal;
  if (r > 1.2) return D_LOW;
  if (r < 0.8) return D_HIGH;
  return D_MID;
}

function TrendArrow({ slope }: { slope: number }) {
  if (slope > 1.5) return (
    <svg width="8" height="8" viewBox="0 0 12 12" fill="none" stroke={D_HIGH} strokeWidth="1.8" style={{ marginLeft: 3 }}>
      <path d="M6 10V2M2.5 5.5L6 2l3.5 3.5"/>
    </svg>
  );
  if (slope < -1.5) return (
    <svg width="8" height="8" viewBox="0 0 12 12" fill="none" stroke={D_LOW} strokeWidth="1.8" style={{ marginLeft: 3 }}>
      <path d="M6 2v8M2.5 6.5L6 10l3.5-3.5"/>
    </svg>
  );
  return (
    <svg width="8" height="8" viewBox="0 0 12 12" fill="none" stroke="var(--ink-5)" strokeWidth="1.5" style={{ marginLeft: 3 }}>
      <path d="M2 6h8M7.5 3.5L10 6l-2.5 2.5"/>
    </svg>
  );
}

const CountyScorecard = ({ shared, setShared }: ViewProps) => {
  const navigate = useNavigate();
  const location = useLocation();
  const { selectedYear } = shared;
  const [allData, setAllData] = useState<AllData>({});
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [sortCol, setSortCol] = useState('county');
  const [sortAsc, setSortAsc] = useState(true);
  const [search, setSearch] = useState('');
  const [showProvider, setShowProvider] = useState(false);
  const [providerData, setProviderData] = useState<Record<string, ProviderRow[]>>({});

  // Auto-filter to highlighted county when arriving from multi-county chart
  useEffect(() => {
    const highlight = (location.state as { highlightCounty?: string } | null)?.highlightCounty;
    if (highlight) setSearch(highlight);
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

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
    }).catch(() => setError('Failed to load scorecard data.'))
      .finally(() => setLoading(false));
  }, []);

  useEffect(() => {
    if (!showProvider || Object.keys(providerData).length > 0) return;
    Promise.all(
      PROVIDER_COLS.map(m =>
        axios.get(`${API_BASE}/provider_data?metric=${m}`).then(r => ({ m, data: r.data as ProviderRow[] }))
      )
    ).then(results => {
      const map: Record<string, ProviderRow[]> = {};
      results.forEach(({ m, data }) => { map[m] = data; });
      setProviderData(map);
    }).catch(() => {});
  }, [showProvider, providerData]);

  const slopeMap = useMemo<Record<string, Record<string, number>>>(() => {
    const m: Record<string, Record<string, number>> = {};
    causes.forEach(cause => {
      (allData[cause] ?? []).forEach(d => {
        if (EXCLUDED_COUNTIES.includes(d.County)) return;
        if (!m[d.County]) m[d.County] = {};
        m[d.County][cause] = calcSlope(d as Record<string, number | string>, 2015, 2022);
      });
    });
    return m;
  }, [allData]);

  const tableData = useMemo(() => {
    if (!Object.keys(allData).length) return [];
    const yrStr = selectedYear.toString();
    const counties = (allData[causes[0]] ?? [])
      .filter(d => !EXCLUDED_COUNTIES.includes(d.County))
      .map(d => d.County);
    return counties.map(county => {
      const row: Record<string, number | string> = { county };
      causes.forEach(cause => {
        const data = allData[cause] ?? [];
        const stateRate = Number(data.find(d => d.County === 'ILLINOIS')?.[yrStr]) || 0;
        const countyRate = Number(data.find(d => d.County === county)?.[yrStr]) || 0;
        row[cause] = stateRate > 0 ? countyRate / stateRate : 0;
      });
      // HPSA badge value (0/1/2)
      const hpsaRows = providerData['hpsa_primary_care_designation'] ?? [];
      row['__hpsa'] = Number(hpsaRows.find(d => d.County === county)?.[yrStr]) || 0;
      // Provider column values
      PROVIDER_COLS.forEach(m => {
        const pRows = providerData[m] ?? [];
        const stateVal = Number(pRows.find(d => d.County === 'ILLINOIS')?.[yrStr]) || 0;
        const countyVal = Number(pRows.find(d => d.County === county)?.[yrStr]) || 0;
        row[`__prov_${m}`] = countyVal;
        row[`__prov_state_${m}`] = stateVal;
      });
      return row;
    });
  }, [allData, selectedYear, providerData]);

  // Causes with no statewide data for the selected year
  const missingCauses = useMemo(() => {
    if (!Object.keys(allData).length) return [];
    return causes.filter(c => {
      const stateRate = Number((allData[c] ?? []).find(d => d.County === 'ILLINOIS')?.[selectedYear.toString()]) || 0;
      return stateRate === 0;
    });
  }, [allData, selectedYear]);

  const sorted = useMemo(() => {
    const filtered = tableData.filter(r =>
      (r.county as string).toLowerCase().includes(search.toLowerCase())
    );
    return [...filtered].sort((a, b) => {
      if (sortCol === 'county') {
        const av = a.county as string, bv = b.county as string;
        return sortAsc ? av.localeCompare(bv) : bv.localeCompare(av);
      }
      const av = a[sortCol] as number, bv = b[sortCol] as number;
      // Zero/suppressed rows always at bottom regardless of sort direction
      if (av === 0 && bv === 0) return 0;
      if (av === 0) return 1;
      if (bv === 0) return -1;
      return sortAsc ? av - bv : bv - av;
    });
  }, [tableData, sortCol, sortAsc, search]);

  const handleSort = (col: string) => {
    if (sortCol === col) setSortAsc(v => !v);
    else { setSortCol(col); setSortAsc(col === 'county'); }
  };

  if (loading) return (
    <div className="loading-center">
      <div className="spinner" />
      <span>Loading all {causes.length} cause datasets…</span>
    </div>
  );
  if (error) return <div className="error-banner" style={{ margin: 32 }}>{error}</div>;

  return (
    <div className="view fade-in" style={{ display: 'flex', flexDirection: 'column', overflow: 'hidden' }}>
      {/* View head */}
      <div className="view-head">
        <div className="titles">
          <div className="eyebrow eyebrow-ink">County Scorecard</div>
          <h1 className="h-display" style={{ marginTop: 8 }}>102 counties × {causes.length} causes</h1>
          <p className="body" style={{ marginTop: 12, maxWidth: 540, color: 'var(--ink-3)' }}>
            Each cell shows a county's age-adjusted death rate as a ratio to the statewide average. Click a cause cell to open that county's drilldown with the cause pre-selected.
          </p>
        </div>
        <div className="ix">
          <div className="field">
            <div className="field-label">Search county</div>
            <div style={{ position: 'relative' }}>
              <svg style={{ position: 'absolute', left: 9, top: 9, color: 'var(--ink-4)', pointerEvents: 'none' }}
                width="14" height="14" viewBox="0 0 16 16" fill="none" stroke="currentColor" strokeWidth="1.2">
                <circle cx="7" cy="7" r="4.5"/><path d="M10.5 10.5L14 14"/>
              </svg>
              <input className="inp" placeholder="Filter county…" style={{ paddingLeft: 30, width: 200 }}
                value={search} onChange={e => setSearch(e.target.value)} />
            </div>
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

      {/* Missing data banner */}
      {missingCauses.length > 0 && (
        <div style={{
          margin: '0 40px 0',
          padding: '10px 16px',
          background: '#FDF6EE',
          borderLeft: `3px solid ${D_MID}`,
          fontSize: 12,
          color: '#6B4A1A',
          fontFamily: 'var(--mono)',
          flexShrink: 0,
        }}>
          <strong style={{ textTransform: 'uppercase', fontSize: 10, letterSpacing: '0.06em' }}>Missing data for {selectedYear}</strong>
          <span style={{ marginLeft: 8 }}>
            {missingCauses.map(c => causeLabels[c]).join(' · ')}
          </span>
        </div>
      )}

      {/* Legend strip */}
      <div style={{ padding: '12px 40px', display: 'flex', alignItems: 'center', gap: 24, borderBottom: '1px solid var(--rule)', background: 'var(--paper)', flexShrink: 0, flexWrap: 'wrap' }}>
        <span className="eyebrow">Cell scale · ratio to state avg</span>
        <div style={{ display: 'flex', alignItems: 'center', gap: 4, flexWrap: 'wrap' }}>
          {[
            [D_HIGH_TINT, D_HIGH, '> 1.4×'],
            ['#FBF0EE', '#C85A4E', '1.2–1.4×'],
            ['#FDF6EE', D_MID, '0.8–1.2×'],
            ['#ECF3EB', '#4A7348', '0.6–0.8×'],
            [D_LOW_TINT, D_LOW, '< 0.6×'],
          ].map(([bg, fg, label]) => (
            <span key={label} style={{ display: 'inline-flex', alignItems: 'center', gap: 4, marginRight: 8 }}>
              <span style={{ width: 14, height: 10, background: bg, border: `1px solid ${fg}`, borderLeft: `3px solid ${fg}` }} />
              <span className="num" style={{ fontSize: 10, color: 'var(--ink-3)' }}>{label}</span>
            </span>
          ))}
        </div>
        <div style={{ flex: 1 }} />
        <span className="caption" style={{ color: 'var(--ink-4)' }}>Trend arrows: 2015–2022 regression slope</span>
        <button
          className={`seg-btn${showProvider ? ' active' : ''}`}
          style={{ marginLeft: 16 }}
          onClick={() => setShowProvider(v => !v)}>
          {showProvider ? 'Hide access columns' : 'Show access columns'}
        </button>
      </div>

      {/* Table */}
      <div style={{ flex: 1, overflow: 'auto' }}>
        <table className="tbl">
          <thead>
            <tr>
              <th className="col-left" onClick={() => handleSort('county')} style={{ textAlign: 'left', paddingLeft: 24, cursor: 'pointer' }}>
                County {sortCol === 'county' ? (sortAsc ? '↑' : '↓') : <span style={{ opacity: 0.25 }}>⇅</span>}
              </th>
              {causes.map(c => (
                <th key={c} title={causeLabels[c]} onClick={() => handleSort(c)}
                  style={{ color: sortCol === c ? INK : undefined, cursor: 'pointer' }}>
                  {SHORT[c]} {sortCol === c ? (sortAsc ? '↑' : '↓') : <span style={{ opacity: 0.2 }}>⇅</span>}
                </th>
              ))}
              {showProvider && PROVIDER_COLS.map((m, i) => (
                <th key={m}
                  style={{
                    borderLeft: i === 0 ? `2px solid ${D_LOW}` : undefined,
                    background: '#F0F6EE', color: D_LOW,
                    cursor: 'pointer',
                  }}
                  title={providerMetricLabels[m]}
                  onClick={() => handleSort(`__prov_${m}`)}>
                  {providerMetricShort[m]}
                  {sortCol === `__prov_${m}` ? (sortAsc ? '↑' : '↓') : <span style={{ opacity: 0.2 }}>⇅</span>}
                </th>
              ))}
              <th>Trend</th>
            </tr>
          </thead>
          <tbody>
            {sorted.map(row => {
              const county = row.county as string;
              return (
                <tr key={county}>
                  {/* County name cell: navigate without pre-selected cause */}
                  <td
                    className="col-left"
                    style={{ cursor: 'pointer' }}
                    onClick={() => navigate(`/county/${encodeURIComponent(county)}`, { state: { fromScorecard: true } })}
                  >
                    <div style={{ display: 'flex', alignItems: 'center', gap: 6 }}>
                      {county}
                      {Number(row['__hpsa']) > 0 && (
                        <span style={{ fontSize: 9, padding: '1px 5px', background: '#F2E4E1', color: D_HIGH, fontFamily: 'var(--mono)', letterSpacing: '0.06em', textTransform: 'uppercase', flexShrink: 0 }}>
                          {Number(row['__hpsa']) === 1 ? 'HPSA' : 'HPSA·P'}
                        </span>
                      )}
                    </div>
                  </td>
                  {causes.map(c => {
                    const ratio = row[c] as number;
                    const pct = ratio > 0 ? ((ratio - 1) * 100) : null;
                    return (
                      <td
                        key={c}
                        title={`${causeLabels[c]} (${selectedYear}): ${pct != null ? `${pct > 0 ? '+' : ''}${pct.toFixed(0)}% vs IL avg` : 'No data'}`}
                        style={{ background: heatBg(ratio), cursor: 'pointer' }}
                        onClick={e => {
                          e.stopPropagation();
                          navigate(`/county/${encodeURIComponent(county)}`, { state: { fromScorecard: true, selectedCause: c } });
                        }}
                      >
                        <div className="h-fill" style={{ color: heatColor(ratio) }}>
                          {pct != null ? (
                            <span>{pct > 0 ? '+' : ''}{pct.toFixed(0)}%
                              <TrendArrow slope={slopeMap[county]?.[c] ?? 0} />
                            </span>
                          ) : '—'}
                        </div>
                      </td>
                    );
                  })}
                  {showProvider && PROVIDER_COLS.map((m, i) => {
                    const val = Number(row[`__prov_${m}`]) || 0;
                    const stateVal = Number(row[`__prov_state_${m}`]) || 0;
                    const inv = providerMetricInverted[m] ?? false;
                    return (
                      <td key={m} style={{
                        background: provHeatBg(val, stateVal, inv),
                        borderLeft: i === 0 ? `2px solid ${D_LOW}` : undefined,
                      }}>
                        <div className="h-fill" style={{ color: provHeatColor(val, stateVal, inv) }}>
                          {val > 0 ? (m === 'hpsa_primary_care_designation' ? val.toFixed(0) : val.toFixed(1)) : '—'}
                        </div>
                      </td>
                    );
                  })}
                  <td>
                    <div className="h-fill">
                      <TrendArrow slope={slopeMap[county]?.['Total_Deaths'] ?? 0} />
                    </div>
                  </td>
                </tr>
              );
            })}
          </tbody>
        </table>
      </div>

      {/* Footer */}
      <div style={{ padding: '10px 24px', borderTop: '1px solid var(--rule)', flexShrink: 0 }}>
        <span className="tiny">{sorted.length} counties · Trend: 2015–2022 linear regression · Data: IDPH Vital Statistics</span>
      </div>
    </div>
  );
};

export default CountyScorecard;
