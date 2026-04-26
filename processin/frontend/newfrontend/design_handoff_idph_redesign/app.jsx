/* App shell — sidebar, routing, tweaks */

const { useState: useStateApp, useEffect: useEffectApp } = React;

const TWEAK_DEFAULTS = /*EDITMODE-BEGIN*/{
  "density": "comfortable",
  "accent": "#1F5C5A",
  "showNovelView": true,
  "monoNumerals": true
}/*EDITMODE-END*/;

const ROUTES = [
  { id: 'map', label: 'Map', num: '01', icon: 'map', sub: 'Choropleth · 102 counties' },
  { id: 'insights', label: 'Insights', num: '02', icon: 'insights', sub: 'Statewide patterns' },
  { id: 'scorecard', label: 'Scorecard', num: '03', icon: 'table', sub: 'Heatmap table' },
  { id: 'priority', label: 'Priority', num: '04', icon: 'scatter', sub: 'Quadrant matrix' },
  { id: 'pulse', label: 'Pulse', num: '05', icon: 'drill', sub: 'Annotated narrative' },
];

function Sidebar({ route, setRoute }) {
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
        {ROUTES.map(r => {
          const I = Icon[r.icon];
          const active = route === r.id;
          return (
            <button key={r.id} className={cx('nav-item', active && 'active')} onClick={() => setRoute(r.id)}>
              <span className="nav-num">{r.num}</span>
              <I />
              <span className="nav-label">{r.label}</span>
            </button>
          );
        })}
      </nav>

      <div className="rail-foot">
        <div className="row"><span>Years</span><span className="v">2009 – 2022</span></div>
        <div className="row"><span>Counties</span><span className="v">102</span></div>
        <div className="row"><span>Build</span><span className="v">v3.0</span></div>
      </div>
    </aside>
  );
}

function TopStrip({ route, shared }) {
  const r = ROUTES.find(x => x.id === route);
  return (
    <div className="topstrip">
      <div className="crumb">
        <Eyebrow>Illinois Department of Public Health</Eyebrow>
        <span className="sep">·</span>
        <Eyebrow ink>{r?.label}</Eyebrow>
        <span className="sep">·</span>
        <span className="caption" style={{ color: 'var(--ink-4)' }}>{r?.sub}</span>
      </div>
      <div className="actions">
        <button className="a-btn"><Icon.filter /> Filters</button>
        <button className="a-btn"><Icon.share /> Share</button>
        <button className="a-btn"><Icon.download /> Export</button>
      </div>
    </div>
  );
}

/* Pulse — novel narrative timeline (scrollytelling-style annotated scrub) */
function PulseView({ shared, setShared }) {
  const data = window.IDPH_DATA;
  const [year, setYear] = React.useState(2022);

  const events = [
    { y: 2009, t: 'Baseline year', d: 'Tracking begins. Statewide all-cause rate is the starting reference.' },
    { y: 2014, t: 'ACA full implementation', d: 'Medicaid expansion in IL; uninsured rate drops sharply.' },
    { y: 2019, t: 'Pre-pandemic floor', d: 'All-cause mortality at lowest point in the decade.' },
    { y: 2020, t: 'COVID-19 onset', d: 'Sharpest single-year increase in IL mortality on record.' },
    { y: 2022, t: 'Latest available', d: 'Rate remains elevated above pre-pandemic baseline.' },
  ];

  return (
    <div className="view fade-in">
      <div className="view-head">
        <div className="titles">
          <Eyebrow ink>Pulse · Annotated timeline</Eyebrow>
          <h1 className="h-display" style={{ marginTop: 8 }}>
            Fourteen years,<br/>
            <span style={{ color: 'var(--ink-3)' }}>read year by year.</span>
          </h1>
          <p className="body" style={{ marginTop: 12, maxWidth: 540, color: 'var(--ink-3)' }}>
            A narrative view of Illinois mortality. Scrub through years to see which counties shift, when policies took effect, and how the COVID-era reshaped the map.
          </p>
        </div>
      </div>

      {/* Timeline ribbon */}
      <div style={{ padding: '40px 48px 24px', borderBottom: '1px solid var(--rule)' }}>
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'baseline', marginBottom: 18 }}>
          <Eyebrow>Timeline</Eyebrow>
          <span className="num" style={{ fontSize: 56, fontFamily: 'var(--serif)', color: 'var(--ink)', lineHeight: 1, letterSpacing: '-0.03em' }}>{year}</span>
        </div>

        <div style={{ position: 'relative', padding: '32px 0 12px' }}>
          {/* baseline */}
          <div style={{ position: 'absolute', left: 0, right: 0, top: '50%', height: 1, background: 'var(--rule-2)' }} />
          {/* events */}
          {events.map((e, i) => {
            const pct = ((e.y - 2009) / (2022 - 2009)) * 100;
            const isActive = year === e.y;
            const isPast = year >= e.y;
            return (
              <div key={e.y} style={{ position: 'absolute', left: `${pct}%`, top: 0, transform: 'translateX(-50%)' }}>
                <div style={{
                  width: isActive ? 14 : 8, height: isActive ? 14 : 8,
                  background: isPast ? 'var(--ink)' : 'var(--card)',
                  border: `1px solid ${isPast ? 'var(--ink)' : 'var(--ink-4)'}`,
                  borderRadius: 50,
                  marginTop: isActive ? 26 : 29,
                  marginLeft: isActive ? -3 : 0,
                  cursor: 'pointer',
                }} onClick={() => setYear(e.y)} />
                <div style={{ marginTop: 10, transform: 'translateX(-50%)', whiteSpace: 'nowrap', textAlign: 'center', fontFamily: 'var(--mono)', fontSize: 10, color: isActive ? 'var(--ink)' : 'var(--ink-4)', letterSpacing: '0.06em' }}>{e.y}</div>
              </div>
            );
          })}
          <input type="range" className="range" min="2009" max="2022" value={year}
            onChange={(e) => setYear(Number(e.target.value))}
            style={{ position: 'relative', zIndex: 5, marginTop: 12 }} />
        </div>
      </div>

      {/* Active annotation */}
      <div style={{ padding: '40px 48px', display: 'grid', gridTemplateColumns: '1fr 1.4fr', gap: 56, alignItems: 'start', borderBottom: '1px solid var(--rule)' }}>
        <div>
          <Eyebrow>What happened</Eyebrow>
          <div className="serif" style={{ fontSize: 28, marginTop: 10, color: 'var(--ink)', letterSpacing: '-0.018em', lineHeight: 1.2 }}>
            {(events.find(e => e.y === year) || events[events.length-1]).t}
          </div>
          <p className="body" style={{ marginTop: 14, color: 'var(--ink-2)' }}>
            {(events.find(e => e.y === year) || events[events.length-1]).d}
          </p>
        </div>
        <div>
          <Eyebrow>Snapshot · {year}</Eyebrow>
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(2, 1fr)', gap: 0, border: '1px solid var(--rule)', marginTop: 12 }}>
            <Stat label="State rate / 100k" value="—" />
            <Stat label="Counties above avg" value="—" suffix="/ 102" />
            <Stat label="Δ from prior year" value="—" suffix="%" />
            <Stat label="Top cause" value="—" mono={false} />
          </div>
        </div>
      </div>

      {/* Mini-map small multiples */}
      <div style={{ padding: '40px 48px' }}>
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'baseline', marginBottom: 24 }}>
          <div>
            <Eyebrow>Small multiples</Eyebrow>
            <div className="h2" style={{ marginTop: 6 }}>The state, year by year</div>
          </div>
          <span className="caption">14 mini-maps · 2009 → 2022</span>
        </div>

        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(7, 1fr)', gap: 16 }}>
          {Array.from({ length: 14 }).map((_, i) => {
            const y = 2009 + i;
            const isActive = y === year;
            return (
              <div key={y} onClick={() => setYear(y)} style={{ cursor: 'pointer' }}>
                <div style={{ position: 'relative', aspectRatio: '1 / 1.1', background: 'var(--paper-2)', border: `1px solid ${isActive ? 'var(--ink)' : 'var(--rule)'}`, padding: 8 }}>
                  {/* tiny grid abstraction */}
                  <svg viewBox="0 0 60 80" style={{ width: '100%', height: '100%' }}>
                    {Array.from({ length: 30 }).map((_, j) => {
                      const cx = 6 + (j % 5) * 11;
                      const cy = 6 + Math.floor(j / 5) * 12;
                      return <rect key={j} x={cx} y={cy} width="9" height="10" fill={isActive ? 'var(--ink-3)' : 'var(--rule-2)'} opacity={0.4 + (j * 0.02)} />;
                    })}
                  </svg>
                </div>
                <div style={{ marginTop: 6, display: 'flex', justifyContent: 'space-between', alignItems: 'baseline' }}>
                  <span className="num" style={{ fontSize: 11, color: isActive ? 'var(--ink)' : 'var(--ink-4)' }}>{y}</span>
                  <span className="num" style={{ fontSize: 10, color: 'var(--ink-5)' }}>—</span>
                </div>
              </div>
            );
          })}
        </div>
      </div>
    </div>
  );
}

window.PulseView = PulseView;

/* ─── App ──────────────────────────────────────────────── */

function App() {
  const [route, setRoute] = useStateApp('map');
  const [shared, setShared] = useStateApp({
    selectedCause: '',
    selectedYear: 2022,
    selectedDistrict: '',
    searchTarget: '',
    activeCounty: 'Cook',
    route: 'map',
  });
  const [tweaks, setTweaks] = useStateApp(TWEAK_DEFAULTS);
  const [tweaksOpen, setTweaksOpen] = useStateApp(false);

  // Tweaks host protocol
  useEffectApp(() => {
    const handler = (e) => {
      if (e.data?.type === '__activate_edit_mode') setTweaksOpen(true);
      else if (e.data?.type === '__deactivate_edit_mode') setTweaksOpen(false);
    };
    window.addEventListener('message', handler);
    window.parent.postMessage({ type: '__edit_mode_available' }, '*');
    return () => window.removeEventListener('message', handler);
  }, []);

  const setTweak = (k, v) => {
    const next = { ...tweaks, [k]: v };
    setTweaks(next);
    window.parent.postMessage({ type: '__edit_mode_set_keys', edits: { [k]: v } }, '*');
  };

  // Apply accent
  useEffectApp(() => {
    document.documentElement.style.setProperty('--accent', tweaks.accent);
  }, [tweaks.accent]);

  // Sync route navigation from shared (drill-down back button)
  useEffectApp(() => {
    if (shared.route && shared.route !== route) setRoute(shared.route);
  }, [shared.route]);

  const handleNav = (r) => {
    setRoute(r);
    setShared(s => ({ ...s, route: r }));
  };

  const renderView = () => {
    const props = { shared, setShared };
    switch (route) {
      case 'map': return <MapView {...props} />;
      case 'insights': return <InsightsView {...props} />;
      case 'scorecard': return <CountyScorecardView {...props} />;
      case 'priority': return <PriorityMatrixView {...props} />;
      case 'pulse': return <PulseView {...props} />;
      case 'drilldown': return <CountyDrillDownView {...props} />;
      default: return <MapView {...props} />;
    }
  };

  return (
    <div className="app">
      <Sidebar route={route} setRoute={handleNav} />
      <div className="main">
        <TopStrip route={route} shared={shared} />
        {renderView()}
      </div>

      {tweaksOpen && (
        <TweaksPanel onClose={() => { setTweaksOpen(false); window.parent.postMessage({ type: '__edit_mode_dismissed' }, '*'); }}>
          <TweakSection title="Visual">
            <TweakColor label="Accent" value={tweaks.accent} onChange={(v) => setTweak('accent', v)} />
            <TweakRadio label="Density" value={tweaks.density}
              options={[{ value: 'comfortable', label: 'Comfortable' }, { value: 'compact', label: 'Compact' }]}
              onChange={(v) => setTweak('density', v)} />
            <TweakToggle label="Mono numerals" value={tweaks.monoNumerals} onChange={(v) => setTweak('monoNumerals', v)} />
          </TweakSection>
          <TweakSection title="Content">
            <TweakToggle label="Show Pulse view" value={tweaks.showNovelView} onChange={(v) => setTweak('showNovelView', v)} />
          </TweakSection>
        </TweaksPanel>
      )}
    </div>
  );
}

ReactDOM.createRoot(document.getElementById('root')).render(<App />);
