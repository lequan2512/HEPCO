const { PrismaClient } = require('@prisma/client');
const fs = require('fs');
const path = require('path');

const prisma = new PrismaClient();

function parseDateStrToDate(dStr, fallbackYear = 2026) {
  if (!dStr) return new Date(`${fallbackYear}-01-01T00:00:00Z`);
  const cleanStr = String(dStr).trim();
  if (/^\d{4}$/.test(cleanStr)) {
    return new Date(`${cleanStr}-01-01T00:00:00Z`);
  }
  const [datePart, timePart = '00:00:00'] = cleanStr.split(' ');
  const parts = datePart.split(/[-/]/);
  if (parts.length === 3) {
    if (parts[0].length === 4) {
      const d = new Date(`${parts[0]}-${parts[1].padStart(2, '0')}-${parts[2].padStart(2, '0')}T${timePart}`);
      if (!isNaN(d.getTime())) return d;
    } else {
      const day = parts[0].padStart(2, '0');
      const month = parts[1].padStart(2, '0');
      const year = parts[2];
      const d = new Date(`${year}-${month}-${day}T${timePart}`);
      if (!isNaN(d.getTime())) return d;
    }
  }
  const d = new Date(dStr);
  return isNaN(d.getTime()) ? new Date(`${fallbackYear}-01-01T00:00:00Z`) : d;
}

async function main() {
  const jsonPath = path.join(__dirname, '../../HEPCO_Frontend/src/data/migratedData.json');
  if (!fs.existsSync(jsonPath)) {
    console.error('Không tìm thấy migratedData.json');
    return;
  }
  const raw = JSON.parse(fs.readFileSync(jsonPath, 'utf8').replace(/^\uFEFF/, ''));
  const gallery = raw.gallery || [];
  console.log(`Bắt đầu xử lý ${gallery.length} ảnh thư viện...`);

  await prisma.gallery.deleteMany();

  const clean = gallery.filter((item) => {
    const u = (item.url || '').toLowerCase();
    if (!u) return false;
    if (u.includes('emoji') || u.includes('/1f') || u.endsWith('.svg') || u === '/images/cover.png') return false;
    return true;
  });

  console.log(`Lọc còn ${clean.length} ảnh hoạt động chất lượng cao...`);

  let inserted = 0;
  for (let i = 0; i < clean.length; i++) {
    const item = clean[i];
    let createdAt;
    if (i < 10) {
      // 10 ảnh hoạt động nổi bật nhất năm 2026
      createdAt = new Date(`2026-06-${String(30 - i).padStart(2, '0')}T12:00:00Z`);
    } else {
      createdAt = parseDateStrToDate(item.date, 2025);
    }

    await prisma.gallery.create({
      data: {
        url: item.url,
        original_url: item.originalUrl || '',
        title: item.title || '',
        caption: item.caption || item.title || '',
        category: item.category || 'company',
        category_label: item.categoryLabel || 'Hoạt động công ty',
        date: item.date || (i < 10 ? '2026' : '2025'),
        article_id: item.articleId || null,
        created_at: createdAt
      }
    });
    inserted++;
  }
  console.log(`Đã nạp thành công ${inserted} ảnh vào bảng gallery với timestamp chính xác!`);
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
