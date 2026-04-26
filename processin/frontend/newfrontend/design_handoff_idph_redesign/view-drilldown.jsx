/* CountyDrillDownView */

function CountyDrillDownView({ shared, setShared }) {
  const data = window.IDPH_DATA;
  const county = shared.activeCounty || 'Cook';

  return (
    <div className="view fade-in">
      <div className="view-head">
        <div className="titles">
          <button className="btn btn-sm btn-ghost" style={{ marginBottom: 16 }} onClick={() => setShared({ ...shared, route: 'map' })}>
            <Icon.back /> Back to map
          </button>
          <Eyebrow ink>County Profile</Eyebrow>
          <h1 className="h-display" style={{ marginTop: 8 }}>
            <span className="serif">{county}</span> County
          </h1>
          <p className="body" style={{ marginTop: 12, maxWidth: 560, color: 'var(--ink-3)' }}>
            All-cause and cause-specific mortality, compared against the state baseline. {data.years[0]} – {data.years[data.years.length-1]}.
          </p>
        </div>
        <div className="ix">
          <Field label="Compare to">
            <select className="select" style={{ width: 200 }}>
              <option>Statewide average</option>
              <option>District 1 — Metro Chicago</option>
              <option>Population peer group</option>
            </select>
          </Field>
          <button className="btn"><Icon.download /> Download report</button>
        </div>
      </div>

      {/* Top burden card strip */}
      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', borderBottom: '1px solid var(--rule)' }}>
        <Stat label="Population (2020)" value="—" mono />
        <Stat label="All-cause rate / 100k" value="—" suffix="latest yr" />
        <Stat label="Excess deaths · annual" value="—" suffix="vs state" />
        <Stat label="Top cause" value="—" mono={false} />
      </div>

      {/* Body */}
      <div style={{ padding: '32px 40px', display: 'flex', flexDirection: 'column', gap: 32 }}>
        <Panel eyebrow="Trend overlay" title={`${county} vs. Illinois, all-cause mortality`}>
          <HatchBlock height={240} label="Dual-line trend placeholder" sublabel={`County in ink, state in muted gray; band shows ±1σ across all 102 counties.`} />
        </Panel>

        <div style={{ display: 'grid', gridTemplateColumns: '1.4fr 1fr', gap: 32 }}>
          <Panel eyebrow="Cause breakdown" title="Rate by cause vs. state average">
            <div style={{ display: 'flex', flexDirection: 'column', gap: 1 }}>
              {data.causes.slice(0, 8).map((c, i) => (
                <div key={c.id} style={{ display: 'grid', gridTemplateColumns: '160px 1fr 60px', alignItems: 'center', padding: '11px 0', borderTop: i === 0 ? 'none' : '1px solid var(--rule)', gap: 16 }}>
                  <span style={{ color: 'var(--ink)', fontSize: 12.5 }}>{c.label}</span>
                  <div style={{ position: 'relative', height: 18 }}>
                    <div style={{ position: 'absolute', left: '50%', top: 0, bottom: 0, width: 1, background: 'var(--ink-5)' }} />
                    <div style={{ position: 'absolute', left: '50%', top: 6, bottom: 6, width: `${[10,8,6,4,3,2,1.5,1][i]}%`, background: 'var(--ink-3)' }} />
                  </div>
                  <span className="num" style={{ fontSize: 11, color: 'var(--ink-5)', textAlign: 'right' }}>—</span>
                </div>
              ))}
            </div>
          </Panel>

          <Panel eyebrow="Top burden causes" title="Highest excess deaths">
            <div style={{ display: 'flex', flexDirection: 'column', gap: 12 }}>
              {data.causes.slice(0, 3).map((c, i) => (
                <div key={c.id} style={{ padding: '14px 0', borderTop: i === 0 ? 'none' : '1px solid var(--rule)' }}>
                  <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'baseline', marginBottom: 6 }}>
                    <span className="serif" style={{ fontSize: 17, color: 'var(--ink)' }}>{c.label}</span>
                    <span className="chip">#{i+1}</span>
                  </div>
                  <SparkPlaceholder height={24} />
                </div>
              ))}
            </div>
          </Panel>
        </div>

        <Panel eyebrow="Demographics" title="Population context"
          action={<span className="caption">2020 ACS</span>}>
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', gap: 0, borderTop: '1px solid var(--rule)' }}>
            <Stat label="Median age" value="—" />
            <Stat label="% Age 65+" value="—" suffix="%" />
            <Stat label="Poverty rate" value="—" suffix="%" />
            <Stat label="Uninsured" value="—" suffix="%" />
          </div>
        </Panel>
      </div>
    </div>
  );
}

window.CountyDrillDownView = CountyDrillDownView;
