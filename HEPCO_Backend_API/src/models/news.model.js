const { prisma } = require('../db');
const { NEWS_SORTS, NEWS_METADATA_FIELDS, ABOUT_SETTINGS_TYPE } = require('../constants/news');

const toArticle = (record) => {
  if (!record) return null;
  const { metadata, ...core } = record;
  const extra = {};
  for (const key of NEWS_METADATA_FIELDS) if (metadata?.[key] !== undefined) extra[key] = metadata[key];
  return { ...extra, ...core };
};

class NewsModel {
  static async getAll({ type, page, limit, search, category, documentTypes, year, sort }) {
    const where = {};
    if (type && type !== 'all') where.type = type;
    else where.OR = [{ type: null }, { type: { not: ABOUT_SETTINGS_TYPE } }];
    const conditions = [];
    if (search) conditions.push({ title: { contains: search } });
    if (category && category !== 'all') {
      conditions.push({
        OR: [
          { metadata: { path: '$.category', equals: category } },
          { metadata: { path: '$.documentType', equals: category } }
        ]
      });
    }
    if (documentTypes?.length) {
      conditions.push({
        OR: documentTypes.map((value) => ({ metadata: { path: '$.documentType', equals: value } }))
      });
    }
    if (year && year !== 'all') {
      conditions.push({ metadata: { path: '$.publishYear', equals: year } });
    }
    if (conditions.length) where.AND = conditions;
    const [total, records] = await Promise.all([
      prisma.news.count({ where }),
      prisma.news.findMany({ where, skip: (page - 1) * limit, take: limit, orderBy: NEWS_SORTS[sort] }),
    ]);
    return { data: records.map(toArticle), meta: { total, page, limit, totalPages: Math.max(1, Math.ceil(total / limit)) } };
  }

  static async getStats() {
    const all = await prisma.news.findMany({
      select: { type: true, metadata: true }
    });
    const newsStats = { total: 0, countsByCategory: {}, countsByYear: {}, years: [] };
    const shareholderStats = { total: 0, countsByType: {}, countsByGroup: {}, countsByYear: {}, years: [] };
    const newsYears = new Set();
    const shareholderYears = new Set();

    for (const item of all) {
      const meta = item.metadata || {};
      const year = meta.publishYear;
      if (item.type === 'news') {
        newsStats.total++;
        if (meta.category) {
          newsStats.countsByCategory[meta.category] = (newsStats.countsByCategory[meta.category] || 0) + 1;
        }
        if (year) {
          newsYears.add(year);
          newsStats.countsByYear[year] = (newsStats.countsByYear[year] || 0) + 1;
        }
      } else if (item.type === 'shareholders') {
        shareholderStats.total++;
        const docType = meta.documentType || 'other_document';
        shareholderStats.countsByType[docType] = (shareholderStats.countsByType[docType] || 0) + 1;
        if (year) {
          shareholderYears.add(year);
          shareholderStats.countsByYear[year] = (shareholderStats.countsByYear[year] || 0) + 1;
        }
      }
    }
    newsStats.years = Array.from(newsYears).sort((a, b) => b - a);
    shareholderStats.years = Array.from(shareholderYears).sort((a, b) => b - a);
    return { news: newsStats, shareholders: shareholderStats };
  }

  static async getById(id) { return toArticle(await prisma.news.findUnique({ where: { id } })); }
  static async create(data) { return toArticle(await prisma.news.create({ data })); }
  static async update(id, data) { return toArticle(await prisma.news.update({ where: { id }, data })); }
  static async delete(id) { return toArticle(await prisma.news.delete({ where: { id } })); }
}

module.exports = NewsModel;
