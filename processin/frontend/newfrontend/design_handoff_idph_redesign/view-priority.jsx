/* PriorityMatrix — quadrant scatter */

function PriorityMatrixView({ shared, setShared }) {
  const data = window.IDPH_DATA;
  const { selectedCause, selectedYear } = shared;

  return (
    <div className="view fade-in">
      <div className="view-head">
        <div className="titles">
          <Eyebrow ink>Priority Matrix</Eyebrow>
          <h1 className="h-display" style={{ marginTop: 8 }}>Where to intervene first.</h1>
          <p className="body" style={{ marginTop: 12, maxWidth: 540, color: 'var(--ink-3)' }}>
            Each county plotted by its current rate (vs. state average) and its trajectory (slope from 2009 to the selected year). Counties in the upper-right quadrant warrant attention.
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
          <div style={{ width: 240 }}>
            <YearScrub value={selectedYear} onChange={(v) => setShared({ ...shared, selectedYear: v })} />
          </div>
        </div>
      </div>

      <div style={{ display: 'grid', gridTemplateColumns: '1fr 320px', alignItems: 'stretch' }}>

        {/* Scatter plot zone */}
        <div style={{ padding: '40px 48px', borderRight: '1px solid var(--rule)', position: 'relative', minHeight: 640 }}>
          <svg viewBox="0 0 800 560" style={{ width: '100%', height: 560 }}>
            {/* axes */}
            <line x1="80" y1="280" x2="780" y2="280" stroke="var(--rule-2)" strokeWidth="0.5" />
            <line x1="430" y1="40" x2="430" y2="540" stroke="var(--rule-2)" strokeWidth="0.5" />
            {/* outer frame */}
            <rect x="80" y="40" width="700" height="500" fill="none" stroke="var(--rule)" strokeWidth="0.5" />

            {/* Quadrant watermarks */}
            <text x="600" y="80" style={{ fontFamily: 'var(--mono)', fontSize: 10, fill: 'var(--d-high)', letterSpacing: '0.16em', opacity: 0.8 }}>HIGH · WORSENING</text>
            <text x="600" y="535" style={{ fontFamily: 'var(--mono)', fontSize: 10, fill: 'var(--ink-3)', letterSpacing: '0.16em', opacity: 0.7 }}>HIGH · IMPROVING</text>
            <text x="100" y="80" style={{ fontFamily: 'var(--mono)', fontSize: 10, fill: 'var(--d-mid)', letterSpacing: '0.16em', opacity: 0.7 }}>LOW · WORSENING</text>
            <text x="100" y="535" style={{ fontFamily: 'var(--mono)', fontSize: 10, fill: 'var(--d-low)', letterSpacing: '0.16em', opacity: 0.7 }}>LOW · IMPROVING</text>

            {/* axis labels */}
            <text x="430" y="20" textAnchor="middle" style={{ fontFamily: 'var(--mono)', fontSize: 10, fill: 'var(--ink-4)', letterSpacing: '0.12em', textTransform: 'uppercase' }}>↑ Worsening</text>
            <text x="430" y="558" textAnchor="middle" style={{ fontFamily: 'var(--mono)', fontSize: 10, fill: 'var(--ink-4)', letterSpacing: '0.12em', textTransform: 'uppercase' }}>↓ Improving</text>
            <text x="780" y="295" textAnchor="end" style={{ fontFamily: 'var(--mono)', fontSize: 10, fill: 'var(--ink-4)', letterSpacing: '0.12em', textTransform: 'uppercase' }}>Higher rate →</text>
            <text x="80" y="295" style={{ fontFamily: 'var(--mono)', fontSize: 10, fill: 'var(--ink-4)', letterSpacing: '0.12em', textTransform: 'uppercase' }}>← Lower rate</text>

            {/* placeholder dots — desaturated */}
            {Array.from({ length: 22 }).map((_, i) => {
              const seed = i * 13.7;
              const x = 100 + (seed * 31 % 660);
              const y = 60 + (seed * 17 % 460);
              return <circle key={i} cx={x} cy={y} r="2.5" fill="var(--ink-5)" opacity="0.5" />;
            })}

            {/* origin marker */}
            <text x="438" y="295" style={{ fontFamily: 'var(--mono)', fontSize: 9, fill: 'var(--ink-4)' }}>State avg</text>
          </svg>
          <div style={{ marginTop: 8, display: 'flex', justifyContent: 'space-between', alignItems: 'baseline' }}>
            <Eyebrow>Y · Cumulative slope (2009 → {selectedYear})</Eyebrow>
            <Eyebrow>X · Rate ÷ state rate ({selectedYear})</Eyebrow>
          </div>
        </div>

        {/* Right rail */}
        <div style={{ padding: '40px 28px', display: 'flex', flexDirection: 'column', gap: 28 }}>
          <div>
            <Eyebrow>How to read</Eyebrow>
            <p className="caption" style={{ marginTop: 8 }}>
              Each dot is a county. The X-axis is its current rate divided by the state's; values &gt; 1 mean above average. The Y-axis is its long-term slope; positive values mean rates have risen.
            </p>
          </div>

          <div>
            <Eyebrow>Quadrants</Eyebrow>
            <ul style={{ marginTop: 12, listStyle: 'none', display: 'flex', flexDirection: 'column', gap: 1 }}>
              {[
                ['var(--d-high)', 'Priority', 'High & worsening — intervene now'],
                ['var(--d-mid)', 'Watch', 'Below average but trending up'],
                ['var(--accent)', 'Recovering', 'Above average but improving'],
                ['var(--d-low)', 'Stable', 'Below average and improving'],
              ].map(([color, label, desc], i) => (
                <li key={label} style={{ display: 'grid', gridTemplateColumns: '12px 1fr', gap: 12, padding: '10px 0', borderTop: i === 0 ? 'none' : '1px solid var(--rule)' }}>
                  <span style={{ width: 8, height: 8, background: color, borderRadius: 50, marginTop: 6 }} />
                  <div>
                    <div style={{ color: 'var(--ink)', fontSize: 13 }}>{label}</div>
                    <div className="caption" style={{ marginTop: 2 }}>{desc}</div>
                  </div>
                </li>
              ))}
            </ul>
          </div>

          <div>
            <Eyebrow>Highlighted counties</Eyebrow>
            <p className="caption" style={{ marginTop: 8 }}>Click a dot to drill in. Selected county appears here with a mini timeline.</p>
            <div style={{ marginTop: 14, padding: 16, border: '1px dashed var(--rule-2)', display: 'flex', alignItems: 'center', justifyContent: 'center', minHeight: 80 }}>
              <span className="caption" style={{ color: 'var(--ink-4)' }}>No county selected</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

window.PriorityMatrixView = PriorityMatrixView;
