-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 10, 2018 at 02:44 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr10_mahtab_nahayati_biglibrary`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `id` int(10) NOT NULL,
  `name` varchar(55) NOT NULL,
  `last_name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`id`, `name`, `last_name`) VALUES
(1, 'Emily', 'Key'),
(2, 'Dan ', 'Brown'),
(3, 'Nuval', 'Harari'),
(4, 'Anna', 'Johansen'),
(5, 'Jean-luc', 'Bannalec'),
(6, 'Dorte ', 'Hansen'),
(7, 'Ed', 'sheeran'),
(8, 'Franz', 'Schuier'),
(9, 'Jojo', 'Moyes'),
(10, 'John', 'Green');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `short_desc` varchar(1000) NOT NULL,
  `isbn` varchar(55) NOT NULL,
  `type` enum('Book','DVD','CD') NOT NULL,
  `status` enum('reserved','available') NOT NULL,
  `fk_author_id` int(10) NOT NULL,
  `fk_publisher_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `title`, `image_url`, `short_desc`, `isbn`, `type`, `status`, `fk_author_id`, `fk_publisher_id`) VALUES
(1, 'Whiskey on the Rocks', 'img/book1.jpg', 'Es ist wohl etwas wahres daran,dass man sich stets zweimal im leben sieht....', '213-45-78-34', 'Book', 'available', 1, 1),
(2, 'Origin', 'img/book2.jpg', 'Wir mussen breit sein,uns von dem leben zu losen.......', '234-67-59-543', 'Book', 'available', 2, 2),
(3, 'Harari', 'img/book3.jpg', 'Geschischte der Menschheit.....', '345-78-112-89', 'Book', 'available', 3, 3),
(4, 'Das Madchen am Strand', 'img/book4.jpg', 'Hauptkommisarin lena lorenz begleitet die grosse angelegt....', '978-1-503-90144-5', 'Book', 'available', 4, 4),
(5, 'Bretonisches leuchten', 'img/dvd1.jpg', 'Bretonische Ferien und ein perfide ....', '546-56-98-234-5', 'CD', 'available', 5, 5),
(6, 'Altes land', 'img/dvd2.jpg', 'Das polackenkind ist die funfzigjahrige.....', '344-543-67-87', 'DVD', 'available', 6, 6),
(7, 'Divide', 'img/cd1.jpg', 'gh hihui  hi huih gyui ', '321-11-675-32', 'DVD', 'available', 7, 7),
(8, 'Leichter lernen', 'img/cd2.jpg', 'Entspannungsmusic fur kinder', '324-11-567-44', 'CD', 'available', 8, 8),
(9, 'Ein ganzes halbes jahr', 'img/dvd3.jpg', 'gyuw  hui uighuigd ', '324-66-123-98', 'DVD', 'available', 9, 9),
(10, 'Das schicksal ist ein mieser Verrater', 'img/dvd4.jpg', 'uih gyugui gu huibu uib ', '876-333-098-11', 'DVD', 'available', 10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `id` int(10) NOT NULL,
  `pub-name` varchar(55) NOT NULL,
  `address` varchar(255) NOT NULL,
  `size` enum('small','medium','big') NOT NULL,
  `fk_media_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`id`, `pub-name`, `address`, `size`, `fk_media_id`) VALUES
(1, 'A.P.P', 'neu street', 'small', 0),
(2, 'CPI', 'er street nien', 'medium', 0),
(3, 'Pantheon', 'fdde street', 'big', 0),
(4, 'Lutz Garnies', 'gdinbf street', 'big', 0),
(5, 'TT', 'gyuv streeet', 'medium', 0),
(6, 'Penguin', 'dstreet', 'small', 0),
(7, 'S.a.r.l', 'gff street', 'big', 0),
(8, 'GG', 'kshd stret', 'medium', 0),
(9, 'rowohlt', 'hdgs street', 'big', 0),
(10, 'plasma', 'ishf street', 'medium', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(55) NOT NULL,
  `last_name` varchar(55) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_author_id` (`fk_author_id`),
  ADD KEY `fk_publisher_id` (`fk_publisher_id`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `publisher`
--
ALTER TABLE `publisher`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_ibfk_1` FOREIGN KEY (`fk_author_id`) REFERENCES `author` (`id`),
  ADD CONSTRAINT `media_ibfk_2` FOREIGN KEY (`fk_publisher_id`) REFERENCES `publisher` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
