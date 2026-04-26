/* InsightsView — analytics canvas */

function InsightsView({ shared, setShared }) {
  const data = window.IDPH_DATA;
  const { selectedCause } = shared;
  const [tab, setTab] = React.useState('overview');

  return (
    <div className="view fade-in">
      <div className="view-head">
        <div className="titles">
          <Eyebrow ink>Mortality Insights</Eyebrow>
          <h1 className="h-display" style={{ marginTop: 8 }}>Statewide patterns &<br/>county trajectories.</h1>
          <p className="body" style={{ marginTop: 12, maxWidth: 540, color: 'var(--ink-3)' }}>
            Population-adjusted excess deaths, change since 2009, and the COVID-era shift across {data.counties.length} Illinois counties.
          </p>
        </div>
        <div className="ix">
          <Field label="Cause">
            <select className="select" style={{ width: 240 }}
              value={selectedCause}
              onChange={(e) => setShared({ ...shared, selectedCause: e.target.value })}>
              <option value="">— Select cause —</option>
              {data.causes.map(c => <option key={c.id} value={c.id}>{c.label}</option>)}
            </select>
          </Field>
          <div className="seg">
            {['overview', 'burden', 'trajectory', 'covid-era'].map(t => (
              <button key={t} className={cx(tab === t && 'active')} onClick={() => setTab(t)}>
                {t === 'covid-era' ? 'COVID era' : t.charAt(0).toUpperCase() + t.slice(1)}
              </button>
            ))}
          </div>
        </div>
      </div>

      {/* KPI strip */}
      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', borderBottom: '1px solid var(--rule)' }}>
        <Stat label="Highest county rate" value="—" suffix="/ 100k" meta="Latest year" />
        <Stat label="Lowest county rate" value="—" suffix="/ 100k" meta="Latest year" />
        <Stat label="State trend · 2009→2022" value="—" suffix="%" meta="Change in rate" />
        <Stat label="Counties above state avg" value="—" suffix={`of ${data.counties.length}`} meta="Latest year" />
      </div>

      {/* Body */}
      <div style={{ padding: '32px 40px', display: 'flex', flexDirection: 'column', gap: 32 }}>

        {/* Statewide trend — wide */}
        <Panel
          eyebrow="Statewide trend"
          title="Age-adjusted death rate, 2009 – 2022"
          action={<button className="btn btn-sm btn-ghost"><Icon.download /> CSV</button>}
        >
          <div style={{ display: 'grid', gridTemplateColumns: '1fr 240px', gap: 32, alignItems: 'stretch' }}>
            <HatchBlock height={260} label="Line chart placeholder" sublabel="State rate per 100,000 with band for county min/max range." />
            <div style={{ display: 'flex', flexDirection: 'column', justifyContent: 'space-between', gap: 12 }}>
              <div>
                <Eyebrow>Annotations</Eyebrow>
                <ul style={{ marginTop: 10, listStyle: 'none', display: 'flex', flexDirection: 'column', gap: 10 }}>
                  {[
                    ['2014', 'ACA full implementation'],
                    ['2020', 'COVID-19 onset'],
                    ['2022', 'Latest available'],
                  ].map(([y, t]) => (
                    <li key={y} style={{ display: 'flex', gap: 12, paddingTop: 10, borderTop: '1px solid var(--rule)' }}>
                      <span className="num" style={{ color: 'var(--ink)', minWidth: 36 }}>{y}</span>
                      <span className="caption">{t}</span>
                    </li>
                  ))}
                </ul>
              </div>
              <div className="caption" style={{ color: 'var(--ink-4)' }}>
                Banded series shows the spread across all 102 counties for context.
              </div>
            </div>
          </div>
        </Panel>

        {/* Two-up: distribution + top/bottom 5 */}
        <div style={{ display: 'grid', gridTemplateColumns: '1.2fr 1fr', gap: 32 }}>
          <Panel eyebrow="Top & bottom counties" title="Five highest, five lowest"
            action={
              <div className="seg">
                <button className="active">Highest</button>
                <button>Lowest</button>
              </div>
            }>
            <div style={{ display: 'flex', flexDirection: 'column', gap: 1 }}>
              {Array.from({ length: 5 }).map((_, i) => (
                <div key={i} style={{ display: 'grid', gridTemplateColumns: '24px 1fr 1fr 60px', alignItems: 'center', padding: '14px 0', borderTop: i === 0 ? 'none' : '1px solid var(--rule)', gap: 16 }}>
                  <span className="num" style={{ color: 'var(--ink-4)', fontSize: 11 }}>{String(i+1).padStart(2,'0')}</span>
                  <span style={{ color: 'var(--ink-5)' }}>—</span>
                  <div style={{ background: 'var(--paper-2)', height: 6, position: 'relative' }}>
                    <div style={{ position: 'absolute', left: 0, top: 0, bottom: 0, width: `${[78,64,52,42,30][i]}%`, background: 'var(--ink-3)' }} />
                  </div>
                  <span className="num" style={{ color: 'var(--ink-5)', textAlign: 'right' }}>—</span>
                </div>
              ))}
            </div>
          </Panel>

          <Panel eyebrow="Distribution" title="Counties vs. state average">
            <div style={{ display: 'flex', flexDirection: 'column', gap: 1 }}>
              {[
                ['Much higher', '> 40% above', 'var(--d-high)'],
                ['Higher', '20–40% above', '#D46A5A'],
                ['Near average', '± 20%', 'var(--d-mid)'],
                ['Lower', '20–40% below', '#7A9C5A'],
                ['Much lower', '> 40% below', 'var(--d-low)'],
              ].map(([label, sub, color], i) => (
                <div key={label} style={{ display: 'grid', gridTemplateColumns: '14px 1fr auto', alignItems: 'center', padding: '12px 0', borderTop: i === 0 ? 'none' : '1px solid var(--rule)', gap: 14 }}>
                  <span style={{ width: 10, height: 10, background: color, display: 'inline-block' }} />
                  <div>
                    <div style={{ color: 'var(--ink)', fontSize: 13 }}>{label}</div>
                    <div className="num" style={{ fontSize: 10.5, color: 'var(--ink-4)', marginTop: 2 }}>{sub}</div>
                  </div>
                  <span className="num" style={{ color: 'var(--ink-5)', fontSize: 13 }}>—</span>
                </div>
              ))}
            </div>
          </Panel>
        </div>

        {/* Burden / Trajectory / COVID — three rows of editorial panels */}
        <Panel eyebrow="Burden analysis" title="Excess deaths, population-adjusted"
          action={<span className="caption">Top 10 counties by excess deaths/year</span>}>
          <HatchBlock height={200} label="Burden bar chart placeholder" sublabel="(rate − state) × population ÷ 100,000 — counties with positive excess only." />
        </Panel>

        <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 32 }}>
          <Panel eyebrow="Trajectory · improved" title="Largest decreases, 2009→2022">
            <HatchBlock height={180} label="Improved counties" />
          </Panel>
          <Panel eyebrow="Trajectory · declined" title="Largest increases, 2009→2022">
            <HatchBlock height={180} label="Declined counties" />
          </Panel>
        </div>

        <Panel eyebrow="COVID-era impact" title="Rate shift, 2019 → 2022"
          action={<span className="caption">Per county, sorted by absolute change</span>}>
          <HatchBlock height={220} label="COVID-era shift placeholder" sublabel="Diverging horizontal bars centered on zero." />
        </Panel>

        {/* Methodology footer */}
        <div style={{ paddingTop: 24, borderTop: '1px solid var(--rule)', display: 'grid', gridTemplateColumns: '1fr 1fr 1fr', gap: 32 }}>
          <div>
            <Eyebrow>Methodology</Eyebrow>
            <p className="caption" style={{ marginTop: 8 }}>Age-adjusted to 2000 US standard. Suppressed when count &lt; 5 (NCHS guidance).</p>
          </div>
          <div>
            <Eyebrow>Coverage</Eyebrow>
            <p className="caption" style={{ marginTop: 8 }}>{data.counties.length} counties · {data.years.length} years · {data.causes.length} cause categories.</p>
          </div>
          <div>
            <Eyebrow>Updated</Eyebrow>
            <p className="caption" style={{ marginTop: 8 }}>Awaiting first sync from IDPH Vital Statistics warehouse.</p>
          </div>
        </div>
      </div>
    </div>
  );
}

window.InsightsView = InsightsView;
