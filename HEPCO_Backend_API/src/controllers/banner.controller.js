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
  if (!req.file) {
    return next(new AppError('NO_FILE_UPLOADED', 400, 'No file was uploaded'));
  }
  
  try {
    const url = await imageUploadService.uploadImage(req.file);
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
