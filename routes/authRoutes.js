// authRoutes.js

const express = require('express');
const router = express.Router();
const authController = require('../controllers/authController');
const { authenticate, authorize } = require('../middleware/authMiddleware');

// Маршрут для регистрации нового пользователя (доступен всем)
router.post('/register', authController.register);

// Маршрут для входа пользователя (доступен всем)
router.post('/login', authController.login);

// Маршруты, требующие аутентификации и авторизации
router.use(authenticate);

// Маршруты для администратора
router.get('/admin/dashboard', authorize, (req, res) => {
    res.send('Admin Dashboard');
});

// Другие маршруты, требующие авторизации и, возможно, определенной роли

module.exports = router;
