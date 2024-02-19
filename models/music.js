const Sequelize = require('sequelize');
const sequelize = require('../config/database');

module.exports = sequelize.define('food', {
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
  publishedDate: {
    type: Sequelize.DATE,
    allowNull: true
  },
  thumbnailUrl: {
    type: Sequelize.STRING(255),
    allowNull: true
  },
  shortDescription: {
    type: Sequelize.TEXT,
    allowNull: true
  }
}, {
  tableName: 'food',
  timestamps: false,
  indexes: [
    {
      name: "PRIMARY",
      unique: true,
      using: "BTREE",
      fields: [
        { name: "id" },
      ]
    },
  ]
});
