const { Sequelize } = require('sequelize');

const sequelize = new Sequelize('spotify_api', 'root', '', {
  host: 'localhost',
  dialect: 'mysql'
});

module.exports = sequelize;