# restmvc
Документация проекта "База данных меню ресторана"
_______________________________________________________________________
Команда:
Никита Скороходов
_______________________________________________________________________
ERD (схема базы данных):

[def]: image.png
_______________________________________________________________________
Шаги для настройки и запуска проекта:

1.В XAMPP создайте базу данных с именем "food".
2.Импортируйте в неё файл "food.sql".
3.В терминале выполните команду npm i.
4.Запустите проект, введя в терминале node index.js.
5.Перейдите по ссылке http://localhost:3000/api-docs.
_______________________________________________________________________
Работа с API:

Создание нового пользователя:

register

Тело запроса:
{
  "username": "us",
  "email": "us@example.com",
  "password": "123"
}
Вход в аккаунт администратора:

signin

Тело запроса:
{
  "username": "admin",
  "email": "admin@example.com",
  "password": "123"
}
Пример создания блюда:

Тело запроса:
{
  "title": "Any Food",
  "publishedDate": "2024-01-15",
  "thumbnailUrl": "https://example.com/food.jpg",
  "shortDescription": "Description of the food",
  "products": [
    {"name": "Ingredient1", "quantity": 2, "unit": "grams"},
    {"name": "Ingredient2", "quantity": 3, "unit": "pieces"}
  ],
  "categories": ["Category1", "Category2"]
}



