import { createContext, useContext, useState, useEffect, useCallback, ReactNode } from 'react';
import axios from 'axios';
import { API_BASE } from '../data/constants';

interface User {
  id: string;
  username: string;
  name: string;
  role: 'admin' | 'editor' | 'viewer';
}

interface AuthState {
  user: User | null;
  token: string | null;
  loading: boolean;
}

interface AuthContextValue extends AuthState {
  login: (username: string, password: string) => Promise<void>;
  logout: () => void;
  isAdmin: boolean;
  isEditor: boolean;
}

const AuthContext = createContext<AuthContextValue | null>(null);

const TOKEN_KEY = 'idph_token';

// Attach auth token to every axios request
let _interceptorId: number | null = null;

function setAxiosToken(token: string | null) {
  if (_interceptorId !== null) {
    axios.interceptors.request.eject(_interceptorId);
    _interceptorId = null;
  }
  if (token) {
    _interceptorId = axios.interceptors.request.use(cfg => {
      cfg.headers = cfg.headers ?? {};
      cfg.headers['Authorization'] = `Bearer ${token}`;
      return cfg;
    });
  }
}

export function AuthProvider({ children }: { children: ReactNode }) {
  const [state, setState] = useState<AuthState>({ user: null, token: null, loading: true });

  const applyToken = useCallback((token: string) => {
    setAxiosToken(token);
    localStorage.setItem(TOKEN_KEY, token);
  }, []);

  // Validate stored token on mount
  useEffect(() => {
    const stored = localStorage.getItem(TOKEN_KEY);
    if (!stored) { setState(s => ({ ...s, loading: false })); return; }
    setAxiosToken(stored);
    axios.get(`${API_BASE}/auth/me`)
      .then(r => setState({ user: r.data, token: stored, loading: false }))
      .catch(() => {
        localStorage.removeItem(TOKEN_KEY);
        setAxiosToken(null);
        setState({ user: null, token: null, loading: false });
      });
  }, []);

  const login = useCallback(async (username: string, password: string) => {
    const r = await axios.post(`${API_BASE}/auth/login`, { username, password });
    const { access_token, user } = r.data;
    applyToken(access_token);
    setState({ user, token: access_token, loading: false });
  }, [applyToken]);

  const logout = useCallback(() => {
    localStorage.removeItem(TOKEN_KEY);
    setAxiosToken(null);
    setState({ user: null, token: null, loading: false });
  }, []);

  const value: AuthContextValue = {
    ...state,
    login,
    logout,
    isAdmin: state.user?.role === 'admin',
    isEditor: state.user?.role === 'admin' || state.user?.role === 'editor',
  };

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>;
}

export function useAuth(): AuthContextValue {
  const ctx = useContext(AuthContext);
  if (!ctx) throw new Error('useAuth must be inside AuthProvider');
  return ctx;
}
