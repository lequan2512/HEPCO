const { PrismaClient } = require('@prisma/client');
const { hashPassword } = require('../src/utils/password');
const prisma = new PrismaClient({});

async function main() {
  console.log('Bắt đầu khởi tạo dữ liệu trong cơ sở dữ liệu SQLite...');

  // 1. Seed IP Whitelist (localhost + local network)
  const ips = [
    { ip: '127.0.0.1', description: 'Localhost IPv4' },
    { ip: '::1', description: 'Localhost IPv6' },
    { ip: '10.1.1.45', description: 'Local Machine IP' },
  ];
  for (const item of ips) {
    await prisma.ipWhitelist.upsert({
      where: { ip: item.ip },
      update: {},
      create: item,
    });
  }

  // 2. Seed Admin Users with scrypt hashed passwords
  const adminPasswordHash = await hashPassword('123456');
  const hepcoPasswordHash = await hashPassword('Hepco@2026');

  await prisma.users.upsert({
    where: { username: 'hepco' },
    update: { password: hepcoPasswordHash },
    create: {
      username: 'hepco',
      password: hepcoPasswordHash,
    },
  });

  await prisma.users.upsert({
    where: { username: 'admin' },
    update: { password: adminPasswordHash },
    create: {
      username: 'admin',
      password: adminPasswordHash,
    },
  });

  // 3. Seed Real Banners
  await prisma.banner.deleteMany();
  const banners = [
    { url: '/uploads/images/TongQuan_6a06c09d.jpg' },
    { url: '/uploads/images/HL-2_a07c11d6.jpg' },
    { url: '/uploads/images/HL-5_c7b60f77.jpg' },
    { url: '/uploads/images/HEPCO_3eb49d00.jpg' },
    { url: '/uploads/images/m_20190816_khanhthanh2_338d5070.jpg' },
    { url: 'https://res.cloudinary.com/doy7sp8ah/image/upload/v1785299082/hepco_banner/iuglmesiclypoktwjmur.jpg' },
    { url: 'https://res.cloudinary.com/doy7sp8ah/image/upload/v1785299069/hepco_banner/xr1du8flflahaiyghx4a.jpg' },
    { url: 'https://res.cloudinary.com/doy7sp8ah/image/upload/v1785299009/hepco_banner/ws48whp5ox4k0largnc0.jpg' }
  ];

  for (const b of banners) {
    await prisma.banner.create({ data: b });
  }

  // 4. Seed Home Sections
  const sections = [
    { id: 'hero', label: 'Mở đầu', order: 1, visible: true },
    { id: 'stats', label: 'Số liệu', order: 2, visible: true },
    { id: 'utilities', label: 'Tiện ích trực tuyến', order: 3, visible: true },
    { id: 'services', label: 'Dịch vụ', order: 4, visible: true },
    { id: 'sectors', label: 'Lĩnh vực phục vụ', order: 5, visible: true },
    { id: 'why', label: 'Vì sao chọn HEPCO', order: 6, visible: true },
    { id: 'showcase', label: 'Hoạt động & Dự án trọng điểm', order: 7, visible: true },
    { id: 'banners', label: 'Banner', order: 8, visible: true },
    { id: 'testimonials', label: 'Ý kiến khách hàng', order: 9, visible: true },
    { id: 'cta', label: 'Kêu gọi liên hệ', order: 10, visible: true },
    { id: 'news', label: 'Tin tức, đối tác & giải thưởng', order: 11, visible: true },
    { id: 'faq', label: 'Hỏi đáp & liên hệ', order: 12, visible: true }
  ];

  for (const s of sections) {
    await prisma.homeSection.upsert({
      where: { id: s.id },
      update: { label: s.label, order: s.order },
      create: s
    });
  }

  // 5. Seed Real 2026 Home Showcase
  const showcaseData = {
    title: 'Hoạt Động & Dự Án Trọng Điểm',
    description: 'Hình ảnh công tác thực tế của đội ngũ cán bộ công nhân viên HEPCO trên khắp các nẻo đường Cố đô Huế.',
    linkLabel: 'Thư Viện Hình Ảnh & Hoạt Động',
    href: '/tin-tuc?tab=gallery',
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
    sections: sections.map(({ id, visible }) => ({ id, visible }))
  };

  await prisma.homeShowcase.upsert({
    where: { id: 1 },
    update: { data: showcaseData },
    create: {
      id: 1,
      data: showcaseData,
      version: 1
    }
  });

  console.log('Khởi tạo dữ liệu vào SQLite hoàn tất!');
}

main()
  .then(async () => {
    await prisma.$disconnect();
  })
  .catch(async (e) => {
    console.error('Lỗi khi seed:', e);
    await prisma.$disconnect();
    process.exit(1);
  });
