const { Playlist } = require('../models/Playlist');

exports.create = async (req, res) => {
    try {
        const newPlaylist = await Playlist.create(req.body);
        res.status(201).json(newPlaylist);
    } catch (error) {
        res.status(500).json({ error: 'Failed to create playlist' });
    }
};

exports.findAll = async (req, res) => {
    try {
        const playlists = await Playlist.findAll();
        res.status(200).json(playlists);
    } catch (error) {
        res.status(500).json({ error: 'Failed to fetch playlists' });
    }
};

exports.update = async (req, res) => {
    try {
        const { id } = req.params;
        const [updatedRows] = await Playlist.update(req.body, { where: { id } });
        if (updatedRows === 0) {
            return res.status(404).json({ error: 'Playlist not found' });
        }
        res.status(200).json({ message: 'Playlist updated successfully' });
    } catch (error) {
        res.status(500).json({ error: 'Failed to update playlist' });
    }
};

exports.delete = async (req, res) => {
    try {
        const { id } = req.params;
        const deletedRowCount = await Playlist.destroy({ where: { id } });
        if (deletedRowCount === 0) {
            return res.status(404).json({ error: 'Playlist not found' });
        }
        res.status(200).json({ message: 'Playlist deleted successfully' });
    } catch (error) {
        res.status(500).json({ error: 'Failed to delete playlist' });
    }
};
