import { useState, useEffect } from 'react';
import { MapContainer, TileLayer, GeoJSON } from 'react-leaflet';
import { FormControl, InputLabel, Select, MenuItem, CircularProgress, Alert, Paper } from '@mui/material';
import { BarChart, Bar, XAxis, YAxis, Tooltip, Legend, ResponsiveContainer } from 'recharts';
import axios from 'axios';
import L from 'leaflet';
import { Feature, Geometry } from 'geojson';
import 'leaflet/dist/leaflet.css';
import './MapView.css';

// Fix Leaflet default icon issue
import icon from 'leaflet/dist/images/marker-icon.png';
import iconShadow from 'leaflet/dist/images/marker-shadow.png';

let DefaultIcon = L.icon({
  iconUrl: icon,
  shadowUrl: iconShadow,
  iconSize: [25, 41],
  iconAnchor: [12, 41]
});

L.Marker.prototype.options.icon = DefaultIcon;

interface DeathRate {
  County: string;
  [key: string]: number | string;
}

interface CountyProperties {
  OBJECTID: string;
  AREA: number;
  Shape_Length: number;
  Shape_Area: number;
  [key: string]: any;
}

// Illinois FIPS county code to county name mapping
const countyCodeToName: { [key: string]: string } = {
  "001": "Adams",
  "003": "Alexander",
  "005": "Bond",
  "007": "Boone",
  "009": "Brown",
  "011": "Bureau",
  "013": "Calhoun",
  "015": "Carroll",
  "017": "Cass",
  "019": "Champaign",
  "021": "Christian",
  "023": "Clark",
  "025": "Clay",
  "027": "Clinton",
  "029": "Coles",
  "031": "Cook",
  "033": "Crawford",
  "035": "Cumberland",
  "037": "DeKalb",
  "039": "De Witt",
  "041": "Douglas",
  "043": "DuPage",
  "045": "Edgar",
  "047": "Edwards",
  "049": "Effingham",
  "051": "Fayette",
  "053": "Ford",
  "055": "Franklin",
  "057": "Fulton",
  "059": "Gallatin",
  "061": "Greene",
  "063": "Grundy",
  "065": "Hamilton",
  "067": "Hancock",
  "069": "Hardin",
  "071": "Henderson",
  "073": "Henry",
  "075": "Iroquois",
  "077": "Jackson",
  "079": "Jasper",
  "081": "Jefferson",
  "083": "Jersey",
  "085": "Jo Daviess",
  "087": "Johnson",
  "089": "Kane",
  "091": "Kankakee",
  "093": "Kendall",
  "095": "Knox",
  "097": "Lake",
  "099": "La Salle",
  "101": "Lawrence",
  "103": "Lee",
  "105": "Livingston",
  "107": "Logan",
  "109": "McDonough",
  "111": "McHenry",
  "113": "McLean",
  "115": "Macon",
  "117": "Macoupin",
  "119": "Madison",
  "121": "Marion",
  "123": "Marshall",
  "125": "Mason",
  "127": "Massac",
  "129": "Menard",
  "131": "Mercer",
  "133": "Monroe",
  "135": "Montgomery",
  "137": "Morgan",
  "139": "Moultrie",
  "141": "Ogle",
  "143": "Peoria",
  "145": "Perry",
  "147": "Piatt",
  "149": "Pike",
  "151": "Pope",
  "153": "Pulaski",
  "155": "Putnam",
  "157": "Randolph",
  "159": "Richland",
  "161": "Rock Island",
  "163": "St. Clair",
  "165": "Saline",
  "167": "Sangamon",
  "169": "Schuyler",
  "171": "Scott",
  "173": "Shelby",
  "175": "Stark",
  "177": "Stephenson",
  "179": "Tazewell",
  "181": "Union",
  "183": "Vermilion",
  "185": "Wabash",
  "187": "Warren",
  "189": "Washington",
  "191": "Wayne",
  "193": "White",
  "193": "White",
  "195": "Whiteside",
  "197": "Will",
  "199": "Williamson",
  "201": "Winnebago",
  "203": "Woodford"
};

const MapView = () => {
  const [selectedCause, setSelectedCause] = useState<string>('');
  const [countyData, setCountyData] = useState<DeathRate[]>([]);
  const [geoJSONData, setGeoJSONData] = useState<any>(null);
  const [hoveredCounty, setHoveredCounty] = useState<string | null>(null);
  const [countyRates, setCountyRates] = useState<any[]>([]);
  const [loading, setLoading] = useState<boolean>(false);
  const [error, setError] = useState<string | null>(null);

  // Illinois bounds (approximately)
  const illinoisBounds: L.LatLngBoundsExpression = [
    [36.9701, -91.513], // Southwest corner
    [42.5083, -87.0199] // Northeast corner
  ];

  useEffect(() => {
    const fetchGeoJSON = async () => {
      try {
        setLoading(true);
        const response = await axios.get('http://127.0.0.1:8000/geojson');
        setGeoJSONData(response.data);
        setError(null);
      } catch (err) {
        setError('Failed to load map data. Please try again later.');
      } finally {
        setLoading(false);
      }
    };
    fetchGeoJSON();
  }, []);

  useEffect(() => {
    const fetchDeathRates = async () => {
      if (!selectedCause) return;
      try {
        setLoading(true);
        const response = await axios.get(`http://127.0.0.1:8000/death_rates?cause=${selectedCause}`);
        setCountyData(response.data);
        setError(null);
      } catch (err) {
        setError('Failed to load death rate data. Please try again later.');
      } finally {
        setLoading(false);
      }
    };
    fetchDeathRates();
  }, [selectedCause]);

  const causes = [
    'Diseases_of_Heart',
    'Malignant_Neoplasms',
    'Accidents',
    'COVID_19',
    'Cerebrovascular_Diseases',
    'Chronic_Lower_Respiratory_Diseases',
    'Alzheimers_Disease',
    'Diabetes_Mellitus',
    'Nephritis_Nephrotic_Syndrome_Nephrosis',
    'Influenza_and_Pneumonia'
  ];

  const getCountyColor = (feature: Feature<Geometry, CountyProperties>) => {
    if (!selectedCause || !countyData.length) return '#CCCCCC';

    const fipsCode = feature.properties.FIPS_CO?.toString().padStart(3, '0');
    const countyName = countyCodeToName[fipsCode];

    if (!countyName) return '#CCCCCC';

    const countyStats = countyData.find(d => d.County === countyName);
    if (!countyStats) return '#CCCCCC';
    
    const latestYear = Object.keys(countyStats)
      .filter(key => key !== 'County')
      .sort()
      .pop();
    
    if (!latestYear) return '#CCCCCC';
    
    const rate = countyStats[latestYear] as number;
    const stateRate = countyData.find(d => d.County === 'ILLINOIS')?.[latestYear] as number;

    if (!stateRate) return '#CCCCCC';

    // Color based on comparison to state average
    if (rate > stateRate * 1.2) return '#ef5350'; // significantly higher
    if (rate < stateRate * 0.8) return '#66bb6a'; // significantly lower
    return '#ffee58'; // around state average
  };

  const onEachFeature = (feature: Feature<Geometry, CountyProperties>, layer: L.Layer) => {
    if (!feature.properties) return;
    
    const countyCode = feature.properties.COUNTY_NUM;
    const countyName = countyCodeToName[countyCode];

    if (!countyName) return;

    layer.on({
      mouseover: () => {
        if (layer instanceof L.Path) {
          layer.setStyle({
            weight: 2,
            fillOpacity: 0.9
          });
        }
        
        setHoveredCounty(countyName);

        if (selectedCause && countyData.length) {
          const countyStats = countyData.find(d => d.County === countyName);
          if (countyStats) {
            const years = Object.keys(countyStats).filter(key => key !== 'County');
            const rateData = years.map(year => ({
              year,
              countyRate: countyStats[year],
              stateRate: countyData.find(d => d.County === 'ILLINOIS')?.[year]
            }));
            setCountyRates(rateData);
          }
        }
      },
      mouseout: () => {
        if (layer instanceof L.Path) {
          layer.setStyle({
            weight: 1,
            fillOpacity: 0.7
          });
        }
        setHoveredCounty(null);
        setCountyRates([]);
      }
    });
  };

  const style = (feature: Feature<Geometry, CountyProperties> | undefined): L.PathOptions => {
    if (!feature?.properties?.COUNTY) return {
      fillColor: '#CCCCCC',
      weight: 1,
      opacity: 1,
      color: 'white',
      fillOpacity: 0.7
    };

    return {
      fillColor: getCountyColor(feature),
      weight: 1,
      opacity: 1,
      color: 'white',
      fillOpacity: 0.7
    };
  };

  if (loading && !geoJSONData) {
    return (
      <div style={{ display: 'flex', justifyContent: 'center', alignItems: 'center', height: '100vh' }}>
        <CircularProgress />
      </div>
    );
  }

  if (error) {
    return (
      <Alert severity="error" style={{ margin: '20px' }}>
        {error}
      </Alert>
    );
  }

  return (
    <div style={{ height: '80vh', width: '100%' }}>
      {error && (
        <Alert severity="error" style={{ marginBottom: '20px' }}>
          {error}
        </Alert>
      )}
      
      <Paper elevation={3} style={{ height: '100%', position: 'relative' }}>
        {loading && (
          <div className="loading-overlay">
            <CircularProgress />
          </div>
        )}
        
        <FormControl style={{ position: 'absolute', top: 20, right: 20, width: 200, zIndex: 1000, backgroundColor: 'white' }}>
          <InputLabel>Select Cause of Death</InputLabel>
          <Select
            value={selectedCause}
            onChange={(e) => setSelectedCause(e.target.value as string)}
            disabled={loading}
          >
            {causes.map(cause => (
              <MenuItem key={cause} value={cause}>
                {cause.replace(/_/g, ' ')}
              </MenuItem>
            ))}
          </Select>
        </FormControl>

        <MapContainer
          center={[40.0, -89.0]} // Center of Illinois
          zoom={7}
          style={{ height: '100%' }}
          maxBounds={illinoisBounds}
          minZoom={6}
          maxZoom={10}
          boundsOptions={{ padding: [50, 50] }}
        >
          <TileLayer
            url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
            attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
            bounds={illinoisBounds}
          />
          {geoJSONData && (
            <GeoJSON
              data={geoJSONData}
              style={style}
              onEachFeature={onEachFeature}
            />
          )}
        </MapContainer>

        {hoveredCounty && selectedCause && countyRates.length > 0 && (
          <Paper
            elevation={3}
            style={{
              position: 'absolute',
              bottom: 20,
              left: 20,
              padding: 20,
              backgroundColor: 'rgba(255, 255, 255, 0.9)',
              zIndex: 1000,
              maxWidth: 400
            }}
          >
            <h3>{hoveredCounty} County</h3>
            <div style={{ height: 200, width: '100%' }}>
              <ResponsiveContainer>
                <BarChart data={countyRates}>
                  <XAxis dataKey="year" />
                  <YAxis />
                  <Tooltip />
                  <Legend />
                  <Bar dataKey="countyRate" name="County Rate" fill="#8884d8" />
                  <Bar dataKey="stateRate" name="State Rate" fill="#82ca9d" />
                </BarChart>
              </ResponsiveContainer>
            </div>
          </Paper>
        )}
      </Paper>
    </div>
  );
};

export default MapView; 