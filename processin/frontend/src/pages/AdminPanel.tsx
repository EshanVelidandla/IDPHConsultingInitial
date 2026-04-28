import { useState, useEffect } from 'react';
import axios from 'axios';
import { useAuth } from '../auth/AuthContext';
import { causeLabels, causes, API_BASE } from '../data/constants';

// ── Types ────────────────────────────────────────────────────

interface Dataset { cause: string; filename: string; size_kb: number; modified: string; }
interface Annotation { id: string; county: string; cause: string | null; text: string; type: string; created_by: string; created_at: string; }
interface Threshold { id: string; cause: string; rate: number; notify_email: string | null; created_by: string; updated_at: string; }
interface Preset { id: string; name: string; cause: string; year: number; district: number | null; is_public: boolean; created_by: string; created_at: string; }
interface UserRow { id: string; username: string; name: string; role: string; created_at: string; }
interface AuditEntry { id: string; user: string; action: string; resource: string; detail: string; timestamp: string; ip: string | null; }

// ── Design tokens ────────────────────────────────────────────

const INK = '#1C1B18';
const INK_3 = '#6B675F';
const INK_4 = '#9A968C';
const RULE = '#E6E3DC';
const D_HIGH = '#B23A2E';
const D_LOW = '#4F7A4D';
const ACCENT = '#1F5C5A';

// ── Shared sub-components ────────────────────────────────────

function Badge({ type }: { type: string }) {
  const map: Record<string, { bg: string; color: string }> = {
    info:         { bg: '#E8EFEE', color: ACCENT },
    warning:      { bg: '#F5ECDD', color: '#8B5A1A' },
    intervention: { bg: '#E4ECDF', color: D_LOW },
    admin:        { bg: '#F2E4E1', color: D_HIGH },
    editor:       { bg: '#E8EFEE', color: ACCENT },
    viewer:       { bg: 'var(--paper-2)', color: INK_3 },
  };
  const s = map[type] ?? { bg: 'var(--paper-2)', color: INK_3 };
  return (
    <span style={{ padding: '2px 7px', background: s.bg, color: s.color, fontSize: 10, fontFamily: 'var(--mono)', letterSpacing: '0.08em', textTransform: 'uppercase' }}>
      {type}
    </span>
  );
}

function ActionBtn({ danger, children, onClick, disabled }: { danger?: boolean; children: React.ReactNode; onClick: () => void; disabled?: boolean }) {
  return (
    <button onClick={onClick} disabled={disabled} style={{
      padding: '5px 10px', fontSize: 11, fontFamily: 'var(--mono)', cursor: disabled ? 'not-allowed' : 'pointer',
      background: 'none', border: `1px solid ${danger ? D_HIGH : RULE}`, color: danger ? D_HIGH : INK_3,
      opacity: disabled ? 0.4 : 1,
    }}>
      {children}
    </button>
  );
}

function FieldRow({ label, children }: { label: string; children: React.ReactNode }) {
  return (
    <div style={{ display: 'flex', flexDirection: 'column', gap: 4 }}>
      <div className="field-label">{label}</div>
      {children}
    </div>
  );
}

function FormPanel({ title, onSubmit, children }: { title: string; onSubmit: (e: React.FormEvent) => void; children: React.ReactNode }) {
  return (
    <div className="panel" style={{ marginBottom: 0 }}>
      <div className="panel-head"><div className="eyebrow eyebrow-ink">{title}</div></div>
      <div className="panel-body">
        <form onSubmit={onSubmit} style={{ display: 'flex', flexDirection: 'column', gap: 14 }}>
          {children}
        </form>
      </div>
    </div>
  );
}

function EmptyRow({ text }: { text: string }) {
  return (
    <tr>
      <td colSpan={99} style={{ padding: '20px 16px', textAlign: 'center', fontFamily: 'var(--mono)', fontSize: 11, color: INK_4 }}>
        {text}
      </td>
    </tr>
  );
}

// ── Tab: Data ────────────────────────────────────────────────

function DataTab() {
  const [datasets, setDatasets] = useState<Dataset[]>([]);
  const [uploadCause, setUploadCause] = useState('');
  const [file, setFile] = useState<File | null>(null);
  const [uploading, setUploading] = useState(false);
  const [feedback, setFeedback] = useState('');

  const load = () => axios.get(`${API_BASE}/admin/datasets`).then(r => setDatasets(r.data));
  useEffect(() => { load(); }, []);

  async function handleUpload(e: React.FormEvent) {
    e.preventDefault();
    if (!uploadCause || !file) return;
    setUploading(true); setFeedback('');
    try {
      const form = new FormData();
      form.append('file', file);
      const r = await axios.post(`${API_BASE}/admin/upload?cause=${uploadCause}`, form);
      setFeedback(`Uploaded — ${r.data.rows} rows.`);
      setFile(null); setUploadCause('');
      load();
    } catch (err: unknown) {
      const msg = (err as { response?: { data?: { detail?: string } } }).response?.data?.detail ?? 'Upload failed.';
      setFeedback(msg);
    } finally { setUploading(false); }
  }

  async function handleDelete(cause: string) {
    if (!confirm(`Delete dataset "${cause}"? This cannot be undone.`)) return;
    await axios.delete(`${API_BASE}/admin/datasets/${cause}`);
    load();
  }

  return (
    <div style={{ display: 'grid', gridTemplateColumns: '2fr 1fr', gap: 32, alignItems: 'start' }}>
      <div className="panel">
        <div className="panel-head">
          <div className="titles"><div className="eyebrow eyebrow-ink">Datasets</div><div className="h3">{datasets.length} cause files on disk</div></div>
          <ActionBtn onClick={load}>Refresh</ActionBtn>
        </div>
        <div className="panel-body" style={{ padding: 0 }}>
          <table className="admin-table">
            <thead><tr><th>Cause</th><th>Size</th><th>Modified</th><th></th></tr></thead>
            <tbody>
              {datasets.length === 0 ? <EmptyRow text="No CSV files found" /> :
                datasets.map(d => (
                  <tr key={d.cause}>
                    <td><span style={{ fontFamily: 'var(--mono)', fontSize: 11 }}>{causeLabels[d.cause] ?? d.cause}</span></td>
                    <td><span className="num" style={{ fontSize: 11 }}>{d.size_kb} KB</span></td>
                    <td><span className="num" style={{ fontSize: 11 }}>{new Date(d.modified).toLocaleDateString()}</span></td>
                    <td><ActionBtn danger onClick={() => handleDelete(d.cause)}>Delete</ActionBtn></td>
                  </tr>
                ))}
            </tbody>
          </table>
        </div>
      </div>

      <FormPanel title="Upload CSV" onSubmit={handleUpload}>
        <FieldRow label="Cause">
          <select className="sel" value={uploadCause} onChange={e => setUploadCause(e.target.value)} style={{ width: '100%' }}>
            <option value="">— Select cause —</option>
            {causes.map(c => <option key={c} value={c}>{causeLabels[c]}</option>)}
          </select>
        </FieldRow>
        <FieldRow label="CSV File">
          <input type="file" accept=".csv"
            onChange={e => setFile(e.target.files?.[0] ?? null)}
            style={{ fontSize: 12, fontFamily: 'var(--mono)', color: INK_3 }} />
          <span className="tiny">Must have a 'County' column + year columns.</span>
        </FieldRow>
        {feedback && <div style={{ fontSize: 11, fontFamily: 'var(--mono)', color: feedback.includes('failed') ? D_HIGH : D_LOW }}>{feedback}</div>}
        <button type="submit" className="login-btn" disabled={uploading || !uploadCause || !file}>
          {uploading ? 'Uploading…' : 'Upload'}
        </button>
      </FormPanel>
    </div>
  );
}

// ── Tab: Annotations ─────────────────────────────────────────

function AnnotationsTab() {
  const { isEditor } = useAuth();
  const [annotations, setAnnotations] = useState<Annotation[]>([]);
  const [county, setCounty] = useState('');
  const [cause, setCause] = useState('');
  const [text, setText] = useState('');
  const [type, setType] = useState('info');
  const [editing, setEditing] = useState<string | null>(null);

  const load = () => axios.get(`${API_BASE}/annotations`).then(r => setAnnotations(r.data));
  useEffect(() => { load(); }, []);

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    if (!county || !text) return;
    if (editing) {
      await axios.put(`${API_BASE}/annotations/${editing}`, { text, type });
      setEditing(null);
    } else {
      await axios.post(`${API_BASE}/annotations`, { county, cause: cause || null, text, type });
    }
    setCounty(''); setCause(''); setText(''); setType('info');
    load();
  }

  async function handleDelete(id: string) {
    await axios.delete(`${API_BASE}/annotations/${id}`);
    load();
  }

  function startEdit(a: Annotation) {
    setEditing(a.id);
    setCounty(a.county);
    setCause(a.cause ?? '');
    setText(a.text);
    setType(a.type);
  }

  return (
    <div style={{ display: 'grid', gridTemplateColumns: '2fr 1fr', gap: 32, alignItems: 'start' }}>
      <div className="panel">
        <div className="panel-head"><div className="titles"><div className="eyebrow eyebrow-ink">Annotations</div><div className="h3">{annotations.length} entries</div></div></div>
        <div className="panel-body" style={{ padding: 0 }}>
          <table className="admin-table">
            <thead><tr><th>County</th><th>Cause</th><th>Type</th><th>Note</th><th>By</th><th></th></tr></thead>
            <tbody>
              {annotations.length === 0 ? <EmptyRow text="No annotations yet" /> :
                annotations.map(a => (
                  <tr key={a.id}>
                    <td style={{ fontWeight: 500 }}>{a.county}</td>
                    <td style={{ fontSize: 10, fontFamily: 'var(--mono)', color: INK_4 }}>{a.cause ? (causeLabels[a.cause] ?? a.cause) : 'All causes'}</td>
                    <td><Badge type={a.type} /></td>
                    <td style={{ maxWidth: 240, overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap', fontSize: 12 }}>{a.text}</td>
                    <td style={{ fontSize: 11, fontFamily: 'var(--mono)', color: INK_4 }}>{a.created_by}</td>
                    <td style={{ display: 'flex', gap: 4 }}>
                      {isEditor && <ActionBtn onClick={() => startEdit(a)}>Edit</ActionBtn>}
                      {isEditor && <ActionBtn danger onClick={() => handleDelete(a.id)}>Del</ActionBtn>}
                    </td>
                  </tr>
                ))}
            </tbody>
          </table>
        </div>
      </div>

      {isEditor && (
        <FormPanel title={editing ? 'Edit Annotation' : 'Add Annotation'} onSubmit={handleSubmit}>
          {!editing && (
            <>
              <FieldRow label="County">
                <input className="inp" value={county} onChange={e => setCounty(e.target.value)} placeholder="e.g. Gallatin" style={{ width: '100%' }} />
              </FieldRow>
              <FieldRow label="Cause (optional)">
                <select className="sel" value={cause} onChange={e => setCause(e.target.value)} style={{ width: '100%' }}>
                  <option value="">All causes</option>
                  {causes.map(c => <option key={c} value={c}>{causeLabels[c]}</option>)}
                </select>
              </FieldRow>
            </>
          )}
          <FieldRow label="Type">
            <select className="sel" value={type} onChange={e => setType(e.target.value)} style={{ width: '100%' }}>
              <option value="info">Info</option>
              <option value="warning">Warning</option>
              <option value="intervention">Intervention</option>
            </select>
          </FieldRow>
          <FieldRow label="Note">
            <textarea className="inp" value={text} onChange={e => setText(e.target.value)}
              placeholder="Enter annotation text…" rows={3} style={{ width: '100%', resize: 'vertical' }} />
          </FieldRow>
          <div style={{ display: 'flex', gap: 8 }}>
            <button type="submit" className="login-btn" disabled={!text || (!editing && !county)} style={{ flex: 1 }}>
              {editing ? 'Save' : 'Add'}
            </button>
            {editing && <ActionBtn onClick={() => { setEditing(null); setCounty(''); setCause(''); setText(''); setType('info'); }}>Cancel</ActionBtn>}
          </div>
        </FormPanel>
      )}
    </div>
  );
}

// ── Tab: Thresholds ──────────────────────────────────────────

function ThresholdsTab() {
  const { isAdmin } = useAuth();
  const [thresholds, setThresholds] = useState<Threshold[]>([]);
  const [cause, setCause] = useState('');
  const [rate, setRate] = useState('');
  const [email, setEmail] = useState('');
  const [feedback, setFeedback] = useState('');

  const load = () => axios.get(`${API_BASE}/thresholds`).then(r => setThresholds(r.data));
  useEffect(() => { load(); }, []);

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    if (!cause || !rate) return;
    try {
      await axios.post(`${API_BASE}/thresholds`, { cause, rate: parseFloat(rate), notify_email: email || null });
      setFeedback('Saved.'); setCause(''); setRate(''); setEmail('');
      load();
    } catch { setFeedback('Failed to save.'); }
  }

  async function handleDelete(c: string) {
    await axios.delete(`${API_BASE}/thresholds/${c}`);
    load();
  }

  return (
    <div style={{ display: 'grid', gridTemplateColumns: '2fr 1fr', gap: 32, alignItems: 'start' }}>
      <div className="panel">
        <div className="panel-head"><div className="titles"><div className="eyebrow eyebrow-ink">Alert Thresholds</div><div className="h3">{thresholds.length} active thresholds</div></div></div>
        <div className="panel-body" style={{ padding: 0 }}>
          <table className="admin-table">
            <thead><tr><th>Cause</th><th>Rate threshold</th><th>Notify email</th><th>Set by</th><th></th></tr></thead>
            <tbody>
              {thresholds.length === 0 ? <EmptyRow text="No thresholds configured" /> :
                thresholds.map(t => (
                  <tr key={t.id}>
                    <td>{causeLabels[t.cause] ?? t.cause}</td>
                    <td><span className="num" style={{ color: D_HIGH }}>{'>'} {t.rate} /100k</span></td>
                    <td style={{ fontFamily: 'var(--mono)', fontSize: 11, color: INK_4 }}>{t.notify_email ?? '—'}</td>
                    <td style={{ fontFamily: 'var(--mono)', fontSize: 11, color: INK_4 }}>{t.created_by}</td>
                    <td>{isAdmin && <ActionBtn danger onClick={() => handleDelete(t.cause)}>Delete</ActionBtn>}</td>
                  </tr>
                ))}
            </tbody>
          </table>
        </div>
      </div>

      {isAdmin && (
        <FormPanel title="Set Threshold" onSubmit={handleSubmit}>
          <FieldRow label="Cause">
            <select className="sel" value={cause} onChange={e => setCause(e.target.value)} style={{ width: '100%' }}>
              <option value="">— Select cause —</option>
              {causes.map(c => <option key={c} value={c}>{causeLabels[c]}</option>)}
            </select>
          </FieldRow>
          <FieldRow label="Rate threshold (per 100k)">
            <input className="inp" type="number" min="0" step="0.1" value={rate} onChange={e => setRate(e.target.value)} placeholder="e.g. 250" style={{ width: '100%' }} />
          </FieldRow>
          <FieldRow label="Notify email (optional)">
            <input className="inp" type="email" value={email} onChange={e => setEmail(e.target.value)} placeholder="analyst@idph.illinois.gov" style={{ width: '100%' }} />
          </FieldRow>
          {feedback && <div style={{ fontSize: 11, fontFamily: 'var(--mono)', color: feedback === 'Saved.' ? D_LOW : D_HIGH }}>{feedback}</div>}
          <button type="submit" className="login-btn" disabled={!cause || !rate}>Save Threshold</button>
        </FormPanel>
      )}
    </div>
  );
}

// ── Tab: Presets ─────────────────────────────────────────────

function PresetsTab() {
  const { user } = useAuth();
  const [presets, setPresets] = useState<Preset[]>([]);
  const [name, setName] = useState('');
  const [cause, setCause] = useState('');
  const [year, setYear] = useState('2022');
  const [district, setDistrict] = useState('');
  const [isPublic, setIsPublic] = useState(true);

  const load = () => axios.get(`${API_BASE}/presets`).then(r => setPresets(r.data));
  useEffect(() => { load(); }, []);

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    if (!name || !cause) return;
    await axios.post(`${API_BASE}/presets`, { name, cause, year: parseInt(year), district: district ? parseInt(district) : null, is_public: isPublic });
    setName(''); setCause(''); setYear('2022'); setDistrict(''); setIsPublic(true);
    load();
  }

  async function handleDelete(id: string) {
    await axios.delete(`${API_BASE}/presets/${id}`);
    load();
  }

  return (
    <div style={{ display: 'grid', gridTemplateColumns: '2fr 1fr', gap: 32, alignItems: 'start' }}>
      <div className="panel">
        <div className="panel-head"><div className="titles"><div className="eyebrow eyebrow-ink">Saved Presets</div><div className="h3">{presets.length} configurations</div></div></div>
        <div className="panel-body" style={{ padding: 0 }}>
          <table className="admin-table">
            <thead><tr><th>Name</th><th>Cause</th><th>Year</th><th>District</th><th>Visibility</th><th>By</th><th></th></tr></thead>
            <tbody>
              {presets.length === 0 ? <EmptyRow text="No presets saved" /> :
                presets.map(p => (
                  <tr key={p.id}>
                    <td style={{ fontWeight: 500 }}>{p.name}</td>
                    <td style={{ fontSize: 11, color: INK_4 }}>{causeLabels[p.cause] ?? p.cause}</td>
                    <td><span className="num" style={{ fontSize: 11 }}>{p.year}</span></td>
                    <td style={{ fontSize: 11, color: INK_4 }}>{p.district ? `D${p.district}` : 'All'}</td>
                    <td><Badge type={p.is_public ? 'info' : 'viewer'} /></td>
                    <td style={{ fontFamily: 'var(--mono)', fontSize: 11, color: INK_4 }}>{p.created_by}</td>
                    <td>
                      {(p.created_by === user?.username || user?.role === 'admin') &&
                        <ActionBtn danger onClick={() => handleDelete(p.id)}>Del</ActionBtn>}
                    </td>
                  </tr>
                ))}
            </tbody>
          </table>
        </div>
      </div>

      <FormPanel title="Save Preset" onSubmit={handleSubmit}>
        <FieldRow label="Name">
          <input className="inp" value={name} onChange={e => setName(e.target.value)} placeholder="e.g. Heart Disease 2022" style={{ width: '100%' }} />
        </FieldRow>
        <FieldRow label="Cause">
          <select className="sel" value={cause} onChange={e => setCause(e.target.value)} style={{ width: '100%' }}>
            <option value="">— Select cause —</option>
            {causes.map(c => <option key={c} value={c}>{causeLabels[c]}</option>)}
          </select>
        </FieldRow>
        <FieldRow label="Year">
          <input className="inp" type="number" min={2009} max={2022} value={year} onChange={e => setYear(e.target.value)} style={{ width: '100%' }} />
        </FieldRow>
        <FieldRow label="Visibility">
          <div style={{ display: 'flex', gap: 16, fontSize: 13 }}>
            <label style={{ display: 'flex', alignItems: 'center', gap: 6, cursor: 'pointer' }}>
              <input type="radio" checked={isPublic} onChange={() => setIsPublic(true)} /> Public
            </label>
            <label style={{ display: 'flex', alignItems: 'center', gap: 6, cursor: 'pointer' }}>
              <input type="radio" checked={!isPublic} onChange={() => setIsPublic(false)} /> Private
            </label>
          </div>
        </FieldRow>
        <button type="submit" className="login-btn" disabled={!name || !cause}>Save Preset</button>
      </FormPanel>
    </div>
  );
}

// ── Tab: Users ───────────────────────────────────────────────

function UsersTab() {
  const { user: me } = useAuth();
  const [users, setUsers] = useState<UserRow[]>([]);
  const [username, setUsername] = useState('');
  const [name, setName] = useState('');
  const [role, setRole] = useState('viewer');
  const [password, setPassword] = useState('');
  const [feedback, setFeedback] = useState('');
  const [editId, setEditId] = useState<string | null>(null);
  const [editRole, setEditRole] = useState('');

  const load = () => axios.get(`${API_BASE}/admin/users`).then(r => setUsers(r.data));
  useEffect(() => { load(); }, []);

  async function handleCreate(e: React.FormEvent) {
    e.preventDefault();
    if (!username || !name || !password) return;
    try {
      await axios.post(`${API_BASE}/admin/users`, { username, name, role, password });
      setFeedback('User created.'); setUsername(''); setName(''); setPassword(''); setRole('viewer');
      load();
    } catch (err: unknown) {
      const msg = (err as { response?: { data?: { detail?: string } } }).response?.data?.detail ?? 'Failed.';
      setFeedback(msg);
    }
  }

  async function handleRoleUpdate(id: string) {
    await axios.put(`${API_BASE}/admin/users/${id}`, { role: editRole });
    setEditId(null);
    load();
  }

  async function handleDelete(id: string, uname: string) {
    if (!confirm(`Delete user "${uname}"?`)) return;
    await axios.delete(`${API_BASE}/admin/users/${id}`);
    load();
  }

  return (
    <div style={{ display: 'grid', gridTemplateColumns: '2fr 1fr', gap: 32, alignItems: 'start' }}>
      <div className="panel">
        <div className="panel-head"><div className="titles"><div className="eyebrow eyebrow-ink">Users</div><div className="h3">{users.length} accounts</div></div></div>
        <div className="panel-body" style={{ padding: 0 }}>
          <table className="admin-table">
            <thead><tr><th>Username</th><th>Name</th><th>Role</th><th>Created</th><th></th></tr></thead>
            <tbody>
              {users.map(u => (
                <tr key={u.id}>
                  <td style={{ fontFamily: 'var(--mono)', fontSize: 12 }}>
                    {u.username} {u.id === me?.id && <span style={{ fontSize: 9, color: INK_4, marginLeft: 4 }}>(you)</span>}
                  </td>
                  <td>{u.name}</td>
                  <td>
                    {editId === u.id ? (
                      <div style={{ display: 'flex', gap: 6, alignItems: 'center' }}>
                        <select className="sel" value={editRole} onChange={e => setEditRole(e.target.value)} style={{ fontSize: 11 }}>
                          <option value="admin">admin</option>
                          <option value="editor">editor</option>
                          <option value="viewer">viewer</option>
                        </select>
                        <ActionBtn onClick={() => handleRoleUpdate(u.id)}>Save</ActionBtn>
                        <ActionBtn onClick={() => setEditId(null)}>Cancel</ActionBtn>
                      </div>
                    ) : (
                      <span style={{ cursor: 'pointer' }} onClick={() => { setEditId(u.id); setEditRole(u.role); }}>
                        <Badge type={u.role} />
                      </span>
                    )}
                  </td>
                  <td style={{ fontFamily: 'var(--mono)', fontSize: 11, color: INK_4 }}>{new Date(u.created_at).toLocaleDateString()}</td>
                  <td>
                    {u.id !== me?.id &&
                      <ActionBtn danger onClick={() => handleDelete(u.id, u.username)}>Delete</ActionBtn>}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>

      <FormPanel title="New User" onSubmit={handleCreate}>
        <FieldRow label="Username">
          <input className="inp" value={username} onChange={e => setUsername(e.target.value)} placeholder="jdoe" style={{ width: '100%' }} />
        </FieldRow>
        <FieldRow label="Full name">
          <input className="inp" value={name} onChange={e => setName(e.target.value)} placeholder="Jane Doe" style={{ width: '100%' }} />
        </FieldRow>
        <FieldRow label="Role">
          <select className="sel" value={role} onChange={e => setRole(e.target.value)} style={{ width: '100%' }}>
            <option value="viewer">Viewer</option>
            <option value="editor">Editor</option>
            <option value="admin">Admin</option>
          </select>
        </FieldRow>
        <FieldRow label="Initial password">
          <input className="inp" type="password" value={password} onChange={e => setPassword(e.target.value)} placeholder="••••••••" style={{ width: '100%' }} />
        </FieldRow>
        {feedback && <div style={{ fontSize: 11, fontFamily: 'var(--mono)', color: feedback === 'User created.' ? D_LOW : D_HIGH }}>{feedback}</div>}
        <button type="submit" className="login-btn" disabled={!username || !name || !password}>Create User</button>
      </FormPanel>
    </div>
  );
}

// ── Tab: Audit ───────────────────────────────────────────────

const ACTION_COLORS: Record<string, string> = {
  login: ACCENT, export: '#7A5C1E', create: D_LOW, update: '#4A6A8A', delete: D_HIGH, upload: ACCENT, upsert: '#4A6A8A',
};

function AuditTab() {
  const [entries, setEntries] = useState<AuditEntry[]>([]);
  const [total, setTotal] = useState(0);
  const [page, setPage] = useState(0);
  const PAGE = 50;

  const load = (p: number) =>
    axios.get(`${API_BASE}/admin/audit?limit=${PAGE}&offset=${p * PAGE}`)
      .then(r => { setEntries(r.data.entries); setTotal(r.data.total); });

  useEffect(() => { load(0); }, []);
  useEffect(() => { load(page); }, [page]);

  return (
    <div className="panel">
      <div className="panel-head">
        <div className="titles"><div className="eyebrow eyebrow-ink">Audit Log</div><div className="h3">{total} events recorded</div></div>
        <ActionBtn onClick={() => { setPage(0); load(0); }}>Refresh</ActionBtn>
      </div>
      <div className="panel-body" style={{ padding: 0 }}>
        <table className="admin-table">
          <thead><tr><th>Time</th><th>User</th><th>Action</th><th>Resource</th><th>Detail</th><th>IP</th></tr></thead>
          <tbody>
            {entries.length === 0 ? <EmptyRow text="No audit entries yet" /> :
              entries.map(e => (
                <tr key={e.id}>
                  <td className="num" style={{ fontSize: 10, color: INK_4, whiteSpace: 'nowrap' }}>
                    {new Date(e.timestamp).toLocaleString()}
                  </td>
                  <td style={{ fontFamily: 'var(--mono)', fontSize: 11 }}>{e.user}</td>
                  <td>
                    <span style={{ fontFamily: 'var(--mono)', fontSize: 10, color: ACTION_COLORS[e.action] ?? INK_3, letterSpacing: '0.06em', textTransform: 'uppercase' }}>
                      {e.action}
                    </span>
                  </td>
                  <td style={{ fontFamily: 'var(--mono)', fontSize: 10, color: INK_4 }}>{e.resource}</td>
                  <td style={{ fontSize: 12, maxWidth: 260, overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap' }}>{e.detail}</td>
                  <td style={{ fontFamily: 'var(--mono)', fontSize: 10, color: INK_4 }}>{e.ip ?? '—'}</td>
                </tr>
              ))}
          </tbody>
        </table>
        {total > PAGE && (
          <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', padding: '12px 16px', borderTop: `1px solid ${RULE}` }}>
            <span className="caption">Showing {page * PAGE + 1}–{Math.min((page + 1) * PAGE, total)} of {total}</span>
            <div style={{ display: 'flex', gap: 8 }}>
              <ActionBtn onClick={() => setPage(p => p - 1)} disabled={page === 0}>← Prev</ActionBtn>
              <ActionBtn onClick={() => setPage(p => p + 1)} disabled={(page + 1) * PAGE >= total}>Next →</ActionBtn>
            </div>
          </div>
        )}
      </div>
    </div>
  );
}

// ── Main AdminPanel ──────────────────────────────────────────

const TABS = [
  { id: 'data',        label: 'Data',        adminOnly: true },
  { id: 'annotations', label: 'Annotations', adminOnly: false },
  { id: 'thresholds',  label: 'Thresholds',  adminOnly: false },
  { id: 'presets',     label: 'Presets',     adminOnly: false },
  { id: 'users',       label: 'Users',       adminOnly: true },
  { id: 'audit',       label: 'Audit Log',   adminOnly: true },
];

export default function AdminPanel() {
  const { user, isAdmin } = useAuth();
  const [activeTab, setActiveTab] = useState('data');

  const visibleTabs = TABS.filter(t => !t.adminOnly || isAdmin);

  return (
    <div className="view fade-in" style={{ overflowY: 'auto' }}>
      <div className="view-head">
        <div className="titles">
          <div className="eyebrow eyebrow-ink">Admin Panel</div>
          <h1 className="h-display" style={{ marginTop: 8 }}>System management.</h1>
          <p className="body" style={{ marginTop: 10, color: 'var(--ink-3)', maxWidth: 480 }}>
            Data uploads, annotations, alert thresholds, filter presets, user accounts, and audit history.
          </p>
        </div>
        <div className="ix">
          <div style={{ padding: '12px 16px', background: 'var(--paper-2)', border: '1px solid var(--rule)' }}>
            <div className="eyebrow" style={{ marginBottom: 6 }}>Signed in as</div>
            <div style={{ fontSize: 14, fontWeight: 500, color: INK }}>{user?.name}</div>
            <div style={{ marginTop: 2 }}><Badge type={user?.role ?? 'viewer'} /></div>
          </div>
        </div>
      </div>

      {/* Tab bar */}
      <div style={{ display: 'flex', gap: 0, borderBottom: `1px solid ${RULE}`, padding: '0 40px' }}>
        {visibleTabs.map(t => (
          <button key={t.id} onClick={() => setActiveTab(t.id)}
            style={{
              padding: '10px 18px', fontSize: 12, fontFamily: 'var(--mono)', letterSpacing: '0.06em',
              textTransform: 'uppercase', background: 'none', border: 'none', cursor: 'pointer',
              color: activeTab === t.id ? INK : INK_4,
              borderBottom: activeTab === t.id ? `2px solid ${INK}` : '2px solid transparent',
              marginBottom: -1,
            }}>
            {t.label}
          </button>
        ))}
      </div>

      {/* Tab content */}
      <div style={{ padding: '32px 40px' }}>
        {activeTab === 'data'        && <DataTab />}
        {activeTab === 'annotations' && <AnnotationsTab />}
        {activeTab === 'thresholds'  && <ThresholdsTab />}
        {activeTab === 'presets'     && <PresetsTab />}
        {activeTab === 'users'       && isAdmin && <UsersTab />}
        {activeTab === 'audit'       && isAdmin && <AuditTab />}
      </div>
    </div>
  );
}
