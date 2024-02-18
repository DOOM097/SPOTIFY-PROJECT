// app.js
const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;
const sequelize = require('./config/database');
const Playlist = require('./models/Playlist');
const Track = require('./models/Track');
const User = require('./models/User');

app.get('/', async (req, res) => {
  try {
    // Проверяем подключение к базе данных
    await sequelize.authenticate();
    console.log('Connection to database has been established successfully.');

    // Создаем таблицы для моделей Playlist, Track и User, если их нет
    await Playlist.sync();
    await Track.sync();
    await User.sync();

    console.log('All models synced with database.');


await Playlist.bulkCreate([{ name: 'Playlist 1' }, { name: 'Playlist 2' }]);
await Track.bulkCreate([{ name: 'Track 1' }, { name: 'Track 2' }]);

    res.send('Hello from Spotify API!');
  } catch (error) {
    console.error('Error occurred while syncing models:', error);
    res.status(500).send('Internal Server Error');
  }
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
