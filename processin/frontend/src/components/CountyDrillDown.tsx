import { useState, useEffect } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import {
  Box, Typography, CircularProgress, Alert, Chip,
} from '@mui/material';
import ArrowBackIcon from '@mui/icons-material/ArrowBack';
import {
  BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip,
  ResponsiveContainer, Cell, LineChart, Line, Legend,
} from 'recharts';
import axios from 'axios';
import { causeLabels, causes, API_BASE, calcSlope } from '../data/constants';
import { countyPop2020 } from '../data/population';

interface DeathRate { County: string; [key: string]: number | string; }
type AllData = Record<string, DeathRate[]>;

const CountyDrillDown = () => {
  const { countyName } = useParams<{ countyName: string }>();
  const navigate = useNavigate();
  const decoded = decodeURIComponent(countyName ?? '');

  const [allData, setAllData] = useState<AllData>({});
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [selectedCause, setSelectedCause] = useState<string | null>(null);

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
      setError(null);
    }).catch(() => setError('Failed to load county data.'))
      .finally(() => setLoading(false));
  }, []);

  const getLatestYear = (data: DeathRate[]): string =>
    Object.keys(data.find(d => d.County === 'ILLINOIS') ?? {})
      .filter(k => k !== 'County' && k !== '2008').sort().pop() ?? '2022';

  /** Per-cause summary: county rate, state rate, ratio, slope */
  const causeSummary = causes.map(cause => {
    const data = allData[cause] ?? [];
    const latestYear = getLatestYear(data);
    const stateRow = data.find(d => d.County === 'ILLINOIS');
    const countyRow = data.find(d => d.County === decoded);
    const stateRate = Number(stateRow?.[latestYear]) || 0;
    const countyRate = Number(countyRow?.[latestYear]) || 0;
    const ratio = stateRate > 0 && countyRate > 0 ? countyRate / stateRate : 0;
    const slope = countyRow ? calcSlope(countyRow as Record<string, number | string>, 2015, 2022) : 0;
    return { cause, countyRate, stateRate, ratio, slope, latestYear };
  }).filter(d => d.countyRate > 0 || d.stateRate > 0);

  /** Trend line for selected cause */
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

  const topCauses = [...causeSummary].sort((a, b) => b.ratio - a.ratio).slice(0, 3);

  if (loading) return (
    <Box sx={{ display: 'flex', alignItems: 'center', justifyContent: 'center', height: '100%' }}>
      <CircularProgress sx={{ color: '#1565C0' }} />
    </Box>
  );
  if (error) return <Alert severity="error" sx={{ m: 3 }}>{error}</Alert>;

  return (
    <Box sx={{ height: '100%', overflowY: 'auto' }}>
      {/* Header */}
      <Box sx={{ px: 3, py: 2.5, borderBottom: '1px solid #D6E4EF', bgcolor: 'white', position: 'sticky', top: 0, zIndex: 5 }}>
        <Box
          onClick={() => navigate(-1)}
          sx={{ display: 'inline-flex', alignItems: 'center', gap: 0.75, color: '#1565C0', cursor: 'pointer', mb: 1,
            fontSize: 13, fontWeight: 500, '&:hover': { textDecoration: 'underline' } }}
        >
          <ArrowBackIcon sx={{ fontSize: 16 }} /> Back
        </Box>
        <Box sx={{ display: 'flex', alignItems: 'baseline', gap: 2, flexWrap: 'wrap' }}>
          <Typography sx={{ fontSize: 24, fontWeight: 700, color: '#0D1B2A' }}>{decoded} County</Typography>
          {pop && (
            <Typography sx={{ fontSize: 13, color: '#546E7A', fontFamily: "'IBM Plex Mono', monospace" }}>
              Pop. {pop.toLocaleString()} (2020)
            </Typography>
          )}
        </Box>
        {topCauses.length > 0 && (
          <Box sx={{ display: 'flex', gap: 1, mt: 1, flexWrap: 'wrap' }}>
            <Typography sx={{ fontSize: 12, color: '#546E7A', mr: 0.5, alignSelf: 'center' }}>Highest burden:</Typography>
            {topCauses.map(({ cause, ratio }) => (
              <Chip
                key={cause}
                label={`${causeLabels[cause]} (+${((ratio - 1) * 100).toFixed(0)}%)`}
                size="small"
                onClick={() => setSelectedCause(cause)}
                sx={{
                  fontSize: 11, height: 22, bgcolor: '#FFEBEE', color: '#C62828',
                  border: selectedCause === cause ? '1.5px solid #C62828' : '1px solid #FFCDD2',
                  cursor: 'pointer',
                }}
              />
            ))}
          </Box>
        )}
      </Box>

      <Box sx={{ p: 3 }}>
        {/* All-causes comparison bar chart */}
        <Box sx={{ bgcolor: 'white', borderRadius: '8px', p: 2.5, mb: 2.5, boxShadow: '0 1px 4px rgba(0,0,0,0.08)' }}>
          <Typography sx={{ fontSize: 14, fontWeight: 600, color: '#0D1B2A', mb: 0.5 }}>
            All-Cause Profile vs. State Average
          </Typography>
          <Typography sx={{ fontSize: 12, color: '#546E7A', mb: 2 }}>
            Click any bar to see the trend for that cause below
          </Typography>
          <Box sx={{ height: Math.max(300, causeSummary.length * 28) }}>
            <ResponsiveContainer width="100%" height="100%">
              <BarChart
                data={causeSummary.map(d => ({
                  cause: causeLabels[d.cause].replace(' (Cancer)', '').replace(' (Suicide)', '').replace(' (Unintentional Injuries)', ''),
                  causeKey: d.cause,
                  County: d.countyRate,
                  State: d.stateRate,
                  ratio: d.ratio,
                }))}
                layout="vertical"
                margin={{ top: 0, right: 60, left: 0, bottom: 0 }}
                onClick={(data: any) => data?.activePayload?.[0] && setSelectedCause(data.activePayload[0].payload.causeKey)}
              >
                <CartesianGrid strokeDasharray="3 3" stroke="#E0E7EF" horizontal={false} />
                <XAxis type="number" tick={{ fontSize: 10, fontFamily: 'IBM Plex Mono' }}
                  label={{ value: 'Rate per 100,000', position: 'insideBottom', offset: -5, fontSize: 11, fill: '#546E7A' }} />
                <YAxis dataKey="cause" type="category" tick={{ fontSize: 11 }} width={160} />
                <Tooltip
                  contentStyle={{ fontSize: 12, fontFamily: 'IBM Plex Mono', border: 'none', boxShadow: '0 2px 8px rgba(0,0,0,0.12)' }}
                  formatter={(v: any, name: string) => [`${Number(v).toFixed(1)} /100k`, name === 'County' ? decoded : 'IL State Avg']}
                  cursor={{ fill: 'rgba(21,101,192,0.07)' }}
                />
                <Bar dataKey="County" name="County" radius={[0, 3, 3, 0]} style={{ cursor: 'pointer' }}>
                  {causeSummary.map((d, i) => (
                    <Cell
                      key={i}
                      fill={
                        d.cause === selectedCause ? '#1565C0'
                          : d.ratio > 1.2 ? '#EF5350'
                          : d.ratio < 0.8 ? '#66BB6A'
                          : '#FFA726'
                      }
                    />
                  ))}
                </Bar>
                <Bar dataKey="State" name="State Avg" fill="#CFD8DC" radius={[0, 3, 3, 0]} style={{ cursor: 'pointer' }} />
                <Legend
                  wrapperStyle={{ fontSize: 11, fontFamily: "'IBM Plex Sans', sans-serif" }}
                  formatter={(value: string) => value === 'County' ? decoded : 'IL State Avg'}
                />
              </BarChart>
            </ResponsiveContainer>
          </Box>
        </Box>

        {/* Trend line for selected cause */}
        {selectedCause && trendData.length > 0 && (
          <Box sx={{ bgcolor: 'white', borderRadius: '8px', p: 2.5, mb: 2.5, boxShadow: '0 1px 4px rgba(0,0,0,0.08)' }}>
            <Box sx={{ display: 'flex', alignItems: 'baseline', gap: 1.5, mb: 2 }}>
              <Typography sx={{ fontSize: 14, fontWeight: 600, color: '#0D1B2A' }}>
                {causeLabels[selectedCause]} — Trend 2009–2022
              </Typography>
              <Typography sx={{
                fontSize: 11, fontFamily: "'IBM Plex Mono', monospace",
                color: calcSlope(allData[selectedCause]?.find(d => d.County === decoded) as Record<string, number | string> ?? {}, 2015, 2022) > 0 ? '#C62828' : '#2E7D32',
              }}>
                {(() => {
                  const s = calcSlope(allData[selectedCause]?.find(d => d.County === decoded) as Record<string, number | string> ?? {}, 2015, 2022);
                  return `${s > 0 ? '↑ +' : '↓ '}${s.toFixed(2)}/yr`;
                })()}
              </Typography>
            </Box>
            <Box sx={{ height: 220 }}>
              <ResponsiveContainer width="100%" height="100%">
                <LineChart data={trendData} margin={{ top: 4, right: 20, left: 0, bottom: 0 }}>
                  <CartesianGrid strokeDasharray="3 3" stroke="#E0E7EF" />
                  <XAxis dataKey="year" tick={{ fontSize: 10, fontFamily: 'IBM Plex Mono' }} />
                  <YAxis tick={{ fontSize: 10 }}
                    label={{ value: '/100k', angle: -90, position: 'insideLeft', fontSize: 10, fill: '#90A4AE', dx: 4 }} />
                  <Tooltip
                    contentStyle={{ fontSize: 12, fontFamily: 'IBM Plex Mono', border: 'none', boxShadow: '0 2px 8px rgba(0,0,0,0.12)' }}
                    formatter={(v: any, name: string) => [`${Number(v).toFixed(1)} /100k`, name === 'County' ? decoded : 'IL State Avg']}
                  />
                  <Legend wrapperStyle={{ fontSize: 11 }}
                    formatter={(value: string) => value === 'County' ? decoded : 'IL State Avg'} />
                  <Line type="monotone" dataKey="County" stroke="#1565C0" strokeWidth={2.5}
                    dot={{ r: 3 }} activeDot={{ r: 5 }} connectNulls={false} />
                  <Line type="monotone" dataKey="State" stroke="#90A4AE" strokeWidth={1.5}
                    strokeDasharray="5 3" dot={false} connectNulls={false} />
                </LineChart>
              </ResponsiveContainer>
            </Box>
          </Box>
        )}

        {/* Mortality burden */}
        {pop && causeSummary.length > 0 && (() => {
          const totalRow = causeSummary.find(d => d.cause === 'Total_Deaths');
          if (!totalRow || !totalRow.stateRate) return null;
          const excessDeaths = ((totalRow.countyRate - totalRow.stateRate) / 100000) * pop;
          if (Math.abs(excessDeaths) < 0.5) return null;
          return (
            <Box sx={{
              bgcolor: excessDeaths > 0 ? '#FFEBEE' : '#E8F5E9',
              border: `1px solid ${excessDeaths > 0 ? '#EF9A9A' : '#A5D6A7'}`,
              borderRadius: '8px', p: 2.5,
            }}>
              <Typography sx={{ fontSize: 13, fontWeight: 600, color: excessDeaths > 0 ? '#C62828' : '#2E7D32', mb: 0.5 }}>
                Estimated Mortality Burden
              </Typography>
              <Typography sx={{ fontSize: 13, color: '#0D1B2A' }}>
                <strong style={{ fontFamily: "'IBM Plex Mono', monospace", fontSize: 15 }}>
                  {Math.abs(excessDeaths).toFixed(1)}
                </strong>{' '}
                {excessDeaths > 0 ? 'excess deaths per year' : 'fewer deaths per year'} vs. state average,
                based on 2020 population of {pop.toLocaleString()}.
              </Typography>
              <Typography sx={{ fontSize: 11, color: '#546E7A', mt: 0.75 }}>
                Formula: (county rate − state rate) × population ÷ 100,000 · Uses Total Deaths cause, latest year.
              </Typography>
            </Box>
          );
        })()}
      </Box>
    </Box>
  );
};

export default CountyDrillDown;
