const { PrismaClient } = require('@prisma/client');
const fs = require('fs');
const path = require('path');

const { parseDisplayDate } = require('../src/utils/parseDisplayDate');

const prisma = new PrismaClient();

async function main() {
  const jsonPath = path.join(__dirname, '../../HEPCO_Frontend/src/data/migratedData.json');
  if (!fs.existsSync(jsonPath)) {
    console.error('Không tìm thấy migratedData.json');
    return;
  }
  const raw = JSON.parse(fs.readFileSync(jsonPath, 'utf8').replace(/^\uFEFF/, ''));
  const gallery = raw.gallery || [];
  console.log(`Bắt đầu xử lý ${gallery.length} ảnh thư viện...`);

  const clean = gallery.filter((item) => {
    const u = (item.url || '').toLowerCase();
    if (!u) return false;
    if (u.includes('emoji') || u.includes('/1f') || u.endsWith('.svg') || u === '/images/cover.png') return false;
    return true;
  });

  console.log(`Lọc còn ${clean.length} ảnh hoạt động chất lượng cao...`);

  const rows = clean.map((item, i) => {
    // Sort key follows the real display date, so the list reads newest (2026) -> oldest.
    // Year-only dates tie, so offset by position to keep their listed order.
    const parsed = parseDisplayDate(item.date) || new Date(Date.UTC(2025, 11, 31));
    const createdAt = /^\d{4}$/.test(String(item.date || '').trim())
      ? new Date(parsed.getTime() - i * 1000)
      : parsed;

    return {
      url: item.url,
      original_url: item.originalUrl || '',
      title: item.title || '',
      caption: item.caption || item.title || '',
      category: item.category || 'company',
      category_label: item.categoryLabel || 'Hoạt động công ty',
      date: item.date || (i < 10 ? '2026' : '2025'),
      article_id: item.articleId || null,
      created_at: createdAt
    };
  });
  const existing = await prisma.gallery.count();
  if (existing > 0) {
    console.log(`Gallery already contains ${existing} photos.`);
    return;
  }
  const result = await prisma.gallery.createMany({ data: rows });
  console.log(`Đã nạp thành công ${result.count} ảnh vào bảng gallery!`);
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
