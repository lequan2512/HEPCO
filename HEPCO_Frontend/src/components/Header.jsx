import { useState, useEffect } from 'react';
import { Phone, Menu, X, ExternalLink, ShieldCheck } from 'lucide-react';
import { NavLink, Link, useLocation } from 'react-router-dom';
import { ROUTES } from '../constants/routes';
import logo from '../assets/images/logo.png';

const Header = () => {
  const [isMenuOpen, setIsMenuOpen] = useState(false);
  const [isScrolled, setIsScrolled] = useState(false);
  const location = useLocation();

  // Auto close mobile menu on route change
  const [prevPathname, setPrevPathname] = useState(location.pathname);
  if (location.pathname !== prevPathname) {
    setPrevPathname(location.pathname);
    setIsMenuOpen(false);
  }

  // Shadow and border effect on page scroll
  useEffect(() => {
    const handleScroll = () => {
      if (window.scrollY > 20) {
        setIsScrolled(true);
      } else {
        setIsScrolled(false);
      }
    };

    window.addEventListener('scroll', handleScroll, { passive: true });
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);

  // Lock body scroll when mobile drawer is open
  useEffect(() => {
    if (!isMenuOpen) return;
    const previousOverflow = document.body.style.overflow;
    const desktop = window.matchMedia('(min-width: 1024px)');
    const closeOnDesktop = () => { if (desktop.matches) setIsMenuOpen(false); };
    const closeOnEscape = (event) => { if (event.key === 'Escape') setIsMenuOpen(false); };
    document.body.style.overflow = 'hidden';
    desktop.addEventListener('change', closeOnDesktop);
    document.addEventListener('keydown', closeOnEscape);
    return () => {
      document.body.style.overflow = previousOverflow;
      desktop.removeEventListener('change', closeOnDesktop);
      document.removeEventListener('keydown', closeOnEscape);
    };
  }, [isMenuOpen]);

  const navItems = [
    { name: 'Trang Chủ', path: ROUTES.HOME },
    { name: 'Giới Thiệu', path: ROUTES.ABOUT },
    { name: 'Dịch Vụ', path: ROUTES.SERVICES },
    {
      name: 'Tin Tức & Thông Báo',
      path: ROUTES.NEWS_AND_ANNOUNCEMENTS,
      matchPaths: [ROUTES.NEWS_AND_ANNOUNCEMENTS, ROUTES.NEWS, ROUTES.ANNOUNCEMENTS]
    },
    { name: 'Quan Hệ Cổ Đông', path: ROUTES.SHAREHOLDERS },
    {
      name: 'Hóa Đơn Điện Tử',
      href: 'https://hoadondientu.hepco.com.vn/',
      isExternal: true,
    },
  ];

  return (
    <header
      className={`sticky top-0 w-full z-50 transition-all duration-300 ${isMenuOpen
        ? 'bg-white shadow-md border-b border-gray-200 py-2.5'
        : isScrolled
          ? 'bg-white/98 backdrop-blur-md shadow-md border-b border-gray-200/90 py-2 sm:py-2.5'
          : 'bg-white/95 backdrop-blur-md shadow-xs border-b border-gray-200/60 py-2.5 sm:py-3.5'
        }`}
    >
      <div className="container mx-auto px-3 sm:px-5 lg:px-6 xl:px-8 max-w-7xl">
        <div className="flex items-center justify-between gap-2 lg:gap-3 xl:gap-4">
          {/* Logo & Brand Identity */}
          <Link
            to={ROUTES.HOME}
            className="flex items-center gap-2.5 sm:gap-3 group shrink-0"
            title="HEPCO - Về Trang Chủ"
          >
            <div className="relative w-10 h-10 sm:w-11 sm:h-11 xl:w-12 xl:h-12 rounded-xl bg-white p-1 border border-gray-200/80 shadow-xs group-hover:border-emerald-500/50 group-hover:shadow-sm transition-all duration-300 flex items-center justify-center shrink-0">
              <img
                src={logo}
                alt="HEPCO Logo"
                className="w-full h-full object-contain group-hover:scale-105 transition-transform duration-300"
              />
            </div>
          </Link>

          {/* Desktop Navigation (1024px+): Strictly single-line with whitespace-nowrap */}
          <nav className="hidden lg:flex items-center gap-1 xl:gap-1.5 shrink-0">
            {navItems.map((item, index) => {
              if (item.isExternal) {
                return (
                  <a
                    key={index}
                    href={item.href}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="whitespace-nowrap shrink-0 inline-flex items-center gap-1.5 px-2.5 xl:px-3.5 py-2 rounded-xl text-[13px] xl:text-[14px] font-bold text-emerald-700 hover:text-emerald-800 hover:bg-emerald-50/80 transition-all duration-200 group"
                  >
                    <span>{item.name}</span>
                    <ExternalLink className="w-3.5 h-3.5 text-emerald-600 shrink-0 group-hover:translate-x-0.5 group-hover:-translate-y-0.5 transition-transform duration-200" />
                  </a>
                );
              }

              const isItemActive = item.matchPaths
                ? item.matchPaths.some((p) => location.pathname === p || location.pathname.startsWith(p + '/'))
                : location.pathname === item.path;

              return (
                <NavLink
                  key={index}
                  to={item.path}
                  className={`whitespace-nowrap shrink-0 px-2.5 xl:px-3.5 py-2 rounded-xl text-[13px] xl:text-[14px] font-bold transition-all duration-200 ${isItemActive
                    ? 'text-emerald-700 bg-emerald-50/90 shadow-2xs font-extrabold'
                    : 'text-gray-700 hover:text-[#10243b] hover:bg-gray-100/80'
                    }`}
                >
                  {item.name}
                </NavLink>
              );
            })}
          </nav>

          {/* Right Action: Hotline CTA, Admin Login & Mobile Toggle */}
          <div className="flex items-center gap-2 sm:gap-2.5 shrink-0">
            {/* Quick CMS Admin Portal Button */}
            <Link
              to={ROUTES.ADMIN_OVERVIEW}
              className="hidden lg:inline-flex items-center justify-center p-2 rounded-xl bg-gray-100 hover:bg-emerald-50 text-gray-700 hover:text-emerald-700 transition-colors shadow-2xs"
              title="Cổng Quản Trị Website CMS"
            >
              <ShieldCheck className="w-4 h-4 text-emerald-600" />
            </Link>

            {/* Mobile Hamburger Toggle Button (< 1024px) */}
            <button
              type="button"
              onClick={() => setIsMenuOpen(!isMenuOpen)}
              className="lg:hidden grid min-h-11 min-w-11 place-items-center rounded-xl text-gray-700 hover:bg-gray-100 active:scale-95 transition-all focus-visible:ring-2 focus-visible:ring-emerald-700 cursor-pointer"
              aria-expanded={isMenuOpen}
              aria-controls="mobile-site-menu"
              aria-label={isMenuOpen ? 'Đóng menu' : 'Mở menu'}
            >
              {isMenuOpen ? <X className="w-6 h-6 text-gray-800" /> : <Menu className="w-6 h-6" />}
            </button>
          </div>
        </div>
      </div>

      {/* Backdrop overlay for mobile drawer */}
      {isMenuOpen && (
        <div
          className="lg:hidden absolute top-full left-0 w-full h-[100dvh] bg-black/50 backdrop-blur-[2px] z-40 transition-opacity"
          onClick={() => setIsMenuOpen(false)}
        />
      )}

      {/* Mobile & Tablet Navigation Drawer */}
      <div
        id="mobile-site-menu"
        inert={!isMenuOpen}
        className={`lg:hidden absolute top-full left-0 w-full bg-white border-b border-gray-200 shadow-2xl transition-all duration-250 ease-out origin-top z-50 max-h-[calc(100dvh-72px)] overflow-y-auto ${isMenuOpen
          ? 'opacity-100 scale-y-100 visible'
          : 'opacity-0 scale-y-95 invisible pointer-events-none'
          }`}
      >
        <div className="container mx-auto px-4 py-4 space-y-1.5 max-w-7xl">
          <div className="grid grid-cols-1 sm:grid-cols-2 gap-1.5">
            {navItems.map((item, index) => {
              if (item.isExternal) {
                return (
                  <a
                    key={index}
                    href={item.href}
                    target="_blank"
                    rel="noopener noreferrer"
                    onClick={() => setIsMenuOpen(false)}
                    className="flex items-center justify-between px-4 py-3 rounded-xl text-sm font-bold text-emerald-800 bg-emerald-50 hover:bg-emerald-100 border border-emerald-200/80 transition-colors"
                  >
                    <span>{item.name}</span>
                    <ExternalLink className="w-4 h-4 text-emerald-600 shrink-0" />
                  </a>
                );
              }

              const isItemActive = item.matchPaths
                ? item.matchPaths.some((p) => location.pathname === p || location.pathname.startsWith(p + '/'))
                : location.pathname === item.path;

              return (
                <NavLink
                  key={index}
                  to={item.path}
                  onClick={() => setIsMenuOpen(false)}
                  className={`flex items-center justify-between px-4 py-3 rounded-xl text-sm font-bold transition-colors ${isItemActive
                    ? 'text-emerald-700 bg-emerald-50/90 border-l-4 border-emerald-600'
                    : 'text-gray-800 hover:text-[#10243b] hover:bg-gray-50'
                    }`}
                >
                  <span>{item.name}</span>
                </NavLink>
              );
            })}
          </div>

          {/* Mobile & Tablet Hotline Box & CMS Link */}
          <div className="pt-3 mt-2 border-t border-gray-200/80 space-y-2">
            <a
              href="tel:1900969669"
              className="flex items-center justify-center gap-3 w-full py-3 px-4 rounded-xl bg-[#10243b] hover:bg-emerald-700 text-white font-bold text-sm shadow-md transition-colors"
            >
              <Phone className="w-4 h-4 text-emerald-400 fill-current" />
              <span>Hotline Tư Vấn 24/7: 1900 969669</span>
            </a>

            <div className="flex items-center justify-between text-xs text-gray-500 px-1 pt-1">
              <span>Địa chỉ: 46 Trần Phú, TP. Huế</span>
              <Link
                to={ROUTES.ADMIN_OVERVIEW}
                onClick={() => setIsMenuOpen(false)}
                className="font-bold text-emerald-700 hover:underline inline-flex items-center gap-1"
              >
                <ShieldCheck className="w-3.5 h-3.5" />
                <span>Cổng CMS</span>
              </Link>
            </div>
          </div>
        </div>
      </div>
    </header>
  );
};

export default Header;
