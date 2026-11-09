const express = require('express');
const router = express.Router();
const authMiddleware = require('../middlewares/auth.middleware');
const bannerController = require('../controllers/banner.controller');
const receiveImage = require('../middlewares/imageUpload.middleware');

router.get('/', bannerController.getAllBanners);
router.post('/', authMiddleware.verifyToken, authMiddleware.requireCmsAdmin, receiveImage, bannerController.createBanner);
router.delete('/:filename', authMiddleware.verifyToken, authMiddleware.requireCmsAdmin, bannerController.deleteBanner);

module.exports = router;
