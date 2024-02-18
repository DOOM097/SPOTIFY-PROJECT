 
const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');
const User = require('./User');

const Playlist = sequelize.define('Playlist', {
  name: {
    type: DataTypes.STRING,
    allowNull: false
  },
  description: {
    type: DataTypes.TEXT,
    allowNull: true
  }
});

Playlist.belongsTo(User);

module.exports = Playlist;
