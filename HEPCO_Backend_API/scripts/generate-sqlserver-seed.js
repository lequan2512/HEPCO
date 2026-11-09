const fs = require('fs');
const path = require('path');

const jsonPath = path.join(__dirname, '../../HEPCO_Frontend/src/data/migratedData.json');
if (!fs.existsSync(jsonPath)) {
  console.error('File not found:', jsonPath);
  process.exit(1);
}

let fileContent = fs.readFileSync(jsonPath, 'utf8').replace(/^\uFEFF/, '');
const raw = JSON.parse(fileContent);

let sql = `-- ============================================================================
-- DỮ LIỆU MẪU ĐẦY ĐỦ CHO HỆ THỐNG HEPCO TRÊN MICROSOFT SQL SERVER
-- Tự động sinh từ migratedData.json (Tin tức, Thông báo, Cổ đông, Dịch vụ, Gallery, Banners)
-- ============================================================================

USE HEPCO_DB;
GO

SET NOCOUNT ON;
PRINT 'Đang nạp dữ liệu mẫu vào SQL Server...';

-- 1. Banners mặc định
IF NOT EXISTS (SELECT 1 FROM banners)
BEGIN
    INSERT INTO banners (url, title, [order]) VALUES 
    ('/images/cover.png', N'HEPCO - Gần 50 năm đồng hành cùng Cố đô Huế', 1),
    ('/images/news_cleanup.png', N'Ngày Chủ Nhật Xanh - Vì một Huế xanh sạch sáng', 2),
    ('/images/news_trucks.png', N'Dàn xe chuyên dụng thế hệ mới tiêu chuẩn Euro 5', 3),
    ('/images/news_planting.png', N'Trồng hoa và cây xanh Đại Nội', 4),
    ('/images/services/thu-gom-rac-1.jpg', N'Dịch vụ Thu gom & Vận chuyển Chất thải', 5),
    ('/images/services/ve-sinh-cong-cong-1.jpg', N'Dịch vụ Vệ sinh Đô thị & Đường phố', 6),
    ('/images/services/cay-xanh-cong-vien-1.jpg', N'Dịch vụ Chăm sóc Công viên Cây xanh', 7),
    ('/images/services/chieu-sang-do-thi-1.jpg', N'Hệ thống Chiếu sáng Công cộng', 8);
    PRINT 'Đã nạp 8 banners mẫu.';
END
GO

-- 2. Thư viện ảnh đầy đủ (Gallery)
PRINT 'Đang nạp danh sách thư viện ảnh hoạt động...';
`;

function escapeSql(str) {
  if (!str) return "''";
  return "N'" + String(str).replace(/'/g, "''") + "'";
}

const gallery = raw.gallery || [];
for (const g of gallery) {
  const url = (g.url || '').slice(0, 500);
  const orig = (g.original_url || g.url || '').slice(0, 500);
  const title = (g.title || '').slice(0, 255);
  const caption = (g.caption || '').slice(0, 500);
  const cat = g.category || 'company';
  const catLabel = g.category_label || 'Hoạt động công ty';
  const date = (g.date || '').slice(0, 50);

  if (url) {
    sql += `
INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (${escapeSql(url)}, ${escapeSql(orig)}, ${escapeSql(title)}, ${escapeSql(caption)}, ${escapeSql(cat)}, ${escapeSql(catLabel)}, ${escapeSql(date)});
`;
  }
}

sql += `
PRINT 'Đã nạp xong thư viện hình ảnh.';
GO

-- 3. Nạp dữ liệu bài viết (News, Announcements, Shareholders, Services, About)
PRINT 'Đang nạp danh sách tin tức, thông báo, tài liệu cổ đông, dịch vụ...';
`;

const allItems = [
  ...(raw.news || []).map(i => ({ ...i, type: (i.category === 'announcement' ? 'announcement' : 'news') })),
  ...(raw.shareholders || []).map(i => ({ ...i, type: 'shareholders' })),
  ...(raw.services || []).map(i => ({ ...i, type: 'service' })),
  ...(raw.about || []).map(i => ({ ...i, type: 'about' }))
];

for (const item of allItems) {
  const title = (item.title || 'Untitled').trim().slice(0, 255);
  const date = (item.date || item.publishDate || '01-01-2026').trim().slice(0, 50);
  const content = item.content || '';
  const thumbnail = (item.thumbnail || '').slice(0, 500);
  const type = item.type || 'news';
  const metadata = JSON.stringify({
    category: item.category,
    documentType: item.documentType,
    publishYear: item.publishYear,
    attachments: item.attachments || [],
    images: item.images || [],
    summary: item.summary || '',
    status: item.status || 'published',
    slug: item.slug || ''
  });

  sql += `
INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (${escapeSql(title)}, ${escapeSql(date)}, ${escapeSql(content)}, ${escapeSql(thumbnail)}, ${escapeSql(type)}, ${escapeSql(metadata)});
`;
}

sql += `
PRINT 'Đã nạp thành công toàn bộ bài viết.';
PRINT '=======================================================';
PRINT 'HOÀN TẤT NẠP DỮ LIỆU SQL SERVER CHO HEPCO WEBSITE!';
PRINT '=======================================================';
GO
`;

const outputPath = path.join(__dirname, '../seed_sqlserver.sql');
fs.writeFileSync(outputPath, sql, 'utf8');
console.log('Successfully generated seed_sqlserver.sql with', allItems.length, 'articles and', gallery.length, 'photos at:', outputPath);
