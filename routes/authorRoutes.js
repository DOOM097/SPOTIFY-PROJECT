// routes/authorRoutes.js
const express = require('express');
const router = express.Router();
const authorController = require('../controllers/authorController');
const { authenticate, authorizeAuthor } = require('../middlewares/auth');

router.use(authenticate, authorizeAuthor);

router.get('/playlists', authorController.getAllPlaylists);
router.post('/playlists', authorController.createPlaylist);
router.put('/playlists/:id', authorController.updatePlaylist);
router.delete('/playlists/:id', authorController.deletePlaylist);

router.get('/tracks', authorController.getAllTracks);
router.post('/tracks', authorController.createTrack);
router.put('/tracks/:id', authorController.updateTrack);
router.delete('/tracks/:id', authorController.deleteTrack);

module.exports = router;
