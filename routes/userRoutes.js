// routes/users.js
const express = require('express');
const router = express.Router();

// Обработчики методов для пользователей
router.get('/', (req, res) => {
    // Логика для получения списка пользователей из базы данных
    res.send('GET request to fetch all users');
});

router.post('/', (req, res) => {
    // Логика для создания нового пользователя на основе данных из тела запроса
    res.send('POST request to create a new user');
});

router.delete('/:id', (req, res) => {
    const userId = req.params.id;
    // Логика для удаления пользователя с указанным ID из базы данных
    res.send(`DELETE request to delete user with ID ${userId}`);
});

module.exports = router;
