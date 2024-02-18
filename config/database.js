// database.js
const { Sequelize } = require('sequelize');

const sequelize = new Sequelize({
  dialect: 'mysql',
  host: 'localhost',
  database: 'spotify_api',
  username: 'root',
  password: '',
  
});

module.exports = sequelize;
