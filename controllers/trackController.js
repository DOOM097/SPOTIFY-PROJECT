const { Track } = require('../models/Track');

exports.create = async (req, res) => {
    try {
        const newTrack = await Track.create(req.body);
        res.status(201).json(newTrack);
    } catch (error) {
        res.status(500).json({ error: 'Failed to create track' });
    }
};

exports.findAll = async (req, res) => {
    try {
        const tracks = await Track.findAll();
        res.status(200).json(tracks);
    } catch (error) {
        res.status(500).json({ error: 'Failed to fetch tracks' });
    }
};

exports.update = async (req, res) => {
    try {
        const { id } = req.params;
        const [updatedRows] = await Track.update(req.body, { where: { id } });
        if (updatedRows === 0) {
            return res.status(404).json({ error: 'Track not found' });
        }
        res.status(200).json({ message: 'Track updated successfully' });
    } catch (error) {
        res.status(500).json({ error: 'Failed to update track' });
    }
};

exports.delete = async (req, res) => {
    try {
        const { id } = req.params;
        const deletedRowCount = await Track.destroy({ where: { id } });
        if (deletedRowCount === 0) {
            return res.status(404).json({ error: 'Track not found' });
        }
        res.status(200).json({ message: 'Track deleted successfully' });
    } catch (error) {
        res.status(500).json({ error: 'Failed to delete track' });
    }
};
