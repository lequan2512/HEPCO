// Re-syncs created_at (the list sort key) with the displayed `date` text of news and gallery rows.
// Dry run by default; pass --apply to write. Never inserts or deletes rows.
const { prisma } = require('../src/db');
const { parseDisplayDate } = require('../src/utils/parseDisplayDate');

const apply = process.argv.includes('--apply');

async function sync(label, rows, update) {
  let changed = 0;
  let skipped = 0;
  const samples = [];
  for (const row of rows) {
    let next = parseDisplayDate(row.date);
    if (!next) { skipped++; console.log(`    unparsable ${label} #${row.id}: date=${JSON.stringify(row.date)}`); continue; }
    // Year-only dates tie; offset by id so rows keep their existing relative order (lower id first).
    if (/^\d{4}$/.test(String(row.date).trim())) next = new Date(next.getTime() - row.id * 1000);
    if (row.created_at && Math.abs(row.created_at.getTime() - next.getTime()) < 1000) continue;
    changed++;
    if (samples.length < 5) samples.push(`${row.id}: "${row.date}" ${row.created_at?.toISOString()} -> ${next.toISOString()}`);
    if (apply) await update(row.id, next);
  }
  console.log(`${label}: ${rows.length} rows, ${changed} ${apply ? 'updated' : 'would change'}, ${skipped} unparsable (left as is)`);
  samples.forEach((line) => console.log('   ', line));
}

(async () => {
  const news = await prisma.news.findMany({
    where: { type: { not: 'about_settings' } },
    select: { id: true, date: true, created_at: true }
  });
  await sync('news', news, (id, created_at) => prisma.news.update({ where: { id }, data: { created_at } }));

  const gallery = await prisma.gallery.findMany({ select: { id: true, date: true, created_at: true } });
  await sync('gallery', gallery, (id, created_at) => prisma.gallery.update({ where: { id }, data: { created_at } }));

  if (!apply) console.log('\nDry run only. Re-run with --apply to write.');
  await prisma.$disconnect();
})().catch((e) => { console.error(e); process.exit(1); });
