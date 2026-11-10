const { prisma } = require('../db');
const { SHOWCASE_ID } = require('../constants/showcase');
const AppError = require('../utils/AppError');

const DEFAULT_HOME_SECTIONS = [
  ['hero', 'Banner chính'],
  ['stats', 'Số liệu thống kê'],
  ['utilities', 'Tiện ích công dân'],
  ['services', 'Dịch vụ'],
  ['sectors', 'Lĩnh vực phục vụ'],
  ['why', 'Năng lực và thế mạnh'],
  ['showcase', 'Hoạt động trọng điểm'],
  ['banners', 'Thư viện hình ảnh'],
  ['testimonials', 'Đánh giá'],
  ['cta', 'Kêu gọi hành động'],
  ['news', 'Tin tức'],
  ['faq', 'Câu hỏi thường gặp']
].map(([id, label]) => ({ id, label, visible: true }));

const DEFAULT_HOME_CONFIG = {
  title: 'Hoạt Động & Dự Án Trọng Điểm',
  description: 'Hình ảnh công tác thực tế của đội ngũ cán bộ công nhân viên HEPCO trên khắp các nẻo đường Cố đô Huế.',
  linkLabel: 'Thư Viện Hình Ảnh & Hoạt Động',
  href: '/tin-tuc?tab=gallery',
  hero: {
    headlinePrefix: 'CÔNG TY CỔ PHẦN MÔI TRƯỜNG',
    headlineHighlight: 'VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ',
    subtitle: 'Gần 50 năm đồng hành cùng tỉnh Thừa Thiên Huế, HEPCO cung ứng trọn gói dịch vụ thu gom chất thải, vệ sinh môi trường, chăm sóc cây xanh công viên và chiếu sáng công cộng đạt chuẩn chất lượng cao.',
    primaryCtaText: 'Khám Phá Dịch Vụ',
    primaryCtaLink: '/dich-vu',
    hotlineDisplay: '1900.96.96.69',
    hotlineTel: '1900969669',
    coverImage: '/uploads/images/TongQuan_6a06c09d.jpg',
    videoUrl: 'https://www.youtube.com/embed/P7RZLoytEBI?autoplay=1',
    videoButtonText: 'Xem Phim Giới Thiệu'
  },
  stats: [
    { value: '50+', label: 'NĂM KINH NGHIỆM', description: 'Gần nửa thế kỷ kiến tạo môi trường đô thị Huế' },
    { value: '100K+', label: 'HỘ DÂN & DOANH NGHIỆP', description: 'Khách hàng tin tưởng và đồng hành mỗi ngày' },
    { value: '100%', label: 'ĐỘ PHỦ ĐÔ THỊ', description: 'Mạng lưới thu gom và duy tu toàn diện khắp địa bàn' },
    { value: '24/7', label: 'ỨNG TRỰC & PHỤC VỤ', description: 'Sẵn sàng xử lý các sự cố vệ sinh môi trường' }
  ],
  utilities: [
    { id: 'schedule', title: 'LỊCH GOM RÁC', subtitle: 'Tra cứu thời gian và tuyến thu gom theo từng Phường, xã', buttonText: 'Tra cứu tuyến đường', link: '/tin-tuc', badge: 'Cập nhật 2026' },
    { id: 'invoice', title: 'HÓA ĐƠN ĐIỆN TỬ', subtitle: 'Tra cứu, xuất hóa đơn & thanh toán tiền dịch vụ vệ sinh trực tuyến', buttonText: 'Thanh toán online', link: 'https://hoadondientu.hepco.com.vn/', badge: 'Cổng thanh toán' },
    { id: 'report', title: 'BÁO CÁO SỰ CỐ', subtitle: 'Gửi hình ảnh và tọa độ điểm rác thải phát sinh về trung tâm', buttonText: 'Gửi phản ánh 24/7', link: 'https://www.facebook.com/hepco.com.vn', badge: 'Phản ứng nhanh' },
    { id: 'register', title: 'ĐĂNG KÝ DỊCH VỤ', subtitle: 'Đăng ký hút hầm cầu, cắt tỉa cành cây, dọn vệ sinh công trình', buttonText: 'Đăng ký ngay', link: 'https://www.facebook.com/hepco.com.vn', badge: 'Dịch vụ trọn gói' }
  ],
  sectors: {
    title: 'Lĩnh Vực Hoạt Động & Phục Vụ Đa Dạng',
    subtitle: 'Giải pháp chuyên biệt cho từng nhóm đối tượng khách hàng và không gian đô thị',
    items: [
      { title: 'Đô Thị & Khu Dân Cư', subtitle: 'Môi trường sống sạch đẹp mỗi ngày', description: 'Hệ thống thu gom rác sinh hoạt định kỳ, quét dọn đường phố và duy tu cảnh quan cho hơn 100.000 hộ gia đình trên toàn địa bàn.', tag: 'Cộng đồng' },
      { title: 'Khu Công Nghiệp & Nhà Máy', subtitle: 'Giải pháp xử lý chuẩn quy định', description: 'Thu gom, vận chuyển chất thải công nghiệp thông thường, hút bùn thải và cung cấp dịch vụ vệ sinh chuyên sâu cho doanh nghiệp.', tag: 'Doanh nghiệp' },
      { title: 'Lễ Hội & Sự Kiện Tầm Cỡ', subtitle: 'Bảo đảm mỹ quan cho sự kiện lớn', description: 'Phương án ứng trực vệ sinh 24/7, cung ứng nhà vệ sinh lưu động cao cấp và thu dọn hiện trường cho Festival Huế và các lễ hội văn hóa.', tag: 'Sự kiện & Du lịch' },
      { title: 'Cảnh Quan & Công Trình Xanh', subtitle: 'Kiến tạo không gian xanh di sản', description: 'Chăm sóc hệ thống công viên bờ sông Hương, cắt tỉa cành cây phòng chống bão lũ và vận hành mạng lưới chiếu sáng công cộng hiện đại.', tag: 'Cảnh quan di sản' }
    ]
  },
  why: {
    title: 'Vì Sao Khách Hàng Luôn Tin Chọn HEPCO?',
    subtitle: 'Năng lực vượt trội, cam kết chất lượng và tinh thần trách nhiệm phụng sự xã hội',
    items: [
      { title: 'Phương Tiện Hiện Đại', description: 'Hơn 100 xe cuốn ép rác, xe tưới rửa đường và xe thang chuyên dụng đạt chuẩn kỹ thuật, hoạt động êm ái và sạch sẽ.', badge: 'Công nghệ tiên tiến' },
      { title: 'Đội Ngũ 1.000+ Nhân Sự', description: 'Cán bộ, công nhân lành nghề, tận tụy gắn bó và sẵn sàng ứng trực cả ngày lẫn đêm, kể cả dịp lễ tết và thời tiết bất lợi.', badge: 'Chuyên nghiệp' },
      { title: 'Kịp Thời & Đúng Tiến Độ', description: 'Thực hiện chuẩn xác theo lộ trình; hệ thống tiếp nhận phản ánh trực tuyến phản hồi và xử lý nhanh chóng trong ngày.', badge: 'Ứng trực 24/7' },
      { title: 'Uy Tín Gần 50 Năm', description: 'Đơn vị công ích chủ lực gìn giữ môi trường và mỹ quan đô thị Cố đô Huế với hệ thống quản lý chất lượng toàn diện.', badge: 'Thương hiệu vững bền' }
    ]
  },
  items: [
    {
      id: 'trucks-2026',
      title: 'Đoàn Phương Tiện Chuyên Dụng Thu Gom Rác 2026',
      subtitle: 'Lịch trình thu gom Nam sông Hương',
      location: 'Các tuyến đường trục chính, TP. Huế',
      scale: '100+ Xe chuyên dùng thế hệ mới',
      image: '/uploads/images/RacThai_42b22196.jpg',
      href: '/tin-tuc',
      linkLabel: 'Xem lịch trình'
    },
    {
      id: 'huan-luyen-2026',
      title: 'Huấn Luyện An Toàn & Vệ Sinh Lao Động 2026',
      subtitle: 'Bảo hộ và an toàn cho người lao động',
      location: 'Hội trường Trung tâm HEPCO',
      scale: 'Toàn thể CBCNV công ty',
      image: 'https://res.cloudinary.com/doy7sp8ah/image/upload/v1785398891/hepco_news/cjvihyz2gychrt5f2z5q.jpg',
      href: '/tin-tuc',
      linkLabel: 'Xem chi tiết'
    },
    {
      id: 'parks-2026',
      title: 'Chăm Sóc & Tôn Tạo Công Viên Di Sản',
      subtitle: 'Duy tu cảnh quan xanh - sạch - sáng',
      location: 'Dọc bờ sông Hương & công viên trung tâm',
      scale: '50+ Hécta thảm cỏ, hoa cảnh',
      image: '/uploads/images/HL-2_a07c11d6.jpg',
      href: '/tin-tuc?tab=gallery',
      linkLabel: 'Xem thư viện ảnh'
    },
    {
      id: 'dhcd-2026',
      title: 'Đại Hội Đồng Cổ Đông Thường Niên Năm 2026',
      subtitle: 'Công bố thông tin minh bạch',
      location: 'Trụ sở HEPCO, TP. Huế',
      scale: 'Phiên họp thường niên năm 2026',
      image: 'https://res.cloudinary.com/doy7sp8ah/image/upload/v1785398910/hepco_news/xcuzby8c8hzjkv6ozgid.jpg',
      href: '/quan-he-co-dong',
      linkLabel: 'Xem nghị quyết'
    }
  ],
  testimonials: {
    title: 'Đánh Giá & Sự Tin Cậy',
    subtitle: 'Những ghi nhận chân thực từ chính quyền cơ sở, doanh nghiệp đối tác và người dân địa phương.',
    items: [
      { content: 'HEPCO luôn chủ động và kịp thời trong công tác thu gom, giữ gìn môi trường các tuyến phố du lịch nội thị luôn văn minh, phong quang và sạch đẹp.', author: 'Đại diện UBND Phường', role: 'Phường Thuận Hóa, TP. Huế', rating: 5 },
      { content: 'Dịch vụ xử lý chất thải và hút bùn công nghiệp của HEPCO rất chuyên nghiệp, hồ sơ nghiệm thu rõ ràng, đáp ứng đầy đủ tiêu chuẩn môi trường nghiêm ngặt của nhà máy.', author: 'Ban Quản Lý KCN', role: 'Khu Công Nghiệp Phú Bài, TT. Huế', rating: 5 },
      { content: 'Công tác bảo đảm vệ sinh môi trường và bố trí hệ thống thu gom, nhà vệ sinh lưu động cho các kỳ Festival Huế được HEPCO triển khai vô cùng chu đáo và nhanh gọn.', author: 'Ban Tổ Chức Sự Kiện', role: 'Festival Huế & Lễ Hội Văn Hóa', rating: 5 }
    ]
  },
  cta: {
    title: 'Chung Tay Xây Dựng Đô Thị Xanh - Sạch - Sáng',
    subtitle: 'Liên hệ ngay với HEPCO để nhận tư vấn phương án thu gom, vệ sinh môi trường, chăm sóc cây xanh và dịch vụ công ích đô thị nhanh chóng, minh bạch.',
    buttonText: 'Gửi Yêu Cầu Dịch Vụ',
    hotlineDisplay: '1900.96.96.69',
    hotlineTel: '1900969669'
  },
  faq: {
    title: 'Giải Đáp Thắc Mắc Thường Gặp',
    subtitle: 'Tổng hợp các câu hỏi và hướng dẫn nhanh về quy trình dịch vụ, hóa đơn và tiếp nhận phản ánh tại HEPCO',
    items: [
      { question: 'Làm thế nào để tra cứu lịch trình thu gom rác tại tuyến đường nhà tôi?', answer: 'Quý khách có thể vào mục "Lịch Gom Rác" ngay trên trang chủ để tra cứu lịch theo từng phường/xã và tuyến đường cụ thể, hoặc liên hệ tổng đài (0234) 3822 052.' },
      { question: 'Quy trình đăng ký dịch vụ hút hầm vệ sinh hoặc cắt tỉa cành cây như thế nào?', answer: 'Quý khách chỉ cần chọn mục "Đăng ký dịch vụ" trên website hoặc liên hệ hotline. Đội ngũ kỹ thuật của HEPCO sẽ liên hệ lại trong vòng 24 giờ để khảo sát và báo giá cụ thể.' },
      { question: 'Doanh nghiệp có thể ký hợp đồng thu gom chất thải công nghiệp định kỳ bằng cách nào?', answer: 'Doanh nghiệp có thể gửi yêu cầu qua form liên hệ hoặc liên hệ trực tiếp phòng Kế hoạch - Kinh doanh của HEPCO. Chúng tôi cung cấp hợp đồng trọn gói kèm đầy đủ chứng từ nghiệm thu môi trường theo luật định.' },
      { question: 'Cách thức tra cứu và thanh toán tiền dịch vụ vệ sinh môi trường qua hóa đơn điện tử?', answer: 'Quý khách truy cập cổng "Hóa Đơn Điện Tử" tại hoadondientu.hepco.com.vn, nhập mã khách hàng in trên biên lai thu tiền để tra cứu và thanh toán trực tuyến qua các ngân hàng.' },
      { question: 'Khi phát hiện điểm tập kết rác thải tự phát hoặc sự cố môi trường, tôi phản ánh qua đâu?', answer: 'Quý khách có thể chụp ảnh và gửi phản ánh qua mục "Báo cáo sự cố" trên website, hoặc gọi hotline khẩn cấp 24/7 để đội cơ động HEPCO tiếp nhận và xử lý nhanh chóng trong ngày.' }
    ]
  }
};

class ShowcaseModel {
  static async get() {
    const row = await prisma.homeShowcase.findUnique({ where: { id: SHOWCASE_ID } });
    const dbSections = await this.getHomeSections();
    const sectionsDefault = dbSections.map(({ id, label, visible }) => ({ id, label, visible }));

    if (row && row.data) {
      const merged = {
        ...DEFAULT_HOME_CONFIG,
        ...row.data,
        hero: { ...DEFAULT_HOME_CONFIG.hero, ...(row.data.hero || {}) },
        stats: Array.isArray(row.data.stats) && row.data.stats.length ? row.data.stats : DEFAULT_HOME_CONFIG.stats,
        utilities: Array.isArray(row.data.utilities) && row.data.utilities.length ? row.data.utilities : DEFAULT_HOME_CONFIG.utilities,
        sectors: { ...DEFAULT_HOME_CONFIG.sectors, ...(row.data.sectors || {}) },
        why: { ...DEFAULT_HOME_CONFIG.why, ...(row.data.why || {}) },
        testimonials: { ...DEFAULT_HOME_CONFIG.testimonials, ...(row.data.testimonials || {}) },
        cta: { ...DEFAULT_HOME_CONFIG.cta, ...(row.data.cta || {}) },
        faq: { ...DEFAULT_HOME_CONFIG.faq, ...(row.data.faq || {}) },
        items: Array.isArray(row.data.items) && row.data.items.length ? row.data.items : DEFAULT_HOME_CONFIG.items,
        sections: Array.isArray(row.data.sections) && row.data.sections.length ? row.data.sections : sectionsDefault
      };
      return { data: merged, version: row.version };
    }

    return {
      data: {
        ...DEFAULT_HOME_CONFIG,
        sections: sectionsDefault
      },
      version: 0
    };
  }

  static async getHomeSections() {
    try {
      const sections = await prisma.homeSection.findMany({ orderBy: { order: 'asc' } });
      return sections.length ? sections : DEFAULT_HOME_SECTIONS;
    } catch (error) {
      if (error.code !== 'P2021') throw error;
      return DEFAULT_HOME_SECTIONS;
    }
  }

  static async save(data, version) {
    if (version === 0) {
      const row = await prisma.homeShowcase.create({ data: { id: SHOWCASE_ID, data, version: 1 } });
      return { data: row.data, version: row.version };
    }
    return prisma.$transaction(async (tx) => {
      const result = await tx.homeShowcase.updateMany({ where: { id: SHOWCASE_ID, version }, data: { data, version: { increment: 1 } } });
      if (result.count !== 1) throw new AppError('SHOWCASE_CONFLICT', 409, 'This section was updated elsewhere. Reload before saving again.');
      const row = await tx.homeShowcase.findUnique({ where: { id: SHOWCASE_ID } });
      return { data: row.data, version: row.version };
    });
  }
}

module.exports = ShowcaseModel;
