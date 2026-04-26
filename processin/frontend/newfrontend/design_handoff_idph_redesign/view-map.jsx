/* MapView — choropleth (grid layout, editorial), search-to-fly, tooltip */

const { useState: useStateMap, useMemo: useMemoMap, useRef: useRefMap, useEffect: useEffectMap } = React;

function MapView({ shared, setShared }) {
  const { selectedCause, selectedYear, selectedDistrict, searchTarget } = shared;
  const [hover, setHover] = useStateMap(null);
  const [tipPos, setTipPos] = useStateMap({ x: 0, y: 0 });
  const wrapRef = useRefMap(null);
  const grid = window.IL_GRID;
  const data = window.IDPH_DATA;

  // grid bounds
  const cells = Object.entries(grid);
  const xs = cells.map(([, v]) => v[0]);
  const ys = cells.map(([, v]) => v[1]);
  const maxX = Math.max(...xs), maxY = Math.max(...ys);
  const TILE = 56, GAP = 2;
  const W = (maxX + 1) * (TILE + GAP);
  const H = (maxY + 1) * (TILE + GAP);

  const districtCounties = useMemoMap(() => {
    if (!selectedDistrict) return null;
    const d = data.districts.find(d => d.n === Number(selectedDistrict));
    return d ? new Set(d.counties) : null;
  }, [selectedDistrict]);

  // search-to-fly: pan/zoom highlight
  const highlightCounty = searchTarget;

  const handleEnter = (county, e) => {
    setHover(county);
    const r = wrapRef.current.getBoundingClientRect();
    setTipPos({ x: e.clientX - r.left + 14, y: e.clientY - r.top + 14 });
  };
  const handleMove = (e) => {
    const r = wrapRef.current.getBoundingClientRect();
    setTipPos({ x: e.clientX - r.left + 14, y: e.clientY - r.top + 14 });
  };

  return (
    <div className="view fade-in">
      {/* View head */}
      <div className="view-head">
        <div className="titles">
          <Eyebrow ink>Choropleth · 102 counties</Eyebrow>
          <h1 className="h-display" style={{ marginTop: 8 }}>Mortality across Illinois</h1>
          <p className="body" style={{ marginTop: 10, maxWidth: 560, color: 'var(--ink-3)' }}>
            County-level age-adjusted death rates per 100,000 residents. Hover any county for its trend; click to drill in.
          </p>
        </div>
        <div className="ix">
          <Field label="Cause">
            <select className="select" style={{ width: 240 }}
              value={selectedCause}
              onChange={(e) => setShared({ ...shared, selectedCause: e.target.value })}>
              <option value="">— Select cause of death —</option>
              {data.causes.map(c => <option key={c.id} value={c.id}>{c.label}</option>)}
            </select>
          </Field>
          <Field label="District filter">
            <select className="select" style={{ width: 200 }}
              value={selectedDistrict || ''}
              onChange={(e) => setShared({ ...shared, selectedDistrict: e.target.value ? Number(e.target.value) : '' })}>
              <option value="">All districts</option>
              {data.districts.map(d => <option key={d.n} value={d.n}>D{d.n} · {d.name}</option>)}
            </select>
          </Field>
          <div style={{ width: 220 }}>
            <YearScrub value={selectedYear} onChange={(v) => setShared({ ...shared, selectedYear: v })} />
          </div>
        </div>
      </div>

      {/* Map + sidebar layout */}
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 320px', gap: 0, alignItems: 'stretch' }}>

        {/* Map column */}
        <div ref={wrapRef} className="map-wrap" style={{ borderRight: '1px solid var(--rule)', padding: '32px 40px', minHeight: 640 }}
             onMouseMove={handleMove}>
          {/* Search bar floating */}
          <div style={{ position: 'absolute', top: 24, left: 40, right: 40, display: 'flex', gap: 12, alignItems: 'center', pointerEvents: 'none' }}>
            <div style={{ position: 'relative', width: 280, pointerEvents: 'all' }}>
              <span style={{ position: 'absolute', left: 10, top: 9, color: 'var(--ink-4)' }}><Icon.search /></span>
              <input className="input" placeholder="Search county…" style={{ paddingLeft: 32 }}
                value={searchTarget || ''}
                onChange={(e) => setShared({ ...shared, searchTarget: e.target.value })}
                list="county-list" />
              <datalist id="county-list">
                {data.counties.map(c => <option key={c} value={c} />)}
              </datalist>
            </div>
            <span className="eyebrow" style={{ pointerEvents: 'all' }}>{selectedYear} · {selectedCause ? data.causes.find(c => c.id === selectedCause)?.short : 'No cause selected'}</span>
            <div style={{ flex: 1 }} />
            <button className="btn btn-sm btn-ghost" style={{ pointerEvents: 'all' }}
              onClick={() => setShared({ ...shared, selectedCause: '', selectedDistrict: '', searchTarget: '' })}>
              <Icon.reset /> Reset
            </button>
          </div>

          {/* Grid choropleth */}
          <svg className="map-svg" viewBox={`0 0 ${W} ${H}`} style={{ marginTop: 56, maxHeight: 640 }}>
            {cells.map(([name, [x, y]]) => {
              if (name === 'Cook_N') return null; // visual extension
              const isCook = name === 'Cook';
              const cookExtra = isCook ? grid['Cook_N'] : null;
              const dimmed = districtCounties && !districtCounties.has(name);
              const isHighlight = highlightCounty && name.toLowerCase().startsWith(highlightCounty.toLowerCase());
              const fill = 'var(--paper-2)'; // empty data — neutral
              const px = x * (TILE + GAP);
              const py = y * (TILE + GAP);

              return (
                <g key={name}>
                  <rect
                    className={cx('county-path', dimmed && 'dimmed')}
                    x={px} y={py}
                    width={TILE} height={isCook ? TILE * 2 + GAP : TILE}
                    fill={fill}
                    stroke={isHighlight ? 'var(--ink)' : undefined}
                    strokeWidth={isHighlight ? 2 : undefined}
                    onMouseEnter={(e) => handleEnter(name, e)}
                    onMouseLeave={() => setHover(null)}
                  />
                  {(isCook || (TILE >= 50)) && (
                    <text x={px + 6} y={py + 14}
                      style={{ fontFamily: 'var(--mono)', fontSize: 8.5, fill: 'var(--ink-4)', letterSpacing: '0.04em', pointerEvents: 'none' }}>
                      {name.length > 9 ? name.slice(0, 8) + '…' : name}
                    </text>
                  )}
                  {isCook && (
                    <text x={px + 6} y={py + 28}
                      style={{ fontFamily: 'var(--serif)', fontSize: 18, fill: 'var(--ink)', pointerEvents: 'none' }}>
                      Cook
                    </text>
                  )}
                </g>
              );
            })}
          </svg>

          {/* Hover tip */}
          {hover && (
            <div className="tip" style={{ left: tipPos.x, top: tipPos.y, opacity: 1 }}>
              <div className="tip-title">{hover}</div>
              <div className="tip-row"><span>Rate / 100k</span><span className="v">—</span></div>
              <div className="tip-row"><span>vs. state avg</span><span className="v">—</span></div>
              <div className="tip-row"><span>2009 → {selectedYear}</span><span className="v">—</span></div>
              <div className="tip-spark"><SparkPlaceholder height={28} /></div>
              <div className="tip-foot">Click to drill in</div>
            </div>
          )}

          {/* Bottom-left attribution */}
          <div style={{ position: 'absolute', bottom: 16, left: 40, display: 'flex', gap: 24, alignItems: 'baseline' }}>
            <span className="eyebrow">Tile-grid projection</span>
            <span className="tiny">Source · IDPH Vital Statistics</span>
          </div>
        </div>

        {/* Right rail: legend + priority + at-a-glance */}
        <div style={{ padding: '32px 28px', display: 'flex', flexDirection: 'column', gap: 28 }}>
          <div>
            <Eyebrow>Reading the map</Eyebrow>
            <div className="serif" style={{ fontSize: 19, marginTop: 8, color: 'var(--ink)', lineHeight: 1.3 }}>
              Each tile is one Illinois county.
            </div>
            <p className="caption" style={{ marginTop: 8 }}>
              Cells are colored by their rate relative to the statewide average for the selected year and cause. Bordered tiles flag <em>priority counties</em> — rates ≥ 20% above average and worsening since 2015.
            </p>
          </div>

          <div>
            <Eyebrow>Scale</Eyebrow>
            <div style={{ marginTop: 10 }}>
              {[
                { c: 'var(--d-high)', t: 'var(--d-high-tint)', label: 'High', sub: '> 20% above state' },
                { c: 'var(--d-mid)', t: 'var(--d-mid-tint)', label: 'Near average', sub: '± 20% of state' },
                { c: 'var(--d-low)', t: 'var(--d-low-tint)', label: 'Low', sub: '> 20% below state' },
                { c: 'var(--d-null)', t: 'var(--d-null-tint)', label: 'Suppressed', sub: 'Count < 5 / no data' },
              ].map(r => (
                <div key={r.label} className="legend-row">
                  <span className="legend-swatch" style={{ background: r.t, borderLeft: `3px solid ${r.c}` }} />
                  <div style={{ display: 'flex', justifyContent: 'space-between', flex: 1, alignItems: 'baseline' }}>
                    <span style={{ color: 'var(--ink)', fontSize: 12.5 }}>{r.label}</span>
                    <span className="num" style={{ fontSize: 10.5, color: 'var(--ink-4)' }}>{r.sub}</span>
                  </div>
                </div>
              ))}
            </div>
          </div>

          <div>
            <Eyebrow>Priority counties</Eyebrow>
            <div className="caption" style={{ marginTop: 10 }}>
              {selectedCause
                ? <>Priority list will populate once data is connected. Counties meeting the threshold appear here with a sparkline trend.</>
                : <>Select a cause to surface counties needing intervention attention.</>}
            </div>
            <div style={{ marginTop: 14, display: 'flex', flexDirection: 'column', gap: 1 }}>
              {[1,2,3].map(i => (
                <div key={i} style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', padding: '10px 0', borderTop: '1px solid var(--rule)' }}>
                  <span style={{ color: 'var(--ink-5)', fontSize: 13 }}>—</span>
                  <SparkPlaceholder height={20} width={80} />
                </div>
              ))}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

window.MapView = MapView;
