import { useState, useEffect } from 'react';
import {
  Typography,
  Paper,
  Grid,
  FormControl,
  InputLabel,
  Select,
  MenuItem,
  CircularProgress,
  Alert
} from '@mui/material';
import {
  LineChart,
  Line,
  BarChart,
  Bar,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  Legend,
  ResponsiveContainer,
  PieChart,
  Pie,
  Cell
} from 'recharts';
import axios from 'axios';

interface DeathRate {
  County: string;
  [key: string]: number | string;
}

const COLORS = ['#0088FE', '#00C49F', '#FFBB28', '#FF8042', '#8884d8'];

const InsightsView = () => {
  const [selectedCause, setSelectedCause] = useState<string>('');
  const [loading, setLoading] = useState<boolean>(false);
  const [error, setError] = useState<string | null>(null);
  const [deathData, setDeathData] = useState<DeathRate[]>([]);

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

  useEffect(() => {
    const fetchData = async () => {
      if (!selectedCause) return;
      try {
        setLoading(true);
        const response = await axios.get(`/death_rates?cause=${selectedCause}`);
        setDeathData(response.data);
        setError(null);
      } catch (err) {
        setError('Failed to load death rate data. Please try again later.');
      } finally {
        setLoading(false);
      }
    };
    fetchData();
  }, [selectedCause]);

  const getStatewideTrend = () => {
    if (!deathData.length) return [];
    const stateData = deathData.find(d => d.County === 'ILLINOIS');
    if (!stateData) return [];

    return Object.entries(stateData)
      .filter(([key]) => key !== 'County')
      .map(([year, value]) => ({
        year,
        rate: value
      }))
      .sort((a, b) => a.year.localeCompare(b.year));
  };

  const getTopCounties = () => {
    if (!deathData.length) return [];
    const latestYear = Object.keys(deathData[0])
      .filter(key => key !== 'County')
      .sort()
      .pop();

    if (!latestYear) return [];

    return deathData
      .filter(d => d.County !== 'ILLINOIS')
      .map(d => ({
        county: d.County,
        rate: d[latestYear] as number
      }))
      .sort((a, b) => (b.rate - a.rate))
      .slice(0, 5);
  };

  const getRegionalDistribution = () => {
    if (!deathData.length) return [];
    const latestYear = Object.keys(deathData[0])
      .filter(key => key !== 'County')
      .sort()
      .pop();

    if (!latestYear) return [];

    const stateRate = deathData.find(d => d.County === 'ILLINOIS')?.[latestYear] as number;
    const counties = deathData.filter(d => d.County !== 'ILLINOIS');
    
    const categories = {
      'Much Higher': 0,
      'Higher': 0,
      'Average': 0,
      'Lower': 0,
      'Much Lower': 0
    };

    counties.forEach(county => {
      const rate = county[latestYear] as number;
      const ratio = rate / stateRate;

      if (ratio > 1.4) categories['Much Higher']++;
      else if (ratio > 1.2) categories['Higher']++;
      else if (ratio >= 0.8) categories['Average']++;
      else if (ratio >= 0.6) categories['Lower']++;
      else categories['Much Lower']++;
    });

    return Object.entries(categories).map(([name, value]) => ({
      name,
      value
    }));
  };

  if (error) {
    return (
      <Alert severity="error" style={{ margin: '20px' }}>
        {error}
      </Alert>
    );
  }

  return (
    <div style={{ padding: '20px' }}>
      <Paper elevation={2} style={{ padding: '20px', marginBottom: '20px' }}>
        <FormControl fullWidth>
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
      </Paper>

      {loading ? (
        <div style={{ display: 'flex', justifyContent: 'center', padding: '50px' }}>
          <CircularProgress />
        </div>
      ) : selectedCause ? (
        <Grid container spacing={3}>
          {/* Statewide Trend */}
          <Grid item xs={12}>
            <Paper elevation={2} style={{ padding: '20px' }}>
              <Typography variant="h6" gutterBottom>
                Statewide Trend Over Time
              </Typography>
              <div style={{ height: '300px' }}>
                <ResponsiveContainer width="100%" height="100%">
                  <LineChart data={getStatewideTrend()}>
                    <CartesianGrid strokeDasharray="3 3" />
                    <XAxis dataKey="year" />
                    <YAxis label={{ value: 'Rate per 100,000', angle: -90, position: 'insideLeft' }} />
                    <Tooltip />
                    <Line type="monotone" dataKey="rate" stroke="#8884d8" />
                  </LineChart>
                </ResponsiveContainer>
              </div>
            </Paper>
          </Grid>

          {/* Top 5 Counties */}
          <Grid item xs={12} md={6}>
            <Paper elevation={2} style={{ padding: '20px' }}>
              <Typography variant="h6" gutterBottom>
                Top 5 Counties (Latest Year)
              </Typography>
              <div style={{ height: '300px' }}>
                <ResponsiveContainer width="100%" height="100%">
                  <BarChart data={getTopCounties()} layout="vertical">
                    <CartesianGrid strokeDasharray="3 3" />
                    <XAxis type="number" />
                    <YAxis dataKey="county" type="category" />
                    <Tooltip />
                    <Bar dataKey="rate" fill="#82ca9d" />
                  </BarChart>
                </ResponsiveContainer>
              </div>
            </Paper>
          </Grid>

          {/* Regional Distribution */}
          <Grid item xs={12} md={6}>
            <Paper elevation={2} style={{ padding: '20px' }}>
              <Typography variant="h6" gutterBottom>
                County Distribution vs State Average
              </Typography>
              <div style={{ height: '300px' }}>
                <ResponsiveContainer width="100%" height="100%">
                  <PieChart>
                    <Pie
                      data={getRegionalDistribution()}
                      dataKey="value"
                      nameKey="name"
                      cx="50%"
                      cy="50%"
                      outerRadius={100}
                      label
                    >
                      {getRegionalDistribution().map((_, index) => (
                        <Cell key={`cell-${index}`} fill={COLORS[index % COLORS.length]} />
                      ))}
                    </Pie>
                    <Tooltip />
                    <Legend />
                  </PieChart>
                </ResponsiveContainer>
              </div>
            </Paper>
          </Grid>
        </Grid>
      ) : (
        <Paper elevation={2} style={{ padding: '20px', textAlign: 'center' }}>
          <Typography>
            Please select a cause of death to view insights
          </Typography>
        </Paper>
      )}
    </div>
  );
};

export default InsightsView; 