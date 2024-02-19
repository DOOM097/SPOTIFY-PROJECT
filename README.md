ДОКУМЕНТАЦИЯ ПРОЕКТА SPOTIFY_API

1) Скачайте проекта из GITHUB -> "github.com/DOOM097/SPOTIFY-PROJECT"
2) Установите и включите XXAMP(https://www.apachefriends.org/) -> включите Apache и MySql.
    - Откройте в браузере "http://localhost/phpmyadmin"
    - Создайте базу данных " CREATE DATABASE spotiy_api "
    - Импортируйте файл из "config\spotify_api.sql"
3) Запустите VS code
    - Сверху выбираем "File -> Open Folder -> и выбираем папку проекта (обычно Downloads)".
    - Сверху выбираем "Terminal -> New Terminal".
    - Выполняем команду "npm i", ожидаем загрузку.
    - Выполняем комманду "node index.js".
    - При успешом выполнении, в терминале должно вывести: " SERVER IS RUNNING 3000, Swagger-autogen:  Success ".
    - Переходим в браузер
    - В адресной строке прописываем "localhost:3000/api-docs"
    - Готово, теперь вы можете увидеть все запросы GET POST PUT DELETE.
  
      
АДМИНКА: 
  {
  "username": "admin",
  "email": "admin@example.com",
  "password": "123"
  }
