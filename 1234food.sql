-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Фев 19 2024 г., 11:58
-- Версия сервера: 10.4.18-MariaDB
-- Версия PHP: 7.4.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `food`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'ThebestmusicEstonia'),
(2, 'ThebestmusicUkraine'),
(3, 'ThebestmusicSpain'),
(4, 'ThebestmusicGreece'),
(5, 'ThebestmusicUSA'),
(6, 'ThebestmusicUganda');

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `foodId` int(11) NOT NULL,
  `commentText` text NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `food`
--

CREATE TABLE `food` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `publishedDate` date DEFAULT NULL,
  `thumbnailUrl` varchar(255) DEFAULT NULL,
  `shortDescription` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `food`
--

INSERT INTO `food` (`id`, `title`, `publishedDate`, `thumbnailUrl`, `shortDescription`) VALUES
(1, 'Song 1', '2022-01-01', 'https://example.com/song1.mp3', 'Short description for Song'),
(2, 'Song 2', '2022-02-01', 'https://example.com/song2.mp3', 'Short description for Song '),
(3, 'Song 3', '2022-03-01', 'https://example.com/song3.mp3', 'Short description for Song '),
(4, 'Song 4', '2022-04-01', 'https://example.com/song4.mp3', 'Short description for Song '),
(5, 'Song 5', '2022-05-01', 'https://example.com/song5.mp3', 'Short description for Song '),
(6, 'Song 6', '2022-06-01', 'https://example.com/song6.mp3', 'Short description for Song '),
(7, 'Song 7', '2022-07-01', 'https://example.com/song7.mp3', 'Short description for Song '),
(8, 'Song 8', '2022-08-01', 'https://example.com/song8.mp3', 'Short description for Song '),
(9, 'Song 9', '2022-09-01', 'https://example.com/song9.mp3', 'Short description for Song '),
(10, 'Song 10', '2022-10-01', 'https://example.com/song10.mp3', 'Short description for Song 10');

-- --------------------------------------------------------

--
-- Структура таблицы `foodcategory`
--

CREATE TABLE `foodcategory` (
  `FoodId` int(11) NOT NULL,
  `CategoryId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `foodcategory`
--

INSERT INTO `foodcategory` (`FoodId`, `CategoryId`) VALUES
(1, 3),
(1, 4),
(2, 5),
(2, 6),
(6, 6),
(7, 1),
(7, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `recipe`
--

CREATE TABLE `recipe` (
  `FoodId` int(11) NOT NULL,
  `ProductId` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `recipe`
--

INSERT INTO `recipe` (`FoodId`, `ProductId`, `quantity`, `unit`) VALUES
(1, 2, 500, 'grams'),
(1, 3, 1, 'piece'),
(1, 4, 200, 'grams'),
(1, 5, 20, 'grams'),
(1, 6, 50, 'grams'),
(1, 7, 5, 'grams'),
(1, 8, 2, 'grams'),
(1, 9, 750, 'milliliters'),
(1, 10, 100, 'milliliters'),
(2, 3, 1, 'piece'),
(2, 7, 5, 'grams'),
(2, 8, 2, 'grams'),
(2, 11, 300, 'grams'),
(2, 12, 250, 'grams'),
(2, 13, 400, 'grams'),
(2, 14, 2, 'cloves'),
(2, 15, 1, 'piece'),
(2, 16, 1, 'stalk'),
(2, 17, 100, 'milliliters'),
(2, 18, 2, 'tablespoons'),
(2, 19, 30, 'grams'),
(3, 6, 100, 'grams'),
(3, 7, 2, 'grams'),
(3, 20, 150, 'grams'),
(3, 21, 100, 'grams'),
(3, 22, 2, 'pieces'),
(3, 23, 50, 'grams'),
(3, 24, 1, 'teaspoon'),
(4, 7, 3, 'grams'),
(4, 13, 2, 'pieces'),
(4, 25, 1, 'piece'),
(4, 26, 1, 'piece'),
(4, 27, 100, 'grams'),
(4, 28, 50, 'grams'),
(4, 29, 2, 'tablespoons'),
(4, 30, 1, 'tablespoon'),
(4, 31, 1, 'teaspoon'),
(4, 32, 2, 'grams'),
(5, 6, 2, 'tablespoons'),
(5, 22, 2, 'pieces'),
(5, 24, 1, 'teaspoon'),
(5, 33, 4, 'pieces'),
(5, 34, 100, 'milliliters'),
(5, 35, 1, 'teaspoon'),
(5, 36, 50, 'milliliters'),
(5, 37, 50, 'grams'),
(6, 7, 2, 'grams'),
(6, 13, 2, 'pieces'),
(6, 15, 1, 'tablespoon'),
(6, 29, 1, 'tablespoon'),
(6, 32, 1, 'gram'),
(6, 38, 150, 'grams'),
(6, 39, 10, 'leaves'),
(7, 3, 1, 'piece'),
(7, 7, 3, 'grams'),
(7, 18, 2, 'tablespoons'),
(7, 23, 2, 'tablespoons'),
(7, 32, 2, 'grams'),
(7, 40, 500, 'grams'),
(7, 41, 2, 'pieces'),
(7, 42, 2, 'pieces'),
(7, 43, 2, 'pieces'),
(7, 44, 500, 'milliliters'),
(7, 45, 2, 'tablespoons'),
(7, 46, 1, 'tablespoon'),
(7, 47, 2, 'pieces');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `RoleID` int(11) NOT NULL,
  `RoleName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`RoleID`, `RoleName`) VALUES
(1, 'user'),
(2, 'admin');

-- --------------------------------------------------------

--
-- Структура таблицы `userroles`
--

CREATE TABLE `userroles` (
  `UserRoleID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `RoleID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `userroles`
--

INSERT INTO `userroles` (`UserRoleID`, `UserID`, `RoleID`) VALUES
(2, 4, 1),
(3, 5, 1),
(4, 6, 1),
(5, 7, 2),
(6, 8, 1),
(8, 10, 1),
(9, 11, 1),
(0, 12, 1),
(0, 13, 1),
(0, 14, 1),
(0, 15, 1),
(0, 16, 1),
(0, 17, 1),
(0, 18, 1),
(0, 19, 1),
(0, 20, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `UserName` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `PasswordHash` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`UserID`, `UserName`, `Email`, `PasswordHash`) VALUES
(2, 'kikгы', 'kikгы@gmail.com', '$2b$10$.voEA0qIcdnkqZOy2x1YZuLq5MkHwg65QO0qZ.IvBZKhfQ6wruG8.'),
(7, 'nana', 'nana@example.com', '$2b$10$/7NgRd7Db0c7DluiBNQVe.zBS73kB.Blc2tSSXkYvKEoDN5TYqqcG'),
(8, 'justuser', 'bj@example.com', '$2b$10$qKzSKBNKodhtXq/.xP6eFuTOc0DRELomjvQK3FUB8GtIC0JNUdFTi'),
(10, 'mynew crrrect', 'user@example.com', '$2b$10$mUurYXFSutLHkuV7avvcOemM24twh9U2d6WGc/46/PSMCqYkbnMkO'),
(11, 'us', 'us@example.com', '$2b$10$hDs85jbjduYm6cONGaMhhe0uH27kG5cLDNO67BAI3h2juiHb.M3E2'),
(20, 'Yevhenii', 'codliplay1998@gmail.com', '$2b$10$hM5j9BUDZ.OUw5WUyqeYkenZqQT9b6YERu2B/Pk620Ho5O67yO2Im');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `foodId` (`foodId`);

--
-- Индексы таблицы `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `foodcategory`
--
ALTER TABLE `foodcategory`
  ADD PRIMARY KEY (`FoodId`,`CategoryId`),
  ADD KEY `CategoryId` (`CategoryId`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`FoodId`,`ProductId`),
  ADD KEY `AuthorId` (`ProductId`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `food`
--
ALTER TABLE `food`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`UserID`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`foodId`) REFERENCES `food` (`id`);

--
-- Ограничения внешнего ключа таблицы `foodcategory`
--
ALTER TABLE `foodcategory`
  ADD CONSTRAINT `foodcategory_ibfk_1` FOREIGN KEY (`FoodId`) REFERENCES `food` (`id`),
  ADD CONSTRAINT `foodcategory_ibfk_2` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`);

--
-- Ограничения внешнего ключа таблицы `recipe`
--
ALTER TABLE `recipe`
  ADD CONSTRAINT `recipe_ibfk_1` FOREIGN KEY (`FoodId`) REFERENCES `food` (`id`),
  ADD CONSTRAINT `recipe_ibfk_2` FOREIGN KEY (`ProductId`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
