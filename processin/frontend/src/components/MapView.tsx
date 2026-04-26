import { useState, useEffect } from 'react';
import { MapContainer, TileLayer, GeoJSON } from 'react-leaflet';
import {
  FormControl, InputLabel, Select, MenuItem, CircularProgress,
  Alert, Box, Slider, Typography,
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

const DefaultIcon = L.icon({ iconUrl: icon, shadowUrl: iconShadow, iconSize: [25, 41], iconAnchor: [12, 41] });
L.Marker.prototype.options.icon = DefaultIcon;

interface DeathRate {
  County: string;
  [key: string]: number | string;
}

interface CountyProperties {
  FIPS_CO: number;
  COUNTY_NAM: string;
  [key: string]: any;
}

const causeLabels: Record<string, string> = {
  Total_Deaths: 'Total Deaths',
  Diseases_of_Heart: 'Diseases of Heart',
  Malignant_Neoplasms: 'Malignant Neoplasms (Cancer)',
  Accidents: 'Accidents (Unintentional Injuries)',
  COVID_19: 'COVID-19',
  Cerebrovascular_Diseases: 'Cerebrovascular Diseases',
  Chronic_Lower_Respiratory_Diseases: 'Chronic Lower Respiratory Diseases',
  Alzheimers_Disease: "Alzheimer's Disease",
  Diabetes_Mellitus: 'Diabetes Mellitus',
  Nephritis_Nephrotic_Syndrome_Nephrosis: 'Nephritis & Nephrotic Syndrome',
  Influenza_and_Pneumonia: 'Influenza & Pneumonia',
  Septicemia: 'Septicemia',
  Intentional_Self_Harm: 'Intentional Self-Harm (Suicide)',
  Chronic_Liver_Disease_Cirrhosis: 'Chronic Liver Disease & Cirrhosis',
  All_Other_Causes: 'All Other Causes',
};

const causes = Object.keys(causeLabels);

const countyCodeToName: { [key: string]: string } = {
  '001': 'Adams', '003': 'Alexander', '005': 'Bond', '007': 'Boone',
  '009': 'Brown', '011': 'Bureau', '013': 'Calhoun', '015': 'Carroll',
  '017': 'Cass', '019': 'Champaign', '021': 'Christian', '023': 'Clark',
  '025': 'Clay', '027': 'Clinton', '029': 'Coles', '031': 'Cook',
  '033': 'Crawford', '035': 'Cumberland', '037': 'DeKalb', '039': 'DeWitt',
  '041': 'Douglas', '043': 'DuPage', '045': 'Edgar', '047': 'Edwards',
  '049': 'Effingham', '051': 'Fayette', '053': 'Ford', '055': 'Franklin',
  '057': 'Fulton', '059': 'Gallatin', '061': 'Greene', '063': 'Grundy',
  '065': 'Hamilton', '067': 'Hancock', '069': 'Hardin', '071': 'Henderson',
  '073': 'Henry', '075': 'Iroquois', '077': 'Jackson', '079': 'Jasper',
  '081': 'Jefferson', '083': 'Jersey', '085': 'Jo Daviess', '087': 'Johnson',
  '089': 'Kane', '091': 'Kankakee', '093': 'Kendall', '095': 'Knox',
  '097': 'Lake', '099': 'LaSalle', '101': 'Lawrence', '103': 'Lee',
  '105': 'Livingston', '107': 'Logan', '109': 'McDonough', '111': 'McHenry',
  '113': 'McLean', '115': 'Macon', '117': 'Macoupin', '119': 'Madison',
  '121': 'Marion', '123': 'Marshall', '125': 'Mason', '127': 'Massac',
  '129': 'Menard', '131': 'Mercer', '133': 'Monroe', '135': 'Montgomery',
  '137': 'Morgan', '139': 'Moultrie', '141': 'Ogle', '143': 'Peoria',
  '145': 'Perry', '147': 'Piatt', '149': 'Pike', '151': 'Pope',
  '153': 'Pulaski', '155': 'Putnam', '157': 'Randolph', '159': 'Richland',
  '161': 'Rock Island', '163': 'St. Clair', '165': 'Saline', '167': 'Sangamon',
  '169': 'Schuyler', '171': 'Scott', '173': 'Shelby', '175': 'Stark',
  '177': 'Stephenson', '179': 'Tazewell', '181': 'Union', '183': 'Vermilion',
  '185': 'Wabash', '187': 'Warren', '189': 'Washington', '191': 'Wayne',
  '193': 'White', '195': 'Whiteside', '197': 'Will', '199': 'Williamson',
  '201': 'Winnebago', '203': 'Woodford',
};

const LEGEND_ITEMS = [
  { color: '#EF5350', label: 'High', sub: '>20% above state avg' },
  { color: '#FFA726', label: 'Near Average', sub: '±20% of state avg' },
  { color: '#66BB6A', label: 'Low', sub: '>20% below state avg' },
  { color: '#9E9E9E', label: 'Suppressed / No Data', sub: 'Count < 5 or unavailable' },
];

const YEAR_MIN = 2009;
const YEAR_MAX = 2022;
const YEAR_MARKS = [2009, 2012, 2015, 2018, 2022].map(y => ({ value: y, label: String(y) }));

const illinoisBounds: L.LatLngBoundsExpression = [
  [36.9701, -91.513],
  [42.5083, -87.0199],
];

const MONO: React.CSSProperties = { fontFamily: "'IBM Plex Mono', monospace" };

const MapView = () => {
  const [selectedCause, setSelectedCause] = useState('');
  const [selectedYear, setSelectedYear] = useState(2022);
  const [countyData, setCountyData] = useState<DeathRate[]>([]);
  const [geoJSONData, setGeoJSONData] = useState<any>(null);
  const [hoveredCounty, setHoveredCounty] = useState<string | null>(null);
  const [countyRates, setCountyRates] = useState<any[]>([]);
  const [hoveredStats, setHoveredStats] = useState<{ rate: number; stateRate: number } | null>(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    axios.get('http://127.0.0.1:8000/geojson')
      .then(r => setGeoJSONData(r.data))
      .catch(() => setError('Failed to load map data. Ensure the backend is running.'));
  }, []);

  useEffect(() => {
    if (!selectedCause) return;
    setLoading(true);
    axios.get(`http://127.0.0.1:8000/death_rates?cause=${selectedCause}`)
      .then(r => { setCountyData(r.data); setError(null); })
      .catch(() => setError('Failed to load death rate data.'))
      .finally(() => setLoading(false));
  }, [selectedCause]);

  const getCountyColor = (feature: Feature<Geometry, CountyProperties>): string => {
    if (!selectedCause || !countyData.length) return '#CCCCCC';
    const fipsCode = feature.properties.FIPS_CO?.toString().padStart(3, '0');
    const countyName = countyCodeToName[fipsCode];
    if (!countyName) return '#CCCCCC';
    const countyStats = countyData.find(d => d.County === countyName);
    if (!countyStats) return '#CCCCCC';
    const rate = Number(countyStats[selectedYear.toString()]);
    if (!rate || rate === 0) return '#9E9E9E';
    const stateRate = Number(countyData.find(d => d.County === 'ILLINOIS')?.[selectedYear.toString()]);
    if (!stateRate) return '#CCCCCC';
    if (rate > stateRate * 1.2) return '#EF5350';
    if (rate < stateRate * 0.8) return '#66BB6A';
    return '#FFA726';
  };

  const onEachFeature = (feature: Feature<Geometry, CountyProperties>, layer: L.Layer) => {
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
            const years = Object.keys(countyStats)
              .filter(k => k !== 'County' && k !== '2008')
              .sort();
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
    });
  };

  const style = (feature: Feature<Geometry, CountyProperties> | undefined): L.PathOptions => ({
    fillColor: feature ? getCountyColor(feature) : '#CCCCCC',
    weight: 1,
    opacity: 1,
    color: 'white',
    fillOpacity: 0.75,
  });

  const pctDiff = hoveredStats && hoveredStats.stateRate > 0
    ? ((hoveredStats.rate - hoveredStats.stateRate) / hoveredStats.stateRate) * 100
    : null;

  if (!geoJSONData && loading) {
    return (
      <Box sx={{ display: 'flex', alignItems: 'center', justifyContent: 'center', height: '100%' }}>
        <CircularProgress sx={{ color: '#1565C0' }} />
      </Box>
    );
  }

  return (
    <Box sx={{ position: 'relative', height: '100%', overflow: 'hidden' }}>

      {/* Top controls */}
      <Box sx={{
        position: 'absolute', top: 14, left: 14, right: 14, zIndex: 1000,
        display: 'flex', gap: 1.5, alignItems: 'flex-end', pointerEvents: 'none',
      }}>
        {/* Cause selector */}
        <Box sx={{
          pointerEvents: 'all', bgcolor: 'white', borderRadius: '6px',
          boxShadow: '0 2px 12px rgba(0,0,0,0.12)', p: 1.5, minWidth: 280,
        }}>
          <FormControl fullWidth size="small">
            <InputLabel sx={{ fontFamily: "'IBM Plex Sans', sans-serif", fontSize: 13 }}>
              Cause of Death
            </InputLabel>
            <Select
              value={selectedCause}
              label="Cause of Death"
              onChange={e => setSelectedCause(e.target.value)}
              disabled={loading}
              sx={{ fontFamily: "'IBM Plex Sans', sans-serif", fontSize: 13 }}
            >
              {causes.map(c => (
                <MenuItem key={c} value={c} sx={{ fontSize: 13, fontFamily: "'IBM Plex Sans', sans-serif" }}>
                  {causeLabels[c]}
                </MenuItem>
              ))}
            </Select>
          </FormControl>
        </Box>

        {/* Year slider */}
        {selectedCause && (
          <Box sx={{
            pointerEvents: 'all', bgcolor: 'white', borderRadius: '6px',
            boxShadow: '0 2px 12px rgba(0,0,0,0.12)', px: 2.5, pt: 1.5, pb: 0.5, minWidth: 300,
          }}>
            <Typography sx={{ fontSize: 10, color: '#546E7A', ...MONO, letterSpacing: '0.08em', mb: 0.25 }}>
              YEAR &nbsp;·&nbsp; {selectedYear}
            </Typography>
            <Slider
              value={selectedYear}
              min={YEAR_MIN}
              max={YEAR_MAX}
              step={1}
              marks={YEAR_MARKS}
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
      </Box>

      {/* Map */}
      {error ? (
        <Alert severity="error" sx={{ m: 2 }}>{error}</Alert>
      ) : (
        <MapContainer
          center={[40.0, -89.0]}
          zoom={7}
          style={{ height: '100%', width: '100%' }}
          maxBounds={illinoisBounds}
          minZoom={6}
          maxZoom={10}
        >
          <TileLayer
            url="https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png"
            attribution='&copy; <a href="https://carto.com/">CARTO</a>'
          />
          {geoJSONData && (
            <GeoJSON
              key={`${selectedCause}-${selectedYear}`}
              data={geoJSONData}
              style={style as any}
              onEachFeature={onEachFeature as any}
            />
          )}
        </MapContainer>
      )}

      {/* Legend */}
      {selectedCause && (
        <Box sx={{
          position: 'absolute', bottom: 20, right: 14, zIndex: 1000,
          bgcolor: 'white', borderRadius: '8px', boxShadow: '0 2px 12px rgba(0,0,0,0.14)',
          p: 2, minWidth: 196,
        }}>
          <Typography sx={{ fontSize: 10, color: '#546E7A', ...MONO, letterSpacing: '0.08em', fontWeight: 600, mb: 1.5 }}>
            MORTALITY INDEX
          </Typography>
          {LEGEND_ITEMS.map(({ color, label, sub }) => (
            <Box key={label} sx={{ display: 'flex', alignItems: 'flex-start', gap: 1.5, mb: 1.25 }}>
              <Box sx={{ width: 11, height: 11, borderRadius: '2px', bgcolor: color, flexShrink: 0, mt: '2px' }} />
              <Box>
                <Typography sx={{ fontSize: 12, fontWeight: 500, color: '#0D1B2A', lineHeight: 1.2 }}>{label}</Typography>
                <Typography sx={{ fontSize: 10, color: '#90A4AE', lineHeight: 1.4 }}>{sub}</Typography>
              </Box>
            </Box>
          ))}
        </Box>
      )}

      {/* Hover tooltip */}
      {hoveredCounty && selectedCause && (
        <Box sx={{
          position: 'absolute', bottom: 20, left: 14, zIndex: 1000,
          bgcolor: 'white', borderRadius: '8px', boxShadow: '0 4px 20px rgba(0,0,0,0.18)',
          p: 2.25, minWidth: 290, maxWidth: 340,
        }}>
          <Typography sx={{ fontSize: 15, fontWeight: 600, color: '#0D1B2A', mb: 0.4 }}>
            {hoveredCounty} County
          </Typography>
          <Typography sx={{ fontSize: 11, color: '#546E7A', ...MONO, mb: 1.75 }}>
            {causeLabels[selectedCause]} · {selectedYear}
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
                <Box sx={{
                  display: 'flex', justifyContent: 'space-between', alignItems: 'baseline',
                  pt: 0.75, borderTop: '1px solid #E0E7EF',
                }}>
                  <Typography sx={{ fontSize: 12, color: '#546E7A' }}>vs. state</Typography>
                  <Typography sx={{
                    fontSize: 13, fontWeight: 700, ...MONO,
                    color: pctDiff > 20 ? '#C62828' : pctDiff < -20 ? '#2E7D32' : '#E65100',
                  }}>
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
                      <Cell
                        key={i}
                        fill={entry.year === selectedYear.toString() ? '#1565C0' : '#90CAF9'}
                      />
                    ))}
                  </Bar>
                  <Bar dataKey="State" name="IL Avg" fill="#CFD8DC" radius={[2, 2, 0, 0]} />
                </BarChart>
              </ResponsiveContainer>
            </Box>
          )}
        </Box>
      )}

      {/* Loading overlay */}
      {loading && (
        <Box className="map-loading-overlay">
          <CircularProgress sx={{ color: '#1565C0' }} />
        </Box>
      )}
    </Box>
  );
};

export default MapView;
