const { Sequelize } = require('sequelize');

const sequelize = new Sequelize('food', 'root', '', {
  host: 'localhost',
  dialect: 'mysql'
});

module.exports = sequelize;