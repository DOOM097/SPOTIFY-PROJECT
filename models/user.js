const Sequelize = require('sequelize');
const sequelize = require('../config/database');

const User = sequelize.define('users', {
  UserID: {
    type: Sequelize.INTEGER,
    primaryKey: true
  },
  UserName: {
    type: Sequelize.STRING(255),
    allowNull: false
  },
  Email: {
    type: Sequelize.STRING(255),
    allowNull: false,
    unique: true
  },
  PasswordHash: {
    type: Sequelize.STRING(255),
    allowNull: false
  }
}, {
  tableName: 'Users',
  timestamps: false,
  indexes: [
    {
      unique: true,
      fields: ['UserID']
    },
    {
      unique: true,
      fields: ['Email']
    }
  ]
});

module.exports = User;
