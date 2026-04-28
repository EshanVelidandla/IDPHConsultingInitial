import { useState, FormEvent } from 'react';
import { useNavigate, useLocation } from 'react-router-dom';
import { useAuth } from '../auth/AuthContext';

export default function LoginPage() {
  const { login } = useAuth();
  const navigate = useNavigate();
  const location = useLocation();
  const from = (location.state as { from?: { pathname: string } })?.from?.pathname ?? '/';

  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);

  async function handleSubmit(e: FormEvent) {
    e.preventDefault();
    setError('');
    setLoading(true);
    try {
      await login(username, password);
      navigate(from, { replace: true });
    } catch {
      setError('Invalid username or password.');
    } finally {
      setLoading(false);
    }
  }

  return (
    <div className="login-shell">
      <div className="login-card">
        <div style={{ marginBottom: 32 }}>
          <div className="brand-mark" style={{ fontSize: 18, marginBottom: 6 }}>IDPH</div>
          <h1 style={{ fontFamily: 'var(--serif)', fontWeight: 400, fontSize: 28, letterSpacing: '-0.02em', color: 'var(--ink)', margin: 0 }}>
            Mortality Analytics
          </h1>
          <p style={{ marginTop: 8, fontSize: 13, color: 'var(--ink-4)', fontFamily: 'var(--mono)' }}>
            Illinois Department of Public Health
          </p>
        </div>

        <form onSubmit={handleSubmit} style={{ display: 'flex', flexDirection: 'column', gap: 16 }}>
          <div className="field">
            <div className="field-label">Username</div>
            <input
              className="inp"
              type="text"
              value={username}
              onChange={e => setUsername(e.target.value)}
              placeholder="username"
              autoFocus
              autoComplete="username"
              style={{ width: '100%' }}
            />
          </div>
          <div className="field">
            <div className="field-label">Password</div>
            <input
              className="inp"
              type="password"
              value={password}
              onChange={e => setPassword(e.target.value)}
              placeholder="••••••••"
              autoComplete="current-password"
              style={{ width: '100%' }}
            />
          </div>

          {error && (
            <div style={{ fontSize: 12, color: 'var(--d-high)', fontFamily: 'var(--mono)', padding: '8px 10px', background: 'var(--d-high-tint)', borderLeft: '3px solid var(--d-high)' }}>
              {error}
            </div>
          )}

          <button
            type="submit"
            disabled={loading || !username || !password}
            className="login-btn"
          >
            {loading ? 'Signing in…' : 'Sign in'}
          </button>
        </form>

        <div style={{ marginTop: 32, paddingTop: 20, borderTop: '1px solid var(--rule)' }}>
          <div className="eyebrow" style={{ marginBottom: 10 }}>Default credentials</div>
          <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 8 }}>
            {[
              { role: 'Admin', user: 'admin', pass: 'idph2024' },
              { role: 'Viewer', user: 'viewer', pass: 'viewer123' },
            ].map(({ role, user: u, pass }) => (
              <div key={role}
                style={{ padding: '10px 12px', background: 'var(--paper-2)', cursor: 'pointer', border: '1px solid var(--rule)' }}
                onClick={() => { setUsername(u); setPassword(pass); }}>
                <div style={{ fontSize: 10, fontFamily: 'var(--mono)', color: 'var(--ink-4)', letterSpacing: '0.1em', textTransform: 'uppercase', marginBottom: 4 }}>{role}</div>
                <div style={{ fontFamily: 'var(--mono)', fontSize: 12, color: 'var(--ink)' }}>{u} / {pass}</div>
              </div>
            ))}
          </div>
        </div>
      </div>
    </div>
  );
}
