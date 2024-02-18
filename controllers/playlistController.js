// controllers/playlistController.js
const Playlist = require('../models/Playlist');

// Получить все плейлисты
exports.getAllPlaylists = async (req, res) => {
    try {
        const playlists = await Playlist.findAll();
        res.json(playlists);
    } catch (error) {
        res.status(500).json({ error: 'Internal server error' });
    }
};

// Получить плейлист по ID
exports.getPlaylistById = async (req, res) => {
    try {
        const playlistId = req.params.id;
        const playlist = await Playlist.findByPk(playlistId);
        if (!playlist) {
            return res.status(404).json({ error: 'Playlist not found' });
        }
        res.json(playlist);
    } catch (error) {
        res.status(500).json({ error: 'Internal server error' });
    }
};

// Создать новый плейлист
exports.createPlaylist = async (req, res) => {
    try {
        const { name, userId } = req.body;
        const newPlaylist = await Playlist.create({ name, userId });
        res.status(201).json(newPlaylist);
    } catch (error) {
        res.status(500).json({ error: 'Internal server error' });
    }
};

// Обновить информацию о плейлисте
exports.updatePlaylist = async (req, res) => {
    try {
        const playlistId = req.params.id;
        const { name, userId } = req.body;
        const [updated] = await Playlist.update({ name, userId }, { where: { id: playlistId } });
        if (updated) {
            const updatedPlaylist = await Playlist.findByPk(playlistId);
            return res.json(updatedPlaylist);
        }
        throw new Error('Playlist not found');
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

// Удалить плейлист
exports.deletePlaylist = async (req, res) => {
    try {
        const playlistId = req.params.id;
        const deleted = await Playlist.destroy({ where: { id: playlistId } });
        if (deleted) {
            return res.json({ message: 'Playlist deleted successfully' });
        }
        throw new Error('Playlist not found');
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};
