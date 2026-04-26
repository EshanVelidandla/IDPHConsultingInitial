/* Shared atoms + helpers for IDPH prototype */

const { useState, useEffect, useMemo, useRef, useCallback } = React;

// ─── helpers ─────────────────────────────────────────────
const fmt = (n) => n == null ? '—' : n.toLocaleString();
const cx = (...a) => a.filter(Boolean).join(' ');

// ─── Eyebrow ─────────────────────────────────────────────
function Eyebrow({ children, ink, className }) {
  return <div className={cx('eyebrow', ink && 'eyebrow-ink', className)}>{children}</div>;
}

// ─── EmptyData — used everywhere data would go ──────────
function EmptyData({ eyebrow = 'Awaiting data', title = 'No data connected', body, height = 220, dense }) {
  return (
    <div className="empty fade-in" style={{ minHeight: dense ? 120 : height }}>
      <div className="empty-eyebrow">{eyebrow}</div>
      <div className="empty-title">{title}</div>
      {body && <div className="empty-body">{body}</div>}
    </div>
  );
}

// ─── Panel ───────────────────────────────────────────────
function Panel({ title, eyebrow, action, children, flat, bodyFlat, style, className }) {
  return (
    <div className={cx(flat ? 'panel-flat' : 'panel', className)} style={style}>
      {(title || eyebrow) && (
        <div className="panel-head">
          <div className="titles">
            {eyebrow && <Eyebrow>{eyebrow}</Eyebrow>}
            {title && <div className="h3">{title}</div>}
          </div>
          {action}
        </div>
      )}
      <div className={cx(bodyFlat ? 'panel-body-flat' : 'panel-body')}>{children}</div>
    </div>
  );
}

// ─── Stat ────────────────────────────────────────────────
function Stat({ label, value, suffix, meta, delta, deltaDir, mono = true }) {
  return (
    <div className="stat">
      <div className="stat-label">{label}</div>
      <div className={cx('stat-value', mono && 'num')}>
        {value ?? <span style={{ color: 'var(--ink-5)' }}>—</span>}
        {suffix && <span style={{ fontSize: '0.55em', color: 'var(--ink-3)', marginLeft: 4, fontFamily: 'var(--mono)', fontWeight: 450 }}>{suffix}</span>}
      </div>
      <div className="stat-meta">
        {delta && <span className={cx('delta', deltaDir || 'flat')}>{delta}</span>}
        {meta && <span>{meta}</span>}
      </div>
    </div>
  );
}

// ─── Field ───────────────────────────────────────────────
function Field({ label, children }) {
  return (
    <div className="field">
      <div className="field-label">{label}</div>
      {children}
    </div>
  );
}

// ─── YearScrub ───────────────────────────────────────────
function YearScrub({ value, onChange, min = 2009, max = 2022 }) {
  return (
    <div className="year-scrub" style={{ width: '100%' }}>
      <div style={{ display: 'flex', alignItems: 'baseline', justifyContent: 'space-between', marginBottom: 4 }}>
        <span className="eyebrow">Year</span>
        <span className="num" style={{ fontSize: 18, color: 'var(--ink)', fontWeight: 500 }}>{value}</span>
      </div>
      <input
        type="range" className="range"
        min={min} max={max} value={value}
        onChange={(e) => onChange(Number(e.target.value))}
      />
      <div className="ticks">
        {[2009, 2012, 2015, 2018, 2022].map(y => <span key={y}>{y}</span>)}
      </div>
    </div>
  );
}

// ─── Sparkline (placeholder pattern, not data) ───────────
function SparkPlaceholder({ height = 28, width = 200 }) {
  // dashed baseline + dotted nodes — communicates "structure exists, data pending"
  const nodes = 14;
  return (
    <svg className="spark" viewBox={`0 0 ${width} ${height}`} preserveAspectRatio="none" style={{ height, width: '100%' }}>
      <line x1="0" y1={height - 4} x2={width} y2={height - 4} stroke="var(--rule-2)" strokeWidth="0.5" />
      <line x1="0" y1={height/2} x2={width} y2={height/2} stroke="var(--ink-5)" strokeWidth="0.5" strokeDasharray="2 4" />
      {Array.from({ length: nodes }).map((_, i) => (
        <circle key={i} cx={(i + 0.5) * (width / nodes)} cy={height/2} r="1" fill="var(--ink-5)" />
      ))}
    </svg>
  );
}

// ─── HatchPlaceholder — for chart bodies ─────────────────
function HatchBlock({ height = 220, label = 'Chart placeholder', sublabel }) {
  return (
    <div className="empty" style={{ minHeight: height }}>
      <div className="empty-eyebrow">{label}</div>
      {sublabel && <div className="empty-body">{sublabel}</div>}
    </div>
  );
}

// ─── Icons (minimalist line) ─────────────────────────────
const Icon = {
  map: (p) => <svg width="14" height="14" viewBox="0 0 16 16" fill="none" stroke="currentColor" strokeWidth="1.2" {...p}><path d="M1 4l4-2 6 2 4-2v10l-4 2-6-2-4 2V4z"/><path d="M5 2v10M11 4v10"/></svg>,
  insights: (p) => <svg width="14" height="14" viewBox="0 0 16 16" fill="none" stroke="currentColor" strokeWidth="1.2" {...p}><path d="M2 13h12M3 11V8M6 11V5M9 11V7M12 11V3"/></svg>,
  table: (p) => <svg width="14" height="14" viewBox="0 0 16 16" fill="none" stroke="currentColor" strokeWidth="1.2" {...p}><rect x="2" y="3" width="12" height="10"/><path d="M2 6h12M2 9h12M6 3v10M10 3v10"/></svg>,
  scatter: (p) => <svg width="14" height="14" viewBox="0 0 16 16" fill="none" stroke="currentColor" strokeWidth="1.2" {...p}><path d="M2 14V2M2 14h12"/><circle cx="5" cy="11" r="1" fill="currentColor"/><circle cx="8" cy="7" r="1" fill="currentColor"/><circle cx="11" cy="9" r="1" fill="currentColor"/><circle cx="13" cy="4" r="1" fill="currentColor"/></svg>,
  drill: (p) => <svg width="14" height="14" viewBox="0 0 16 16" fill="none" stroke="currentColor" strokeWidth="1.2" {...p}><circle cx="8" cy="8" r="5"/><path d="M8 5v3l2 2"/></svg>,
  search: (p) => <svg width="14" height="14" viewBox="0 0 16 16" fill="none" stroke="currentColor" strokeWidth="1.2" {...p}><circle cx="7" cy="7" r="4.5"/><path d="M10.5 10.5L14 14"/></svg>,
  download: (p) => <svg width="13" height="13" viewBox="0 0 16 16" fill="none" stroke="currentColor" strokeWidth="1.2" {...p}><path d="M8 2v9M4 7l4 4 4-4M2 14h12"/></svg>,
  share: (p) => <svg width="13" height="13" viewBox="0 0 16 16" fill="none" stroke="currentColor" strokeWidth="1.2" {...p}><circle cx="4" cy="8" r="2"/><circle cx="12" cy="3" r="2"/><circle cx="12" cy="13" r="2"/><path d="M5.7 7l4.6-3M5.7 9l4.6 3"/></svg>,
  back: (p) => <svg width="14" height="14" viewBox="0 0 16 16" fill="none" stroke="currentColor" strokeWidth="1.2" {...p}><path d="M10 3L5 8l5 5"/></svg>,
  arrowUp: (p) => <svg width="10" height="10" viewBox="0 0 12 12" fill="none" stroke="currentColor" strokeWidth="1.5" {...p}><path d="M6 10V2M2.5 5.5L6 2l3.5 3.5"/></svg>,
  arrowDown: (p) => <svg width="10" height="10" viewBox="0 0 12 12" fill="none" stroke="currentColor" strokeWidth="1.5" {...p}><path d="M6 2v8M2.5 6.5L6 10l3.5-3.5"/></svg>,
  arrowFlat: (p) => <svg width="10" height="10" viewBox="0 0 12 12" fill="none" stroke="currentColor" strokeWidth="1.5" {...p}><path d="M2 6h8M7.5 3.5L10 6l-2.5 2.5"/></svg>,
  filter: (p) => <svg width="13" height="13" viewBox="0 0 16 16" fill="none" stroke="currentColor" strokeWidth="1.2" {...p}><path d="M2 3h12L9.5 8.5V13L6.5 14V8.5L2 3z"/></svg>,
  reset: (p) => <svg width="13" height="13" viewBox="0 0 16 16" fill="none" stroke="currentColor" strokeWidth="1.2" {...p}><path d="M3 8a5 5 0 1 0 1.5-3.5"/><path d="M3 3v3h3"/></svg>,
  info: (p) => <svg width="12" height="12" viewBox="0 0 16 16" fill="none" stroke="currentColor" strokeWidth="1.2" {...p}><circle cx="8" cy="8" r="6"/><path d="M8 7v4M8 5v.5"/></svg>,
};

// ─── expose ──────────────────────────────────────────────
Object.assign(window, {
  Eyebrow, EmptyData, Panel, Stat, Field, YearScrub, SparkPlaceholder, HatchBlock, Icon, fmt, cx,
});
