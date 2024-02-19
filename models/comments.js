const Sequelize = require('sequelize');
const sequelize = require('../config/database');
const User = require('./user'); 

const Comment = sequelize.define('comments', {
  id: {
    autoIncrement: true,
    type: Sequelize.INTEGER,
    allowNull: false,
    primaryKey: true
  },
  userId: {
    type: Sequelize.INTEGER,
    allowNull: false,
    references: {
      model: User, 
      key: 'UserID'
    }
  },
  foodId: {
    type: Sequelize.INTEGER,
    allowNull: false,
    references: {
      model: 'food',
      key: 'id'
    }
  },
  commentText: {
    type: Sequelize.TEXT,
    allowNull: false
  },
  createdAt: {
    type: Sequelize.DATE,
    allowNull: false,
    defaultValue: Sequelize.literal('CURRENT_TIMESTAMP')
  }
}, {
  tableName: 'comments',
  timestamps: false,
  indexes: [
    {
      name: 'PRIMARY',
      unique: true,
      using: 'BTREE',
      fields: [
        { name: 'id' }
      ]
    },
    {
      name: 'FK_comments_users',
      using: 'BTREE',
      fields: [
        { name: 'userId' }
      ]
    },
    {
      name: 'FK_comments_food',
      using: 'BTREE',
      fields: [
        { name: 'foodId' }
      ]
    }
  ]
});

Comment.belongsTo(User, { foreignKey: 'userId' });

module.exports = Comment;
