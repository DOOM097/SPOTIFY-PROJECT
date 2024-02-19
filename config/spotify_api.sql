-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Час створення: Лют 19 2024 р., 13:18
-- Версія сервера: 10.4.28-MariaDB
-- Версія PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `spotify_api`
--

-- --------------------------------------------------------

--
-- Структура таблиці `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'BestMusicEesti'),
(2, 'BestMusicUkraine'),
(3, 'BestMusicUganda'),
(4, 'BestMusicUSA'),
(5, 'BestMusicToronto'),
(6, 'BestMusicItalia'),
(7, 'BestMusicSpain'),
(8, 'BestMusicFranch'),
(9, 'BestMusicGreece'),
(10, 'BestMusicLivan'),
(11, 'BestMusicIran');

-- --------------------------------------------------------

--
-- Структура таблиці `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `foodId` int(11) NOT NULL,
  `commentText` text NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `food`
--

CREATE TABLE `food` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `publishedDate` date DEFAULT NULL,
  `thumbnailUrl` varchar(255) DEFAULT NULL,
  `shortDescription` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `food`
--

INSERT INTO `food` (`id`, `title`, `publishedDate`, `thumbnailUrl`, `shortDescription`) VALUES
(1, 'Song Title 1', '2024-02-19', 'https://yourwebsite.com/music/song1.mp3', 'Short description for song 1'),
(2, 'Song Title 2', '2024-02-20', 'https://yourwebsite.com/music/song2.mp3', 'Short description for song 2'),
(3, 'Song Title 3', '2024-02-21', 'https://yourwebsite.com/music/song3.mp3', 'Short description for song 3'),
(4, 'Song Title 4', '2024-02-22', 'https://yourwebsite.com/music/song4.mp3', 'Short description for song 4'),
(5, 'Song Title 5', '2024-02-23', 'https://yourwebsite.com/music/song5.mp3', 'Short description for song 5'),
(6, 'Song Title 6', '2024-02-24', 'https://yourwebsite.com/music/song6.mp3', 'Short description for song 6'),
(7, 'Song Title 7', '2024-02-25', 'https://yourwebsite.com/music/song7.mp3', 'Short description for song 7'),
(8, 'Song Title 8', '2024-02-26', 'https://yourwebsite.com/music/song8.mp3', 'Short description for song 8'),
(10, 'Song Title 10', '2024-02-28', 'https://yourwebsite.com/music/song10.mp3', 'Short description for song 10');

-- --------------------------------------------------------

--
-- Структура таблиці `foodcategory`
--

CREATE TABLE `foodcategory` (
  `FoodId` int(11) NOT NULL,
  `CategoryId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `foodcategory`
--

INSERT INTO `foodcategory` (`FoodId`, `CategoryId`) VALUES
(1, 3),
(1, 4),
(2, 5),
(2, 6),
(3, 7),
(4, 8),
(5, 9),
(5, 10),
(6, 6),
(6, 8),
(6, 11),
(7, 1),
(7, 2);

-- --------------------------------------------------------

--
-- Структура таблиці `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `recipe`
--

CREATE TABLE `recipe` (
  `FoodId` int(11) NOT NULL,
  `ProductId` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `roles`
--

CREATE TABLE `roles` (
  `RoleID` int(11) NOT NULL,
  `RoleName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `roles`
--

INSERT INTO `roles` (`RoleID`, `RoleName`) VALUES
(1, 'user'),
(2, 'admin');

-- --------------------------------------------------------

--
-- Структура таблиці `userroles`
--

CREATE TABLE `userroles` (
  `UserRoleID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `RoleID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `userroles`
--

INSERT INTO `userroles` (`UserRoleID`, `UserID`, `RoleID`) VALUES
(2, 4, 1),
(3, 5, 1),
(4, 6, 1),
(5, 7, 2),
(6, 8, 1),
(7, 9, 2),
(8, 10, 1),
(9, 11, 1),
(0, 12, 1),
(0, 13, 1),
(0, 14, 1),
(0, 15, 1),
(0, 16, 1),
(0, 17, 1),
(0, 18, 1),
(0, 19, 1);

-- --------------------------------------------------------

--
-- Структура таблиці `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `UserName` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `PasswordHash` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `users`
--

INSERT INTO `users` (`UserID`, `UserName`, `Email`, `PasswordHash`) VALUES
(0, 'an11y', 'any', '$2b$10$x5rlBeBttY59eqD0HzVPju.viiblFmfSZeMueDAYge/pWqjKq4rIW'),
(7, 'nana', 'nana@example.com', '$2b$10$/7NgRd7Db0c7DluiBNQVe.zBS73kB.Blc2tSSXkYvKEoDN5TYqqcG'),
(8, 'justuser', 'bj@example.com', '$2b$10$qKzSKBNKodhtXq/.xP6eFuTOc0DRELomjvQK3FUB8GtIC0JNUdFTi'),
(9, 'admin', 'admin@example.com', '$2b$10$ZoizTReCHFsRsAulx2kes.2ghGhbZRNJhew2bZCBDYnQjqA0axVp6'),
(15, 'nikitot', 'nk@gmail.com', '$2b$10$feZqLzvO5uVZZWXzE3M3IOmV9xhI5RthL0kTucneDymTx/vbbUEAe'),
(17, 'popi', 'popi@gmail.com', '$2b$10$1cxn3vIO9fUi9snqjAID4e5BaipiyGwms3fxwhwuRDVoZxMemqf82');

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `foodId` (`foodId`);

--
-- Індекси таблиці `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `foodcategory`
--
ALTER TABLE `foodcategory`
  ADD PRIMARY KEY (`FoodId`,`CategoryId`),
  ADD KEY `CategoryId` (`CategoryId`);

--
-- Індекси таблиці `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`FoodId`,`ProductId`),
  ADD KEY `AuthorId` (`ProductId`);

--
-- Індекси таблиці `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблиці `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `food`
--
ALTER TABLE `food`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблиці `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`UserID`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`foodId`) REFERENCES `food` (`id`);

--
-- Обмеження зовнішнього ключа таблиці `foodcategory`
--
ALTER TABLE `foodcategory`
  ADD CONSTRAINT `foodcategory_ibfk_1` FOREIGN KEY (`FoodId`) REFERENCES `food` (`id`),
  ADD CONSTRAINT `foodcategory_ibfk_2` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`);

--
-- Обмеження зовнішнього ключа таблиці `recipe`
--
ALTER TABLE `recipe`
  ADD CONSTRAINT `recipe_ibfk_1` FOREIGN KEY (`FoodId`) REFERENCES `food` (`id`),
  ADD CONSTRAINT `recipe_ibfk_2` FOREIGN KEY (`ProductId`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
