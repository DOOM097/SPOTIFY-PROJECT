const Sequelize = require('sequelize');
const sequelize = require('../config/database');

// Модель для треков (музыки)
const Track = sequelize.define('track', {
  id: {
    autoIncrement: true,
    type: Sequelize.INTEGER,
    allowNull: false,
    primaryKey: true
  },
  title: {
    type: Sequelize.STRING(255),
    allowNull: false
  },
  artist: {
    type: Sequelize.STRING(255),
    allowNull: false
  },
  duration: {
    type: Sequelize.INTEGER,
    allowNull: false
  }
}, {
  tableName: 'tracks',
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
module.exports = Track;