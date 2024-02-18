const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');
const Playlist = require('./Playlist');

const Track = sequelize.define('Track', {
  title: {
    type: DataTypes.STRING,
    allowNull: false
  },
  album: {
    type: DataTypes.STRING,
    allowNull: true
  },
  genre: {
    type: DataTypes.STRING,
    allowNull: true
  }
});

Track.belongsTo(Playlist);

module.exports = Track;