// routes/adminRoutes.js
const express = require('express');
const router = express.Router();
const adminController = require('../controllers/adminController');
const { authenticate, authorizeAdmin } = require('../middleware/auth');

router.use(authenticate, authorizeAdmin);

router.get('/users', adminController.getAllUsers);
router.post('/users', adminController.createUser);
router.put('/users/:id', adminController.updateUser);
router.delete('/users/:id', adminController.deleteUser);

router.get('/playlists', adminController.getAllPlaylists);
router.post('/playlists', adminController.createPlaylist);
router.put('/playlists/:id', adminController.updatePlaylist);
router.delete('/playlists/:id', adminController.deletePlaylist);

module.exports = router;
