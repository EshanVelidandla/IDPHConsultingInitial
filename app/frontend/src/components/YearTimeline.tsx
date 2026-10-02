/**
 * The Pulse timeline scrubber.
 *
 * Replaces a row of fourteen clickable dots that sat on top of a separate
 * native range input. That arrangement had two interactive controls for one
 * job: the native thumb showed up as a stray dot below the track, and screen
 * readers announced fourteen buttons plus a slider.
 *
 * Here there is exactly one control. A transparent range input covers the
 * strip and owns all interaction, so dragging, clicking, arrow keys, Home and
 * End work natively and the value snaps to whole years. Everything drawn is
 * decoration and is hidden from assistive technology.
 *
 * Geometry: the first and last dots used to be centred on 0% and 100% of the
 * container, so half of each dot and its label hung off the ends, which is why
 * the final year collided with its own label. The track is inset by EDGE_INSET
 * on both sides and every position is measured inside that inset, including
 * the range input, so the thumb and the dots share one scale.
 */

import { useCallback, useMemo, useRef, useState } from 'react';

export interface TimelineEvent {
  /** Short form for the timeline label. Must be explicit: deriving it by
   *  taking the first word turned "Last pre-pandemic year" into "Last". */
  short: string;
  t: string;
  d: string;
}

interface Props {
  years: number[];
  value: number;
  onChange: (year: number) => void;
  events: Record<number, TimelineEvent>;
}

/** Half the widest year label, so end labels stay inside the container. */
const EDGE_INSET = 28;

export default function YearTimeline({ years, value, onChange, events }: Props) {
  const [hoverYear, setHoverYear] = useState<number | null>(null);
  const trackRef = useRef<HTMLDivElement>(null);

  const min = years[0];
  const max = years[years.length - 1];
  const span = Math.max(1, max - min);

  /** Fraction of the inset track, 0 at the first year and 1 at the last. */
  const fraction = useCallback((year: number) => (year - min) / span, [min, span]);

  /** CSS left for a year, measured inside the inset so ends never overflow. */
  const positionOf = useCallback(
    (year: number) => `calc(${EDGE_INSET}px + ${fraction(year)} * (100% - ${EDGE_INSET * 2}px))`,
    [fraction],
  );

  // Year labels only where they carry information: the two ends, the annotated
  // years, and whatever is currently selected. Fourteen 9px labels in a row
  // read as texture rather than as a scale.
  const labelledYears = useMemo(() => {
    const keep = new Set<number>([min, max, value, ...Object.keys(events).map(Number)]);
    // Drop a label that would sit on top of a neighbour.
    return years.filter(y => {
      if (!keep.has(y)) return false;
      if (y === value || y === min || y === max) return true;
      return Math.abs(y - value) > 1;
    });
  }, [years, events, value, min, max]);

  const annotated = useMemo(
    () => years.filter(y => y in events),
    [years, events],
  );

  /** Nearest year to a pointer position, for hover feedback on the dots. */
  const yearAtClientX = useCallback((clientX: number): number | null => {
    const el = trackRef.current;
    if (!el) return null;
    const box = el.getBoundingClientRect();
    const usable = box.width - EDGE_INSET * 2;
    if (usable <= 0) return null;
    const t = (clientX - box.left - EDGE_INSET) / usable;
    return Math.min(max, Math.max(min, Math.round(min + t * span)));
  }, [min, max, span]);

  const active = hoverYear ?? value;
  const activeEvent = events[active];

  return (
    <div className="tl" ref={trackRef}>
      {/* Event labels, each tied to its dot by a connector. Five labels
          floating above fourteen dots left it ambiguous which dot owned
          which label. */}
      <div className="tl-labels">
        {annotated.map(y => (
          <div
            key={y}
            className={`tl-label${y === value ? ' is-active' : ''}${y === hoverYear ? ' is-hover' : ''}`}
            style={{ left: positionOf(y) }}
          >
            <span className="tl-label-text">{events[y].short}</span>
            <span className="tl-connector" />
          </div>
        ))}
      </div>

      <div className="tl-track-area">
        <div className="tl-track" style={{ left: EDGE_INSET, right: EDGE_INSET }} />
        {/* Progress reads on the track, not by blacking out every dot behind
            the thumb, which made the dots look like a loading bar. */}
        <div
          className="tl-track-fill"
          style={{ left: EDGE_INSET, width: `calc(${fraction(value)} * (100% - ${EDGE_INSET * 2}px))` }}
        />

        {years.map(y => {
          const classes = ['tl-dot'];
          if (y in events) classes.push('is-event');
          if (y === value) classes.push('is-active');
          if (y === hoverYear) classes.push('is-hover');
          return <span key={y} className={classes.join(' ')} style={{ left: positionOf(y) }} />;
        })}

        {/* The only real control. Transparent, covers the strip, inset to the
            same scale as the dots so the thumb and the dots agree. */}
        <input
          className="tl-input"
          type="range"
          min={min}
          max={max}
          step={1}
          value={value}
          aria-label="Year"
          aria-valuetext={activeEvent ? `${value}, ${activeEvent.t}` : String(value)}
          style={{ left: EDGE_INSET, right: EDGE_INSET }}
          onChange={e => onChange(Number(e.target.value))}
          onMouseMove={e => setHoverYear(yearAtClientX(e.clientX))}
          onMouseLeave={() => setHoverYear(null)}
          onBlur={() => setHoverYear(null)}
        />
      </div>

      <div className="tl-years">
        {labelledYears.map(y => (
          <span
            key={y}
            className={`tl-year${y === value ? ' is-active' : ''}${y === hoverYear ? ' is-hover' : ''}`}
            style={{ left: positionOf(y) }}
          >
            {y}
          </span>
        ))}
      </div>
    </div>
  );
}
