import { useState, useRef, useEffect } from 'react';
import { BrowserRouter as Router, Routes, Route, NavLink, useLocation, useNavigate } from 'react-router-dom';
import axios from 'axios';
import MapView from './components/MapView';
import InsightsView from './components/InsightsView';
import CountyScorecard from './components/CountyScorecard';
import PriorityMatrix from './components/PriorityMatrix';
import CountyDrillDown from './components/CountyDrillDown';
import PulseView from './components/PulseView';
import ProtectedRoute from './components/ProtectedRoute';
import LoginPage from './pages/LoginPage';
import AdminPanel from './pages/AdminPanel';
import { AuthProvider, useAuth } from './auth/AuthContext';
import { API_BASE } from './data/constants';

export interface SharedState {
  selectedCause: string;
  selectedYear: number;
  selectedDistrict: number | '';
  searchTarget: string;
}

// ── Icons ────────────────────────────────────────────────────

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
const IconAdmin = () => (
  <svg width="14" height="14" viewBox="0 0 16 16" fill="none" stroke="currentColor" strokeWidth="1.2">
    <circle cx="8" cy="5" r="2.5"/>
    <path d="M3 13c0-2.8 2.2-4.5 5-4.5s5 1.7 5 4.5"/>
    <circle cx="13" cy="11" r="2"/>
    <path d="M13 9.5v1M13 12.5v.5M11.5 11h.5M14 11h.5M12 9.8l.4.4M14.5 12.2l-.4-.4M12 12.2l.4-.4M14.5 9.8l-.4.4"/>
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
const IconLogout = () => (
  <svg width="12" height="12" viewBox="0 0 16 16" fill="none" stroke="currentColor" strokeWidth="1.2">
    <path d="M10 3h3v10h-3M6 5l-3 3 3 3M13 8H6"/>
  </svg>
);

// ── Nav items ────────────────────────────────────────────────

const NAV_ITEMS = [
  { path: '/', label: 'Map', num: '01', Icon: IconMap, exact: true, sub: 'Choropleth · 102 counties' },
  { path: '/insights', label: 'Insights', num: '02', Icon: IconInsights, exact: false, sub: 'Statewide patterns' },
  { path: '/scorecard', label: 'Scorecard', num: '03', Icon: IconTable, exact: false, sub: 'Heatmap table' },
  { path: '/priority', label: 'Priority', num: '04', Icon: IconScatter, exact: false, sub: 'Quadrant matrix' },
  { path: '/pulse', label: 'Pulse', num: '05', Icon: IconPulse, exact: false, sub: 'Annotated timeline' },
];

// ── Presets flyout ───────────────────────────────────────────

interface Preset { id: string; name: string; cause: string; year: number; district: number | null; }

function PresetsPopover({
  shared,
  setShared,
  onClose,
}: {
  shared: SharedState;
  setShared: (s: SharedState) => void;
  onClose: () => void;
}) {
  const [presets, setPresets] = useState<Preset[]>([]);
  const [saveName, setSaveName] = useState('');

  useEffect(() => {
    axios.get(`${API_BASE}/presets`).then(r => setPresets(r.data)).catch(() => {});
  }, []);

  function loadPreset(p: Preset) {
    setShared({ ...shared, selectedCause: p.cause, selectedYear: p.year, selectedDistrict: p.district ?? '' });
    onClose();
  }

  async function savePreset() {
    if (!saveName || !shared.selectedCause) return;
    await axios.post(`${API_BASE}/presets`, {
      name: saveName, cause: shared.selectedCause, year: shared.selectedYear,
      district: shared.selectedDistrict || null, is_public: true,
    });
    setSaveName('');
    axios.get(`${API_BASE}/presets`).then(r => setPresets(r.data)).catch(() => {});
  }

  return (
    <div className="popover" style={{ width: 280 }}>
      <div className="eyebrow" style={{ marginBottom: 10 }}>Load preset</div>
      {presets.length === 0
        ? <p className="caption" style={{ color: 'var(--ink-4)' }}>No presets saved yet.</p>
        : presets.map(p => (
          <div key={p.id} className="popover-row" onClick={() => loadPreset(p)}>
            <span>{p.name}</span>
            <span className="num" style={{ fontSize: 10, color: 'var(--ink-4)' }}>{p.year}</span>
          </div>
        ))
      }
      <div style={{ borderTop: '1px solid var(--rule)', marginTop: 12, paddingTop: 12 }}>
        <div className="eyebrow" style={{ marginBottom: 8 }}>Save current</div>
        <div style={{ display: 'flex', gap: 6 }}>
          <input className="inp" placeholder="Preset name…" value={saveName}
            onChange={e => setSaveName(e.target.value)} style={{ flex: 1, fontSize: 12 }} />
          <button className="a-btn" onClick={savePreset} disabled={!saveName || !shared.selectedCause}>Save</button>
        </div>
        {!shared.selectedCause && <p className="tiny" style={{ marginTop: 6, color: 'var(--ink-4)' }}>Select a cause first.</p>}
      </div>
    </div>
  );
}

// ── Sidebar ──────────────────────────────────────────────────

function Sidebar() {
  const { user, logout, isAdmin } = useAuth();
  const navigate = useNavigate();

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

        {isAdmin && (
          <>
            <div className="nav-section-label" style={{ marginTop: 12 }}>Admin</div>
            <NavLink to="/admin" className={({ isActive }) => `nav-item${isActive ? ' active' : ''}`}>
              <span className="nav-num">06</span>
              <IconAdmin />
              <span className="nav-label">Admin</span>
            </NavLink>
          </>
        )}
      </nav>
      <div className="rail-foot">
        <div className="rf-row"><span>Years</span><span className="v">2009 – 2022</span></div>
        <div className="rf-row"><span>Counties</span><span className="v">102</span></div>
        <div className="rf-row"><span>Build</span><span className="v">v4.0</span></div>
        {user && (
          <div className="rf-row" style={{ marginTop: 8, paddingTop: 8, borderTop: '1px solid var(--rule)' }}>
            <span style={{ overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap', maxWidth: 120 }}>{user.name}</span>
            <button
              onClick={() => { logout(); navigate('/login'); }}
              style={{ display: 'flex', alignItems: 'center', gap: 4, fontSize: 10, color: 'var(--ink-4)', cursor: 'pointer', background: 'none', border: 'none', fontFamily: 'var(--mono)' }}
            >
              <IconLogout /> out
            </button>
          </div>
        )}
      </div>
    </aside>
  );
}

// ── TopStrip ─────────────────────────────────────────────────

function TopStrip({ shared, setShared }: { shared: SharedState; setShared: (s: SharedState) => void }) {
  const { pathname } = useLocation();
  const { user } = useAuth();
  const active = NAV_ITEMS.find(n => n.exact ? pathname === n.path : pathname.startsWith(n.path)) ?? NAV_ITEMS[0];
  const [showPresets, setShowPresets] = useState(false);
  const presetsRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    function handleClick(e: MouseEvent) {
      if (presetsRef.current && !presetsRef.current.contains(e.target as Node)) setShowPresets(false);
    }
    document.addEventListener('mousedown', handleClick);
    return () => document.removeEventListener('mousedown', handleClick);
  }, []);

  async function handleExport() {
    if (!shared.selectedCause) { alert('Select a cause first.'); return; }
    try {
      const r = await axios.get(`${API_BASE}/export/csv?cause=${shared.selectedCause}`, { responseType: 'blob' });
      const url = URL.createObjectURL(new Blob([r.data]));
      const a = document.createElement('a');
      a.href = url;
      a.download = `idph_${shared.selectedCause}_death_rates.csv`;
      a.click();
      URL.revokeObjectURL(url);
    } catch { alert('Export failed — select a cause first.'); }
  }

  return (
    <div className="topstrip">
      <div className="crumb">
        <span className="eyebrow">Illinois Dept. of Public Health</span>
        <span className="sep">·</span>
        <span className="eyebrow eyebrow-ink">{active.label}</span>
        <span className="sep">·</span>
        <span className="caption" style={{ color: 'var(--ink-4)' }}>{active.sub}</span>
      </div>
      <div className="actions" style={{ position: 'relative' }}>
        <div ref={presetsRef} style={{ position: 'relative' }}>
          <button className="a-btn" onClick={() => setShowPresets(v => !v)}><IconFilter /> Presets</button>
          {showPresets && (
            <div style={{ position: 'absolute', top: '100%', right: 0, zIndex: 200, marginTop: 4 }}>
              <PresetsPopover shared={shared} setShared={setShared} onClose={() => setShowPresets(false)} />
            </div>
          )}
        </div>
        {user && (
          <button className="a-btn" onClick={handleExport}><IconDownload /> Export</button>
        )}
      </div>
    </div>
  );
}

// ── AppShell ─────────────────────────────────────────────────

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
        <TopStrip shared={shared} setShared={setShared} />
        <Routes>
          <Route path="/" element={<ProtectedRoute><MapView {...props} /></ProtectedRoute>} />
          <Route path="/insights" element={<ProtectedRoute><InsightsView {...props} /></ProtectedRoute>} />
          <Route path="/scorecard" element={<ProtectedRoute><CountyScorecard {...props} /></ProtectedRoute>} />
          <Route path="/priority" element={<ProtectedRoute><PriorityMatrix {...props} /></ProtectedRoute>} />
          <Route path="/pulse" element={<ProtectedRoute><PulseView {...props} /></ProtectedRoute>} />
          <Route path="/county/:countyName" element={<ProtectedRoute><CountyDrillDown {...props} /></ProtectedRoute>} />
          <Route path="/admin" element={<ProtectedRoute requireAdmin><AdminPanel /></ProtectedRoute>} />
        </Routes>
      </div>
    </div>
  );
}

// ── Root ─────────────────────────────────────────────────────

function App() {
  return (
    <Router>
      <AuthProvider>
        <Routes>
          <Route path="/login" element={<LoginPage />} />
          <Route path="/*" element={<AppShell />} />
        </Routes>
      </AuthProvider>
    </Router>
  );
}

export default App;
