// controllers/trackController.js
const Track = require('../models/Track');

// Получить все треки
exports.getAllTracks = async (req, res) => {
    try {
        const tracks = await Track.findAll();
        res.json(tracks);
    } catch (error) {
        res.status(500).json({ error: 'Internal server error' });
    }
};

// Получить трек по ID
exports.getTrackById = async (req, res) => {
    try {
        const trackId = req.params.id;
        const track = await Track.findByPk(trackId);
        if (!track) {
            return res.status(404).json({ error: 'Track not found' });
        }
        res.json(track);
    } catch (error) {
        res.status(500).json({ error: 'Internal server error' });
    }
};

// Создать новый трек
exports.createTrack = async (req, res) => {
    try {
        const { name, artist, playlistId } = req.body;
        const newTrack = await Track.create({ name, artist, playlistId });
        res.status(201).json(newTrack);
    } catch (error) {
        res.status(500).json({ error: 'Internal server error' });
    }
};

// Обновить информацию о треке
exports.updateTrack = async (req, res) => {
    try {
        const trackId = req.params.id;
        const { name, artist, playlistId } = req.body;
        const [updated] = await Track.update({ name, artist, playlistId }, { where: { id: trackId } });
        if (updated) {
            const updatedTrack = await Track.findByPk(trackId);
            return res.json(updatedTrack);
        }
        throw new Error('Track not found');
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

// Удалить трек
exports.deleteTrack = async (req, res) => {
    try {
        const trackId = req.params.id;
        const deleted = await Track.destroy({ where: { id: trackId } });
        if (deleted) {
            return res.json({ message: 'Track deleted successfully' });
        }
        throw new Error('Track not found');
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};
