const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');
const User = require('./User');
const Track = require('./Track');

const Favorite = sequelize.define('Favorite', {});

Favorite.belongsTo(User);
Favorite.belongsTo(Track);

module.exports = Favorite;