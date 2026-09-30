import { createContext, useContext, ReactNode } from 'react';

// Auth is bypassed for local use — every session is the built-in admin.
interface User {
  id: string;
  username: string;
  name: string;
  role: 'admin' | 'editor' | 'viewer';
}

interface AuthContextValue {
  user: User;
  loading: boolean;
  logout: () => void;
  isAdmin: boolean;
  isEditor: boolean;
}

const FAKE_USER: User = { id: '1', username: 'admin', name: 'IDPH Admin', role: 'admin' };

const AuthContext = createContext<AuthContextValue | null>(null);

export function AuthProvider({ children }: { children: ReactNode }) {
  const value: AuthContextValue = {
    user: FAKE_USER,
    loading: false,
    logout: () => {},
    isAdmin: true,
    isEditor: true,
  };
  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>;
}

export function useAuth(): AuthContextValue {
  const ctx = useContext(AuthContext);
  if (!ctx) throw new Error('useAuth must be inside AuthProvider');
  return ctx;
}
