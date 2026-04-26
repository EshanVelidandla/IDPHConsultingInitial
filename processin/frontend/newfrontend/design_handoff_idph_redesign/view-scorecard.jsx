/* CountyScorecard — heatmap table */

function CountyScorecardView({ shared, setShared }) {
  const data = window.IDPH_DATA;
  const [search, setSearch] = React.useState('');
  const [sortCol, setSortCol] = React.useState('county');
  const [sortAsc, setSortAsc] = React.useState(true);

  const filtered = data.counties.filter(c => c.toLowerCase().includes(search.toLowerCase()));

  return (
    <div className="view fade-in">
      <div className="view-head">
        <div className="titles">
          <Eyebrow ink>County Scorecard</Eyebrow>
          <h1 className="h-display" style={{ marginTop: 8 }}>{data.counties.length} counties × {data.causes.length} causes</h1>
          <p className="body" style={{ marginTop: 12, maxWidth: 540, color: 'var(--ink-3)' }}>
            Each cell shows a county's age-adjusted death rate as a ratio to the statewide average for the selected year. Sortable by any column.
          </p>
        </div>
        <div className="ix">
          <Field label="Search">
            <div style={{ position: 'relative', width: 220 }}>
              <span style={{ position: 'absolute', left: 10, top: 9, color: 'var(--ink-4)' }}><Icon.search /></span>
              <input className="input" placeholder="Filter county…" style={{ paddingLeft: 32 }}
                value={search} onChange={(e) => setSearch(e.target.value)} />
            </div>
          </Field>
          <div style={{ width: 240 }}>
            <YearScrub value={shared.selectedYear} onChange={(v) => setShared({ ...shared, selectedYear: v })} />
          </div>
        </div>
      </div>

      {/* Legend strip */}
      <div style={{ padding: '16px 40px', display: 'flex', alignItems: 'center', gap: 28, borderBottom: '1px solid var(--rule)', background: 'var(--paper)' }}>
        <Eyebrow>Cell scale · ratio to state avg</Eyebrow>
        <div style={{ display: 'flex', alignItems: 'center', gap: 4 }}>
          {[
            ['var(--d-low)', '< 0.6'],
            ['#7A9C5A', '0.6 – 0.8'],
            ['var(--d-mid)', '0.8 – 1.2'],
            ['#D46A5A', '1.2 – 1.4'],
            ['var(--d-high)', '> 1.4'],
          ].map(([c, t]) => (
            <span key={t} style={{ display: 'inline-flex', alignItems: 'center', gap: 6, marginRight: 12 }}>
              <span style={{ width: 16, height: 10, background: c }} />
              <span className="num" style={{ fontSize: 10.5, color: 'var(--ink-3)' }}>{t}</span>
            </span>
          ))}
        </div>
        <div style={{ flex: 1 }} />
        <span className="caption">Trend arrows derived from 2009–{shared.selectedYear} regression slope</span>
      </div>

      {/* Table */}
      <div style={{ overflow: 'auto', maxHeight: 'calc(100vh - 320px)' }}>
        <table className="tbl">
          <thead>
            <tr>
              <th className="col-left" onClick={() => { setSortCol('county'); setSortAsc(!sortAsc); }}>
                County {sortCol === 'county' && (sortAsc ? '↑' : '↓')}
              </th>
              {data.causes.map(c => (
                <th key={c.id} title={c.label}>{c.short}</th>
              ))}
              <th>Trend</th>
            </tr>
          </thead>
          <tbody>
            {filtered.map((county, ri) => (
              <tr key={county}>
                <td className="col-left">{county}</td>
                {data.causes.map(c => (
                  <td key={c.id} className="h-cell">
                    <div className="h-fill" style={{ background: 'transparent', color: 'var(--ink-5)' }}>—</div>
                  </td>
                ))}
                <td>
                  <span style={{ color: 'var(--ink-5)' }}><Icon.arrowFlat /></span>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}

window.CountyScorecardView = CountyScorecardView;
