// authMiddleware.js

const jwt = require('jsonwebtoken');

exports.authenticate = (req, res, next) => {
    // Получить токен из заголовка Authorization
    const token = req.headers.authorization;

    // Проверить наличие токена
    if (!token) {
        return res.status(401).json({ message: 'Authorization token is missing' });
    }

    // Проверить действительность токена
    jwt.verify(token, 'your_secret_key', (err, decodedToken) => {
        if (err) {
            return res.status(401).json({ message: 'Invalid token' });
        } else {
            // Добавить информацию о пользователе в объект запроса для последующего использования
            req.user = decodedToken;
            next();
        }
    });
};

exports.authorize = (req, res, next) => {
    // Проверить роль пользователя из объекта запроса
    if (req.user.role !== 'admin') {
        return res.status(403).json({ message: 'User is not authorized' });
    }
    next();
};
