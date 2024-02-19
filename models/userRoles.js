const Sequelize = require('sequelize');
const sequelize = require('../config/database');

const UserRole = sequelize.define('userroles', {
  UserRoleID: {
    autoIncrement: true,
    type: Sequelize.INTEGER,
    allowNull: false,
    primaryKey: true
  },
  UserID: {
    type: Sequelize.INTEGER,
    allowNull: false
  },
  RoleID: {
    type: Sequelize.INTEGER,
    allowNull: false
  }
}, {
  tableName: 'UserRoles',
  timestamps: false,
  indexes: [
    {
      name: "PRIMARY",
      unique: true,
      using: "BTREE",
      fields: [
        { name: "UserRoleID" },
      ]
    },
  ]
});

module.exports = UserRole;
