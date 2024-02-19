-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Фев 09 2024 г., 12:20
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
(1, 'Stews'),
(2, 'Comfort Food'),
(3, 'Soups'),
(4, 'Vegetables'),
(5, 'Pasta'),
(6, 'Italian'),
(7, 'Desserts'),
(8, 'Salads'),
(9, 'Breakfast'),
(10, 'Brunch'),
(11, 'Appetizers');

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
(1, 'Carrot Cream Soup', '2024-02-09', 'https://example.com/carrot_soup.jpg', 'A creamy and aromatic soup made from fresh carrots, with a hint of ginger and butter.'),
(2, 'Spaghetti Bolognese', '2024-02-09', 'https://example.com/spaghetti_bolognese.jpg', 'A hearty Italian dish featuring al dente spaghetti noodles topped with a rich and savory Bolognese sauce.'),
(3, 'Chocolate Lava Cake', '2024-02-09', 'https://example.com/chocolate_lava_cake.jpg', 'Indulge in the decadence of molten chocolate encased in a warm, moist cake.'),
(4, 'Greek Salad', '2024-02-09', 'https://example.com/greek_salad.jpg', 'A light and fresh salad bursting with Mediterranean flavors.'),
(5, 'French Toast', '2024-02-09', 'https://example.com/french_toast.jpg', 'A delightful breakfast treat made from slices of bread soaked in a mixture of eggs and milk, then fried to golden perfection.'),
(6, 'Caprese Salad', '2024-02-09', 'https://example.com/caprese_salad.jpg', 'A simple yet elegant salad featuring fresh tomatoes, mozzarella cheese, basil leaves, and a drizzle of balsamic glaze.'),
(7, 'Beef Stew', '2024-02-09', 'https://example.com/beef_stew.jpg', 'A rich and flavorful stew made with tender chunks of beef, carrots, potatoes, and onions, simmered in a savory broth.');

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
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `name`) VALUES
(1, 'apple'),
(2, 'Carrot'),
(3, 'Onion'),
(4, 'Potato'),
(5, 'Ginger'),
(6, 'Butter'),
(7, 'Salt'),
(8, 'Pepper'),
(9, 'Water'),
(10, 'Cream'),
(11, 'Spaghetti'),
(12, 'Ground beef'),
(13, 'Tomatoes'),
(14, 'Garlic'),
(15, 'Balsamic glaze'),
(16, 'Celery'),
(17, 'Red wine'),
(18, 'Olive oil'),
(19, 'Parmesan cheese'),
(20, 'Dark chocolate'),
(21, 'Sugar'),
(22, 'Eggs'),
(23, 'Flour'),
(24, 'Vanilla extract'),
(25, 'Cucumber'),
(26, 'Red onion'),
(27, 'Feta cheese'),
(28, 'Kalamata olives'),
(29, 'Extra virgin olive oil'),
(30, 'Red wine vinegar'),
(31, 'Dried oregano'),
(32, 'Black pepper'),
(33, 'Bread slices'),
(34, 'Milk'),
(35, 'Cinnamon'),
(36, 'Maple syrup'),
(37, 'Fresh berries'),
(38, 'Fresh mozzarella cheese'),
(39, 'Fresh basil leaves'),
(40, 'Beef stew meat'),
(41, 'Carrots'),
(42, 'Potatoes'),
(43, 'Garlic cloves'),
(44, 'Beef broth'),
(45, 'Tomato paste'),
(46, 'Worcestershire sauce'),
(47, 'Bay leaves');

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
(0, 'an11y', 'any', '$2b$10$x5rlBeBttY59eqD0HzVPju.viiblFmfSZeMueDAYge/pWqjKq4rIW'),
(2, 'kikгы', 'kikгы@gmail.com', '$2b$10$.voEA0qIcdnkqZOy2x1YZuLq5MkHwg65QO0qZ.IvBZKhfQ6wruG8.'),
(4, 'n', 'n@example.com', '$2b$10$A8XKo.reKpv0lI/w06POwuYPLRGkIMk6ZElgUinpYUNqrrHE0dCPy'),
(5, 'an', 'an@example.com', '$2b$10$A/NcI3CXc2J0FqDDeiPUAOxuTmAx4JWIjG30hKp4rjdJ9UFjUGVrO'),
(6, 'ana', 'ana@example.com', '$2b$10$fGQY0Ad2RD9dlrYlyehipOyPrLsTR5Q.CeVmT4bf40LnoXoDLOaRu'),
(7, 'nana', 'nana@example.com', '$2b$10$/7NgRd7Db0c7DluiBNQVe.zBS73kB.Blc2tSSXkYvKEoDN5TYqqcG'),
(8, 'justuser', 'bj@example.com', '$2b$10$qKzSKBNKodhtXq/.xP6eFuTOc0DRELomjvQK3FUB8GtIC0JNUdFTi'),
(9, 'admin', 'admin@example.com', '$2b$10$ZoizTReCHFsRsAulx2kes.2ghGhbZRNJhew2bZCBDYnQjqA0axVp6'),
(10, 'mynew crrrect', 'user@example.com', '$2b$10$mUurYXFSutLHkuV7avvcOemM24twh9U2d6WGc/46/PSMCqYkbnMkO'),
(11, 'us', 'us@example.com', '$2b$10$hDs85jbjduYm6cONGaMhhe0uH27kG5cLDNO67BAI3h2juiHb.M3E2'),
(12, 'any', 'a12ny', '$2b$10$4mwx9j0StnyOPMSulJjlM.Nwyh2aT9kY7lXeIZqG0ul7yfuV/yPHi'),
(13, 'niki', 'niki@gmail.com', '$2b$10$rxmFxYJWqwWPwEjuEsFs6uxEr4tvFpPVDxz7GfIEY2yT5h19OaNyS'),
(14, 'nkn', 'n15k@gmail.com', '$2b$10$TpaGmvXUi1qulqz3u27JY.XST8vdE8Q9NPLFlg1Xe3mAuctTPN0Le'),
(15, 'nikitot', 'nk@gmail.com', '$2b$10$feZqLzvO5uVZZWXzE3M3IOmV9xhI5RthL0kTucneDymTx/vbbUEAe'),
(16, 'anyrol', 'any@gmail.com', '$2b$10$3qVWlaHSjNbMHbsLb84KKOqT3iTXcepHEyj/cgcIVWRGMtWd8VKKC'),
(17, 'popi', 'popi@gmail.com', '$2b$10$1cxn3vIO9fUi9snqjAID4e5BaipiyGwms3fxwhwuRDVoZxMemqf82'),
(18, 'nusi', 'nusi@ivkhk.ee', '$2b$10$PCYrJxF2aVH2wGzkPG4TneRK08KedTbnEaf5deJyAsmRsEJHmrpb6'),
(19, 'user55', 'user55@gmail.com', '$2b$10$Yn2HX5a9Tzl8Ji.GylyQV.cPrRV75TfJVxDXgJn5HYScGCUGCcH0O');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `food`
--
ALTER TABLE `food`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
