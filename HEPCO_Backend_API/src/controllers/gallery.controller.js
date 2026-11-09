const GalleryModel = require('../models/gallery.model');
const { GALLERY_LIMITS } = require('../constants/gallery');
const AppError = require('../utils/AppError');
const publicReads = require('../utils/publicReadCache')();

exports.getGallery = async (req, res, next) => {
  try {
    const { category, search, page = GALLERY_LIMITS.DEFAULT_PAGE, limit = GALLERY_LIMITS.DEFAULT_LIMIT } = req.query;
    const params = {
      category,
      search,
      page: Math.max(1, Number(page) || GALLERY_LIMITS.DEFAULT_PAGE),
      limit: Math.min(GALLERY_LIMITS.MAX_LIMIT, Math.max(1, Number(limit) || GALLERY_LIMITS.DEFAULT_LIMIT))
    };
    const load = () => GalleryModel.getAll(params);
    const cacheable = params.page === 1 && params.limit <= 24 && !search && !req.headers.authorization;
    const result = await (cacheable ? publicReads.read(JSON.stringify(params), load) : load());
    res.json(result);
  } catch (error) {
    next(error);
  }
};

exports.createGallery = async (req, res, next) => {
  try {
    const { url, caption, category, categoryLabel, date, title } = req.body || {};
    if (!url || typeof url !== 'string' || !url.trim()) {
      throw new AppError('INVALID_INPUT', 400, 'Image URL is required');
    }
    const item = await GalleryModel.create({
      url: url.trim(),
      caption: (caption || '').trim(),
      title: (title || caption || '').trim(),
      category,
      categoryLabel,
      date: date || new Date().getFullYear().toString()
    });
    publicReads.clear();
    res.status(201).json({ success: true, data: item });
  } catch (error) {
    next(error);
  }
};

exports.updateGallery = async (req, res, next) => {
  try {
    const id = Number(req.params.id);
    if (!Number.isSafeInteger(id) || id <= 0) {
      throw new AppError('INVALID_INPUT', 400, 'A positive integer ID is required');
    }
    const item = await GalleryModel.update(id, req.body || {});
    publicReads.clear();
    res.json({ success: true, data: item });
  } catch (error) {
    next(error.code === 'P2025' ? new AppError('NOT_FOUND', 404, 'Item not found') : error);
  }
};

exports.deleteGallery = async (req, res, next) => {
  try {
    const id = Number(req.params.id);
    if (!Number.isSafeInteger(id) || id <= 0) {
      throw new AppError('INVALID_INPUT', 400, 'A positive integer ID is required');
    }
    await GalleryModel.delete(id);
    publicReads.clear();
    res.json({ success: true, id });
  } catch (error) {
    next(error.code === 'P2025' ? new AppError('NOT_FOUND', 404, 'Item not found') : error);
  }
};
