import { useState, useEffect, useMemo, useCallback, useRef } from 'react';
import { useNavigate } from 'react-router-dom';
import { MapContainer, GeoJSON as LeafletGeoJSON, useMap } from 'react-leaflet';
import L from 'leaflet';
import 'leaflet/dist/leaflet.css';
import './MapView.css';
import axios from 'axios';
import type { FeatureCollection, Feature } from 'geojson';
import { causeLabels, causes, EXCLUDED_COUNTIES, API_BASE, calcSlope, IDPH_DISTRICTS } from '../data/constants';
import type { SharedState } from '../App';

interface Annotation {
  id: string;
  county: string;
  cause: string | null;
  text: string;
  type: string;
  created_by: string;
}

interface DeathRate { County: string; [key: string]: number | string; }
interface MapViewProps { shared: SharedState; setShared: (s: SharedState) => void; }

const D_HIGH = '#B23A2E';
const D_HIGH_TINT = '#F2E4E1';
const D_MID_TINT = '#F5ECDD';
const D_LOW = '#4F7A4D';
const D_LOW_TINT = '#E4ECDF';
const D_NULL_TINT = '#EFEDE7';
const INK = '#1C1B18';
const INK_4 = '#9A968C';
const RULE = '#E6E3DC';

function tileColor(rate: number, stateRate: number): string {
  if (!rate || !stateRate) return D_NULL_TINT;
  const r = rate / stateRate;
  if (r > 1.2) return D_HIGH_TINT;
  if (r < 0.8) return D_LOW_TINT;
  return D_MID_TINT;
}

function FitBounds({ geojson }: { geojson: FeatureCollection | null }) {
  const map = useMap();
  const fitted = useRef(false);
  useEffect(() => {
    if (!geojson || fitted.current) return;
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    const bounds = L.geoJSON(geojson as any).getBounds();
    if (bounds.isValid()) {
      map.fitBounds(bounds, { padding: [12, 12] });
      fitted.current = true;
    }
  }, [geojson, map]);
  return null;
}

const ANNOT_COLORS: Record<string, string> = {
  info: '#1F5C5A',
  warning: '#8B5A1A',
  intervention: '#4F7A4D',
};

const MapView = ({ shared, setShared }: MapViewProps) => {
  const navigate = useNavigate();
  const { selectedCause, selectedYear, selectedDistrict, searchTarget } = shared;

  const [countyData, setCountyData] = useState<DeathRate[]>([]);
  const [geoData, setGeoData] = useState<FeatureCollection | null>(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [annotations, setAnnotations] = useState<Annotation[]>([]);

  useEffect(() => {
    axios.get(`${API_BASE}/geojson`)
      .then(r => setGeoData(r.data))
      .catch(() => setError('Failed to load map geometry.'));
    axios.get(`${API_BASE}/annotations`)
      .then(r => setAnnotations(r.data))
      .catch(() => {});
  }, []);

  useEffect(() => {
    if (!selectedCause) return;
    setLoading(true);
    axios.get(`${API_BASE}/death_rates?cause=${selectedCause}`)
      .then(r => { setCountyData(r.data); setError(null); })
      .catch(() => setError('Failed to load data. Ensure the backend is running at port 8000.'))
      .finally(() => setLoading(false));
  }, [selectedCause]);

  const stateRate = useMemo(() => {
    const row = countyData.find(d => d.County === 'ILLINOIS');
    return Number(row?.[selectedYear.toString()]) || 0;
  }, [countyData, selectedYear]);

  const rateMap = useMemo<Record<string, number>>(() => {
    const m: Record<string, number> = {};
    countyData.forEach(d => {
      if (!EXCLUDED_COUNTIES.includes(d.County))
        m[d.County.toLowerCase()] = Number(d[selectedYear.toString()]) || 0;
    });
    return m;
  }, [countyData, selectedYear]);

  const nameMap = useMemo<Record<string, string>>(() => {
    const m: Record<string, string> = {};
    countyData.forEach(d => {
      if (!EXCLUDED_COUNTIES.includes(d.County)) m[d.County.toLowerCase()] = d.County;
    });
    return m;
  }, [countyData]);

  const priorityCounties = useMemo<Set<string>>(() => {
    if (!countyData.length || !stateRate) return new Set();
    const s = new Set<string>();
    countyData.forEach(d => {
      if (EXCLUDED_COUNTIES.includes(d.County)) return;
      const rate = Number(d[selectedYear.toString()]);
      if (rate > stateRate * 1.2 && calcSlope(d as Record<string, number | string>, 2015, selectedYear) > 0)
        s.add(d.County.toLowerCase());
    });
    return s;
  }, [countyData, stateRate, selectedYear]);

  const districtSet = useMemo<Set<string> | null>(() => {
    if (!selectedDistrict) return null;
    return new Set(
      (IDPH_DISTRICTS[selectedDistrict as number]?.counties ?? []).map((n: string) => n.toLowerCase())
    );
  }, [selectedDistrict]);

  const priorityList = useMemo(() =>
    Array.from(priorityCounties)
      .map(n => ({ name: nameMap[n] || n, rate: rateMap[n] || 0 }))
      .sort((a, b) => b.rate - a.rate)
      .slice(0, 8),
    [priorityCounties, rateMap, nameMap]
  );

  const getStyle = useCallback((feature: Feature | undefined): L.PathOptions => {
    if (!feature) return {};
    const key = ((feature.properties?.COUNTY_NAM as string) || '').toLowerCase();
    const rate = rateMap[key] || 0;
    const fill = selectedCause ? tileColor(rate, stateRate) : D_NULL_TINT;
    const isPriority = priorityCounties.has(key);
    const isDimmed = districtSet != null && !districtSet.has(key);
    return {
      fillColor: fill,
      fillOpacity: isDimmed ? 0.25 : 0.92,
      color: isPriority ? D_HIGH : '#C4C0B6',
      weight: isPriority ? 1.8 : 0.6,
      dashArray: isPriority ? '5 3' : undefined,
    };
  }, [rateMap, stateRate, selectedCause, priorityCounties, districtSet]);

  const onEachFeature = useCallback((feature: Feature, layer: L.Layer) => {
    const key = ((feature.properties?.COUNTY_NAM as string) || '').toLowerCase();
    const titleName = nameMap[key] || (feature.properties?.COUNTY_NAM as string) || '';
    const rate = rateMap[key] || 0;
    const ratio = rate && stateRate ? rate / stateRate : 0;
    const isPriority = priorityCounties.has(key);
    const isSearch = searchTarget.length > 1 && titleName.toLowerCase().startsWith(searchTarget.toLowerCase());
    const row = countyData.find(d => d.County.toLowerCase() === key);
    const slope = row ? calcSlope(row as Record<string, number | string>, 2015, selectedYear) : 0;

    const pctStr = ratio > 0
      ? `${(ratio - 1) * 100 > 0 ? '+' : ''}${((ratio - 1) * 100).toFixed(0)}%`
      : '&mdash;';
    const slopeStr = slope !== 0 ? `${slope > 0 ? '+' : ''}${slope.toFixed(2)}/yr` : '&mdash;';
    const slopeColor = slope > 0 ? D_HIGH : slope < 0 ? D_LOW : INK_4;
    const ratioColor = ratio > 1.2 ? D_HIGH : ratio < 0.8 ? D_LOW : INK;

    const tooltipHtml = `
      <div style="font-family:'IBM Plex Mono',monospace;font-size:11px;min-width:186px;${isPriority ? `border-top:3px solid ${D_HIGH};` : ''}">
        <div style="font-family:'Inter Tight',sans-serif;font-size:13px;font-weight:500;color:${INK};margin-bottom:8px;letter-spacing:-0.01em;">${titleName} County</div>
        ${selectedCause ? `
          <div style="display:flex;justify-content:space-between;gap:16px;margin-bottom:4px;">
            <span style="color:${INK_4}">Rate&nbsp;/&nbsp;100k</span>
            <span style="color:${INK}">${rate > 0 ? rate.toFixed(1) : '&mdash;'}</span>
          </div>
          <div style="display:flex;justify-content:space-between;gap:16px;margin-bottom:4px;">
            <span style="color:${INK_4}">vs.&nbsp;state&nbsp;avg</span>
            <span style="color:${ratioColor}">${pctStr}</span>
          </div>
          <div style="display:flex;justify-content:space-between;gap:16px;padding-top:6px;border-top:1px solid ${RULE};">
            <span style="color:${INK_4}">Slope&nbsp;2015&ndash;${selectedYear}</span>
            <span style="color:${slopeColor}">${slopeStr}</span>
          </div>
          ${isPriority ? `<div style="margin-top:6px;padding:3px 7px;background:${D_HIGH_TINT};font-size:9px;letter-spacing:0.08em;text-transform:uppercase;color:${D_HIGH};">Priority county</div>` : ''}
        ` : `<div style="color:${INK_4}">Select a cause to view data</div>`}
        <div style="margin-top:6px;font-size:9px;letter-spacing:0.06em;text-transform:uppercase;color:${INK_4};">Click to drill in &rarr;</div>
      </div>
    `;

    (layer as L.Path).bindTooltip(tooltipHtml, {
      sticky: true,
      className: 'idph-tip',
      opacity: 1,
    });

    if (isSearch) {
      (layer as L.Path).setStyle({ color: INK, weight: 2.5 });
    }

    const path = layer as L.Path;
    path.on('mouseover', () => {
      path.setStyle({ weight: 2, fillOpacity: 1 });
      path.bringToFront();
    });
    path.on('mouseout', () => {
      path.setStyle(getStyle(feature));
    });
    (layer as L.Path).on('click', () => {
      navigate(`/county/${encodeURIComponent(titleName)}`);
    });
  }, [rateMap, stateRate, nameMap, priorityCounties, selectedCause, selectedYear, countyData, searchTarget, navigate, getStyle]);

  return (
    <div className="view fade-in" style={{ display: 'flex', flexDirection: 'column', overflow: 'hidden' }}>
      {/* View head */}
      <div className="view-head">
        <div className="titles">
          <div className="eyebrow eyebrow-ink">Choropleth · 102 counties</div>
          <h1 className="h-display" style={{ marginTop: 8 }}>Mortality across Illinois</h1>
          <p className="body" style={{ marginTop: 10, maxWidth: 540, color: 'var(--ink-3)' }}>
            County-level age-adjusted death rates per 100,000 residents. Hover for trend; click to drill in.
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
          <div className="field">
            <div className="field-label">District filter</div>
            <select className="sel" style={{ width: 200 }}
              value={selectedDistrict || ''}
              onChange={e => setShared({ ...shared, selectedDistrict: e.target.value ? Number(e.target.value) : '' })}>
              <option value="">All districts</option>
              {Object.entries(IDPH_DISTRICTS).map(([num, { name }]) => (
                <option key={num} value={num}>D{num} · {(name as string).split(' — ')[1]}</option>
              ))}
            </select>
          </div>
          <div className="field">
            <div className="field-label">Search county</div>
            <div style={{ position: 'relative' }}>
              <svg style={{ position: 'absolute', left: 9, top: 9, color: 'var(--ink-4)', pointerEvents: 'none' }}
                width="14" height="14" viewBox="0 0 16 16" fill="none" stroke="currentColor" strokeWidth="1.2">
                <circle cx="7" cy="7" r="4.5" /><path d="M10.5 10.5L14 14" />
              </svg>
              <input className="inp" placeholder="Filter county…" style={{ paddingLeft: 30, width: 180 }}
                value={searchTarget}
                onChange={e => setShared({ ...shared, searchTarget: e.target.value })}
                list="county-search-list" />
              <datalist id="county-search-list">
                {countyData.filter(d => !EXCLUDED_COUNTIES.includes(d.County))
                  .map(d => <option key={d.County} value={d.County} />)}
              </datalist>
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

      {error && (
        <div className="error-banner" style={{ margin: '16px 40px' }}>
          <svg width="14" height="14" viewBox="0 0 16 16" fill="none" stroke="currentColor" strokeWidth="1.2">
            <circle cx="8" cy="8" r="6" /><path d="M8 5v4M8 11v.5" />
          </svg>
          {error}
        </div>
      )}

      {/* Map + sidebar */}
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 300px', flex: 1, overflow: 'hidden', position: 'relative' }}>

        {/* Map column */}
        <div style={{ position: 'relative', overflow: 'hidden' }}>
          {loading && (
            <div className="loading-center" style={{ position: 'absolute', inset: 0, zIndex: 800, background: 'rgba(251,250,247,0.7)' }}>
              <div className="spinner" />
              <span>Loading data…</span>
            </div>
          )}
          <MapContainer
            center={[40.0, -89.3]}
            zoom={6}
            style={{ height: '100%', width: '100%' }}
            zoomControl={true}
            scrollWheelZoom={true}
            attributionControl={false}
          >
            {geoData && (
              <LeafletGeoJSON
                key={`${selectedCause}-${selectedYear}-${searchTarget}`}
                data={geoData}
                style={getStyle as (feature?: Feature) => L.PathOptions}
                onEachFeature={onEachFeature}
              />
            )}
            {geoData && <FitBounds geojson={geoData} />}
          </MapContainer>
        </div>

        {/* Right rail */}
        <div style={{ borderLeft: `1px solid ${RULE}`, padding: '32px 24px', display: 'flex', flexDirection: 'column', gap: 28, overflowY: 'auto' }}>

          <div>
            <div className="eyebrow" style={{ marginBottom: 10 }}>Scale</div>
            {[
              { c: D_HIGH_TINT, border: D_HIGH, label: 'High', sub: '> 20% above state' },
              { c: '#F5ECDD', border: '#C68B3C', label: 'Near average', sub: '± 20% of state' },
              { c: D_LOW_TINT, border: D_LOW, label: 'Low', sub: '> 20% below state' },
              { c: D_NULL_TINT, border: '#C4C0B6', label: 'Suppressed', sub: 'Count < 5 / no data' },
            ].map(({ c, border, label, sub }) => (
              <div key={label} className="legend-row">
                <span className="legend-swatch" style={{ background: c, borderLeft: `3px solid ${border}` }} />
                <div style={{ display: 'flex', justifyContent: 'space-between', flex: 1, alignItems: 'baseline' }}>
                  <span style={{ color: 'var(--ink)', fontSize: 12.5 }}>{label}</span>
                  <span className="num" style={{ fontSize: 10, color: 'var(--ink-4)' }}>{sub}</span>
                </div>
              </div>
            ))}
          </div>

          <div>
            <div className="eyebrow" style={{ marginBottom: 8 }}>Priority border</div>
            <div style={{ display: 'flex', alignItems: 'center', gap: 8, marginBottom: 8 }}>
              <div style={{ width: 24, height: 2, borderTop: `2px dashed ${D_HIGH}` }} />
              <span className="caption">High rate + worsening trend</span>
            </div>
            <p className="caption" style={{ color: 'var(--ink-4)' }}>
              Counties where rate exceeds state average by ≥ 20% and 2015–{selectedYear} slope is positive.
            </p>
          </div>

          <div>
            <div className="eyebrow" style={{ marginBottom: 10 }}>
              Priority counties
              {priorityList.length > 0 && (
                <span className="chip priority" style={{ marginLeft: 8 }}>{priorityList.length}</span>
              )}
            </div>
            {!selectedCause ? (
              <p className="caption" style={{ color: 'var(--ink-4)' }}>Select a cause to surface priority counties.</p>
            ) : priorityList.length === 0 ? (
              <p className="caption" style={{ color: 'var(--ink-4)' }}>No priority counties for {selectedYear}.</p>
            ) : (
              <div style={{ display: 'flex', flexDirection: 'column', gap: 0 }}>
                {priorityList.map((c, i) => (
                  <div key={c.name}
                    style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', padding: '8px 0', borderTop: i === 0 ? 'none' : `1px solid ${RULE}`, cursor: 'pointer' }}
                    onClick={() => navigate(`/county/${encodeURIComponent(c.name)}`)}>
                    <span style={{ fontSize: 13, color: 'var(--ink)' }}>{c.name}</span>
                    <span className="num" style={{ fontSize: 11, color: D_HIGH }}>{c.rate.toFixed(1)}</span>
                  </div>
                ))}
              </div>
            )}
          </div>

          {/* Annotations for current cause */}
          {(() => {
            const relevant = annotations.filter(
              a => a.cause === selectedCause || a.cause === null
            );
            if (!relevant.length) return null;
            return (
              <div>
                <div className="eyebrow" style={{ marginBottom: 10 }}>
                  Annotations
                  <span style={{ marginLeft: 6, fontFamily: 'var(--mono)', fontSize: 10,
                    padding: '1px 6px', background: 'var(--accent-tint)', color: 'var(--accent)' }}>
                    {relevant.length}
                  </span>
                </div>
                <div style={{ display: 'flex', flexDirection: 'column', gap: 0 }}>
                  {relevant.map(a => (
                    <div key={a.id}
                      className={`annotation-pill ${a.type}`}
                      style={{ cursor: 'pointer' }}
                      onClick={() => navigate(`/county/${encodeURIComponent(a.county)}`)}>
                      <div>
                        <div style={{ fontWeight: 500, fontSize: 12.5, color: 'var(--ink)', marginBottom: 2 }}>
                          {a.county}
                        </div>
                        <div style={{ fontSize: 11.5, color: 'var(--ink-3)', lineHeight: 1.4 }}>{a.text}</div>
                        <div style={{ marginTop: 3, fontSize: 10, fontFamily: 'var(--mono)',
                          color: ANNOT_COLORS[a.type] ?? 'var(--ink-4)', textTransform: 'uppercase', letterSpacing: '0.06em' }}>
                          {a.type}
                        </div>
                      </div>
                    </div>
                  ))}
                </div>
              </div>
            );
          })()}

          <div style={{ marginTop: 'auto' }}>
            <span className="tiny">Source · IDPH Vital Statistics · Age-adjusted rates per 100,000</span>
          </div>
        </div>
      </div>
    </div>
  );
};

export default MapView;
