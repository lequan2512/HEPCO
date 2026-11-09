import { create } from 'zustand';

const storedUser = (() => {
  try {
    const raw = localStorage.getItem('adminUser');
    return raw ? JSON.parse(raw) : null;
  } catch {
    return null;
  }
})();

const useAuthStore = create((set) => ({
  token: localStorage.getItem('adminToken') || null,
  user: storedUser,
  isAuthenticated: !!localStorage.getItem('adminToken'),
  setAuth: (token, user = null) => {
    localStorage.setItem('adminToken', token);
    localStorage.setItem('isAdminLoggedIn', 'true');
    if (user) localStorage.setItem('adminUser', JSON.stringify(user));
    set({ token, user, isAuthenticated: true });
  },
  logout: () => {
    localStorage.removeItem('adminToken');
    localStorage.removeItem('isAdminLoggedIn');
    localStorage.removeItem('adminUser');
    set({ token: null, user: null, isAuthenticated: false });
  },
}));

export default useAuthStore;
