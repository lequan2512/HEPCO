import { useState, useRef } from 'react';
import { useNavigate, Link } from 'react-router-dom';
import { useQuery, useQueryClient } from '@tanstack/react-query';
import {
  Newspaper,
  TrendingUp,
  Wrench,
  Image as ImageIcon,
  Building2,
  Sliders,
  Bell,
  Sparkles,
  ExternalLink,
  Download,
  Upload,
  RotateCcw,
  CheckCircle2,
  ArrowRight,
  Plus,
  Users
} from 'lucide-react';
import toast from 'react-hot-toast';
import { ROUTES } from '../../../constants/routes';
import {
  getCmsOverviewCounts,
  exportCmsDataJson,
  importCmsDataJson,
  resetLocalOverrides
} from '../../../services/news.service';
import ConfirmModal from '../../../components/ConfirmModal';

const AdminCmsOverview = () => {
  const navigate = useNavigate();
  const queryClient = useQueryClient();
  const fileInputRef = useRef(null);
  const [confirmReset, setConfirmReset] = useState(false);

  const { data: counts = {} } = useQuery({ queryKey: ['cms-overview'], queryFn: getCmsOverviewCounts });

  const modules = [
    {
      title: 'Cập Nhật Tin Tức',
      count: counts.newsCount ?? 0,
      unit: 'bài viết',
      description: 'Quản lý tin hoạt động công ty, sự kiện, môi trường, đoàn thể và sản xuất kinh doanh với trình soạn thảo phong phú.',
      icon: Newspaper,
      color: 'bg-emerald-50 text-emerald-700 border-emerald-200',
      route: ROUTES.ADMIN_NEWS,
      publicRoute: ROUTES.NEWS
    },
    {
      title: 'Cập Nhật Thông Báo',
      count: 12,
      unit: 'thông báo',
      description: 'Quản lý thông báo chính thức, thông báo tuyển dụng, thông báo đấu thầu và công văn pháp quy đính kèm tài liệu.',
      icon: Bell,
      color: 'bg-amber-50 text-amber-700 border-amber-200',
      route: ROUTES.ADMIN_ANNOUNCEMENTS,
      publicRoute: ROUTES.ANNOUNCEMENTS
    },
    {
      title: 'Quan Hệ Cổ Đông',
      count: counts.shareholdersCount ?? 0,
      unit: 'tài liệu',
      description: 'Đăng tải báo cáo tài chính đã kiểm toán, báo cáo thường niên, nghị quyết ĐHĐCĐ, thông báo cổ tức & file PDF.',
      icon: TrendingUp,
      color: 'bg-blue-50 text-blue-700 border-blue-200',
      route: ROUTES.ADMIN_SHAREHOLDERS,
      publicRoute: ROUTES.SHAREHOLDERS
    },
    {
      title: 'Dịch Vụ Công Ty',
      count: counts.servicesCount ?? 0,
      unit: 'dịch vụ',
      description: 'Cập nhật nội dung các dịch vụ thu gom chất thải, vệ sinh môi trường, thoát nước, chiếu sáng và chăm sóc cây xanh.',
      icon: Wrench,
      color: 'bg-purple-50 text-purple-700 border-purple-200',
      route: ROUTES.ADMIN_SERVICES,
      publicRoute: ROUTES.SERVICES
    },
    {
      title: 'Thông Tin Giới Thiệu & Thư Ngỏ',
      count: (counts.aboutCount ?? 0) + 4,
      unit: 'mục cấu hình',
      description: 'Chỉnh sửa Thư ngỏ Ban Lãnh Đạo, số liệu năng lực, Giấy phép môi trường 317 & 48, Sơ đồ tổ chức & Hồ sơ năng lực 2026.',
      icon: Building2,
      color: 'bg-teal-50 text-teal-700 border-teal-200',
      route: ROUTES.ADMIN_ABOUT,
      publicRoute: ROUTES.ABOUT
    },
    {
      title: 'Showcase Dự Án 2026',
      count: 4,
      unit: 'dự án',
      description: 'Quản lý 4 Dự án trọng điểm năm 2026 và các công trình nổi bật hiển thị ở vị trí danh dự trên trang chủ.',
      icon: Sparkles,
      color: 'bg-indigo-50 text-indigo-700 border-indigo-200',
      route: ROUTES.ADMIN_SHOWCASE,
      publicRoute: ROUTES.HOME
    },
    {
      title: 'Banner & Hero Trang Chủ',
      count: counts.bannersCount ?? 0,
      unit: 'banner',
      description: 'Tùy chỉnh tiêu đề trang chủ, hotline hiển thị, video Youtube giới thiệu và danh sách banner chạy trên trang chủ.',
      icon: Sliders,
      color: 'bg-rose-50 text-rose-700 border-rose-200',
      route: ROUTES.ADMIN_BANNERS,
      publicRoute: ROUTES.HOME
    },
    {
      title: 'Thư Viện Hình Ảnh',
      count: counts.galleryCount ?? 0,
      unit: 'hình ảnh',
      description: 'Quản lý kho ảnh thực tế phân theo chủ đề: Hoạt động công ty, Môi trường, Sự kiện đoàn thể, Phương tiện & Công trình.',
      icon: ImageIcon,
      color: 'bg-cyan-50 text-cyan-700 border-cyan-200',
      route: ROUTES.ADMIN_GALLERY,
      publicRoute: `${ROUTES.NEWS}?tab=gallery`
    },
    {
      title: 'Tài Khoản & Phân Quyền',
      count: 2,
      unit: 'tài khoản',
      description: 'Cấp mới tài khoản quản trị, thiết lập phân quyền (Quản trị tối cao, Quản trị viên, Biên tập viên) và bảo mật.',
      icon: Users,
      color: 'bg-violet-50 text-violet-700 border-violet-200',
      route: ROUTES.ADMIN_USERS,
      publicRoute: ROUTES.ADMIN_USERS
    }
  ];

  const handleExportJson = () => {
    try {
      const jsonStr = exportCmsDataJson();
      const blob = new Blob([jsonStr], { type: 'application/json' });
      const url = URL.createObjectURL(blob);
      const a = document.createElement('a');
      a.href = url;
      a.download = `hepco-cms-backup-${new Date().toISOString().slice(0, 10)}.json`;
      a.click();
      URL.revokeObjectURL(url);
      toast.success('Đã xuất tệp sao lưu dữ liệu CMS!');
    } catch {
      toast.error('Không thể xuất dữ liệu');
    }
  };

  const handleImportJson = async (e) => {
    const file = e.target.files?.[0];
    if (!file) return;
    try {
      const text = await file.text();
      importCmsDataJson(text);
      queryClient.invalidateQueries();

      toast.success('Đã khôi phục dữ liệu CMS từ tệp sao lưu!');
    } catch {
      toast.error('Tệp JSON không hợp lệ!');
    } finally {
      if (fileInputRef.current) fileInputRef.current.value = '';
    }
  };

  const handleResetDefaults = () => {
    resetLocalOverrides();
    queryClient.invalidateQueries();

    setConfirmReset(false);
    toast.success('Đã khôi phục dữ liệu mặc định từ hệ thống gốc!');
  };

  return (
    <div className="space-y-6">
      {/* Top Banner Card */}
      <div className="bg-gradient-to-r from-[#10243b] via-emerald-900 to-[#0e8a44] rounded-2xl p-5 sm:p-7 text-white shadow-lg flex flex-col lg:flex-row lg:items-center justify-between gap-5">
        <div>
          <span className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-bold bg-white/15 text-emerald-200 mb-3">
            <CheckCircle2 className="w-3.5 h-3.5" />
            Hệ thống Quản trị Website HEPCO 2026
          </span>
          <h1 className="text-xl sm:text-2xl md:text-3xl font-extrabold leading-tight">
            Quản trị Nội dung Website Chuyên Biệt
          </h1>
          <p className="text-xs sm:text-sm text-emerald-100 mt-1.5 max-w-2xl leading-relaxed">
            Chỉnh sửa thông tin trên web, cập nhật tin tức hoạt động, thông báo chính thức, tài liệu quan hệ cổ đông và các dịch vụ vệ sinh môi trường.
          </p>
        </div>

        <div className="flex flex-wrap items-center gap-2.5 shrink-0">
          <Link
            to={ROUTES.HOME}
            target="_blank"
            className="inline-flex items-center gap-2 px-4 py-2.5 rounded-xl bg-white text-[#10243b] hover:bg-emerald-50 font-bold text-xs sm:text-sm shadow-md transition-all"
          >
            <ExternalLink className="w-4 h-4 text-emerald-700" />
            <span>Mở xem Website</span>
          </Link>
          <button
            type="button"
            onClick={() => navigate(ROUTES.ADMIN_NEWS)}
            className="inline-flex items-center gap-2 px-4 py-2.5 rounded-xl bg-amber-500 hover:bg-amber-600 text-white font-bold text-xs sm:text-sm shadow-md transition-all cursor-pointer"
          >
            <Plus className="w-4 h-4" />
            <span>Đăng bài viết mới</span>
          </button>
        </div>
      </div>

      {/* CMS Modules Grid */}
      <div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-4 gap-4 sm:gap-5">
        {modules.map((mod) => {
          const Icon = mod.icon;
          return (
            <div
              key={mod.title}
              className="bg-white rounded-2xl p-5 shadow-xs hover:shadow-md border border-gray-200/80 flex flex-col justify-between transition-all group"
            >
              <div>
                <div className="flex items-start justify-between gap-3 mb-3.5">
                  <div className={`w-11 h-11 rounded-xl border flex items-center justify-center ${mod.color}`}>
                    <Icon className="w-5 h-5" />
                  </div>
                  <div className="text-right">
                    <span className="text-2xl font-black text-[#10243b]">
                      {mod.count}
                    </span>
                    <span className="block text-[10px] font-bold uppercase tracking-wider text-gray-400">
                      {mod.unit}
                    </span>
                  </div>
                </div>

                <h3 className="text-base font-extrabold text-gray-900 mb-1 group-hover:text-emerald-700 transition-colors">
                  {mod.title}
                </h3>
                <p className="text-xs text-gray-500 leading-relaxed mb-4 line-clamp-3">
                  {mod.description}
                </p>
              </div>

              <div className="pt-3 border-t border-gray-100 flex items-center justify-between gap-2">
                <button
                  type="button"
                  onClick={() => navigate(mod.route)}
                  className="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-xl bg-[#0e8a44] hover:bg-emerald-700 text-white text-xs font-bold transition-colors cursor-pointer shadow-2xs"
                >
                  <span>Chỉnh sửa</span>
                  <ArrowRight className="w-3.5 h-3.5" />
                </button>

                <Link
                  to={mod.publicRoute}
                  target="_blank"
                  className="inline-flex items-center gap-1 px-2.5 py-1.5 rounded-xl bg-gray-100 hover:bg-gray-200 text-gray-700 text-xs font-semibold transition-colors"
                  title="Xem trang thực tế"
                >
                  <ExternalLink className="w-3.5 h-3.5" />
                  <span>Xem</span>
                </Link>
              </div>
            </div>
          );
        })}
      </div>

      {/* Backup / Restore / Reset CMS Data Bar */}
      <div className="bg-white rounded-2xl p-5 sm:p-6 shadow-xs border border-gray-200/80 flex flex-col sm:flex-row sm:items-center justify-between gap-4">
        <div>
          <h3 className="text-base font-extrabold text-gray-900">
            Sao lưu &amp; Đồng bộ Dữ liệu Quản trị (CMS Backup)
          </h3>
          <p className="text-xs sm:text-sm text-gray-500 mt-0.5">
            Xuất dữ liệu chỉnh sửa ra tệp JSON hoặc nạp lại bản sao lưu để đồng bộ giữa các môi trường.
          </p>
        </div>

        <div className="flex flex-wrap items-center gap-2.5 shrink-0">
          <button
            type="button"
            onClick={handleExportJson}
            className="inline-flex items-center gap-1.5 px-3.5 py-2 rounded-xl bg-emerald-50 hover:bg-emerald-100 text-emerald-800 border border-emerald-200 text-xs font-bold transition-colors cursor-pointer"
          >
            <Download className="w-4 h-4" />
            <span>Xuất bản sao lưu (.JSON)</span>
          </button>

          <button
            type="button"
            onClick={() => fileInputRef.current?.click()}
            className="inline-flex items-center gap-1.5 px-3.5 py-2 rounded-xl bg-blue-50 hover:bg-blue-100 text-blue-800 border border-blue-200 text-xs font-bold transition-colors cursor-pointer"
          >
            <Upload className="w-4 h-4" />
            <span>Nhập dữ liệu (.JSON)</span>
          </button>
          <input
            type="file"
            ref={fileInputRef}
            accept=".json,application/json"
            onChange={handleImportJson}
            className="hidden"
          />

          <button
            type="button"
            onClick={() => setConfirmReset(true)}
            className="inline-flex items-center gap-1.5 px-3.5 py-2 rounded-xl bg-rose-50 hover:bg-rose-100 text-rose-700 border border-rose-200 text-xs font-bold transition-colors cursor-pointer"
          >
            <RotateCcw className="w-4 h-4" />
            <span>Khôi phục gốc</span>
          </button>
        </div>
      </div>

      <ConfirmModal
        isOpen={confirmReset}
        title="Khôi phục dữ liệu gốc"
        message="Bạn có chắc chắn muốn đặt lại các chỉnh sửa tạm thời về trạng thái dữ liệu chuẩn ban đầu?"
        onConfirm={handleResetDefaults}
        onClose={() => setConfirmReset(false)}
      />
    </div>
  );
};

export default AdminCmsOverview;
