const Sequelize = require('sequelize');
const sequelize = require('../config/database');

module.exports = sequelize.define('foodcategory', {
  FoodId: {
    type: Sequelize.INTEGER,
    allowNull: false,
    primaryKey: true,
    references: {
      model: 'food', 
      key: 'id'
    }
  },
  CategoryId: {
    type: Sequelize.INTEGER,
    allowNull: false,
    primaryKey: true,
    references: {
      model: 'categories',
      key: 'id'
    }
  }
}, {
  tableName: 'foodcategory',
  timestamps: false,
  indexes: [
    {
      name: "PRIMARY",
      unique: true,
      using: "BTREE",
      fields: [
        { name: "FoodId" },
        { name: "CategoryId" },
      ]
    },
  ]
});
