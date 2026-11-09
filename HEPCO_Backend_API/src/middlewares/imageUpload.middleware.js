const multer = require('multer');
const AppError = require('../utils/AppError');

const uploadFields = multer({
  storage: multer.memoryStorage(),
  limits: { fileSize: 30 * 1024 * 1024, files: 1 }
}).fields([
  { name: 'image', maxCount: 1 },
  { name: 'file', maxCount: 1 }
]);

module.exports = (req, res, next) => uploadFields(req, res, (error) => {
  if (error) return next(new AppError('INVALID_IMAGE_UPLOAD', 400, 'Tệp tải lên không được vượt quá 30 MB'));
  req.file = req.files?.file?.[0] || req.files?.image?.[0] || req.file;
  next();
});
