const express = require('express');
const router = express.Router();
const ipController = require('../controllers/ip.controller');
const authMiddleware = require('../middlewares/auth.middleware');

router.use(authMiddleware.verifyToken, authMiddleware.requireAccountAdmin);

router.get('/', ipController.getAllIps);
router.post('/', ipController.addIp);
router.delete('/:id', ipController.deleteIp);
router.put('/:id', ipController.updateIp);

module.exports = router;
