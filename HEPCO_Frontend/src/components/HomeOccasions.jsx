import { Building2, Factory, PartyPopper, Trees } from 'lucide-react';

const DEFAULT_OCCASIONS = [
  {
    title: 'Đô Thị & Khu Dân Cư',
    subtitle: 'Môi trường sống sạch đẹp mỗi ngày',
    description:
      'Hệ thống thu gom rác sinh hoạt định kỳ, quét dọn đường phố và duy tu cảnh quan cho hơn 100.000 hộ gia đình trên toàn địa bàn.',
    icon: Building2,
    tag: 'Cộng đồng',
    badgeColor: 'bg-emerald-50 text-emerald-800 border-emerald-200',
  },
  {
    title: 'Khu Công Nghiệp & Nhà Máy',
    subtitle: 'Giải pháp xử lý chuẩn quy định',
    description:
      'Thu gom, vận chuyển chất thải công nghiệp thông thường, hút bùn thải và cung cấp dịch vụ vệ sinh chuyên sâu cho doanh nghiệp.',
    icon: Factory,
    tag: 'Doanh nghiệp',
    badgeColor: 'bg-blue-50 text-blue-800 border-blue-200',
  },
  {
    title: 'Lễ Hội & Sự Kiện Tầm Cỡ',
    subtitle: 'Bảo đảm mỹ quan cho sự kiện lớn',
    description:
      'Phương án ứng trực vệ sinh 24/7, cung ứng nhà vệ sinh lưu động cao cấp và thu dọn hiện trường cho Festival Huế và các lễ hội văn hóa.',
    icon: PartyPopper,
    tag: 'Sự kiện & Du lịch',
    badgeColor: 'bg-amber-50 text-amber-800 border-amber-200',
  },
  {
    title: 'Cảnh Quan & Công Trình Xanh',
    subtitle: 'Kiến tạo không gian xanh di sản',
    description:
      'Chăm sóc hệ thống công viên bờ sông Hương, cắt tỉa cành cây phòng chống bão lũ và vận hành mạng lưới chiếu sáng công cộng hiện đại.',
    icon: Trees,
    tag: 'Cảnh quan di sản',
    badgeColor: 'bg-teal-50 text-teal-800 border-teal-200',
  },
];

const ICONS = [Building2, Factory, PartyPopper, Trees];
const BADGE_COLORS = [
  'bg-emerald-50 text-emerald-800 border-emerald-200',
  'bg-blue-50 text-blue-800 border-blue-200',
  'bg-amber-50 text-amber-800 border-amber-200',
  'bg-teal-50 text-teal-800 border-teal-200'
];

// Helper to format heading with no orphan words
const formatHeadingBalanced = (str) => {
  if (!str || typeof str !== 'string') return str;
  // If default title, return pre-balanced markup
  if (str === 'Lĩnh Vực Hoạt Động & Phục Vụ Đa Dạng') {
    return (
      <>
        Lĩnh Vực Hoạt Động &amp;{' '}
        <span className="inline-block whitespace-nowrap">Phục Vụ Đa Dạng</span>
      </>
    );
  }
  const trimmed = str.trim();
  const lastSpace = trimmed.lastIndexOf(' ');
  if (lastSpace === -1) return trimmed;
  return trimmed.substring(0, lastSpace) + '\u00A0' + trimmed.substring(lastSpace + 1);
};

const HomeOccasions = ({ config }) => {
  const title = config?.title || 'Lĩnh Vực Hoạt Động & Phục Vụ Đa Dạng';
  const subtitle = config?.subtitle || 'Giải pháp chuyên biệt cho từng nhóm đối tượng khách hàng và không gian đô thị';
  const items = Array.isArray(config?.items) && config.items.length > 0
    ? config.items.map((it, idx) => ({
        ...it,
        icon: ICONS[idx % ICONS.length],
        badgeColor: BADGE_COLORS[idx % BADGE_COLORS.length]
      }))
    : DEFAULT_OCCASIONS;

  return (
    <section className="py-14 sm:py-20 md:py-24 lg:py-28 bg-[#f8fafc] border-b border-gray-200/80">
      <div className="container mx-auto px-4 sm:px-6 lg:px-8 max-w-7xl">
        {/* Section Header */}
        <div className="max-w-5xl mb-12 sm:mb-16 md:mb-20">
          <h2 className="text-2xl sm:text-3xl md:text-4xl lg:text-5xl font-black text-[#10243b] tracking-tight leading-tight text-balance mb-4">
            {formatHeadingBalanced(title)}
          </h2>
          <p className="text-sm sm:text-base md:text-lg text-gray-600 leading-relaxed font-normal text-pretty max-w-3xl">
            {subtitle}
          </p>
        </div>

        {/* 4 Occasions Grid - Responsive 1 col on mobile, 2 cols on tablet, 4 cols on desktop */}
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 sm:gap-8 home-mobile-rail">
          {items.map((item, idx) => {
            const IconComponent = item.icon || Building2;
            return (
              <div
                key={idx}
                className="group relative flex flex-col justify-between p-6 sm:p-7 md:p-8 rounded-3xl bg-white border border-gray-200/90 hover:border-emerald-600/60 shadow-xs hover:shadow-xl transition-all duration-300 hover:-translate-y-1.5"
              >
                <div>
                  <div className="flex items-center justify-between mb-5 sm:mb-6">
                    <div className="w-12 h-12 sm:w-14 sm:h-14 rounded-2xl bg-[#f0fdf4] text-emerald-800 flex items-center justify-center transition-transform group-hover:scale-110">
                      <IconComponent className="w-6 h-6 sm:w-7 sm:h-7" />
                    </div>
                    {item.tag && (
                      <span
                        className={`text-[11px] sm:text-xs font-bold px-2.5 sm:px-3 py-1 rounded-full border ${item.badgeColor || BADGE_COLORS[0]}`}
                      >
                        {item.tag}
                      </span>
                    )}
                  </div>

                  <h3 className="text-lg sm:text-xl font-black text-[#10243b] group-hover:text-emerald-700 transition-colors mb-2 text-balance leading-snug">
                    {item.title}
                  </h3>
                  {item.subtitle && (
                    <div className="text-xs font-bold text-emerald-700 mb-3 sm:mb-4">
                      {item.subtitle}
                    </div>
                  )}
                  <p className="text-sm text-gray-600 leading-relaxed font-normal text-pretty">
                    {item.description}
                  </p>
                </div>

                <div className="pt-5 sm:pt-6 mt-5 sm:mt-6 border-t border-gray-100 flex items-center gap-2 text-xs font-bold text-gray-400 group-hover:text-emerald-700 transition-colors">
                  <span>Tiêu chuẩn công ích</span>
                </div>
              </div>
            );
          })}
        </div>
      </div>
    </section>
  );
};

export default HomeOccasions;
