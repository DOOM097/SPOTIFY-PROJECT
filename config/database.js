// Подключение к базе данных
const { Sequelize } = require('sequelize');
const sequelize = new Sequelize('mysql://root:@localhost:3306/spotify-api');

// Определение модели User
const User = sequelize.define('User', {
  username: Sequelize.STRING,
  email: Sequelize.STRING,
  password: Sequelize.STRING
});

// Синхронизация модели с базой данных (создание таблицы, если она не существует)
async function syncDatabase() {
  try {
    await sequelize.sync();
    console.log('Database synchronized successfully');
  } catch (error) {
    console.error('Error synchronizing database:', error);
  }
}

// Вызов функции синхронизации при запуске приложения
syncDatabase();
