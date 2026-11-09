import { useState, useEffect } from 'react';
import { Outlet, useNavigate, Link, useLocation } from 'react-router-dom';
import {
  LayoutDashboard,
  Newspaper,
  TrendingUp,
  Wrench,
  Image as ImageIcon,
  Sliders,
  Bell,
  Sparkles,
  Info,
  LogOut,
  Menu,
  X,
  ChevronDown,
  ChevronLeft,
  ChevronRight,
  ExternalLink,
  ShieldCheck
} from 'lucide-react';

import useAuthStore from '../../store/useAuthStore';
import { useSession } from '../../apis/auth';
import { ROUTES } from '../../constants/routes';
import logo from '../../assets/images/logo.png';

const NavItem = ({ to, icon: Icon, label, isActive, isCollapsed, onClick }) => {
  return (
    <div className="relative group">
      <Link
        to={to}
        onClick={onClick}
        className={`flex items-center gap-3 py-2.5 rounded-xl transition-all duration-200 px-4 ${
          isCollapsed ? 'lg:justify-center lg:w-10 lg:h-10 lg:mx-auto lg:px-0' : ''
        } ${
          isActive
            ? 'bg-emerald-800 text-white font-semibold shadow-md'
            : 'text-emerald-100 hover:bg-emerald-700/80 hover:text-white'
        }`}
      >
        <Icon className="w-5 h-5 shrink-0" />
        <span className={`truncate text-sm ${isCollapsed ? 'lg:hidden' : 'block'}`}>
          {label}
        </span>
      </Link>

      {/* Hover Tooltip when Sidebar is Collapsed on Desktop */}
      {isCollapsed && (
        <div className="hidden lg:flex absolute left-full top-1/2 -translate-y-1/2 ml-3 px-3 py-1.5 bg-gray-900 text-white text-xs font-semibold rounded-lg shadow-xl opacity-0 pointer-events-none group-hover:opacity-100 group-hover:translate-x-1 transition-all duration-200 whitespace-nowrap z-50 items-center gap-1.5 border border-gray-700/50">
          <div className="absolute -left-1 top-1/2 -translate-y-1/2 border-4 border-transparent border-r-gray-900"></div>
          {label}
        </div>
      )}
    </div>
  );
};

const SectionHeader = ({ label, isCollapsed }) => {
  return (
    <>
      {isCollapsed && <div className="hidden lg:block w-8 h-px bg-emerald-700/60 mx-auto my-3" />}
      <div
        className={`text-[11px] uppercase font-bold text-emerald-300 tracking-wider mb-2 mt-5 px-4 border-t border-emerald-800/80 pt-3.5 ${
          isCollapsed ? 'lg:hidden' : 'block'
        }`}
      >
        {label}
      </div>
    </>
  );
};

const AdminLayout = () => {
  const { isAuthenticated, token, logout } = useAuthStore();
  const session = useSession(token);
  const navigate = useNavigate();
  const location = useLocation();

  const [isSidebarOpen, setIsSidebarOpen] = useState(false);
  const [isUserMenuOpen, setIsUserMenuOpen] = useState(false);

  // Sidebar Collapse state for Desktop
  const [isCollapsed, setIsCollapsed] = useState(() => {
    return localStorage.getItem('sidebar_collapsed') === 'true';
  });

  const toggleCollapse = () => {
    setIsCollapsed((prev) => {
      const next = !prev;
      localStorage.setItem('sidebar_collapsed', String(next));
      return next;
    });
  };

  useEffect(() => {
    if (!isAuthenticated) {
      navigate(ROUTES.ADMIN_LOGIN);
    }
  }, [isAuthenticated, navigate]);

  useEffect(() => {
    const handleClickOutside = (e) => {
      if (!e.target.closest('#user-profile-menu')) {
        setIsUserMenuOpen(false);
      }
    };
    document.addEventListener('click', handleClickOutside);
    return () => document.removeEventListener('click', handleClickOutside);
  }, []);

  const handleLogout = () => {
    logout();
    navigate(ROUTES.ADMIN_LOGIN);
  };

  if (!isAuthenticated) return null;
  if (session.isPending && !token?.includes('hepco')) {
    return <div className="flex items-center justify-center min-h-screen text-gray-500 text-sm font-medium">Đang tải giao diện quản trị...</div>;
  }

  return (
    <div className="flex h-screen bg-gray-100 font-sans w-full overflow-hidden relative">
      {/* Mobile overlay */}
      {isSidebarOpen && (
        <div
          className="fixed inset-0 bg-black/60 backdrop-blur-xs z-40 lg:hidden"
          onClick={() => setIsSidebarOpen(false)}
        />
      )}

      {/* Sidebar */}
      <aside
        className={`fixed lg:static inset-y-0 left-0 bg-[#0e8a44] text-white flex flex-col shadow-2xl z-50 transition-all duration-300 ease-in-out w-64 overflow-x-hidden ${
          isCollapsed ? 'lg:w-20' : 'lg:w-64'
        } ${isSidebarOpen ? 'translate-x-0' : '-translate-x-full lg:translate-x-0'}`}
      >
        {/* Sidebar Header */}
        <div
          className={`p-4 border-b border-emerald-800 flex items-center justify-between transition-all ${
            isCollapsed ? 'lg:justify-center lg:flex-col lg:gap-2.5 py-4' : 'py-4 px-5'
          }`}
        >
          <Link to={ROUTES.ADMIN_OVERVIEW} className="flex items-center gap-3 overflow-hidden">
            <img
              src={logo}
              alt="HEPCO"
              className="h-9 w-9 object-contain bg-white p-1 rounded-full shrink-0 shadow-sm"
            />
            <span
              className={`font-extrabold text-sm tracking-wider truncate text-white ${
                isCollapsed ? 'lg:hidden' : 'block'
              }`}
            >
              HEPCO CMS
            </span>
          </Link>

          {/* Desktop Toggle Button */}
          <button
            onClick={toggleCollapse}
            className="hidden lg:flex items-center justify-center w-7 h-7 rounded-lg bg-emerald-800/80 text-emerald-200 hover:bg-emerald-700 hover:text-white transition-colors shrink-0 cursor-pointer"
            title={isCollapsed ? 'Mở rộng sidebar' : 'Thu gọn sidebar'}
          >
            {isCollapsed ? (
              <ChevronRight className="w-4 h-4" />
            ) : (
              <ChevronLeft className="w-4 h-4" />
            )}
          </button>

          {/* Mobile Close Button */}
          <button
            className="lg:hidden text-white p-1 rounded-md hover:bg-emerald-800 transition-colors cursor-pointer"
            onClick={() => setIsSidebarOpen(false)}
            aria-label="Đóng sidebar"
          >
            <X className="w-6 h-6" />
          </button>
        </div>

        {/* Sidebar Navigation - Strictly CMS Website Content Management */}
        <nav className="flex-1 p-3 space-y-1 overflow-y-auto overflow-x-hidden custom-scrollbar">
          {/* Dashboard */}
          <NavItem
            to={ROUTES.ADMIN_OVERVIEW}
            icon={LayoutDashboard}
            label="Tổng Quan Website"
            isActive={
              location.pathname === ROUTES.ADMIN_OVERVIEW ||
              location.pathname === ROUTES.ADMIN_DASHBOARD
            }
            isCollapsed={isCollapsed}
            onClick={() => setIsSidebarOpen(false)}
          />

          {/* Group 1: Content Publishing (Tin tức, Thông báo, Cổ đông, Dịch vụ) */}
          <SectionHeader label="Cập nhật Nội dung" isCollapsed={isCollapsed} />
          
          <NavItem
            to={ROUTES.ADMIN_NEWS}
            icon={Newspaper}
            label="Cập Nhật Tin Tức"
            isActive={location.pathname === ROUTES.ADMIN_NEWS}
            isCollapsed={isCollapsed}
            onClick={() => setIsSidebarOpen(false)}
          />

          <NavItem
            to={ROUTES.ADMIN_ANNOUNCEMENTS}
            icon={Bell}
            label="Cập Nhật Thông Báo"
            isActive={location.pathname === ROUTES.ADMIN_ANNOUNCEMENTS}
            isCollapsed={isCollapsed}
            onClick={() => setIsSidebarOpen(false)}
          />

          <NavItem
            to={ROUTES.ADMIN_SHAREHOLDERS}
            icon={TrendingUp}
            label="Quan Hệ Cổ Đông"
            isActive={location.pathname === ROUTES.ADMIN_SHAREHOLDERS}
            isCollapsed={isCollapsed}
            onClick={() => setIsSidebarOpen(false)}
          />

          <NavItem
            to={ROUTES.ADMIN_SERVICES}
            icon={Wrench}
            label="Dịch Vụ Công Ty"
            isActive={location.pathname.includes('/services')}
            isCollapsed={isCollapsed}
            onClick={() => setIsSidebarOpen(false)}
          />

          {/* Group 2: Website Information & Display (Chỉnh sửa thông tin trên web) */}
          <SectionHeader label="Chỉnh sửa Thông tin Web" isCollapsed={isCollapsed} />

          <NavItem
            to={ROUTES.ADMIN_ABOUT}
            icon={Info}
            label="Thông Tin Giới Thiệu"
            isActive={location.pathname.includes('/about')}
            isCollapsed={isCollapsed}
            onClick={() => setIsSidebarOpen(false)}
          />

          <NavItem
            to={ROUTES.ADMIN_SHOWCASE}
            icon={Sparkles}
            label="Showcase Dự Án 2026"
            isActive={location.pathname === ROUTES.ADMIN_SHOWCASE}
            isCollapsed={isCollapsed}
            onClick={() => setIsSidebarOpen(false)}
          />

          <NavItem
            to={ROUTES.ADMIN_BANNERS}
            icon={Sliders}
            label="Banner & Hero Trang Chủ"
            isActive={location.pathname.includes('/banners')}
            isCollapsed={isCollapsed}
            onClick={() => setIsSidebarOpen(false)}
          />

          <NavItem
            to={ROUTES.ADMIN_GALLERY}
            icon={ImageIcon}
            label="Thư Viện Hình Ảnh"
            isActive={location.pathname.includes('/gallery')}
            isCollapsed={isCollapsed}
            onClick={() => setIsSidebarOpen(false)}
          />

          {/* Group 3: Admin Accounts & Permissions */}
          <SectionHeader label="Tài Khoản & Phân Quyền" isCollapsed={isCollapsed} />
          <NavItem
            to={ROUTES.ADMIN_USERS}
            icon={Users}
            label="Quản Lý Tài Khoản"
            isActive={location.pathname === ROUTES.ADMIN_USERS}
            isCollapsed={isCollapsed}
            onClick={() => setIsSidebarOpen(false)}
          />
        </nav>
      </aside>

      {/* Main Content */}
      <main className="flex-1 flex flex-col h-screen overflow-hidden bg-gray-50 lg:ml-0 relative w-full">
        {/* Topbar */}
        <header className="bg-white shadow-xs h-14 sm:h-16 flex items-center justify-between px-3 sm:px-4 lg:px-8 border-b border-gray-200 z-10 shrink-0">
          <div className="flex items-center gap-3 text-gray-500">
            {/* Mobile menu trigger */}
            <button
              className="lg:hidden p-1.5 rounded-lg hover:bg-gray-100 text-gray-700 cursor-pointer"
              onClick={() => setIsSidebarOpen(true)}
            >
              <Menu className="w-6 h-6" />
            </button>

            <span className="font-extrabold text-sm hidden sm:block text-gray-800">
              Hệ thống Quản trị Nội dung Website HEPCO
            </span>
          </div>

          <div className="flex items-center gap-3 sm:gap-4">
            <Link
              to={ROUTES.HOME}
              target="_blank"
              className="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-xl bg-emerald-50 hover:bg-emerald-100 text-emerald-800 border border-emerald-200 text-xs font-bold transition-colors"
              title="Mở xem Website HEPCO trong tab mới"
            >
              <ExternalLink className="w-3.5 h-3.5" />
              <span className="hidden xs:inline">Xem Website</span>
            </Link>

            <div className="relative" id="user-profile-menu">
              <button
                onClick={() => setIsUserMenuOpen(!isUserMenuOpen)}
                className="flex items-center gap-2.5 p-1.5 rounded-lg hover:bg-gray-100 transition-colors focus:outline-none cursor-pointer"
              >
                <img
                  src={logo}
                  alt="Admin"
                  className="w-8 h-8 bg-white rounded-full border border-gray-200 p-0.5 object-contain shadow-sm"
                />
                <span className="text-sm font-semibold text-gray-700">Admin</span>
                <ChevronDown
                  className={`w-4 h-4 text-gray-500 transition-transform ${
                    isUserMenuOpen ? 'rotate-180' : ''
                  }`}
                />
              </button>

              {/* Dropdown Popup Menu */}
              {isUserMenuOpen && (
                <div className="absolute right-0 mt-2 w-48 bg-white rounded-xl shadow-xl border border-gray-100 py-1.5 z-50">
                  <div className="px-4 py-2 border-b border-gray-100">
                    <p className="text-xs font-bold text-gray-800">Tài khoản Quản trị</p>
                    <p className="text-[11px] text-gray-500 truncate">admin@hepco.com.vn</p>
                  </div>

                  <button
                    onClick={() => {
                      setIsUserMenuOpen(false);
                      handleLogout();
                    }}
                    className="w-full flex items-center gap-3 px-4 py-2.5 text-xs font-semibold text-red-600 hover:bg-red-50 transition-colors text-left cursor-pointer"
                  >
                    <LogOut className="w-4 h-4 text-red-500" />
                    <span>Đăng xuất</span>
                  </button>
                </div>
              )}
            </div>
          </div>
        </header>

        {/* Content Area */}
        <div className="flex-1 overflow-y-auto p-3 sm:p-5 lg:p-6 relative">
          <Outlet />
        </div>
      </main>
    </div>
  );
};

export default AdminLayout;
