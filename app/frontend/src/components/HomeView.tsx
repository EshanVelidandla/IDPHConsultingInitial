import type { CSSProperties } from 'react';
import { Link } from 'react-router-dom';
import type { NavItem } from '../App';
import { hueVars } from '../data/constants';

export default function HomeView({ items }: { items: NavItem[] }) {
  return (
    <div className="view">
      <div className="view-head">
        <div className="titles">
          <div className="eyebrow eyebrow-ink">Home</div>
          <h1 className="h-display" style={{ marginTop: 8 }}>Illinois mortality,<br /><span style={{ color: 'var(--ink-3)' }}>county by county.</span></h1>
          <p className="body" style={{ marginTop: 12, maxWidth: 540, color: 'var(--ink-3)' }}>
            County death rates from IDPH vital statistics alongside provider access data for all 102 Illinois counties. Each view below answers a different question; pick one to open it.
          </p>
        </div>
      </div>
      <div className="home-grid">
        {items.map(({ path, label, num, Icon, sub, desc, hue }, i) => (
          <Link key={path} to={path} className={`home-card fade-in fade-in-${Math.min(i + 1, 4)}`}
            style={hueVars(hue) as CSSProperties | undefined}>
            <div className="home-card-top">
              <span className="nav-num">{num}</span>
              <span className="home-card-icon"><Icon /></span>
            </div>
            <div className="h2" style={{ marginTop: 14 }}>{label}</div>
            <div className="eyebrow" style={{ marginTop: 4 }}>{sub}</div>
            <p className="caption" style={{ marginTop: 12, lineHeight: 1.55 }}>{desc}</p>
            <span className="home-card-go">Open view →</span>
          </Link>
        ))}
      </div>
    </div>
  );
}
