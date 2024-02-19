const Sequelize = require('sequelize');
const sequelize = require('../config/database');

const Role = sequelize.define('roles', {
  RoleID: {
    autoIncrement: true,
    type: Sequelize.INTEGER,
    allowNull: false,
    primaryKey: true
  },
  RoleName: {
    type: Sequelize.STRING(255),
    allowNull: false
  }
}, {
  tableName: 'Roles',
  timestamps: false,
  indexes: [
    {
      name: "PRIMARY",
      unique: true,
      using: "BTREE",
      fields: [
        { name: "RoleID" },
      ]
    },
  ]
});

module.exports = Role;
