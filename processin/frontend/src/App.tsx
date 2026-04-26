import { BrowserRouter as Router, Routes, Route, NavLink } from 'react-router-dom';
import { Box } from '@mui/material';
import MapIcon from '@mui/icons-material/Map';
import InsertChartIcon from '@mui/icons-material/InsertChart';
import TableChartIcon from '@mui/icons-material/TableChart';
import ScatterPlotIcon from '@mui/icons-material/ScatterPlot';
import MapView from './components/MapView';
import InsightsView from './components/InsightsView';
import CountyScorecard from './components/CountyScorecard';
import PriorityMatrix from './components/PriorityMatrix';
import CountyDrillDown from './components/CountyDrillDown';

const navItems = [
  { to: '/', label: 'Map', Icon: MapIcon, exact: true },
  { to: '/insights', label: 'Insights', Icon: InsertChartIcon, exact: false },
  { to: '/scorecard', label: 'Scorecard', Icon: TableChartIcon, exact: false },
  { to: '/priority', label: 'Priority Matrix', Icon: ScatterPlotIcon, exact: false },
];

function App() {
  return (
    <Router>
      <Box sx={{ display: 'flex', height: '100vh', overflow: 'hidden' }}>

        {/* Sidebar */}
        <Box sx={{
          width: 220, flexShrink: 0, display: 'flex', flexDirection: 'column',
          bgcolor: '#0A1628', borderRight: '1px solid #1E3050', zIndex: 10,
          position: 'relative',
        }}>
          {/* Left accent line */}
          <Box sx={{
            position: 'absolute', left: 0, top: 0, bottom: 0, width: '2px',
            background: 'linear-gradient(to bottom, transparent 0%, #1565C0 20%, #1565C0 80%, transparent 100%)',
            opacity: 0.7,
            zIndex: 1,
          }} />

          {/* Brand */}
          <Box sx={{ px: 3, pt: 4, pb: 3, borderBottom: '1px solid #1E3050' }}>
            <Box sx={{
              display: 'inline-flex', alignItems: 'center', bgcolor: '#1565C0',
              borderRadius: '3px', px: 1.25, py: 0.5, mb: 1.5,
            }}>
              <span className="mono" style={{ color: '#fff', fontSize: 11, fontWeight: 600, letterSpacing: '0.1em' }}>
                IDPH
              </span>
            </Box>
            <Box sx={{ width: '100%', height: '1px', bgcolor: '#1E3050', mb: 1.5 }} />
            <Box sx={{ color: '#FFFFFF', fontSize: 16, fontWeight: 600, lineHeight: 1.35, fontFamily: "'IBM Plex Sans', sans-serif" }}>
              IL Health<br />Analytics
            </Box>
          </Box>

          {/* Nav */}
          <Box component="nav" sx={{ p: '12px', flex: 1 }}>
            <Box sx={{
              px: 1, mb: 1,
              fontSize: 9, color: '#2D4A6A', fontFamily: "'IBM Plex Mono', monospace",
              letterSpacing: '0.12em', fontWeight: 600,
            }}>
              NAVIGATION
            </Box>
            {navItems.map(({ to, label, Icon, exact }) => (
              <NavLink
                key={to}
                to={to}
                end={exact}
                className={({ isActive }) => `nav-pill${isActive ? ' active' : ''}`}
              >
                <Icon sx={{ fontSize: 17 }} />
                {label}
              </NavLink>
            ))}
          </Box>

          {/* Footer */}
          <Box sx={{ px: 3, py: 3, borderTop: '1px solid #1E3050' }}>
            <Box sx={{ color: '#546E7A', fontSize: 11, lineHeight: 1.7, fontFamily: "'IBM Plex Mono', monospace" }}>
              Data: IDPH<br />2009 – 2022
            </Box>
            <Box sx={{ color: '#2D4A6A', fontSize: 9, mt: 0.5, fontFamily: "'IBM Plex Mono', monospace" }}>
              v1.0 · Illinois
            </Box>
          </Box>
        </Box>

        {/* Main content */}
        <Box sx={{
          flex: 1, overflow: 'hidden', display: 'flex', flexDirection: 'column',
          bgcolor: '#F0F4F8', minWidth: 0,
          backgroundImage: 'radial-gradient(circle, rgba(13,27,42,0.03) 1px, transparent 1px)',
          backgroundSize: '24px 24px',
        }}>
          <Routes>
            <Route path="/" element={<MapView />} />
            <Route path="/insights" element={<InsightsView />} />
            <Route path="/scorecard" element={<CountyScorecard />} />
            <Route path="/priority" element={<PriorityMatrix />} />
            <Route path="/county/:countyName" element={<CountyDrillDown />} />
          </Routes>
        </Box>

      </Box>
    </Router>
  );
}

export default App;
