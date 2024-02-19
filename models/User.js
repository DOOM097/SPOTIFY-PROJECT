const Sequelize = require('sequelize');
const sequelize = require('../config/database');
const User = sequelize.define('user', {
  id: {
    autoIncrement: true,
    type: Sequelize.INTEGER,
    allowNull: false,
    primaryKey: true
  },
  username: {
    type: Sequelize.STRING(255),
    allowNull: false
  },
  email: {
    type: Sequelize.STRING(255),
    allowNull: false,
    unique: true
  },
  password: {
    type: Sequelize.STRING(255),
    allowNull: false
  }
}, {
  tableName: 'users',
  timestamps: false,
  indexes: [
    {
      name: 'PRIMARY',
      unique: true,
      using: 'BTREE',
      fields: [{ name: 'id' }]
    },
    {
      name: 'users_email_unique',
      unique: true,
      using: 'BTREE',
      fields: [{ name: 'email' }]
    }
  ]
});
module.exports =User;