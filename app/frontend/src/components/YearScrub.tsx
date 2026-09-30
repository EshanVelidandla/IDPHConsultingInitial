/**
 * The year slider, shared by every view.
 *
 * Five views each hardcoded min 2009 / max 2022 while the app fetched /meta
 * and ignored it, and Providers allowed 2008. The data actually starts in
 * 2008, so a whole year was unreachable everywhere except one view. This
 * component takes the range the server reported.
 */

import type { SharedState } from '../App';

interface Props {
  value: number;
  onChange: (v: number) => void;
  shared: SharedState;
  width?: number;
  label?: string;
}

/** Evenly spaced tick labels, always including both ends. */
function ticks(min: number, max: number, count = 5): number[] {
  if (max <= min) return [min];
  const step = (max - min) / (count - 1);
  const out = Array.from({ length: count }, (_, i) => Math.round(min + step * i));
  out[out.length - 1] = max;
  return Array.from(new Set(out));
}

export default function YearScrub({ value, onChange, shared, width = 220, label = 'Year' }: Props) {
  const min = shared.dataYearRange?.min ?? 2008;
  const max = shared.dataYearRange?.max ?? 2022;
  const id = `year-scrub-${label.replace(/\s+/g, '-').toLowerCase()}`;

  return (
    <div className="year-scrub" style={{ width }}>
      <div style={{ display: 'flex', alignItems: 'baseline', justifyContent: 'space-between', marginBottom: 4 }}>
        <label className="eyebrow" htmlFor={id}>{label}</label>
        <span className="num" style={{ fontSize: 18, color: 'var(--ink)', fontWeight: 500 }}>{value}</span>
      </div>
      <input
        id={id}
        type="range"
        className="range"
        min={min}
        max={max}
        step={1}
        value={Math.min(Math.max(value, min), max)}
        aria-label={`${label}, ${min} to ${max}`}
        aria-valuetext={String(value)}
        onChange={e => onChange(Number(e.target.value))}
      />
      <div style={{ display: 'flex', justifyContent: 'space-between', marginTop: 4, fontFamily: 'var(--mono)', fontSize: 9.5, color: 'var(--ink-3)' }}>
        {ticks(min, max).map(y => <span key={y}>{y}</span>)}
      </div>
    </div>
  );
}
