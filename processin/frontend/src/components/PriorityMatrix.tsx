import { useState, useEffect, useMemo } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Box, Typography, CircularProgress, Alert, FormControl, InputLabel, Select, MenuItem, Slider,
} from '@mui/material';
import {
  ScatterChart, Scatter, XAxis, YAxis, CartesianGrid, Tooltip,
  ResponsiveContainer, ReferenceLine, Cell,
} from 'recharts';
import axios from 'axios';
import { causeLabels, causes, EXCLUDED_COUNTIES, API_BASE, calcSlope } from '../data/constants';

interface DeathRate { County: string; [key: string]: number | string; }

interface CountyPoint {
  county: string;
  x: number;
  y: number;
  rate: number;
  stateRate: number;
}

const YEAR_MIN = 2009;
const YEAR_MAX = 2022;
const YEAR_MARKS = [2009, 2013, 2017, 2022].map(y => ({ value: y, label: String(y) }));

function dotColor(x: number, y: number): string {
  const high = x > 1.0;
  const worsening = y > 0;
  if (high && worsening) return '#EF5350';
  if (!high && worsening) return '#FFA726';
  if (high && !worsening) return '#64B5F6';
  return '#66BB6A';
}

const CustomDot = (props: any) => {
  const { cx, cy, payload } = props;
  const color = dotColor(payload.x, payload.y);
  return (
    <circle
      cx={cx} cy={cy} r={5}
      fill={color} fillOpacity={0.85}
      stroke="white" strokeWidth={1}
      style={{ cursor: 'pointer' }}
    />
  );
};

const CustomTooltip = ({ active, payload, selectedYear }: any) => {
  if (!active || !payload?.length) return null;
  const d: CountyPoint = payload[0].payload;
  const pctVsState = ((d.x - 1) * 100).toFixed(1);
  const slopeSign = d.y > 0 ? '+' : '';
  return (
    <Box sx={{
      bgcolor: 'white', borderRadius: '6px', p: 1.75,
      boxShadow: '0 4px 16px rgba(0,0,0,0.18)', minWidth: 200,
      fontFamily: "'IBM Plex Sans', sans-serif",
    }}>
      <Typography sx={{ fontSize: 14, fontWeight: 600, color: '#0D1B2A', mb: 0.5 }}>
        {d.county} County
      </Typography>
      <Box sx={{ display: 'flex', justifyContent: 'space-between', mb: 0.4 }}>
        <Typography sx={{ fontSize: 12, color: '#546E7A' }}>Rate vs state ({selectedYear})</Typography>
        <Typography sx={{ fontSize: 12, fontWeight: 600, fontFamily: "'IBM Plex Mono', monospace",
          color: Number(pctVsState) > 0 ? '#C62828' : '#2E7D32' }}>
          {Number(pctVsState) > 0 ? '+' : ''}{pctVsState}%
        </Typography>
      </Box>
      <Box sx={{ display: 'flex', justifyContent: 'space-between', mb: 0.4 }}>
        <Typography sx={{ fontSize: 12, color: '#546E7A' }}>Trend slope (2009–{selectedYear})</Typography>
        <Typography sx={{ fontSize: 12, fontWeight: 600, fontFamily: "'IBM Plex Mono', monospace",
          color: d.y > 0 ? '#C62828' : '#2E7D32' }}>
          {slopeSign}{d.y.toFixed(2)}/yr
        </Typography>
      </Box>
      <Box sx={{ display: 'flex', justifyContent: 'space-between' }}>
        <Typography sx={{ fontSize: 12, color: '#546E7A' }}>Rate ({selectedYear})</Typography>
        <Typography sx={{ fontSize: 12, fontWeight: 600, fontFamily: "'IBM Plex Mono', monospace" }}>
          {d.rate.toFixed(1)}<span style={{ fontSize: 10, color: '#90A4AE' }}> /100k</span>
        </Typography>
      </Box>
      <Typography sx={{ fontSize: 10, color: '#90A4AE', mt: 0.75, fontStyle: 'italic' }}>
        Click to view county detail
      </Typography>
    </Box>
  );
};

const PriorityMatrix = () => {
  const navigate = useNavigate();
  const [selectedCause, setSelectedCause] = useState('Diseases_of_Heart');
  const [selectedYear, setSelectedYear] = useState<number>(YEAR_MAX);
  const [deathData, setDeathData] = useState<DeathRate[]>([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    if (!selectedCause) return;
    setLoading(true);
    axios.get(`${API_BASE}/death_rates?cause=${selectedCause}`)
      .then(r => { setDeathData(r.data); setError(null); })
      .catch(() => setError('Failed to load data.'))
      .finally(() => setLoading(false));
  }, [selectedCause]);

  const points = useMemo<CountyPoint[]>(() => {
    if (!deathData.length) return [];
    const stateRow = deathData.find(d => d.County === 'ILLINOIS');
    if (!stateRow) return [];
    const yearKey = selectedYear.toString();
    const stateRate = Number(stateRow[yearKey]);
    if (!stateRate) return [];

    return deathData
      .filter(d => !EXCLUDED_COUNTIES.includes(d.County))
      .map(d => {
        const countyRate = Number(d[yearKey]);
        if (!countyRate) return null;
        const slope = calcSlope(d as Record<string, number | string>, YEAR_MIN, selectedYear);
        return {
          county: d.County,
          x: countyRate / stateRate,
          y: slope,
          rate: countyRate,
          stateRate,
        };
      })
      .filter(Boolean) as CountyPoint[];
  }, [deathData, selectedYear]);

  const priorityCount = useMemo(() => points.filter(p => p.x > 1.2 && p.y > 0).length, [points]);

  return (
    <Box sx={{ height: '100%', display: 'flex', flexDirection: 'column', overflow: 'hidden' }}>
      {/* Header */}
      <Box sx={{ px: 3, py: 2.5, borderBottom: '1px solid #D6E4EF', bgcolor: 'white', flexShrink: 0 }}>
        <Box sx={{ display: 'flex', alignItems: 'flex-start', justifyContent: 'space-between', gap: 3, mb: 2 }}>
          <Box>
            <Typography sx={{ fontSize: 20, fontWeight: 600, color: '#0D1B2A' }}>Priority Matrix</Typography>
            <Typography sx={{ fontSize: 12, color: '#546E7A', mt: 0.25 }}>
              X: rate vs. state avg ({selectedYear}) · Y: slope 2009–{selectedYear} · top-right = highest intervention priority
            </Typography>
          </Box>
          <Box sx={{ display: 'flex', alignItems: 'center', gap: 2, flexShrink: 0 }}>
            {priorityCount > 0 && !loading && (
              <Box sx={{ bgcolor: '#FFEBEE', border: '1px solid #EF9A9A', borderRadius: '6px', px: 1.5, py: 0.75 }}>
                <Typography sx={{ fontSize: 12, color: '#C62828', fontWeight: 600 }}>
                  {priorityCount} priority {priorityCount === 1 ? 'county' : 'counties'}
                </Typography>
              </Box>
            )}
            <Box sx={{ bgcolor: 'white', borderRadius: '6px', boxShadow: '0 1px 4px rgba(0,0,0,0.08)', p: 1.25, minWidth: 260 }}>
              <FormControl fullWidth size="small">
                <InputLabel sx={{ fontFamily: "'IBM Plex Sans', sans-serif", fontSize: 13 }}>Cause</InputLabel>
                <Select
                  value={selectedCause}
                  label="Cause"
                  onChange={e => setSelectedCause(e.target.value)}
                  disabled={loading}
                  sx={{ fontFamily: "'IBM Plex Sans', sans-serif", fontSize: 13 }}
                >
                  {causes.map(c => (
                    <MenuItem key={c} value={c} sx={{ fontSize: 13 }}>{causeLabels[c]}</MenuItem>
                  ))}
                </Select>
              </FormControl>
            </Box>
          </Box>
        </Box>

        {/* Year slider */}
        <Box sx={{ display: 'flex', alignItems: 'center', gap: 4 }}>
          <Box sx={{ flex: 1, maxWidth: 380 }}>
            <Typography sx={{ fontSize: 10, color: '#546E7A', fontFamily: "'IBM Plex Mono', monospace", letterSpacing: '0.08em', mb: 0.5 }}>
              REFERENCE YEAR
            </Typography>
            <Slider
              value={selectedYear}
              min={YEAR_MIN}
              max={YEAR_MAX}
              step={1}
              marks={YEAR_MARKS}
              onChange={(_, v) => setSelectedYear(v as number)}
              valueLabelDisplay="auto"
              sx={{
                color: '#1565C0',
                '& .MuiSlider-markLabel': { fontSize: 9, fontFamily: "'IBM Plex Mono', monospace", color: '#90A4AE' },
                '& .MuiSlider-thumb': { width: 13, height: 13 },
                '& .MuiSlider-rail': { opacity: 0.3 },
              }}
            />
          </Box>

          {/* Quadrant legend */}
          <Box sx={{ display: 'flex', gap: 2, flexWrap: 'wrap', alignItems: 'center' }}>
            {[
              { color: '#EF5350', label: 'High & Worsening' },
              { color: '#FFA726', label: 'Low & Worsening' },
              { color: '#64B5F6', label: 'High & Improving' },
              { color: '#66BB6A', label: 'Low & Improving' },
            ].map(({ color, label }) => (
              <Box key={label} sx={{ display: 'flex', alignItems: 'center', gap: 0.75 }}>
                <Box sx={{ width: 10, height: 10, borderRadius: '50%', bgcolor: color }} />
                <Typography sx={{ fontSize: 11, color: '#546E7A' }}>{label}</Typography>
              </Box>
            ))}
          </Box>
        </Box>
      </Box>

      {error && <Alert severity="error" sx={{ m: 2 }}>{error}</Alert>}

      {/* Chart */}
      <Box sx={{ flex: 1, p: 2, position: 'relative' }}>
        {loading ? (
          <Box sx={{ display: 'flex', alignItems: 'center', justifyContent: 'center', height: '100%' }}>
            <CircularProgress sx={{ color: '#1565C0' }} />
          </Box>
        ) : (
          <ResponsiveContainer width="100%" height="100%">
            <ScatterChart margin={{ top: 20, right: 30, bottom: 40, left: 40 }}>
              <CartesianGrid strokeDasharray="3 3" stroke="#E0E7EF" />
              <XAxis
                type="number"
                dataKey="x"
                name="Rate vs. State"
                domain={['auto', 'auto']}
                tickFormatter={v => `${((v - 1) * 100).toFixed(0)}%`}
                label={{ value: `Rate vs. State Average (${selectedYear})`, position: 'insideBottom', offset: -20, fontSize: 12, fill: '#546E7A' }}
                tick={{ fontSize: 11, fontFamily: 'IBM Plex Mono' }}
              />
              <YAxis
                type="number"
                dataKey="y"
                name="Annual Trend"
                tickFormatter={v => `${v > 0 ? '+' : ''}${v.toFixed(1)}`}
                label={{ value: `Annual Rate Change 2009–${selectedYear} (per 100k/yr)`, angle: -90, position: 'insideLeft', offset: 10, fontSize: 12, fill: '#546E7A' }}
                tick={{ fontSize: 11, fontFamily: 'IBM Plex Mono' }}
              />
              <ReferenceLine x={1} stroke="#546E7A" strokeDasharray="6 4" strokeWidth={1.5} />
              <ReferenceLine y={0} stroke="#546E7A" strokeDasharray="6 4" strokeWidth={1.5} />
              <Tooltip content={<CustomTooltip selectedYear={selectedYear} />} />
              <Scatter
                data={points}
                shape={<CustomDot />}
                onClick={(d: any) => navigate(`/county/${encodeURIComponent(d.county)}`)}
              >
                {points.map((p, i) => (
                  <Cell key={i} fill={dotColor(p.x, p.y)} />
                ))}
              </Scatter>
            </ScatterChart>
          </ResponsiveContainer>
        )}

        {/* Quadrant watermarks */}
        {!loading && points.length > 0 && (
          <>
            <Box sx={{ position: 'absolute', top: 30, right: 40, opacity: 0.25, pointerEvents: 'none' }}>
              <Typography sx={{ fontSize: 11, color: '#C62828', fontWeight: 700, textAlign: 'right' }}>
                HIGH & WORSENING
              </Typography>
            </Box>
            <Box sx={{ position: 'absolute', top: 30, left: 55, opacity: 0.25, pointerEvents: 'none' }}>
              <Typography sx={{ fontSize: 11, color: '#E65100', fontWeight: 700 }}>LOW & WORSENING</Typography>
            </Box>
            <Box sx={{ position: 'absolute', bottom: 60, right: 40, opacity: 0.25, pointerEvents: 'none' }}>
              <Typography sx={{ fontSize: 11, color: '#1565C0', fontWeight: 700, textAlign: 'right' }}>
                HIGH & IMPROVING
              </Typography>
            </Box>
            <Box sx={{ position: 'absolute', bottom: 60, left: 55, opacity: 0.25, pointerEvents: 'none' }}>
              <Typography sx={{ fontSize: 11, color: '#2E7D32', fontWeight: 700 }}>LOW & IMPROVING</Typography>
            </Box>
          </>
        )}
      </Box>
    </Box>
  );
};

export default PriorityMatrix;
