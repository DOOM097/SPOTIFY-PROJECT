// routes/favoriteRoutes.js
const express = require('express');
const router = express.Router();
const favoriteController = require('../controllers/favoriteController');

// Получить все избранные треки
router.get('/favorites', favoriteController.getAllFavorites);

// Добавить трек в избранное
router.post('/favorites', favoriteController.addToFavorites);

// Удалить трек из избранного
router.delete('/favorites/:id', favoriteController.removeFromFavorites);

module.exports = router;
