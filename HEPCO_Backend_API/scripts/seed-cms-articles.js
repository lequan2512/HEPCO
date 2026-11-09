const { PrismaClient } = require('@prisma/client');
const fs = require('fs');
const path = require('path');

const prisma = new PrismaClient();

function parseDateStrToDate(dStr) {
  if (!dStr) return new Date();
  const cleanStr = String(dStr).trim();
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
  return isNaN(d.getTime()) ? new Date() : d;
}

async function main() {
  const jsonPath = path.join(__dirname, '../../HEPCO_Frontend/src/data/migratedData.json');
  if (!fs.existsSync(jsonPath)) {
    console.error('Không tìm thấy file migratedData.json tại:', jsonPath);
    return;
  }

  const raw = JSON.parse(fs.readFileSync(jsonPath, 'utf8').replace(/^\uFEFF/, ''));
  const allArticles = [
    ...(raw.news || []).map((i) => ({ ...i, type: (i.category === 'announcement' ? 'announcement' : 'news') })),
    ...(raw.shareholders || []).map((i) => ({ ...i, type: 'shareholders' })),
    ...(raw.services || []).map((i) => ({ ...i, type: 'service' })),
    ...(raw.about || []).map((i) => ({ ...i, type: 'about' }))
  ];

  console.log(`Xóa dữ liệu cũ và nạp lại ${allArticles.length} bài viết với timestamp chính xác...`);
  await prisma.news.deleteMany();

  let inserted = 0;
  for (const item of allArticles) {
    const title = (item.title || 'Untitled').trim().slice(0, 255);
    const date = (item.date || item.publishDate || '01-01-2026').trim().slice(0, 20);
    const content = item.content || '';
    const thumbnail = (item.thumbnail || '').slice(0, 500);
    const type = item.type || 'news';
    const createdAt = parseDateStrToDate(item.date || item.publishDate);
    const metadata = {
      category: item.category,
      documentType: item.documentType,
      publishYear: item.publishYear,
      attachments: item.attachments || [],
      images: item.images || [],
      summary: item.summary || '',
      status: item.status || 'published',
      slug: item.slug || ''
    };

    await prisma.news.create({
      data: {
        title,
        date,
        content,
        thumbnail,
        type,
        metadata,
        created_at: createdAt
      }
    });
    inserted++;
  }

  console.log(`Đã nạp thành công ${inserted} bài viết vào CSDL!`);
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
