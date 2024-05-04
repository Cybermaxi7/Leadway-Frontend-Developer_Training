-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 24, 2024 at 07:57 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `music_streaming_service`
--

-- --------------------------------------------------------

--
-- Table structure for table `albums`
--

CREATE TABLE `albums` (
  `album_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `release_year` int(11) DEFAULT NULL,
  `cover_image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `albums`
--

INSERT INTO `albums` (`album_id`, `title`, `artist_id`, `release_year`, `cover_image_url`) VALUES
(1, 'Abbey Road', 1, 1969, 'https://...'),
(2, 'Thriller', 2, 1982, 'https://...'),
(3, 'A Night at the Opera', 3, 1975, 'https://...'),
(4, 'The Marshall Mathers LP', 4, 1999, 'https://...'),
(5, 'Lemonade', 5, 2016, 'https://...'),
(6, 'Beethoven\'s 5th Symphony', 6, 1808, 'https://...'),
(7, 'Back in Black', 7, 1980, 'https://...'),
(8, 'Map of the Soul: 7', 8, 2020, 'https://...'),
(9, 'Folklore', 9, 2020, 'https://...'),
(10, 'Are You Experienced', 10, 1967, 'https://...');

-- --------------------------------------------------------

--
-- Table structure for table `artists`
--

CREATE TABLE `artists` (
  `artist_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `artists`
--

INSERT INTO `artists` (`artist_id`, `name`, `genre`, `bio`, `image_url`) VALUES
(1, 'The Beatles', 'Rock', 'A legendary British rock band', NULL),
(2, 'Michael Jackson', 'Pop', 'The King of Pop', NULL),
(3, 'Queen', 'Rock', 'British rock band known for their anthemic songs', NULL),
(4, 'Eminem', 'Hip Hop', 'One of the most influential rappers of all time', NULL),
(5, 'Beyoncé', 'Pop, R&B', 'Award-winning singer, songwriter, and performer', NULL),
(6, 'Ludwig van Beethoven', 'Classical', 'Renowned German composer', NULL),
(7, 'AC/DC', 'Rock', 'Australian rock band known for their high-energy performances', NULL),
(8, 'BTS', 'K-Pop', 'Popular South Korean boy band', NULL),
(9, 'Taylor Swift', 'Pop, Country', 'Award-winning singer-songwriter', NULL),
(10, 'Jimi Hendrix', 'Rock, Blues', 'A highly influential guitarist and songwriter', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `playlists`
--

CREATE TABLE `playlists` (
  `playlist_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `playlists`
--

INSERT INTO `playlists` (`playlist_id`, `user_id`, `name`, `description`) VALUES
(21, 1, 'My Favorite Beatles', 'A collection of classic Beatles hits'),
(22, 2, 'Dance Party', 'Upbeat songs to get you moving'),
(23, 3, 'Hip Hop Throwback', 'Classic hip hop tracks'),
(24, 4, 'K-Pop Favorites', 'A mix of popular Korean artists'),
(25, 5, 'Chill Vibes', 'Relaxing and mellow tunes'),
(26, 6, 'user6_playlist', 'Playlist created by user6'),
(27, 7, 'user7_playlist', 'Playlist created by user7'),
(28, 8, 'user8_playlist', 'Playlist created by user8'),
(29, 9, 'user9_playlist', 'Playlist created by user9'),
(30, 10, 'user10_playlist', 'Playlist created by user10');

-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

CREATE TABLE `songs` (
  `song_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `album_id` int(11) DEFAULT NULL,
  `artist_id` int(11) NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `audio_file` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `songs`
--

INSERT INTO `songs` (`song_id`, `title`, `album_id`, `artist_id`, `duration`, `audio_file`) VALUES
(1, 'Hey Jude', 1, 1, 221, NULL),
(2, 'Billie Jean', 2, 2, 302, NULL),
(3, 'Bohemian Rhapsody', 3, 3, 555, NULL),
(4, 'Stan', 4, 4, 340, NULL),
(5, 'Formation', 5, 5, 306, NULL),
(6, 'Für Elise', NULL, 6, 195, NULL),
(7, 'Back in Black', 7, 7, 202, NULL),
(8, 'Dynamite', 8, 8, 180, NULL),
(9, 'cardigan', 9, 9, 242, NULL),
(10, 'Purple Haze', NULL, 10, 240, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `subscription_type` varchar(255) DEFAULT NULL,
  `joined_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `subscription_type`, `joined_date`) VALUES
(1, 'user1', 'user1@example.com', 'HASHED_PASSWORD', 'Free', '2024-04-18'),
(2, 'user2', 'user2@example.com', 'HASHED_PASSWORD', 'Premium', '2024-04-17'),
(3, 'user3', 'user3@example.com', 'HASHED_PASSWORD', 'Free', '2024-04-16'),
(4, 'user4', 'user4@example.com', 'HASHED_PASSWORD', 'Premium', '2024-04-15'),
(5, 'user5', 'user5@example.com', 'HASHED_PASSWORD', 'Free', '2024-04-14'),
(6, 'user6', 'user6@example.com', 'HASHED_PASSWORD', 'Premium', '2024-04-13'),
(7, 'user7', 'user7@example.com', 'HASHED_PASSWORD', 'Free', '2024-04-12'),
(8, 'user8', 'user8@example.com', 'HASHED_PASSWORD', 'Free', '2024-04-12'),
(9, 'user9', 'user9@example.com', 'HASHED_PASSWORD', 'Premium', '2024-04-18'),
(10, 'user10', 'user10@example.com', 'HASHED_PASSWORD', 'Free', '2024-04-17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`album_id`),
  ADD KEY `artist_id` (`artist_id`);

--
-- Indexes for table `artists`
--
ALTER TABLE `artists`
  ADD PRIMARY KEY (`artist_id`);

--
-- Indexes for table `playlists`
--
ALTER TABLE `playlists`
  ADD PRIMARY KEY (`playlist_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`song_id`),
  ADD KEY `artist_id` (`artist_id`),
  ADD KEY `album_id` (`album_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `albums`
--
ALTER TABLE `albums`
  MODIFY `album_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `artists`
--
ALTER TABLE `artists`
  MODIFY `artist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `playlists`
--
ALTER TABLE `playlists`
  MODIFY `playlist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `songs`
--
ALTER TABLE `songs`
  MODIFY `song_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `albums`
--
ALTER TABLE `albums`
  ADD CONSTRAINT `albums_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`artist_id`);

--
-- Constraints for table `playlists`
--
ALTER TABLE `playlists`
  ADD CONSTRAINT `playlists_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `songs`
--
ALTER TABLE `songs`
  ADD CONSTRAINT `songs_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`artist_id`),
  ADD CONSTRAINT `songs_ibfk_2` FOREIGN KEY (`album_id`) REFERENCES `albums` (`album_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
