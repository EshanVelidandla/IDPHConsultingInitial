import { BrowserRouter as Router, Routes, Route, NavLink } from 'react-router-dom';
import { Box } from '@mui/material';
import MapIcon from '@mui/icons-material/Map';
import InsertChartIcon from '@mui/icons-material/InsertChart';
import MapView from './components/MapView';
import InsightsView from './components/InsightsView';

const navItems = [
  { to: '/', label: 'Map', Icon: MapIcon, exact: true },
  { to: '/insights', label: 'Insights', Icon: InsertChartIcon, exact: false },
];

function App() {
  return (
    <Router>
      <Box sx={{ display: 'flex', height: '100vh', overflow: 'hidden' }}>

        {/* Sidebar */}
        <Box sx={{
          width: 220,
          flexShrink: 0,
          display: 'flex',
          flexDirection: 'column',
          bgcolor: '#0A1628',
          borderRight: '1px solid #1E3050',
          zIndex: 10,
        }}>

          {/* Brand */}
          <Box sx={{ px: 3, pt: 4, pb: 3.5, borderBottom: '1px solid #1E3050' }}>
            <Box sx={{
              display: 'inline-flex',
              alignItems: 'center',
              bgcolor: '#1565C0',
              borderRadius: '3px',
              px: 1.25,
              py: 0.5,
              mb: 2,
            }}>
              <span className="mono" style={{ color: '#fff', fontSize: 11, fontWeight: 600, letterSpacing: '0.1em' }}>
                IDPH
              </span>
            </Box>
            <Box sx={{
              color: '#FFFFFF',
              fontSize: 15,
              fontWeight: 600,
              lineHeight: 1.35,
              fontFamily: "'IBM Plex Sans', sans-serif",
            }}>
              IL Health<br />Analytics
            </Box>
          </Box>

          {/* Nav */}
          <Box component="nav" sx={{ p: '12px', flex: 1 }}>
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
            <Box sx={{
              color: '#546E7A',
              fontSize: 11,
              lineHeight: 1.7,
              fontFamily: "'IBM Plex Mono', monospace",
            }}>
              Data: IDPH<br />2009 – 2022
            </Box>
          </Box>
        </Box>

        {/* Main content */}
        <Box sx={{
          flex: 1,
          overflow: 'hidden',
          display: 'flex',
          flexDirection: 'column',
          bgcolor: '#F0F4F8',
          minWidth: 0,
        }}>
          <Routes>
            <Route path="/" element={<MapView />} />
            <Route path="/insights" element={<InsightsView />} />
          </Routes>
        </Box>

      </Box>
    </Router>
  );
}

export default App;
