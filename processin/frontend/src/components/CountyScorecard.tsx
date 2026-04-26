import { useState, useEffect, useMemo } from 'react';
import { useNavigate } from 'react-router-dom';
import { Box, Typography, CircularProgress, Alert, Tooltip, TextField, InputAdornment } from '@mui/material';
import SearchIcon from '@mui/icons-material/Search';
import ArrowUpwardIcon from '@mui/icons-material/ArrowUpward';
import ArrowDownwardIcon from '@mui/icons-material/ArrowDownward';
import axios from 'axios';
import { causeLabels, causes, EXCLUDED_COUNTIES, API_BASE } from '../data/constants';

interface DeathRate { County: string; [key: string]: number | string; }
type AllData = Record<string, DeathRate[]>;

const SHORT_LABELS: Record<string, string> = {
  Total_Deaths: 'Total',
  Diseases_of_Heart: 'Heart',
  Malignant_Neoplasms: 'Cancer',
  Accidents: 'Accidents',
  COVID_19: 'COVID',
  Cerebrovascular_Diseases: 'Stroke',
  Chronic_Lower_Respiratory_Diseases: 'CLRD',
  Alzheimers_Disease: 'Alzheimer\'s',
  Diabetes_Mellitus: 'Diabetes',
  Nephritis_Nephrotic_Syndrome_Nephrosis: 'Nephritis',
  Influenza_and_Pneumonia: 'Flu/Pneum',
  Septicemia: 'Septicemia',
  Intentional_Self_Harm: 'Suicide',
  Chronic_Liver_Disease_Cirrhosis: 'Liver',
  All_Other_Causes: 'Other',
};

function getRatio(countyRate: number, stateRate: number): number {
  if (!stateRate || !countyRate) return 0;
  return countyRate / stateRate;
}

function ratioColor(ratio: number): string {
  if (!ratio) return '#F5F7FA';
  if (ratio > 1.4) return '#FFCDD2';
  if (ratio > 1.2) return '#FFEBEE';
  if (ratio < 0.6) return '#C8E6C9';
  if (ratio < 0.8) return '#E8F5E9';
  return '#FFF8E1';
}

function ratioTextColor(ratio: number): string {
  if (!ratio) return '#9E9E9E';
  if (ratio > 1.4) return '#B71C1C';
  if (ratio > 1.2) return '#C62828';
  if (ratio < 0.6) return '#1B5E20';
  if (ratio < 0.8) return '#2E7D32';
  return '#6D4C00';
}

const CountyScorecard = () => {
  const navigate = useNavigate();
  const [allData, setAllData] = useState<AllData>({});
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [sortCol, setSortCol] = useState<string>('county');
  const [sortAsc, setSortAsc] = useState(true);
  const [search, setSearch] = useState('');

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
    }).catch(() => {
      setError('Failed to load scorecard data. Ensure the backend is running.');
    }).finally(() => setLoading(false));
  }, []);

  const getLatestYear = (data: DeathRate[]): string => {
    const stateRow = data.find(d => d.County === 'ILLINOIS');
    if (!stateRow) return '2022';
    return Object.keys(stateRow).filter(k => k !== 'County' && k !== '2008').sort().pop() ?? '2022';
  };

  const tableData = useMemo(() => {
    if (!Object.keys(allData).length) return [];
    const firstCause = causes[0];
    const firstData = allData[firstCause] ?? [];
    const counties = firstData
      .filter(d => !EXCLUDED_COUNTIES.includes(d.County))
      .map(d => d.County);

    return counties.map(county => {
      const row: Record<string, number | string> = { county };
      causes.forEach(cause => {
        const data = allData[cause] ?? [];
        const year = getLatestYear(data);
        const stateRate = Number(data.find(d => d.County === 'ILLINOIS')?.[year]) || 0;
        const countyRate = Number(data.find(d => d.County === county)?.[year]) || 0;
        row[cause] = stateRate > 0 ? getRatio(countyRate, stateRate) : 0;
      });
      return row;
    });
  }, [allData]);

  const sorted = useMemo(() => {
    const filtered = tableData.filter(r =>
      (r.county as string).toLowerCase().includes(search.toLowerCase())
    );
    return [...filtered].sort((a, b) => {
      const av = sortCol === 'county' ? (a.county as string) : (a[sortCol] as number);
      const bv = sortCol === 'county' ? (b.county as string) : (b[sortCol] as number);
      if (typeof av === 'string') return sortAsc ? av.localeCompare(bv as string) : (bv as string).localeCompare(av);
      return sortAsc ? (av as number) - (bv as number) : (bv as number) - (av as number);
    });
  }, [tableData, sortCol, sortAsc, search]);

  const handleSort = (col: string) => {
    if (sortCol === col) setSortAsc(v => !v);
    else { setSortCol(col); setSortAsc(col === 'county'); }
  };

  const SortIcon = ({ col }: { col: string }) => {
    if (sortCol !== col) return null;
    return sortAsc
      ? <ArrowUpwardIcon sx={{ fontSize: 11, ml: 0.25, verticalAlign: 'middle' }} />
      : <ArrowDownwardIcon sx={{ fontSize: 11, ml: 0.25, verticalAlign: 'middle' }} />;
  };

  if (loading) return (
    <Box sx={{ display: 'flex', alignItems: 'center', justifyContent: 'center', height: '100%' }}>
      <Box sx={{ textAlign: 'center' }}>
        <CircularProgress sx={{ color: '#1565C0', mb: 2 }} />
        <Typography sx={{ fontSize: 13, color: '#546E7A' }}>Loading all 15 cause datasets…</Typography>
      </Box>
    </Box>
  );

  if (error) return <Alert severity="error" sx={{ m: 3 }}>{error}</Alert>;

  return (
    <Box sx={{ height: '100%', display: 'flex', flexDirection: 'column', overflow: 'hidden' }}>
      {/* Header */}
      <Box sx={{ px: 3, py: 2.5, borderBottom: '1px solid #D6E4EF', bgcolor: 'white', flexShrink: 0 }}>
        <Box sx={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', gap: 2 }}>
          <Box>
            <Typography sx={{ fontSize: 20, fontWeight: 600, color: '#0D1B2A' }}>County Scorecard</Typography>
            <Typography sx={{ fontSize: 12, color: '#546E7A', mt: 0.25 }}>
              Rate vs. state average for latest year · click a county to drill down
            </Typography>
          </Box>
          <TextField
            size="small"
            placeholder="Search county…"
            value={search}
            onChange={e => setSearch(e.target.value)}
            InputProps={{
              startAdornment: <InputAdornment position="start"><SearchIcon sx={{ fontSize: 17, color: '#90A4AE' }} /></InputAdornment>,
              sx: { fontFamily: "'IBM Plex Sans', sans-serif", fontSize: 13 },
            }}
            sx={{ width: 220 }}
          />
        </Box>
        {/* Legend */}
        <Box sx={{ display: 'flex', gap: 2, mt: 1.5, flexWrap: 'wrap' }}>
          {[
            { color: '#FFCDD2', text: '>40% above avg' },
            { color: '#FFEBEE', text: '20–40% above' },
            { color: '#FFF8E1', text: '±20% (near avg)' },
            { color: '#E8F5E9', text: '20–40% below' },
            { color: '#C8E6C9', text: '>40% below avg' },
            { color: '#F5F7FA', text: 'No data' },
          ].map(({ color, text }) => (
            <Box key={text} sx={{ display: 'flex', alignItems: 'center', gap: 0.75 }}>
              <Box sx={{ width: 14, height: 14, bgcolor: color, borderRadius: '2px', border: '1px solid rgba(0,0,0,0.08)' }} />
              <Typography sx={{ fontSize: 11, color: '#546E7A' }}>{text}</Typography>
            </Box>
          ))}
        </Box>
      </Box>

      {/* Table */}
      <Box sx={{ flex: 1, overflow: 'auto' }}>
        <table style={{ width: '100%', borderCollapse: 'collapse', fontSize: 12, fontFamily: "'IBM Plex Sans', sans-serif" }}>
          <thead>
            <tr style={{ position: 'sticky', top: 0, zIndex: 10 }}>
              <th
                onClick={() => handleSort('county')}
                style={{
                  padding: '10px 16px', textAlign: 'left', background: '#0A1628', color: '#90CAF9',
                  fontFamily: "'IBM Plex Mono', monospace", fontSize: 11, letterSpacing: '0.07em',
                  cursor: 'pointer', whiteSpace: 'nowrap', position: 'sticky', left: 0, zIndex: 20,
                  borderRight: '2px solid #1E3050',
                }}
              >
                COUNTY <SortIcon col="county" />
              </th>
              {causes.map(cause => (
                <th
                  key={cause}
                  onClick={() => handleSort(cause)}
                  title={causeLabels[cause]}
                  style={{
                    padding: '10px 8px', textAlign: 'center', background: '#0A1628', color: '#6B8CAE',
                    fontFamily: "'IBM Plex Mono', monospace", fontSize: 10, letterSpacing: '0.05em',
                    cursor: 'pointer', whiteSpace: 'nowrap',
                    ...(sortCol === cause ? { color: '#90CAF9' } : {}),
                  }}
                >
                  {SHORT_LABELS[cause]} <SortIcon col={cause} />
                </th>
              ))}
            </tr>
          </thead>
          <tbody>
            {sorted.map((row, i) => (
              <tr
                key={row.county as string}
                style={{ background: i % 2 === 0 ? '#FFFFFF' : '#F8FAFC', cursor: 'pointer' }}
                onClick={() => navigate(`/county/${encodeURIComponent(row.county as string)}`)}
                onMouseEnter={e => (e.currentTarget.style.background = '#EDF4FF')}
                onMouseLeave={e => (e.currentTarget.style.background = i % 2 === 0 ? '#FFFFFF' : '#F8FAFC')}
              >
                <td style={{
                  padding: '8px 16px', fontWeight: 600, color: '#0D1B2A', whiteSpace: 'nowrap',
                  position: 'sticky', left: 0, background: i % 2 === 0 ? '#FFFFFF' : '#F8FAFC',
                  borderRight: '2px solid #D6E4EF', zIndex: 1,
                }}>
                  {row.county as string}
                </td>
                {causes.map(cause => {
                  const ratio = row[cause] as number;
                  return (
                    <Tooltip
                      key={cause}
                      title={`${causeLabels[cause]}: ${ratio > 0 ? `${((ratio - 1) * 100).toFixed(1)}% vs state avg` : 'No data'}`}
                      placement="top"
                    >
                      <td style={{
                        padding: '8px 6px', textAlign: 'center',
                        background: ratioColor(ratio),
                        color: ratioTextColor(ratio),
                        fontFamily: "'IBM Plex Mono', monospace",
                        fontSize: 11,
                      }}>
                        {ratio > 0 ? `${((ratio - 1) * 100).toFixed(0)}%` : '—'}
                      </td>
                    </Tooltip>
                  );
                })}
              </tr>
            ))}
          </tbody>
        </table>
      </Box>
    </Box>
  );
};

export default CountyScorecard;
