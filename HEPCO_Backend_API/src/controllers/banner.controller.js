const BannerModel = require('../models/banner.model');
const imageUploadService = require('../services/imageUpload.service');
const AppError = require('../utils/AppError');

exports.getAllBanners = async (req, res, next) => {
  try {
    const { page, limit } = req.query;
    const banners = await BannerModel.getAll(page, limit);
    res.json(banners);
  } catch (error) {
    next(new AppError('FETCH_FAILED', 500, error.message));
  }
};

exports.createBanner = async (req, res, next) => {
  try {
    let url;
    if (req.file) {
      url = await imageUploadService.uploadImage(req.file);
    } else if (req.body?.url && typeof req.body.url === 'string' && req.body.url.trim()) {
      url = req.body.url.trim();
    } else {
      return next(new AppError('NO_FILE_UPLOADED', 400, 'Vui lòng chọn tệp ảnh hoặc nhập URL'));
    }
    await BannerModel.create(url);
    res.status(201).json({ success: true, url });
  } catch (error) {
    next(new AppError('SAVE_DB_FAILED', 500, error.message));
  }
};

exports.deleteBanner = async (req, res, next) => {
  const { filename } = req.params;
  if (!filename) {
    return next(new AppError('INVALID_FILENAME', 400, 'Valid filename parameter is required'));
  }

  try {
    await BannerModel.deleteByUrlMatch(filename);
    res.json({ success: true, message: 'File deleted' });
  } catch (error) {
    next(new AppError('DELETE_FAILED', 500, error.message));
  }
};
