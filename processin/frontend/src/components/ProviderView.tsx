import { useState, useEffect, useMemo, useCallback, useRef } from 'react';
import { useNavigate } from 'react-router-dom';
import { MapContainer, GeoJSON as LeafletGeoJSON, useMap } from 'react-leaflet';
import L from 'leaflet';
import 'leaflet/dist/leaflet.css';
import axios from 'axios';
import type { FeatureCollection, Feature } from 'geojson';
import { EXCLUDED_COUNTIES, API_BASE, IDPH_DISTRICTS, causeLabels, causes } from '../data/constants';
import { countyPop2020 } from '../data/population';
import type { SharedState } from '../App';

interface ProviderRate { County: string; [key: string]: number | string; }
interface Props { shared: SharedState; setShared: (s: SharedState) => void; }

// Brief description of which specialist types are counted for each cause
const CAUSE_SPECIALIST_DESC: Record<string, string> = {
  Chronic_Lower_Respiratory_Diseases: 'Pulmonary & critical care specialists',
  Diseases_of_Heart: 'Cardiologists & thoracic surgeons',
  Malignant_Neoplasms: 'Medical, radiation & surgical oncologists',
  Cerebrovascular_Diseases: 'Neurologists & vascular specialists',
  Alzheimers_Disease: 'Neurologists & geriatric psychiatrists',
  Diabetes_Mellitus: 'Endocrinologists',
  Nephritis_Nephrotic_Syndrome_Nephrosis: 'Nephrologists',
  Influenza_and_Pneumonia: 'Infectious disease & pulmonary specialists',
  Septicemia: 'Infectious disease & critical care specialists',
  COVID_19: 'Infectious disease, critical care & pulmonary specialists',
  Chronic_Liver_Disease_Cirrhosis: 'Gastroenterologists & transplant surgeons',
  Intentional_Self_Harm: 'Psychiatrists, psychologists & counselors',
  Accidents: 'Emergency medicine & trauma surgeons',
  Total_Deaths: 'Primary care physicians (family medicine, internal medicine)',
  All_Other_Causes: 'Primary care physicians (family medicine, internal medicine)',
};

// Access palette: warm red (no access) → orange → light blue → dark blue (high access)
const P_HIGH      = '#1A5276';   // dark blue — > 120% of state avg
const P_HIGH_TINT = '#2E86C1';   // medium blue — 50–120% of state avg
const P_MID_TINT  = '#AED6F1';   // light blue — 25–50% of state avg
const P_LOW_TINT  = '#FAD7A0';   // peach/orange — > 0 but < 25% of state avg
const P_ZERO_TINT = '#F1948A';   // warm red — zero providers recorded
const P_NULL_TINT = '#E0DDD5';   // neutral gray — county not matched
const INK         = '#1C1B18';
const INK_4       = '#9A968C';
const RULE        = '#E6E3DC';

function densityColor(rate: number, stateRate: number): string {
  if (!stateRate) return P_NULL_TINT;
  if (rate === 0) return P_ZERO_TINT;
  const r = rate / stateRate;
  if (r >= 1.2) return P_HIGH_TINT;
  if (r >= 0.5) return P_MID_TINT;
  return P_LOW_TINT;
}

function FitBounds({ geojson }: { geojson: FeatureCollection | null }) {
  const map = useMap();
  const fitted = useRef(false);
  useEffect(() => {
    if (!geojson || fitted.current) return;
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    const bounds = L.geoJSON(geojson as any).getBounds();
    if (bounds.isValid()) { map.fitBounds(bounds, { padding: [12, 12] }); fitted.current = true; }
  }, [geojson, map]);
  return null;
}

const ProviderView = ({ shared, setShared }: Props) => {
  const navigate = useNavigate();
  const { selectedYear, selectedDistrict } = shared;

  // Local cause — auto-syncs from shared.selectedCause when navigating here from another view
  const [cause, setCauseLocal] = useState<string>(
    shared.selectedCause && causes.includes(shared.selectedCause)
      ? shared.selectedCause
      : 'Chronic_Lower_Respiratory_Diseases'
  );

  const [providerData, setProviderData] = useState<ProviderRate[]>([]);
  const [geoData, setGeoData] = useState<FeatureCollection | null>(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const layerStore = useRef<Map<string, { layer: L.Path; feature: Feature }>>(new Map());

  // Propagate local cause change to shared state and fetch new data
  function setCause(c: string) {
    setCauseLocal(c);
    setShared({ ...shared, selectedCause: c });
  }

  // Load GeoJSON once
  useEffect(() => {
    axios.get(`${API_BASE}/geojson`)
      .then(r => setGeoData(r.data))
      .catch(() => setError('Failed to load map geometry.'));
  }, []);

  // Sync when another view changes shared.selectedCause
  useEffect(() => {
    if (shared.selectedCause && causes.includes(shared.selectedCause) && shared.selectedCause !== cause) {
      setCauseLocal(shared.selectedCause);
    }
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [shared.selectedCause]);

  // Fetch provider data whenever cause changes
  useEffect(() => {
    setLoading(true);
    setProviderData([]);
    axios.get(`${API_BASE}/providers`, { params: { cause } })
      .then(r => { setProviderData(r.data); setError(null); })
      .catch(() => setError(`Failed to load provider data for "${causeLabels[cause] ?? cause}".`))
      .finally(() => setLoading(false));
  }, [cause]);

  useEffect(() => { layerStore.current.clear(); }, [selectedYear, cause]);

  const stateRate = useMemo(() => {
    const row = providerData.find(d => d.County === 'ILLINOIS');
    return Number(row?.[selectedYear.toString()]) || 0;
  }, [providerData, selectedYear]);

  const rateMap = useMemo<Record<string, number>>(() => {
    const m: Record<string, number> = {};
    providerData.forEach(d => {
      if (!EXCLUDED_COUNTIES.includes(d.County))
        m[d.County.toLowerCase()] = Number(d[selectedYear.toString()]) || 0;
    });
    return m;
  }, [providerData, selectedYear]);

  const nameMap = useMemo<Record<string, string>>(() => {
    const m: Record<string, string> = {};
    providerData.forEach(d => {
      if (!EXCLUDED_COUNTIES.includes(d.County)) m[d.County.toLowerCase()] = d.County;
    });
    return m;
  }, [providerData]);

  // Counties with zero providers — distinct from "low but nonzero"
  const desertCounties = useMemo<Set<string>>(() => {
    const s = new Set<string>();
    providerData.forEach(d => {
      if (EXCLUDED_COUNTIES.includes(d.County)) return;
      if (Number(d[selectedYear.toString()]) === 0) s.add(d.County.toLowerCase());
    });
    return s;
  }, [providerData, selectedYear]);

  const districtSet = useMemo<Set<string> | null>(() => {
    if (!selectedDistrict) return null;
    return new Set(
      (IDPH_DISTRICTS[selectedDistrict as number]?.counties ?? []).map((n: string) => n.toLowerCase())
    );
  }, [selectedDistrict]);

  // Sorted ranking for sidebar
  const ranked = useMemo(() => {
    return Object.entries(rateMap)
      .filter(([k]) => !EXCLUDED_COUNTIES.map(s => s.toLowerCase()).includes(k))
      .map(([key, rate]) => ({ name: nameMap[key] || key, rate }))
      .sort((a, b) => a.rate - b.rate)
      .slice(0, 8);
  }, [rateMap, nameMap]);

  const getStyle = useCallback((feature: Feature | undefined): L.PathOptions => {
    if (!feature) return {};
    const key = ((feature.properties?.COUNTY_NAM as string) || '').toLowerCase();
    const rate = rateMap[key] ?? -1;
    const isZero = desertCounties.has(key);
    const isDimmed = districtSet != null && !districtSet.has(key);
    const fill = rate < 0 ? P_NULL_TINT : densityColor(rate, stateRate);
    return {
      fillColor: fill,
      fillOpacity: isDimmed ? 0.2 : 0.92,
      color: isZero ? '#C0392B' : '#B0A99A',
      weight: isZero ? 1.8 : 0.6,
      dashArray: isZero ? '5 3' : undefined,
    };
  }, [rateMap, stateRate, desertCounties, districtSet]);

  const escHtml = (s: string) =>
    s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');

  const onEachFeature = useCallback((feature: Feature, layer: L.Layer) => {
    const key = ((feature.properties?.COUNTY_NAM as string) || '').toLowerCase();
    const titleName = nameMap[key] || (feature.properties?.COUNTY_NAM as string) || '';
    const safeTitle = escHtml(titleName);
    const rate = rateMap[key] || 0;
    const pop = countyPop2020[titleName as keyof typeof countyPop2020] || 0;
    const rawCount = pop > 0 ? Math.round(rate * pop / 100_000) : 0;
    const ratio = rate && stateRate ? rate / stateRate : 0;
    const isDesert = desertCounties.has(key);

    const ratioStr = ratio > 0
      ? `${ratio >= 1 ? '+' : ''}${((ratio - 1) * 100).toFixed(0)}% vs state`
      : 'No data';
    const ratioColor = ratio >= 1.2 ? P_HIGH : ratio < 0.5 ? '#C0392B' : INK;

    const tooltipHtml = `
      <div style="font-family:'IBM Plex Mono',monospace;font-size:11px;min-width:200px;${isDesert ? 'border-top:3px solid #E74C3C;' : `border-top:3px solid ${P_HIGH};`}">
        <div style="font-family:'Inter Tight',sans-serif;font-size:13px;font-weight:500;color:${INK};margin-bottom:8px;">${safeTitle} County</div>
        <div style="display:flex;justify-content:space-between;gap:16px;margin-bottom:4px;">
          <span style="color:${INK_4}">Providers/100k</span>
          <span style="color:${INK}">${rate > 0 ? rate.toFixed(1) : '—'}</span>
        </div>
        <div style="display:flex;justify-content:space-between;gap:16px;margin-bottom:4px;">
          <span style="color:${INK_4}">Est. count</span>
          <span style="color:${INK}">${rawCount > 0 ? rawCount : '—'}</span>
        </div>
        <div style="display:flex;justify-content:space-between;gap:16px;padding-top:6px;border-top:1px solid ${RULE};">
          <span style="color:${INK_4}">vs state avg</span>
          <span style="color:${ratioColor}">${ratioStr}</span>
        </div>
        ${isDesert ? `<div style="margin-top:6px;padding:3px 7px;background:#FADBD8;font-size:9px;letter-spacing:0.08em;text-transform:uppercase;color:#C0392B;">No NPI-registered specialists</div>` : ''}
        <div style="margin-top:6px;font-size:9px;letter-spacing:0.06em;text-transform:uppercase;color:${INK_4};">Click to drill in →</div>
      </div>
    `;

    (layer as L.Path).bindTooltip(tooltipHtml, { sticky: true, className: 'idph-tip', opacity: 1 });

    const path = layer as L.Path;
    layerStore.current.set(key, { layer: path, feature });

    path.on('mouseover', () => {
      path.setStyle({ weight: 2, fillOpacity: 1 });
      path.bringToFront();
      layerStore.current.forEach((v, k) => {
        if (k !== key) { try { v.layer.setStyle({ fillOpacity: 0.2 }); } catch { /* detached */ } }
      });
    });
    path.on('mouseout', () => {
      path.setStyle(getStyle(feature));
      layerStore.current.forEach((v, k) => {
        if (k !== key) { try { v.layer.setStyle(getStyle(v.feature)); } catch { /* detached */ } }
      });
    });
    path.on('click', () => {
      navigate(`/county/${encodeURIComponent(titleName.replace(/[^a-zA-Z0-9 .\-']/g, ''))}`);
    });
  }, [rateMap, stateRate, nameMap, desertCounties, navigate, getStyle]);

  const specialistDesc = CAUSE_SPECIALIST_DESC[cause] ?? 'Relevant specialists';

  return (
    <div className="view fade-in" style={{ display: 'flex', flexDirection: 'column', overflow: 'hidden' }}>
      <div className="view-head">
        <div className="titles">
          <div className="eyebrow eyebrow-ink">Specialist density · 102 counties</div>
          <h1 className="h-display" style={{ marginTop: 8 }}>
            {causeLabels[cause] ?? cause} — provider access
          </h1>
          <p className="body" style={{ marginTop: 10, maxWidth: 540, color: 'var(--ink-3)' }}>
            {specialistDesc} per 100,000 residents by county. Dashed red border = specialist desert (&lt; 50% of state average). Hover for detail; click to drill in.
          </p>
        </div>
        <div className="ix">
          <div className="field">
            <div className="field-label">Cause of death</div>
            <select className="sel" style={{ width: 260 }}
              value={cause}
              onChange={e => setCause(e.target.value)}>
              {causes.map(c => (
                <option key={c} value={c}>{causeLabels[c] ?? c}</option>
              ))}
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

      <div style={{ display: 'grid', gridTemplateColumns: '1fr 300px', flex: 1, overflow: 'hidden', position: 'relative' }}>

        {/* Map */}
        <div style={{ position: 'relative', overflow: 'hidden' }}>
          {loading && (
            <div className="loading-center" style={{ position: 'absolute', inset: 0, zIndex: 800, background: 'rgba(251,250,247,0.7)' }}>
              <div className="spinner" /><span>Loading data…</span>
            </div>
          )}
          <MapContainer center={[40.0, -89.3]} zoom={6}
            style={{ height: '100%', width: '100%' }}
            zoomControl scrollWheelZoom attributionControl={false}>
            {geoData && (
              <LeafletGeoJSON
                key={`providers-${cause}-${selectedYear}`}
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
              { c: P_HIGH_TINT, border: P_HIGH,    label: 'High access',    sub: '≥ 120% of state avg' },
              { c: P_MID_TINT,  border: '#5DADE2',  label: 'Adequate',       sub: '50–120% of state avg' },
              { c: P_LOW_TINT,  border: '#E59866',  label: 'Low access',     sub: '> 0, below 50% avg' },
              { c: P_ZERO_TINT, border: '#C0392B',  label: 'No specialists', sub: '0 in NPI registry' },
              { c: P_NULL_TINT, border: '#C4C0B6',  label: 'No data',        sub: 'County not matched' },
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
            <div className="eyebrow" style={{ marginBottom: 8 }}>Zero-provider border</div>
            <div style={{ display: 'flex', alignItems: 'center', gap: 8, marginBottom: 8 }}>
              <div style={{ width: 24, height: 2, borderTop: '2px dashed #C0392B' }} />
              <span className="caption">No NPI-registered specialists</span>
            </div>
            <p className="caption" style={{ color: 'var(--ink-4)' }}>
              State avg {selectedYear}: <strong>{stateRate.toFixed(1)}</strong> specialists/100k
            </p>
          </div>

          <div>
            <div className="eyebrow" style={{ marginBottom: 10 }}>
              Lowest access counties
              {ranked.length > 0 && (
                <span className="chip priority" style={{ marginLeft: 8 }}>{ranked.length}</span>
              )}
            </div>
            {loading ? (
              <p className="caption" style={{ color: 'var(--ink-4)' }}>Loading…</p>
            ) : ranked.length === 0 ? (
              <p className="caption" style={{ color: 'var(--ink-4)' }}>No data loaded.</p>
            ) : (
              <div style={{ display: 'flex', flexDirection: 'column', gap: 0 }}>
                {ranked.map((c, i) => (
                  <div key={c.name}
                    style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', padding: '8px 0', borderTop: i === 0 ? 'none' : `1px solid ${RULE}`, cursor: 'pointer' }}
                    onClick={() => navigate(`/county/${encodeURIComponent(c.name)}`)}>
                    <span style={{ fontSize: 13, color: 'var(--ink)' }}>{c.name}</span>
                    <span className="num" style={{ fontSize: 11, color: c.rate === 0 ? '#C0392B' : '#E59866' }}>
                      {c.rate === 0 ? 'none' : c.rate.toFixed(1)}
                    </span>
                  </div>
                ))}
              </div>
            )}
          </div>

          <div style={{ marginTop: 'auto' }}>
            <span className="tiny">Source · CMS NPPES NPI Registry · Providers/100k (2020 Census) · Snapshot Feb 2026</span>
          </div>
        </div>
      </div>
    </div>
  );
};

export default ProviderView;
