const Sequelize = require('sequelize');
const sequelize = require('../config/database');
const Playlist = sequelize.define('playlist', {
  id: {
    autoIncrement: true,
    type: Sequelize.INTEGER,
    allowNull: false,
    primaryKey: true
  },
  name: {
    type: Sequelize.STRING(255),
    allowNull: false
  },
  description: {
    type: Sequelize.TEXT,
    allowNull: true
  }
}, {
  tableName: 'playlists',
  timestamps: false,
  indexes: [
    {
      name: 'PRIMARY',
      unique: true,
      using: 'BTREE',
      fields: [{ name: 'id' }]
    }
  ]
});

module.exports = Playlist;