import { useState } from 'react';
import { BrowserRouter as Router, Routes, Route, NavLink, useLocation } from 'react-router-dom';
import MapView from './components/MapView';
import InsightsView from './components/InsightsView';
import CountyScorecard from './components/CountyScorecard';
import PriorityMatrix from './components/PriorityMatrix';
import CountyDrillDown from './components/CountyDrillDown';
import PulseView from './components/PulseView';

export interface SharedState {
  selectedCause: string;
  selectedYear: number;
  selectedDistrict: number | '';
  searchTarget: string;
}

const IconMap = () => (
  <svg width="14" height="14" viewBox="0 0 16 16" fill="none" stroke="currentColor" strokeWidth="1.2">
    <path d="M1 4l4-2 6 2 4-2v10l-4 2-6-2-4 2V4z"/>
    <path d="M5 2v10M11 4v10"/>
  </svg>
);
const IconInsights = () => (
  <svg width="14" height="14" viewBox="0 0 16 16" fill="none" stroke="currentColor" strokeWidth="1.2">
    <path d="M2 13h12M3 11V8M6 11V5M9 11V7M12 11V3"/>
  </svg>
);
const IconTable = () => (
  <svg width="14" height="14" viewBox="0 0 16 16" fill="none" stroke="currentColor" strokeWidth="1.2">
    <rect x="2" y="3" width="12" height="10"/>
    <path d="M2 6h12M2 9h12M6 3v10M10 3v10"/>
  </svg>
);
const IconScatter = () => (
  <svg width="14" height="14" viewBox="0 0 16 16" fill="none" stroke="currentColor" strokeWidth="1.2">
    <path d="M2 14V2M2 14h12"/>
    <circle cx="5" cy="11" r="1" fill="currentColor"/>
    <circle cx="8" cy="7" r="1" fill="currentColor"/>
    <circle cx="11" cy="9" r="1" fill="currentColor"/>
    <circle cx="13" cy="4" r="1" fill="currentColor"/>
  </svg>
);
const IconPulse = () => (
  <svg width="14" height="14" viewBox="0 0 16 16" fill="none" stroke="currentColor" strokeWidth="1.2">
    <circle cx="8" cy="8" r="5"/>
    <path d="M8 5v3l2 2"/>
  </svg>
);
const IconFilter = () => (
  <svg width="13" height="13" viewBox="0 0 16 16" fill="none" stroke="currentColor" strokeWidth="1.2">
    <path d="M2 3h12L9.5 8.5V13L6.5 14V8.5L2 3z"/>
  </svg>
);
const IconDownload = () => (
  <svg width="13" height="13" viewBox="0 0 16 16" fill="none" stroke="currentColor" strokeWidth="1.2">
    <path d="M8 2v9M4 7l4 4 4-4M2 14h12"/>
  </svg>
);

const NAV_ITEMS = [
  { path: '/', label: 'Map', num: '01', Icon: IconMap, exact: true, sub: 'Choropleth · 102 counties' },
  { path: '/insights', label: 'Insights', num: '02', Icon: IconInsights, exact: false, sub: 'Statewide patterns' },
  { path: '/scorecard', label: 'Scorecard', num: '03', Icon: IconTable, exact: false, sub: 'Heatmap table' },
  { path: '/priority', label: 'Priority', num: '04', Icon: IconScatter, exact: false, sub: 'Quadrant matrix' },
  { path: '/pulse', label: 'Pulse', num: '05', Icon: IconPulse, exact: false, sub: 'Annotated timeline' },
];

function Sidebar() {
  return (
    <aside className="rail">
      <div className="brand">
        <div>
          <div className="brand-mark">IDPH</div>
          <div className="brand-sub" style={{ marginTop: 4 }}>Mortality Analytics</div>
        </div>
      </div>
      <nav className="nav">
        <div className="nav-section-label">Views</div>
        {NAV_ITEMS.map(({ path, label, num, Icon, exact }) => (
          <NavLink
            key={path}
            to={path}
            end={exact}
            className={({ isActive }) => `nav-item${isActive ? ' active' : ''}`}
          >
            <span className="nav-num">{num}</span>
            <Icon />
            <span className="nav-label">{label}</span>
          </NavLink>
        ))}
      </nav>
      <div className="rail-foot">
        <div className="rf-row"><span>Years</span><span className="v">2009 – 2022</span></div>
        <div className="rf-row"><span>Counties</span><span className="v">102</span></div>
        <div className="rf-row"><span>Build</span><span className="v">v3.0</span></div>
      </div>
    </aside>
  );
}

function TopStrip() {
  const { pathname } = useLocation();
  const active = NAV_ITEMS.find(n => n.exact ? pathname === n.path : pathname.startsWith(n.path)) ?? NAV_ITEMS[0];

  return (
    <div className="topstrip">
      <div className="crumb">
        <span className="eyebrow">Illinois Dept. of Public Health</span>
        <span className="sep">·</span>
        <span className="eyebrow eyebrow-ink">{active.label}</span>
        <span className="sep">·</span>
        <span className="caption" style={{ color: 'var(--ink-4)' }}>{active.sub}</span>
      </div>
      <div className="actions">
        <button className="a-btn"><IconFilter /> Filters</button>
        <button className="a-btn"><IconDownload /> Export</button>
      </div>
    </div>
  );
}

function AppShell() {
  const [shared, setShared] = useState<SharedState>({
    selectedCause: '',
    selectedYear: 2022,
    selectedDistrict: '',
    searchTarget: '',
  });

  const props = { shared, setShared };

  return (
    <div className="app">
      <Sidebar />
      <div className="main">
        <TopStrip />
        <Routes>
          <Route path="/" element={<MapView {...props} />} />
          <Route path="/insights" element={<InsightsView {...props} />} />
          <Route path="/scorecard" element={<CountyScorecard {...props} />} />
          <Route path="/priority" element={<PriorityMatrix {...props} />} />
          <Route path="/pulse" element={<PulseView {...props} />} />
          <Route path="/county/:countyName" element={<CountyDrillDown {...props} />} />
        </Routes>
      </div>
    </div>
  );
}

function App() {
  return (
    <Router>
      <AppShell />
    </Router>
  );
}

export default App;
