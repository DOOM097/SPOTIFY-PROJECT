 
const User = require('../models/User');

// Получить всех пользователей
exports.getAllUsers = async (req, res) => {
    try {
        const users = await User.findAll();
        res.json(users);
    } catch (error) {
        res.status(500).json({ error: 'Internal server error' });
    }
};

// Получить пользователя по ID
exports.getUserById = async (req, res) => {
    try {
        const userId = req.params.id;
        const user = await User.findByPk(userId);
        if (!user) {
            return res.status(404).json({ error: 'User not found' });
        }
        res.json(user);
    } catch (error) {
        res.status(500).json({ error: 'Internal server error' });
    }
};

// Создать нового пользователя
exports.createUser = async (req, res) => {
    try {
        const newUser = await User.create(req.body);
        res.status(201).json(newUser);
    } catch (error) {
        res.status(500).json({ error: 'Internal server error' });
    }
};

// Обновить информацию о пользователе
exports.updateUser = async (req, res) => {
    try {
        const userId = req.params.id;
        const [updated] = await User.update(req.body, { where: { id: userId } });
        if (!updated) {
            return res.status(404).json({ error: 'User not found' });
        }
        const updatedUser = await User.findByPk(userId);
        res.json(updatedUser);
    } catch (error) {
        res.status(500).json({ error: 'Internal server error' });
    }
};

// Удалить пользователя
exports.deleteUser = async (req, res) => {
    try {
        const userId = req.params.id;
        const deleted = await User.destroy({ where: { id: userId } });
        if (!deleted) {
            return res.status(404).json({ error: 'User not found' });
        }
        res.status(204).end();
    } catch (error) {
        res.status(500).json({ error: 'Internal server error' });
    }
};
