const { prisma } = require('../db');
const { GALLERY_CATEGORY, GALLERY_CATEGORY_LABELS, GALLERY_LIMITS } = require('../constants/gallery');

class GalleryModel {
  static async getAll({ category, search, page = GALLERY_LIMITS.DEFAULT_PAGE, limit = GALLERY_LIMITS.DEFAULT_LIMIT } = {}) {
    const where = {};
    if (category && category !== GALLERY_CATEGORY.ALL) {
      where.category = category;
    }
    if (search && search.trim()) {
      where.OR = [
        { title: { contains: search.trim() } },
        { caption: { contains: search.trim() } },
      ];
    }
    const [total, records] = await Promise.all([
      prisma.gallery.count({ where }),
      prisma.gallery.findMany({
        where,
        skip: (page - 1) * limit,
        take: limit,
        orderBy: [{ created_at: 'desc' }, { id: 'desc' }]
      })
    ]);
    return {
      data: records.map((r) => ({
        id: r.id,
        url: r.url,
        originalUrl: r.original_url,
        title: r.title,
        caption: r.caption,
        category: r.category,
        categoryLabel: r.category_label,
        date: r.date,
        articleId: r.article_id
      })),
      meta: {
        total,
        page,
        limit,
        totalPages: Math.max(1, Math.ceil(total / limit))
      }
    };
  }

  static async create(data) {
    const category = data.category || GALLERY_CATEGORY.COMPANY;
    const categoryLabel = data.categoryLabel || GALLERY_CATEGORY_LABELS[category] || 'Hoạt động công ty';

    const row = await prisma.gallery.create({
      data: {
        url: data.url,
        original_url: data.originalUrl || data.url,
        title: data.title || data.caption || 'Hình ảnh hoạt động',
        caption: data.caption || data.title || '',
        category,
        category_label: categoryLabel,
        date: data.date || new Date().getFullYear().toString(),
        article_id: data.articleId ? Number(data.articleId) : null
      }
    });
    return {
      id: row.id,
      url: row.url,
      caption: row.caption,
      title: row.title,
      category: row.category,
      categoryLabel: row.category_label,
      date: row.date
    };
  }

  static async update(id, data) {
    const category = data.category || GALLERY_CATEGORY.COMPANY;
    const categoryLabel = data.categoryLabel || GALLERY_CATEGORY_LABELS[category] || 'Hoạt động công ty';

    const row = await prisma.gallery.update({
      where: { id: Number(id) },
      data: {
        url: data.url,
        caption: data.caption,
        title: data.title || data.caption,
        category,
        category_label: categoryLabel,
        date: data.date
      }
    });
    return row;
  }

  static async delete(id) {
    return prisma.gallery.delete({
      where: { id: Number(id) }
    });
  }
}

module.exports = GalleryModel;
