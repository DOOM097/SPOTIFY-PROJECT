// errorHandler.js

// Middleware для обработки ошибок в Express
const errorHandler = (err, req, res, next) => {
    // Логируем ошибку в консоль для отслеживания
    console.error(err.stack);

    // Отправляем клиенту HTTP-ответ с кодом 500 и сообщением об ошибке
    res.status(500).json({ message: 'Internal server error' });
};

// Экспортируем middleware для использования в других файлах
module.exports = errorHandler;
