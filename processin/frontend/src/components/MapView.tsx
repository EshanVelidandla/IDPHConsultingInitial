import { useState, useEffect, useMemo } from 'react';
import { useNavigate } from 'react-router-dom';
import { MapContainer, TileLayer, GeoJSON, useMap } from 'react-leaflet';
import {
  FormControl, InputLabel, Select, MenuItem, CircularProgress,
  Alert, Box, Slider, Typography, Autocomplete, TextField,
} from '@mui/material';
import {
  BarChart, Bar, XAxis, YAxis, Tooltip as RechartsTip, ResponsiveContainer, Cell,
} from 'recharts';
import axios from 'axios';
import L from 'leaflet';
import { Feature, Geometry } from 'geojson';
import 'leaflet/dist/leaflet.css';
import './MapView.css';
import icon from 'leaflet/dist/images/marker-icon.png';
import iconShadow from 'leaflet/dist/images/marker-shadow.png';
import {
  causeLabels, causes, countyCodeToName, IDPH_DISTRICTS, API_BASE, calcSlope,
} from '../data/constants';

const DefaultIcon = L.icon({ iconUrl: icon, shadowUrl: iconShadow, iconSize: [25, 41], iconAnchor: [12, 41] });
L.Marker.prototype.options.icon = DefaultIcon;

interface DeathRate { County: string; [key: string]: number | string; }
interface CountyProps { FIPS_CO: number; COUNTY_NAM: string; DISTRICT: number; [key: string]: any; }

const YEAR_MIN = 2009;
const YEAR_MAX = 2022;
const YEAR_MARKS = [2009, 2012, 2015, 2018, 2022].map(y => ({ value: y, label: String(y) }));
const illinoisBounds: L.LatLngBoundsExpression = [[36.9701, -91.513], [42.5083, -87.0199]];
const MONO: React.CSSProperties = { fontFamily: "'IBM Plex Mono', monospace" };

const LEGEND_ITEMS = [
  { color: '#EF5350', label: 'High', sub: '>20% above avg' },
  { color: '#FFA726', label: 'Near Average', sub: '±20% of avg' },
  { color: '#66BB6A', label: 'Low', sub: '>20% below avg' },
  { color: '#9E9E9E', label: 'Suppressed', sub: 'Count < 5 or no data' },
];

const countyNames = Object.values(countyCodeToName).sort();

/** Flies the map to a county centroid by computing it from GeoJSON features. */
function FlyToCounty({ target, geoJSONData }: { target: string | null; geoJSONData: any }) {
  const map = useMap();
  useEffect(() => {
    if (!target || !geoJSONData) return;
    const feature = geoJSONData.features.find(
      (f: any) => countyCodeToName[f.properties.FIPS_CO?.toString().padStart(3, '0')] === target
    );
    if (!feature) return;
    const layer = L.geoJSON(feature);
    const bounds = layer.getBounds();
    map.flyToBounds(bounds, { padding: [40, 40], duration: 0.8 });
  }, [target, geoJSONData, map]);
  return null;
}

const MapView = () => {
  const navigate = useNavigate();
  const [selectedCause, setSelectedCause] = useState('');
  const [selectedYear, setSelectedYear] = useState(2022);
  const [selectedDistrict, setSelectedDistrict] = useState<number | ''>('');
  const [searchTarget, setSearchTarget] = useState<string | null>(null);
  const [countyData, setCountyData] = useState<DeathRate[]>([]);
  const [geoJSONData, setGeoJSONData] = useState<any>(null);
  const [hoveredCounty, setHoveredCounty] = useState<string | null>(null);
  const [countyRates, setCountyRates] = useState<any[]>([]);
  const [hoveredStats, setHoveredStats] = useState<{ rate: number; stateRate: number } | null>(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    axios.get(`${API_BASE}/geojson`)
      .then(r => setGeoJSONData(r.data))
      .catch(() => setError('Failed to load map data. Ensure the backend is running.'));
  }, []);

  useEffect(() => {
    if (!selectedCause) return;
    setLoading(true);
    axios.get(`${API_BASE}/death_rates?cause=${selectedCause}`)
      .then(r => { setCountyData(r.data); setError(null); })
      .catch(() => setError('Failed to load death rate data.'))
      .finally(() => setLoading(false));
  }, [selectedCause]);

  /** Counties flagged as priority: above 120% of state avg AND worsening slope */
  const priorityCounties = useMemo<Set<string>>(() => {
    if (!countyData.length || !selectedCause) return new Set();
    const stateRow = countyData.find(d => d.County === 'ILLINOIS');
    if (!stateRow) return new Set();
    const latestYear = Object.keys(stateRow).filter(k => k !== 'County' && k !== '2008').sort().pop() ?? '2022';
    const stateRate = Number(stateRow[latestYear]);
    const set = new Set<string>();
    countyData.forEach(d => {
      if (['ILLINOIS', 'Chicago', 'Suburban Cook'].includes(d.County)) return;
      const rate = Number(d[latestYear]);
      if (!rate) return;
      if (rate > stateRate * 1.2 && calcSlope(d as Record<string, number | string>, 2015, 2022) > 0) {
        set.add(d.County);
      }
    });
    return set;
  }, [countyData, selectedCause]);

  const districtCountySet = useMemo<Set<string>>(() => {
    if (!selectedDistrict) return new Set();
    const names = IDPH_DISTRICTS[selectedDistrict as number]?.counties ?? [];
    return new Set(names);
  }, [selectedDistrict]);

  const getCountyColor = (feature: Feature<Geometry, CountyProps>): string => {
    if (!selectedCause || !countyData.length) return '#CCCCCC';
    const fipsCode = feature.properties.FIPS_CO?.toString().padStart(3, '0');
    const countyName = countyCodeToName[fipsCode];
    if (!countyName) return '#CCCCCC';

    if (selectedDistrict && !districtCountySet.has(countyName)) return '#D6DDE6';

    const countyStats = countyData.find(d => d.County === countyName);
    if (!countyStats) return '#CCCCCC';
    const rate = Number(countyStats[selectedYear.toString()]);
    if (!rate) return '#9E9E9E';
    const stateRate = Number(countyData.find(d => d.County === 'ILLINOIS')?.[selectedYear.toString()]);
    if (!stateRate) return '#CCCCCC';
    if (rate > stateRate * 1.2) return '#EF5350';
    if (rate < stateRate * 0.8) return '#66BB6A';
    return '#FFA726';
  };

  const style = (feature: Feature<Geometry, CountyProps> | undefined): L.PathOptions => {
    if (!feature) return { fillColor: '#CCCCCC', weight: 1, opacity: 1, color: 'white', fillOpacity: 0.75 };
    const fipsCode = feature.properties.FIPS_CO?.toString().padStart(3, '0');
    const countyName = countyCodeToName[fipsCode];
    const isPriority = selectedCause && countyName && priorityCounties.has(countyName);
    const dimmed = selectedDistrict && countyName && !districtCountySet.has(countyName);
    return {
      fillColor: getCountyColor(feature),
      weight: isPriority ? 2.5 : 1,
      opacity: 1,
      color: isPriority ? '#B71C1C' : 'white',
      dashArray: isPriority ? '6 3' : undefined,
      fillOpacity: dimmed ? 0.25 : 0.75,
    };
  };

  const onEachFeature = (feature: Feature<Geometry, CountyProps>, layer: L.Layer) => {
    if (!feature.properties) return;
    const fipsCode = feature.properties.FIPS_CO?.toString().padStart(3, '0');
    const countyName = countyCodeToName[fipsCode];
    if (!countyName) return;

    layer.on({
      mouseover: () => {
        if (layer instanceof L.Path) layer.setStyle({ weight: 2.5, fillOpacity: 0.95 });
        setHoveredCounty(countyName);
        if (selectedCause && countyData.length) {
          const countyStats = countyData.find(d => d.County === countyName);
          const stateStats = countyData.find(d => d.County === 'ILLINOIS');
          if (countyStats) {
            const years = Object.keys(countyStats).filter(k => k !== 'County' && k !== '2008').sort();
            setCountyRates(years.map(year => ({
              year,
              County: Number(countyStats[year]) > 0 ? Number(countyStats[year]) : null,
              State: Number(stateStats?.[year]) > 0 ? Number(stateStats?.[year]) : null,
            })));
            setHoveredStats({
              rate: Number(countyStats[selectedYear.toString()]) || 0,
              stateRate: Number(stateStats?.[selectedYear.toString()]) || 0,
            });
          }
        }
      },
      mouseout: () => {
        if (layer instanceof L.Path) layer.setStyle({ weight: 1, fillOpacity: 0.75 });
        setHoveredCounty(null);
        setCountyRates([]);
        setHoveredStats(null);
      },
      click: () => {
        if (countyName) navigate(`/county/${encodeURIComponent(countyName)}`);
      },
    });
  };

  const pctDiff = hoveredStats && hoveredStats.stateRate > 0
    ? ((hoveredStats.rate - hoveredStats.stateRate) / hoveredStats.stateRate) * 100
    : null;

  const isPriorityHovered = hoveredCounty ? priorityCounties.has(hoveredCounty) : false;

  if (!geoJSONData && loading) return (
    <Box sx={{ display: 'flex', alignItems: 'center', justifyContent: 'center', height: '100%' }}>
      <CircularProgress sx={{ color: '#1565C0' }} />
    </Box>
  );

  return (
    <Box sx={{ position: 'relative', height: '100%', overflow: 'hidden' }}>

      {/* Top controls */}
      <Box sx={{
        position: 'absolute', top: 14, left: 14, right: 14, zIndex: 1000,
        display: 'flex', gap: 1.5, alignItems: 'flex-end', pointerEvents: 'none', flexWrap: 'wrap',
      }}>
        {/* Cause */}
        <Box sx={{ pointerEvents: 'all', bgcolor: 'white', borderRadius: '6px', boxShadow: '0 2px 12px rgba(0,0,0,0.12)', p: 1.5, minWidth: 260 }}>
          <FormControl fullWidth size="small">
            <InputLabel sx={{ fontFamily: "'IBM Plex Sans', sans-serif", fontSize: 13 }}>Cause of Death</InputLabel>
            <Select value={selectedCause} label="Cause of Death" onChange={e => setSelectedCause(e.target.value)} disabled={loading}
              sx={{ fontFamily: "'IBM Plex Sans', sans-serif", fontSize: 13 }}>
              {causes.map(c => (
                <MenuItem key={c} value={c} sx={{ fontSize: 13, fontFamily: "'IBM Plex Sans', sans-serif" }}>{causeLabels[c]}</MenuItem>
              ))}
            </Select>
          </FormControl>
        </Box>

        {/* Year slider */}
        {selectedCause && (
          <Box sx={{ pointerEvents: 'all', bgcolor: 'white', borderRadius: '6px', boxShadow: '0 2px 12px rgba(0,0,0,0.12)', px: 2.5, pt: 1.5, pb: 0.5, minWidth: 290 }}>
            <Typography sx={{ fontSize: 10, color: '#546E7A', ...MONO, letterSpacing: '0.08em', mb: 0.25 }}>
              YEAR &nbsp;·&nbsp; {selectedYear}
            </Typography>
            <Slider value={selectedYear} min={YEAR_MIN} max={YEAR_MAX} step={1} marks={YEAR_MARKS}
              onChange={(_, v) => setSelectedYear(v as number)}
              sx={{
                color: '#1565C0',
                '& .MuiSlider-markLabel': { fontSize: 9, fontFamily: "'IBM Plex Mono', monospace", color: '#90A4AE' },
                '& .MuiSlider-thumb': { width: 13, height: 13 },
                '& .MuiSlider-rail': { opacity: 0.3 },
                mb: 0.5,
              }}
            />
          </Box>
        )}

        {/* District filter */}
        <Box sx={{ pointerEvents: 'all', bgcolor: 'white', borderRadius: '6px', boxShadow: '0 2px 12px rgba(0,0,0,0.12)', p: 1.5, minWidth: 200 }}>
          <FormControl fullWidth size="small">
            <InputLabel sx={{ fontFamily: "'IBM Plex Sans', sans-serif", fontSize: 13 }}>IDPH District</InputLabel>
            <Select value={selectedDistrict} label="IDPH District" onChange={e => setSelectedDistrict(e.target.value as number | '')}
              sx={{ fontFamily: "'IBM Plex Sans', sans-serif", fontSize: 13 }}>
              <MenuItem value="" sx={{ fontSize: 13 }}>All Districts</MenuItem>
              {Object.entries(IDPH_DISTRICTS).map(([num, { name }]) => (
                <MenuItem key={num} value={Number(num)} sx={{ fontSize: 12 }}>{name}</MenuItem>
              ))}
            </Select>
          </FormControl>
        </Box>

        {/* County search */}
        <Box sx={{ pointerEvents: 'all', bgcolor: 'white', borderRadius: '6px', boxShadow: '0 2px 12px rgba(0,0,0,0.12)', minWidth: 200 }}>
          <Autocomplete
            options={countyNames}
            size="small"
            onChange={(_, value) => setSearchTarget(value)}
            renderInput={params => (
              <TextField {...params} label="Jump to county" sx={{ '& .MuiInputBase-root': { fontFamily: "'IBM Plex Sans', sans-serif", fontSize: 13 } }} />
            )}
          />
        </Box>
      </Box>

      {/* Map */}
      {error ? (
        <Alert severity="error" sx={{ m: 2 }}>{error}</Alert>
      ) : (
        <MapContainer center={[40.0, -89.0]} zoom={7} style={{ height: '100%', width: '100%' }}
          maxBounds={illinoisBounds} minZoom={6} maxZoom={12}>
          <TileLayer
            url="https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png"
            attribution='&copy; <a href="https://carto.com/">CARTO</a>'
          />
          {geoJSONData && (
            <GeoJSON
              key={`${selectedCause}-${selectedYear}-${selectedDistrict}-${priorityCounties.size}`}
              data={geoJSONData}
              style={style as any}
              onEachFeature={onEachFeature as any}
            />
          )}
          <FlyToCounty target={searchTarget} geoJSONData={geoJSONData} />
        </MapContainer>
      )}

      {/* Legend */}
      {selectedCause && (
        <Box sx={{
          position: 'absolute', bottom: 20, right: 14, zIndex: 1000,
          bgcolor: 'white', borderRadius: '8px', boxShadow: '0 2px 12px rgba(0,0,0,0.14)', p: 2, minWidth: 200,
        }}>
          <Typography sx={{ fontSize: 10, color: '#546E7A', ...MONO, letterSpacing: '0.08em', fontWeight: 600, mb: 1.5 }}>
            MORTALITY INDEX
          </Typography>
          {LEGEND_ITEMS.map(({ color, label, sub }) => (
            <Box key={label} sx={{ display: 'flex', alignItems: 'flex-start', gap: 1.5, mb: 1.25 }}>
              <Box sx={{ width: 11, height: 11, borderRadius: '2px', bgcolor: color, flexShrink: 0, mt: '2px' }} />
              <Box>
                <Typography sx={{ fontSize: 12, fontWeight: 500, lineHeight: 1.2 }}>{label}</Typography>
                <Typography sx={{ fontSize: 10, color: '#90A4AE', lineHeight: 1.4 }}>{sub}</Typography>
              </Box>
            </Box>
          ))}
          {priorityCounties.size > 0 && (
            <Box sx={{ mt: 1.5, pt: 1.5, borderTop: '1px solid #E0E7EF' }}>
              <Box sx={{ display: 'flex', alignItems: 'center', gap: 1 }}>
                <Box sx={{ width: 18, height: 4, bgcolor: '#B71C1C', borderRadius: '2px',
                  backgroundImage: 'repeating-linear-gradient(90deg, #B71C1C 0px, #B71C1C 4px, transparent 4px, transparent 7px)' }} />
                <Typography sx={{ fontSize: 11, fontWeight: 600, color: '#B71C1C' }}>
                  Priority ({priorityCounties.size})
                </Typography>
              </Box>
              <Typography sx={{ fontSize: 10, color: '#90A4AE', mt: 0.25 }}>
                High rate + worsening trend
              </Typography>
            </Box>
          )}
        </Box>
      )}

      {/* Hover tooltip */}
      {hoveredCounty && selectedCause && (
        <Box sx={{
          position: 'absolute', bottom: 20, left: 14, zIndex: 1000,
          bgcolor: 'white', borderRadius: '8px', boxShadow: '0 4px 20px rgba(0,0,0,0.18)',
          p: 2.25, minWidth: 290, maxWidth: 340,
          borderLeft: isPriorityHovered ? '3px solid #C62828' : 'none',
        }}>
          <Box sx={{ display: 'flex', alignItems: 'center', gap: 1, mb: 0.4 }}>
            <Typography sx={{ fontSize: 15, fontWeight: 600, color: '#0D1B2A' }}>
              {hoveredCounty} County
            </Typography>
            {isPriorityHovered && (
              <Box sx={{ bgcolor: '#FFEBEE', borderRadius: '4px', px: 0.75, py: 0.2 }}>
                <Typography sx={{ fontSize: 10, color: '#C62828', fontWeight: 700 }}>PRIORITY</Typography>
              </Box>
            )}
          </Box>
          <Typography sx={{ fontSize: 11, color: '#546E7A', ...MONO, mb: 1.75 }}>
            {causeLabels[selectedCause]} · {selectedYear}
          </Typography>
          <Typography sx={{ fontSize: 11, color: '#546E7A', mb: 1, fontStyle: 'italic' }}>
            Click county to drill down →
          </Typography>

          {hoveredStats && hoveredStats.rate > 0 ? (
            <Box sx={{ mb: 1.75 }}>
              {[
                { label: 'County rate', value: hoveredStats.rate },
                { label: 'State average', value: hoveredStats.stateRate },
              ].map(({ label, value }) => (
                <Box key={label} sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'baseline', mb: 0.75 }}>
                  <Typography sx={{ fontSize: 12, color: '#546E7A' }}>{label}</Typography>
                  <Typography sx={{ fontSize: 13, fontWeight: 600, ...MONO }}>
                    {value > 0 ? value.toFixed(1) : '—'}
                    <span style={{ fontSize: 10, color: '#90A4AE', fontWeight: 400 }}> /100k</span>
                  </Typography>
                </Box>
              ))}
              {pctDiff !== null && hoveredStats.rate > 0 && (
                <Box sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'baseline', pt: 0.75, borderTop: '1px solid #E0E7EF' }}>
                  <Typography sx={{ fontSize: 12, color: '#546E7A' }}>vs. state</Typography>
                  <Typography sx={{ fontSize: 13, fontWeight: 700, ...MONO,
                    color: pctDiff > 20 ? '#C62828' : pctDiff < -20 ? '#2E7D32' : '#E65100' }}>
                    {pctDiff > 0 ? '+' : ''}{pctDiff.toFixed(1)}%
                  </Typography>
                </Box>
              )}
            </Box>
          ) : (
            <Typography sx={{ fontSize: 12, color: '#9E9E9E', mb: 1.75, fontStyle: 'italic' }}>
              Data suppressed for this year
            </Typography>
          )}

          {countyRates.length > 0 && (
            <Box sx={{ height: 110 }}>
              <ResponsiveContainer width="100%" height="100%">
                <BarChart data={countyRates} margin={{ top: 2, right: 2, left: -24, bottom: 0 }}>
                  <XAxis dataKey="year" tick={{ fontSize: 9, fontFamily: 'IBM Plex Mono' }} interval={2} />
                  <YAxis tick={{ fontSize: 9 }} />
                  <RechartsTip
                    contentStyle={{ fontSize: 11, fontFamily: 'IBM Plex Mono', border: 'none', boxShadow: '0 2px 8px rgba(0,0,0,0.15)' }}
                    cursor={{ fill: 'rgba(21,101,192,0.07)' }}
                  />
                  <Bar dataKey="County" name="County" radius={[2, 2, 0, 0]}>
                    {countyRates.map((entry, i) => (
                      <Cell key={i} fill={entry.year === selectedYear.toString() ? '#1565C0' : '#90CAF9'} />
                    ))}
                  </Bar>
                  <Bar dataKey="State" name="IL Avg" fill="#CFD8DC" radius={[2, 2, 0, 0]} />
                </BarChart>
              </ResponsiveContainer>
            </Box>
          )}
        </Box>
      )}

      {loading && (
        <Box className="map-loading-overlay">
          <CircularProgress sx={{ color: '#1565C0' }} />
        </Box>
      )}
    </Box>
  );
};

export default MapView;
