import { useState, useEffect } from 'react';
import {
  Typography, Box, FormControl, InputLabel, Select, MenuItem,
  CircularProgress, Alert, Grid, Paper,
} from '@mui/material';
import {
  LineChart, Line, BarChart, Bar, XAxis, YAxis, CartesianGrid,
  Tooltip, Legend, ResponsiveContainer, PieChart, Pie, Cell,
} from 'recharts';
import axios from 'axios';
import InsertChartIcon from '@mui/icons-material/InsertChart';
import { causeLabels, causes, EXCLUDED_COUNTIES, API_BASE, MONO } from '../data/constants';

interface DeathRate {
  County: string;
  [key: string]: number | string;
}

const EXCLUDED = EXCLUDED_COUNTIES;
const PIE_COLORS = ['#EF5350', '#FF7043', '#FFA726', '#66BB6A', '#42A5F5'];

const cardSx = {
  bgcolor: 'white',
  borderRadius: '8px',
  p: 2.25,
  boxShadow: '0 1px 4px rgba(0,0,0,0.08)',
  height: '100%',
};

const InsightsView = () => {
  const [selectedCause, setSelectedCause] = useState('');
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [deathData, setDeathData] = useState<DeathRate[]>([]);
  const [showBottom, setShowBottom] = useState(false);

  useEffect(() => {
    if (!selectedCause) return;
    setLoading(true);
    axios.get(`${API_BASE}/death_rates?cause=${selectedCause}`)
      .then(r => { setDeathData(r.data); setError(null); })
      .catch(() => setError('Failed to load data. Ensure the backend is running.'))
      .finally(() => setLoading(false));
  }, [selectedCause]);

  const getLatestYear = () => {
    const stateRow = deathData.find(d => d.County === 'ILLINOIS');
    if (!stateRow) return null;
    return Object.keys(stateRow)
      .filter(k => k !== 'County' && k !== '2008')
      .sort()
      .pop() ?? null;
  };

  const getStatewideTrend = () => {
    const stateData = deathData.find(d => d.County === 'ILLINOIS');
    if (!stateData) return [];
    return Object.entries(stateData)
      .filter(([k]) => k !== 'County' && k !== '2008')
      .map(([year, value]) => ({ year, rate: Number(value) > 0 ? Number(value) : null }))
      .sort((a, b) => a.year.localeCompare(b.year));
  };

  const getTopCounties = () => {
    const latestYear = getLatestYear();
    if (!latestYear) return [];
    const sorted = deathData
      .filter(d => !EXCLUDED.includes(d.County))
      .map(d => ({ county: d.County, rate: Number(d[latestYear]) || 0 }))
      .filter(d => d.rate > 0)
      .sort((a, b) => b.rate - a.rate);
    return showBottom ? sorted.slice(-5).reverse() : sorted.slice(0, 5);
  };

  const getRegionalDistribution = () => {
    const latestYear = getLatestYear();
    if (!latestYear) return [];
    const stateRate = Number(deathData.find(d => d.County === 'ILLINOIS')?.[latestYear]);
    const cats: Record<string, number> = {
      'Much Higher (>40%)': 0,
      'Higher (20-40%)': 0,
      'Near Average (±20%)': 0,
      'Lower (20-40%)': 0,
      'Much Lower (>40%)': 0,
    };
    deathData.filter(d => !EXCLUDED.includes(d.County)).forEach(county => {
      const rate = Number(county[latestYear]);
      if (!rate) return;
      const ratio = rate / stateRate;
      if (ratio > 1.4) cats['Much Higher (>40%)']++;
      else if (ratio > 1.2) cats['Higher (20-40%)']++;
      else if (ratio >= 0.8) cats['Near Average (±20%)']++;
      else if (ratio >= 0.6) cats['Lower (20-40%)']++;
      else cats['Much Lower (>40%)']++;
    });
    return Object.entries(cats).map(([name, value]) => ({ name, value })).filter(d => d.value > 0);
  };

  /* Executive stat cards */
  const getHighestCounty = () => {
    const y = getLatestYear();
    if (!y) return null;
    return deathData
      .filter(d => !EXCLUDED.includes(d.County))
      .map(d => ({ county: d.County, rate: Number(d[y]) || 0 }))
      .filter(d => d.rate > 0)
      .sort((a, b) => b.rate - a.rate)[0] ?? null;
  };

  const getLowestCounty = () => {
    const y = getLatestYear();
    if (!y) return null;
    return deathData
      .filter(d => !EXCLUDED.includes(d.County))
      .map(d => ({ county: d.County, rate: Number(d[y]) || 0 }))
      .filter(d => d.rate > 0)
      .sort((a, b) => a.rate - b.rate)[0] ?? null;
  };

  const getStateTrend = () => {
    const stateRow = deathData.find(d => d.County === 'ILLINOIS');
    if (!stateRow) return null;
    const rate2009 = Number(stateRow['2009']);
    const y = getLatestYear();
    const rateLatest = y ? Number(stateRow[y]) : 0;
    if (!rate2009 || !rateLatest) return null;
    return { pct: ((rateLatest - rate2009) / rate2009) * 100, from: rate2009, to: rateLatest };
  };

  const getCountiesAboveAvg = () => {
    const y = getLatestYear();
    if (!y) return null;
    const stateRate = Number(deathData.find(d => d.County === 'ILLINOIS')?.[y]);
    if (!stateRate) return null;
    return deathData
      .filter(d => !EXCLUDED.includes(d.County))
      .filter(d => Number(d[y]) > stateRate).length;
  };

  const highest = getHighestCounty();
  const lowest = getLowestCounty();
  const trend = getStateTrend();
  const aboveAvg = getCountiesAboveAvg();
  const latestYear = getLatestYear();

  const StatCard = ({
    label, accent, children,
  }: { label: string; accent: string; children: React.ReactNode }) => (
    <Paper elevation={0} sx={{ ...cardSx, borderTop: `3px solid ${accent}` }}>
      <Typography sx={{ fontSize: 10, color: '#90A4AE', ...MONO, letterSpacing: '0.08em', mb: 1 }}>
        {label}
      </Typography>
      {children}
    </Paper>
  );

  return (
    <Box sx={{ height: '100%', overflowY: 'auto', p: 2.5 }}>
      {/* Header + selector */}
      <Box sx={{ display: 'flex', alignItems: 'center', gap: 2, mb: 3 }}>
        <Box sx={{ flex: 1 }}>
          <Typography sx={{ fontSize: 20, fontWeight: 600, color: '#0D1B2A', lineHeight: 1 }}>
            Mortality Insights
          </Typography>
          {selectedCause && latestYear && (
            <Typography sx={{ fontSize: 12, color: '#546E7A', mt: 0.5 }}>
              {causeLabels[selectedCause]} · Latest data: {latestYear}
            </Typography>
          )}
        </Box>
        <Box sx={{ bgcolor: 'white', borderRadius: '6px', boxShadow: '0 1px 4px rgba(0,0,0,0.08)', p: 1.5, minWidth: 280 }}>
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
      </Box>

      {error && <Alert severity="error" sx={{ mb: 2 }}>{error}</Alert>}

      {loading ? (
        <Box sx={{ display: 'flex', justifyContent: 'center', pt: 8 }}>
          <CircularProgress sx={{ color: '#1565C0' }} />
        </Box>
      ) : selectedCause && deathData.length ? (
        <>
          {/* Executive summary cards */}
          <Grid container spacing={2} sx={{ mb: 3 }}>
            <Grid item xs={12} sm={6} md={3}>
              <StatCard label="HIGHEST RATE COUNTY" accent="#EF5350">
                <Typography sx={{ fontSize: 18, fontWeight: 700, color: '#C62828', ...MONO }}>
                  {highest ? highest.rate.toFixed(1) : '—'}
                </Typography>
                <Typography sx={{ fontSize: 11, color: '#546E7A', mt: 0.25 }}>
                  per 100k — {highest?.county ?? '—'}
                </Typography>
              </StatCard>
            </Grid>
            <Grid item xs={12} sm={6} md={3}>
              <StatCard label="LOWEST RATE COUNTY" accent="#66BB6A">
                <Typography sx={{ fontSize: 18, fontWeight: 700, color: '#2E7D32', ...MONO }}>
                  {lowest ? lowest.rate.toFixed(1) : '—'}
                </Typography>
                <Typography sx={{ fontSize: 11, color: '#546E7A', mt: 0.25 }}>
                  per 100k — {lowest?.county ?? '—'}
                </Typography>
              </StatCard>
            </Grid>
            <Grid item xs={12} sm={6} md={3}>
              <StatCard label="STATE TREND 2009→2022" accent={trend && trend.pct < 0 ? '#66BB6A' : '#EF5350'}>
                <Typography sx={{
                  fontSize: 18, fontWeight: 700, ...MONO,
                  color: trend ? (trend.pct < 0 ? '#2E7D32' : '#C62828') : '#9E9E9E',
                }}>
                  {trend ? `${trend.pct > 0 ? '+' : ''}${trend.pct.toFixed(1)}%` : '—'}
                </Typography>
                <Typography sx={{ fontSize: 11, color: '#546E7A', mt: 0.25 }}>
                  {trend ? `${trend.from.toFixed(1)} → ${trend.to.toFixed(1)} per 100k` : 'Insufficient data'}
                </Typography>
              </StatCard>
            </Grid>
            <Grid item xs={12} sm={6} md={3}>
              <StatCard label="COUNTIES ABOVE STATE AVG" accent="#FFA726">
                <Typography sx={{ fontSize: 18, fontWeight: 700, color: '#E65100', ...MONO }}>
                  {aboveAvg ?? '—'}<span style={{ fontSize: 13, color: '#90A4AE' }}> / 102</span>
                </Typography>
                <Typography sx={{ fontSize: 11, color: '#546E7A', mt: 0.25 }}>
                  counties with above-avg rate
                </Typography>
              </StatCard>
            </Grid>
          </Grid>

          {/* Statewide trend */}
          <Paper elevation={0} sx={{ ...cardSx, mb: 2.5, height: 'auto' }}>
            <Typography sx={{ fontSize: 13, fontWeight: 600, color: '#0D1B2A', mb: 2 }}>
              Statewide Mortality Rate Over Time
            </Typography>
            <Box sx={{ height: 240 }}>
              <ResponsiveContainer width="100%" height="100%">
                <LineChart data={getStatewideTrend()} margin={{ top: 4, right: 20, left: 0, bottom: 0 }}>
                  <CartesianGrid strokeDasharray="3 3" stroke="#E0E7EF" />
                  <XAxis dataKey="year" tick={{ fontSize: 11, fontFamily: 'IBM Plex Mono' }} />
                  <YAxis
                    tick={{ fontSize: 11 }}
                    label={{ value: 'Rate per 100k', angle: -90, position: 'insideLeft', fontSize: 11, fill: '#90A4AE', dx: -4 }}
                  />
                  <Tooltip
                    contentStyle={{ fontSize: 12, fontFamily: 'IBM Plex Mono', border: 'none', boxShadow: '0 2px 8px rgba(0,0,0,0.12)' }}
                    formatter={(v: any) => [`${Number(v).toFixed(1)} per 100k`, 'IL State Rate']}
                  />
                  <Line
                    type="monotone" dataKey="rate" stroke="#1565C0" strokeWidth={2}
                    dot={{ r: 3, fill: '#1565C0' }} activeDot={{ r: 5 }}
                    connectNulls={false}
                  />
                </LineChart>
              </ResponsiveContainer>
            </Box>
          </Paper>

          {/* Top/Bottom counties + Distribution */}
          <Grid container spacing={2.5}>
            <Grid item xs={12} md={6}>
              <Paper elevation={0} sx={{ ...cardSx, height: 'auto' }}>
                <Box sx={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', mb: 2 }}>
                  <Typography sx={{ fontSize: 13, fontWeight: 600, color: '#0D1B2A' }}>
                    {showBottom ? 'Bottom 5 Counties' : 'Top 5 Counties'} (Latest Year)
                  </Typography>
                  <Box
                    onClick={() => setShowBottom(v => !v)}
                    sx={{
                      fontSize: 11, fontWeight: 600, color: '#1565C0', cursor: 'pointer',
                      border: '1px solid #1565C0', borderRadius: '4px', px: 1.25, py: 0.4,
                      userSelect: 'none',
                      '&:hover': { bgcolor: 'rgba(21,101,192,0.06)' },
                    }}
                  >
                    Show {showBottom ? 'Top 5' : 'Bottom 5'}
                  </Box>
                </Box>
                <Box sx={{ height: 240 }}>
                  <ResponsiveContainer width="100%" height="100%">
                    <BarChart data={getTopCounties()} layout="vertical" margin={{ top: 0, right: 20, left: 0, bottom: 0 }}>
                      <CartesianGrid strokeDasharray="3 3" stroke="#E0E7EF" horizontal={false} />
                      <XAxis type="number" tick={{ fontSize: 10, fontFamily: 'IBM Plex Mono' }} />
                      <YAxis dataKey="county" type="category" tick={{ fontSize: 11 }} width={90} />
                      <Tooltip
                        contentStyle={{ fontSize: 12, fontFamily: 'IBM Plex Mono', border: 'none', boxShadow: '0 2px 8px rgba(0,0,0,0.12)' }}
                        formatter={(v: any) => [`${Number(v).toFixed(1)} per 100k`, 'Rate']}
                      />
                      <Bar dataKey="rate" fill={showBottom ? '#66BB6A' : '#EF5350'} radius={[0, 3, 3, 0]} />
                    </BarChart>
                  </ResponsiveContainer>
                </Box>
              </Paper>
            </Grid>

            <Grid item xs={12} md={6}>
              <Paper elevation={0} sx={{ ...cardSx, height: 'auto' }}>
                <Typography sx={{ fontSize: 13, fontWeight: 600, color: '#0D1B2A', mb: 2 }}>
                  County Distribution vs. State Average
                </Typography>
                <Box sx={{ height: 240 }}>
                  <ResponsiveContainer width="100%" height="100%">
                    <PieChart>
                      <Pie
                        data={getRegionalDistribution()}
                        dataKey="value"
                        nameKey="name"
                        cx="45%"
                        cy="50%"
                        outerRadius={90}
                        innerRadius={40}
                        label={({ percent }) => `${(percent * 100).toFixed(0)}%`}
                        labelLine={false}
                      >
                        {getRegionalDistribution().map((_, i) => (
                          <Cell key={i} fill={PIE_COLORS[i % PIE_COLORS.length]} />
                        ))}
                      </Pie>
                      <Tooltip
                        contentStyle={{ fontSize: 12, border: 'none', boxShadow: '0 2px 8px rgba(0,0,0,0.12)' }}
                        formatter={(v: any) => [`${v} counties`, '']}
                      />
                      <Legend
                        wrapperStyle={{ fontSize: 11, fontFamily: 'IBM Plex Sans, sans-serif' }}
                        iconType="circle"
                        iconSize={8}
                      />
                    </PieChart>
                  </ResponsiveContainer>
                </Box>
              </Paper>
            </Grid>
          </Grid>

          <Typography sx={{ fontSize: 10, color: '#B0BEC5', mt: 3, textAlign: 'center' }}>
            Cook County data represents the combined county total. Chicago and Suburban Cook reported as IDPH subdivisions.
            Cells showing 0.0 represent suppressed data (death count &lt; 5).
          </Typography>
        </>
      ) : (
        <Box sx={{
          display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center',
          height: 300, color: '#90A4AE',
        }}>
          <InsertChartIcon sx={{ fontSize: 40, mb: 1.5, opacity: 0.4 }} />
          <Typography sx={{ fontSize: 14 }}>Select a cause of death to view insights</Typography>
        </Box>
      )}
    </Box>
  );
};

export default InsightsView;
