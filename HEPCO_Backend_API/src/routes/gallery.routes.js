const express = require('express');
const router = express.Router();
const galleryController = require('../controllers/gallery.controller');
const authMiddleware = require('../middlewares/auth.middleware');

router.get('/', galleryController.getGallery);
router.post('/', authMiddleware.verifyToken, authMiddleware.requireCmsAdmin, galleryController.createGallery);
router.put('/:id', authMiddleware.verifyToken, authMiddleware.requireCmsAdmin, galleryController.updateGallery);
router.delete('/:id', authMiddleware.verifyToken, authMiddleware.requireCmsAdmin, galleryController.deleteGallery);

module.exports = router;
