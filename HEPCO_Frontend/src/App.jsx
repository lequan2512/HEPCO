import { useEffect } from 'react';
import { BrowserRouter as Router, Routes, Route, Outlet, Navigate, useLocation } from 'react-router-dom';
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';
import { Toaster } from 'react-hot-toast';

import Header from './components/Header';
import Footer from './components/Footer';
import Home from './pages/user/Home';
import About from './pages/user/About';
import Services from './pages/user/Services';
import News from './pages/user/News';
import ArticleDetail from './pages/user/ArticleDetail';

import AdminLogin from './pages/admin/AdminLogin';
import AdminLayout from './components/AdminLayout';
import AdminCmsOverview from './pages/admin/AdminCmsOverview';
import AdminNewsManager from './pages/admin/AdminNewsManager';
import AdminAboutManager from './pages/admin/AdminAboutManager';
import AdminShowcaseManager from './pages/admin/AdminShowcaseManager';
import AdminGalleryManager from './pages/admin/AdminGalleryManager';
import AdminBannerManager from './pages/admin/AdminBannerManager';
import AdminUserManager from './pages/admin/AdminUserManager';
import { ROUTES } from './constants/routes';

const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      refetchOnWindowFocus: false,
      retry: 1,
      staleTime: 5 * 60 * 1000
    }
  }
});

// Scroll to top helper on route change
const ScrollToTop = () => {
  const { pathname } = useLocation();
  useEffect(() => {
    window.scrollTo(0, 0);
  }, [pathname]);
  return null;
};

// Public layout with Header & Footer
const PublicLayout = () => {
  return (
    <div className="min-h-screen bg-gray-50 flex flex-col font-sans">
      <Header />
      <main className="flex-grow flex flex-col">
        <Outlet />
      </main>
      <Footer />
    </div>
  );
};

const AppRoutes = () => {
  return (
    <>
      <ScrollToTop />
      <Routes>
        {/* ================= PUBLIC PORTAL ================= */}
        <Route element={<PublicLayout />}>
          <Route path={ROUTES.HOME} element={<Home />} />
          <Route path={ROUTES.ABOUT} element={<About />} />
          <Route path={ROUTES.SERVICES} element={<Services />} />
          <Route path={ROUTES.NEWS} element={<News pageType="news" />} />
          <Route path={ROUTES.ANNOUNCEMENTS} element={<News pageType="announcements" />} />
          <Route path={ROUTES.SHAREHOLDERS} element={<News pageType="shareholders" />} />
          <Route path={ROUTES.ARTICLE_DETAIL} element={<ArticleDetail />} />
          <Route path="/tin-tuc/:id" element={<ArticleDetail />} />
          <Route path="/quan-he-co-dong/:id" element={<ArticleDetail />} />
        </Route>

        {/* ================= ADMIN AUTH ================= */}
        <Route path={ROUTES.ADMIN_LOGIN} element={<AdminLogin />} />
        <Route path="/admin-login" element={<Navigate to={ROUTES.ADMIN_LOGIN} replace />} />
        <Route path="/admin" element={<Navigate to={ROUTES.ADMIN_OVERVIEW} replace />} />

        {/* ================= ADMIN CMS DASHBOARD ================= */}
        <Route path="/admin-dashboard" element={<AdminLayout />}>
          <Route index element={<Navigate to="overview" replace />} />
          <Route path="overview" element={<AdminCmsOverview />} />
          
          {/* Content modules */}
          <Route path="news" element={<AdminNewsManager type="news" />} />
          <Route path="announcements" element={<AdminNewsManager type="announcement" />} />
          <Route path="shareholders" element={<AdminNewsManager type="shareholders" />} />
          <Route path="services" element={<AdminNewsManager type="service" />} />
          
          {/* Website appearance & info */}
          <Route path="about" element={<AdminAboutManager />} />
          <Route path="showcase" element={<AdminShowcaseManager />} />
          <Route path="banners" element={<AdminBannerManager />} />
          <Route path="gallery" element={<AdminGalleryManager />} />
          
          {/* Accounts & Roles */}
          <Route path="users" element={<AdminUserManager />} />
        </Route>

        {/* ================= CATCH ALL FALLBACK ================= */}
        <Route path="*" element={<Navigate to="/" replace />} />
      </Routes>
    </>
  );
};

function App() {
  return (
    <QueryClientProvider client={queryClient}>
      <Router>
        <Toaster position="top-right" />
        <AppRoutes />
      </Router>
    </QueryClientProvider>
  );
}

export default App;
