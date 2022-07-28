-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 11, 2022 at 11:24 PM
-- Server version: 8.0.17
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `website`
--

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `user1_email` varchar(200) NOT NULL,
  `body` text NOT NULL,
  `user2_email` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`user1_email`, `body`, `user2_email`) VALUES
('sara@gmail.com', 'gamed', 'ayat@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `normal_user`
--

CREATE TABLE `normal_user` (
  `normal_email` varchar(200) NOT NULL,
  `bio` text NOT NULL,
  `info` text NOT NULL,
  `skills` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `normal_user`
--

INSERT INTO `normal_user` (`normal_email`, `bio`, `info`, `skills`) VALUES
('ayat@gmail.com', 'swimmer', 'sw ', 'playing , gaming , lamp'),
('sara@gmail.com', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `body` text NOT NULL,
  `image` text,
  `like_counter` int(11) NOT NULL,
  `owner_email` varchar(200) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `body`, `image`, `like_counter`, `owner_email`, `status`) VALUES
(1, 'helloooo', NULL, 1, 'ayat@gmail.com', ''),
(2, 'i am here', NULL, 1, 'ayat@gmail.com', ''),
(3, '', 'IMG-61de0482237027.69147815.jpg', 1, 'ayat@gmail.com', ''),
(6, 'alooooo', NULL, 0, 'ayat@gmail.com', 'private'),
(7, 'new post :)', NULL, 1, 'ayat@gmail.com', 'Friends of friends'),
(9, 'hii', 'IMG-61de1083e613d8.83511183.jpg', 0, 'sara@gmail.com', 'private'),
(10, 'kefyy kda !!', NULL, 0, 'nada@gmail.com', 'Friends of friends');

-- --------------------------------------------------------

--
-- Table structure for table `post_comments`
--

CREATE TABLE `post_comments` (
  `id` int(11) NOT NULL,
  `user_email` varchar(200) NOT NULL,
  `post_id` int(11) NOT NULL,
  `body` text NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `post_comments`
--

INSERT INTO `post_comments` (`id`, `user_email`, `post_id`, `body`, `date`) VALUES
(1, 'ayat@gmail.com', 2, 'gamed', '2022-01-10');

-- --------------------------------------------------------

--
-- Table structure for table `post_likes`
--

CREATE TABLE `post_likes` (
  `user_email` varchar(200) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `post_likes`
--

INSERT INTO `post_likes` (`user_email`, `post_id`) VALUES
('ayat@gmail.com', 1),
('ayat@gmail.com', 2),
('sara@gmail.com', 3),
('sara@gmail.com', 7);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `name` text NOT NULL,
  `dob` date NOT NULL,
  `profile_picture` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`email`, `password`, `name`, `dob`, `profile_picture`) VALUES
('ali@gmail.com', 'a12345678', 'ali', '2022-01-19', 'default.jpg'),
('ayat@gmail.com', 'a12345678', 'ayat', '2022-01-13', 'IMG-61dcc7ea6dea64.02298789.jpg'),
('hamada@gmail.com', 'h1234567h12345', 'hamada', '2022-01-13', 'default.jpg'),
('mark@gmail.com', 'm12345678', 'mark', '2022-01-20', 'default.jpg'),
('nada@gmail.com', 'n12345678', 'nada', '2022-01-22', 'IMG-61de10e141f570.57837162.jpg'),
('omar@gmail.com', 'o12345678', 'omar', '2021-12-29', 'default.jpg'),
('sara@gmail.com', 's12345678', 'sara', '2022-01-14', 'IMG-61de1069449a21.12146546.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`user2_email`,`user1_email`),
  ADD KEY `fkIdx_57` (`user1_email`),
  ADD KEY `fkIdx_60` (`user2_email`);

--
-- Indexes for table `normal_user`
--
ALTER TABLE `normal_user`
  ADD PRIMARY KEY (`normal_email`),
  ADD KEY `fkIdx_65` (`normal_email`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkIdx_21` (`owner_email`);

--
-- Indexes for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkIdx_35` (`user_email`),
  ADD KEY `fkIdx_38` (`post_id`);

--
-- Indexes for table `post_likes`
--
ALTER TABLE `post_likes`
  ADD PRIMARY KEY (`user_email`,`post_id`),
  ADD KEY `fkIdx_44` (`user_email`),
  ADD KEY `fkIdx_47` (`post_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `FK_user1_email` FOREIGN KEY (`user1_email`) REFERENCES `user` (`email`),
  ADD CONSTRAINT `FK_user2_email` FOREIGN KEY (`user2_email`) REFERENCES `user` (`email`);

--
-- Constraints for table `normal_user`
--
ALTER TABLE `normal_user`
  ADD CONSTRAINT `FK_normal_user_email` FOREIGN KEY (`normal_email`) REFERENCES `user` (`email`);

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `FK_owner_email` FOREIGN KEY (`owner_email`) REFERENCES `user` (`email`);

--
-- Constraints for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD CONSTRAINT `FK_commenter_email` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`),
  ADD CONSTRAINT `FK_comments_post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`);

--
-- Constraints for table `post_likes`
--
ALTER TABLE `post_likes`
  ADD CONSTRAINT `FK_likes_post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  ADD CONSTRAINT `FK_user_email` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
