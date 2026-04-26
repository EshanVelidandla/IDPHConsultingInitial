import { useState, useEffect, useMemo } from 'react';
import {
  Typography, Box, FormControl, InputLabel, Select, MenuItem,
  CircularProgress, Alert, Grid, Paper,
} from '@mui/material';
import {
  LineChart, Line, BarChart, Bar, XAxis, YAxis, CartesianGrid,
  Tooltip, Legend, ResponsiveContainer, PieChart, Pie, Cell,
  ReferenceLine,
} from 'recharts';
import axios from 'axios';
import InsertChartIcon from '@mui/icons-material/InsertChart';
import TrendingUpIcon from '@mui/icons-material/TrendingUp';
import TrendingDownIcon from '@mui/icons-material/TrendingDown';
import { causeLabels, causes, EXCLUDED_COUNTIES, API_BASE, MONO } from '../data/constants';
import { countyPop2020 } from '../data/population';

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

  // Mortality burden: excess deaths per year vs. state avg
  const mortalityBurden = useMemo(() => {
    const y = getLatestYear();
    if (!y || !deathData.length) return [];
    const stateRate = Number(deathData.find(d => d.County === 'ILLINOIS')?.[y]);
    if (!stateRate) return [];
    return deathData
      .filter(d => !EXCLUDED.includes(d.County))
      .map(d => {
        const rate = Number(d[y]) || 0;
        if (!rate) return null;
        const pop = countyPop2020[d.County] ?? 0;
        const excessDeaths = Math.round(((rate - stateRate) * pop) / 100000);
        return { county: d.County, excessDeaths, rate };
      })
      .filter((d): d is { county: string; excessDeaths: number; rate: number } =>
        d !== null && d.excessDeaths > 0
      )
      .sort((a, b) => b.excessDeaths - a.excessDeaths)
      .slice(0, 10);
  }, [deathData]);

  // Trajectory: 2009 to 2022 absolute change per county
  const trajectory = useMemo(() => {
    if (!deathData.length) return { improved: [], declined: [] };
    const rows = deathData
      .filter(d => !EXCLUDED.includes(d.County))
      .map(d => {
        const r2009 = Number(d['2009']) || 0;
        const r2022 = Number(d['2022']) || 0;
        if (!r2009 || !r2022) return null;
        return { county: d.County, change: r2022 - r2009 };
      })
      .filter((d): d is { county: string; change: number } => d !== null)
      .sort((a, b) => a.change - b.change);

    return {
      improved: rows.slice(0, 8).map(d => ({ county: d.county, change: Math.abs(d.change), direction: 'improved' })),
      declined: rows.slice(-8).reverse().map(d => ({ county: d.county, change: d.change, direction: 'declined' })),
    };
  }, [deathData]);

  // COVID-era shift: rate change from 2019 to 2022
  const covidImpact = useMemo(() => {
    if (!deathData.length) return [];
    return deathData
      .filter(d => !EXCLUDED.includes(d.County))
      .map(d => {
        const r2019 = Number(d['2019']) || 0;
        const r2022 = Number(d['2022']) || 0;
        if (!r2019 || !r2022) return null;
        return { county: d.County, change: +(r2022 - r2019).toFixed(1), pct: +((r2022 - r2019) / r2019 * 100).toFixed(1) };
      })
      .filter((d): d is { county: string; change: number; pct: number } => d !== null)
      .sort((a, b) => b.change - a.change)
      .slice(0, 12);
  }, [deathData]);

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

  const SectionHeader = ({ title, sub }: { title: string; sub?: string }) => (
    <Box sx={{ mb: 2.5 }}>
      <Typography sx={{ fontSize: 15, fontWeight: 600, color: '#0D1B2A' }}>{title}</Typography>
      {sub && <Typography sx={{ fontSize: 11, color: '#546E7A', mt: 0.25 }}>{sub}</Typography>}
    </Box>
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
            <SectionHeader
              title="Statewide Mortality Rate Over Time"
              sub="Illinois aggregate rate per 100,000 population, 2009–2022"
            />
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
          <Grid container spacing={2.5} sx={{ mb: 2.5 }}>
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

          {/* --- NEW PANELS --- */}

          {/* Mortality Burden */}
          {mortalityBurden.length > 0 && (
            <Paper elevation={0} sx={{ ...cardSx, mb: 2.5, height: 'auto' }}>
              <SectionHeader
                title="Mortality Burden — Excess Deaths vs. State Average"
                sub={`Top counties by estimated excess deaths per year (latest year · population-adjusted)`}
              />
              <Box sx={{ height: 280 }}>
                <ResponsiveContainer width="100%" height="100%">
                  <BarChart data={mortalityBurden} layout="vertical" margin={{ top: 0, right: 30, left: 10, bottom: 0 }}>
                    <CartesianGrid strokeDasharray="3 3" stroke="#E0E7EF" horizontal={false} />
                    <XAxis type="number" tick={{ fontSize: 10, fontFamily: 'IBM Plex Mono' }}
                      label={{ value: 'Estimated excess deaths/yr vs. state avg', position: 'insideBottom', offset: -4, fontSize: 10, fill: '#90A4AE' }}
                    />
                    <YAxis dataKey="county" type="category" tick={{ fontSize: 10 }} width={90} />
                    <Tooltip
                      contentStyle={{ fontSize: 12, fontFamily: 'IBM Plex Mono', border: 'none', boxShadow: '0 2px 8px rgba(0,0,0,0.12)' }}
                      formatter={(v: any) => [`+${Number(v).toLocaleString()} deaths/yr`, 'Excess burden']}
                    />
                    <Bar dataKey="excessDeaths" fill="#EF5350" radius={[0, 3, 3, 0]}>
                      {mortalityBurden.map((_, i) => (
                        <Cell key={i} fill={i < 3 ? '#B71C1C' : i < 6 ? '#EF5350' : '#FF7043'} />
                      ))}
                    </Bar>
                  </BarChart>
                </ResponsiveContainer>
              </Box>
              <Typography sx={{ fontSize: 10, color: '#B0BEC5', mt: 1, ...MONO }}>
                Excess deaths = (county rate − state rate) × county population / 100,000. Source: 2020 US Census.
              </Typography>
            </Paper>
          )}

          {/* Trajectory Analysis */}
          <Grid container spacing={2.5} sx={{ mb: 2.5 }}>
            <Grid item xs={12} md={6}>
              <Paper elevation={0} sx={{ ...cardSx, height: 'auto' }}>
                <Box sx={{ display: 'flex', alignItems: 'center', gap: 1, mb: 1.5 }}>
                  <TrendingDownIcon sx={{ fontSize: 18, color: '#2E7D32' }} />
                  <Typography sx={{ fontSize: 13, fontWeight: 600, color: '#0D1B2A' }}>
                    Most Improved (2009 → 2022)
                  </Typography>
                </Box>
                <Typography sx={{ fontSize: 11, color: '#546E7A', mb: 1.5 }}>
                  Counties with the largest rate decrease over the full period
                </Typography>
                <Box sx={{ height: 220 }}>
                  <ResponsiveContainer width="100%" height="100%">
                    <BarChart data={trajectory.improved} layout="vertical" margin={{ top: 0, right: 20, left: 0, bottom: 0 }}>
                      <CartesianGrid strokeDasharray="3 3" stroke="#E0E7EF" horizontal={false} />
                      <XAxis type="number" tick={{ fontSize: 10, fontFamily: 'IBM Plex Mono' }}
                        tickFormatter={v => `-${v.toFixed(0)}`}
                      />
                      <YAxis dataKey="county" type="category" tick={{ fontSize: 10 }} width={85} />
                      <Tooltip
                        contentStyle={{ fontSize: 12, fontFamily: 'IBM Plex Mono', border: 'none', boxShadow: '0 2px 8px rgba(0,0,0,0.12)' }}
                        formatter={(v: any) => [`−${Number(v).toFixed(1)} per 100k`, 'Rate decrease']}
                      />
                      <Bar dataKey="change" fill="#66BB6A" radius={[0, 3, 3, 0]} />
                    </BarChart>
                  </ResponsiveContainer>
                </Box>
              </Paper>
            </Grid>

            <Grid item xs={12} md={6}>
              <Paper elevation={0} sx={{ ...cardSx, height: 'auto' }}>
                <Box sx={{ display: 'flex', alignItems: 'center', gap: 1, mb: 1.5 }}>
                  <TrendingUpIcon sx={{ fontSize: 18, color: '#C62828' }} />
                  <Typography sx={{ fontSize: 13, fontWeight: 600, color: '#0D1B2A' }}>
                    Most Declined (2009 → 2022)
                  </Typography>
                </Box>
                <Typography sx={{ fontSize: 11, color: '#546E7A', mb: 1.5 }}>
                  Counties with the largest rate increase over the full period
                </Typography>
                <Box sx={{ height: 220 }}>
                  <ResponsiveContainer width="100%" height="100%">
                    <BarChart data={trajectory.declined} layout="vertical" margin={{ top: 0, right: 20, left: 0, bottom: 0 }}>
                      <CartesianGrid strokeDasharray="3 3" stroke="#E0E7EF" horizontal={false} />
                      <XAxis type="number" tick={{ fontSize: 10, fontFamily: 'IBM Plex Mono' }}
                        tickFormatter={v => `+${v.toFixed(0)}`}
                      />
                      <YAxis dataKey="county" type="category" tick={{ fontSize: 10 }} width={85} />
                      <Tooltip
                        contentStyle={{ fontSize: 12, fontFamily: 'IBM Plex Mono', border: 'none', boxShadow: '0 2px 8px rgba(0,0,0,0.12)' }}
                        formatter={(v: any) => [`+${Number(v).toFixed(1)} per 100k`, 'Rate increase']}
                      />
                      <Bar dataKey="change" fill="#EF5350" radius={[0, 3, 3, 0]} />
                    </BarChart>
                  </ResponsiveContainer>
                </Box>
              </Paper>
            </Grid>
          </Grid>

          {/* COVID-Era Impact (2019 → 2022) */}
          {covidImpact.length > 0 && (
            <Paper elevation={0} sx={{ ...cardSx, mb: 2.5, height: 'auto' }}>
              <Box sx={{ display: 'flex', alignItems: 'flex-start', justifyContent: 'space-between', mb: 2 }}>
                <SectionHeader
                  title="COVID-Era Rate Shift (2019 → 2022)"
                  sub="County-level mortality rate change across the pandemic period — positive values indicate increased burden"
                />
                <Box sx={{ bgcolor: '#FFF8E1', border: '1px solid #FFE082', borderRadius: '6px', px: 1.5, py: 0.75, flexShrink: 0, ml: 2 }}>
                  <Typography sx={{ fontSize: 11, color: '#6D4C00', fontWeight: 600 }}>2019 → 2022</Typography>
                </Box>
              </Box>
              <Box sx={{ height: 300 }}>
                <ResponsiveContainer width="100%" height="100%">
                  <BarChart data={covidImpact} margin={{ top: 4, right: 20, left: 10, bottom: 40 }}>
                    <CartesianGrid strokeDasharray="3 3" stroke="#E0E7EF" />
                    <XAxis
                      dataKey="county"
                      tick={{ fontSize: 9, fontFamily: 'IBM Plex Mono' }}
                      angle={-45}
                      textAnchor="end"
                      interval={0}
                    />
                    <YAxis
                      tick={{ fontSize: 10, fontFamily: 'IBM Plex Mono' }}
                      tickFormatter={v => `${v > 0 ? '+' : ''}${v.toFixed(0)}`}
                      label={{ value: 'Rate change per 100k', angle: -90, position: 'insideLeft', fontSize: 10, fill: '#90A4AE', dx: -4 }}
                    />
                    <ReferenceLine y={0} stroke="#546E7A" strokeWidth={1.5} />
                    <Tooltip
                      contentStyle={{ fontSize: 12, fontFamily: 'IBM Plex Mono', border: 'none', boxShadow: '0 2px 8px rgba(0,0,0,0.12)' }}
                      formatter={(v: any, _: any, props: any) => [
                        `${Number(v) > 0 ? '+' : ''}${Number(v).toFixed(1)} per 100k (${props.payload.pct > 0 ? '+' : ''}${props.payload.pct.toFixed(1)}%)`,
                        'Rate change'
                      ]}
                    />
                    <Bar dataKey="change" radius={[2, 2, 0, 0]}>
                      {covidImpact.map((d, i) => (
                        <Cell key={i} fill={d.change > 0 ? '#EF5350' : '#66BB6A'} />
                      ))}
                    </Bar>
                  </BarChart>
                </ResponsiveContainer>
              </Box>
              <Typography sx={{ fontSize: 10, color: '#B0BEC5', mt: 1, ...MONO }}>
                Positive values (red) indicate rate increased from pre-pandemic 2019 to 2022. Cells suppressed where 2019 or 2022 data unavailable.
              </Typography>
            </Paper>
          )}

          <Typography sx={{ fontSize: 10, color: '#B0BEC5', mt: 1, mb: 2, textAlign: 'center' }}>
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
