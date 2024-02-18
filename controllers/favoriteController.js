// favoriteController.js
const User = require('../models/User');

exports.addToFavorites = async (req, res) => {
    try {
        const userId = req.user.id; // Предполагается, что идентификатор пользователя содержится в токене аутентификации
        const { trackId } = req.body;

        const user = await User.findByPk(userId);
        if (!user) {
            return res.status(404).json({ error: 'User not found' });
        }

        // Проверяем, есть ли трек уже в избранном у пользователя
        const isTrackAlreadyInFavorites = user.favorites.some(favorite => favorite === trackId);
        if (isTrackAlreadyInFavorites) {
            return res.status(400).json({ error: 'Track already in favorites' });
        }

        // Добавляем трек в список избранного пользователя
        user.favorites.push(trackId);
        await user.save();

        res.status(200).json({ message: 'Track added to favorites' });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal server error' });
    }
};

exports.removeFromFavorites = async (req, res) => {
    try {
        const userId = req.user.id; // Предполагается, что идентификатор пользователя содержится в токене аутентификации
        const { trackId } = req.body;

        const user = await User.findByPk(userId);
        if (!user) {
            return res.status(404).json({ error: 'User not found' });
        }

        // Удаляем трек из списка избранного пользователя
        user.favorites = user.favorites.filter(favorite => favorite !== trackId);
        await user.save();

        res.status(200).json({ message: 'Track removed from favorites' });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal server error' });
    }
};
