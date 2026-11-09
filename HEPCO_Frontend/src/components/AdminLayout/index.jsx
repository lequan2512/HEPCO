import { useState, useEffect } from 'react';
import { Outlet, useNavigate, Link, useLocation, Navigate } from 'react-router-dom';
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
  Users
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

  // Auto close mobile drawer on route change
  const [prevPathname, setPrevPathname] = useState(location.pathname);
  if (location.pathname !== prevPathname) {
    setPrevPathname(location.pathname);
    setIsSidebarOpen(false);
  }

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

  // Immediate redirect if not authenticated (prevents blank screen)
  if (!isAuthenticated || !token) {
    return <Navigate to={ROUTES.ADMIN_LOGIN} replace />;
  }

  if (session.isPending || session.isError || !session.data?.canManageContent) {
    return (
      <main className="min-h-screen grid place-content-center gap-4 p-6 text-center">
        <p>{session.isPending ? 'Đang xác thực phiên đăng nhập…' : session.isError
          ? 'Không thể xác thực phiên. Kiểm tra kết nối tới máy chủ.'
          : 'Tài khoản này không có quyền quản trị nội dung.'}</p>
        {session.isError && <button type="button" onClick={() => session.refetch()}>Thử lại</button>}
        <button type="button" onClick={handleLogout}>Đăng xuất</button>
      </main>
    );
  }

  const currentUser = session.data.user;

  return (
    <div className="flex h-screen bg-gray-100 font-sans w-full overflow-hidden relative">
      {/* Mobile overlay */}
      {isSidebarOpen && (
        <div
          className="fixed inset-0 bg-black/60 backdrop-blur-xs z-40 lg:hidden transition-opacity"
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
            isCollapsed ? 'lg:justify-center lg:px-2' : ''
          }`}
        >
          <div className="flex items-center gap-3 overflow-hidden">
            <img
              src={logo}
              alt="HEPCO Logo"
              className="w-10 h-10 bg-white rounded-xl p-1 shrink-0 shadow-md"
            />
            <div className={`overflow-hidden transition-all duration-300 ${isCollapsed ? 'lg:hidden' : 'block'}`}>
              <h1 className="font-extrabold text-base tracking-wider truncate">HEPCO CMS</h1>
              <span className="text-[11px] text-emerald-200 block truncate">Quản trị Website</span>
            </div>
          </div>

          {/* Mobile close button */}
          <button
            onClick={() => setIsSidebarOpen(false)}
            className="lg:hidden p-1.5 text-emerald-200 hover:text-white rounded-lg cursor-pointer"
          >
            <X className="w-5 h-5" />
          </button>
        </div>

        {/* Navigation Items (Clean Grouped Structure) */}
        <nav className="flex-1 overflow-y-auto px-3 py-4 space-y-1.5 custom-scrollbar">
          {/* Main Dashboard Overview */}
          <NavItem
            to={ROUTES.ADMIN_OVERVIEW}
            icon={LayoutDashboard}
            label="Tổng Quan CMS"
            isActive={location.pathname === ROUTES.ADMIN_OVERVIEW}
            isCollapsed={isCollapsed}
            onClick={() => setIsSidebarOpen(false)}
          />

          {/* Group 1: Content Management (Quản lý nội dung) */}
          <SectionHeader label="Biên tập Nội Dung" isCollapsed={isCollapsed} />

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

        {/* Sidebar Footer: Collapse Toggle on Desktop & Quick Logout on Mobile */}
        <div className="p-3 border-t border-emerald-800 bg-[#0a6d36] shrink-0">
          <div className="flex items-center justify-between">
            <button
              onClick={toggleCollapse}
              className={`hidden lg:flex items-center gap-2 p-2 w-full text-emerald-200 hover:text-white hover:bg-emerald-700/50 rounded-xl transition-colors text-xs font-semibold ${
                isCollapsed ? 'justify-center' : ''
              }`}
              title={isCollapsed ? 'Mở rộng thanh menu' : 'Thu nhỏ thanh menu'}
            >
              {isCollapsed ? (
                <ChevronRight className="w-5 h-5 shrink-0" />
              ) : (
                <>
                  <ChevronLeft className="w-5 h-5 shrink-0" />
                  <span className="truncate">Thu gọn thanh điều hướng</span>
                </>
              )}
            </button>

            {/* Mobile drawer quick logout */}
            <button
              onClick={handleLogout}
              className="lg:hidden flex items-center justify-center gap-2 w-full py-2.5 px-3 rounded-xl bg-red-600/90 text-white font-bold text-xs hover:bg-red-700 transition-colors"
            >
              <LogOut className="w-4 h-4 shrink-0" />
              <span>Đăng xuất tài khoản</span>
            </button>
          </div>
        </div>
      </aside>

      {/* Main Content */}
      <main className="flex-1 flex flex-col h-screen overflow-hidden bg-gray-50 lg:ml-0 relative w-full">
        {/* Topbar */}
        <header className="bg-white shadow-xs h-14 sm:h-16 flex items-center justify-between px-3 sm:px-4 lg:px-8 border-b border-gray-200 z-10 shrink-0">
          <div className="flex items-center gap-2 sm:gap-3 text-gray-500">
            {/* Mobile menu trigger */}
            <button
              className="lg:hidden p-2 rounded-xl hover:bg-gray-100 text-gray-700 cursor-pointer active:scale-95 transition-all"
              onClick={() => setIsSidebarOpen(true)}
              aria-label="Mở thanh điều hướng"
            >
              <Menu className="w-5 h-5" />
            </button>

            <span className="font-extrabold text-xs sm:text-sm text-gray-800 truncate max-w-[200px] sm:max-w-none">
              Quản trị Website HEPCO
            </span>
          </div>

          <div className="flex items-center gap-2 sm:gap-3.5">
            <Link
              to={ROUTES.HOME}
              target="_blank"
              className="inline-flex items-center gap-1.5 px-2.5 sm:px-3 py-1.5 rounded-xl bg-emerald-50 hover:bg-emerald-100 text-emerald-800 border border-emerald-200 text-xs font-bold transition-colors shadow-2xs"
              title="Mở xem Website HEPCO trong tab mới"
            >
              <ExternalLink className="w-3.5 h-3.5" />
              <span className="hidden sm:inline">Xem Website</span>
            </Link>

            <div className="relative" id="user-profile-menu">
              <button
                onClick={() => setIsUserMenuOpen(!isUserMenuOpen)}
                className="flex items-center gap-2 p-1 sm:p-1.5 rounded-xl hover:bg-gray-100 transition-colors focus:outline-none cursor-pointer"
              >
                <div className="w-8 h-8 rounded-full bg-emerald-100 text-[#0e8a44] flex items-center justify-center font-bold text-xs shadow-xs border border-emerald-200">
                  {currentUser.username ? currentUser.username.slice(0, 2).toUpperCase() : 'AD'}
                </div>
                <span className="text-xs sm:text-sm font-semibold text-gray-700 hidden sm:inline">
                  {currentUser.username || 'Admin'}
                </span>
                <ChevronDown
                  className={`w-3.5 h-3.5 text-gray-500 transition-transform ${
                    isUserMenuOpen ? 'rotate-180' : ''
                  }`}
                />
              </button>

              {/* Dropdown Popup Menu */}
              {isUserMenuOpen && (
                <div className="absolute right-0 mt-2 w-48 bg-white rounded-xl shadow-xl border border-gray-100 py-1.5 z-50">
                  <div className="px-4 py-2 border-b border-gray-100">
                    <p className="text-xs font-bold text-gray-800 truncate">
                      {currentUser.username || 'admin'}
                    </p>
                    <p className="text-[11px] text-emerald-600 font-semibold truncate">
                      {currentUser.role || 'Quản trị viên'}
                    </p>
                  </div>

                  <Link
                    to={ROUTES.ADMIN_USERS}
                    onClick={() => setIsUserMenuOpen(false)}
                    className="flex items-center gap-2.5 px-4 py-2 text-xs font-semibold text-gray-700 hover:bg-gray-50"
                  >
                    <Users className="w-4 h-4 text-gray-400" />
                    <span>Quản lý tài khoản</span>
                  </Link>

                  <button
                    onClick={() => {
                      setIsUserMenuOpen(false);
                      handleLogout();
                    }}
                    className="w-full flex items-center gap-2.5 px-4 py-2 text-xs font-semibold text-red-600 hover:bg-red-50 transition-colors text-left cursor-pointer border-t border-gray-100 mt-1"
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
