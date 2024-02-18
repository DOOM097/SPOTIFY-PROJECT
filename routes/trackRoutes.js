// routes/trackRoutes.js
const express = require('express');
const router = express.Router();
const trackController = require('../controllers/trackController');

// Получить все треки
router.get('/tracks', trackController.getAllTracks);

// Получить трек по ID
router.get('/tracks/:id', trackController.getTrackById);

// Создать новый трек
router.post('/tracks', trackController.createTrack);

// Обновить информацию о треке
router.put('/tracks/:id', trackController.updateTrack);

// Удалить трек
router.delete('/tracks/:id', trackController.deleteTrack);

module.exports = router;
