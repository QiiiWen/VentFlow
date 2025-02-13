-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 11, 2025 at 01:26 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ventflow`
--

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `location` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `organizer` varchar(255) NOT NULL,
  `price` decimal(10,2) DEFAULT 0.00,
  `attendees_limit` int(11) DEFAULT 0,
  `icon` varchar(255) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `status` enum('upcoming','ongoing','past') DEFAULT 'upcoming',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `name`, `date`, `location`, `description`, `organizer`, `price`, `attendees_limit`, `icon`, `banner`, `status`, `created_at`, `updated_at`, `latitude`, `longitude`) VALUES
(1, 'Electro Music Festival', '2024-05-29 18:00:00', 'Kuala Lumpur, Malaysia', 'Join the best music festival of the year!', 'Music Inc.', 42.00, 5000, 'test.jpg', 'test.jpg', 'upcoming', '2025-02-09 17:35:03', '2025-02-09 19:12:24', 3.13900000, 101.68690000),
(2, 'Marketing: The Event Life Cycle', '2024-06-24 10:00:00', 'Kuala Lumpur, Malaysia', 'Learn about marketing strategies from top experts.', 'Marketing Pro', 25.00, 300, 'test.jpg', 'test.jpg', 'upcoming', '2025-02-09 17:35:03', '2025-02-09 19:12:24', 3.13900000, 101.68690000),
(3, 'Journey into AI', '2025-07-15 09:30:00', 'Singapore', 'Explore the future of AI and machine learning with industry experts.', 'Tech AI Hub', 35.50, 200, 'test.jpg', 'test.jpg', 'upcoming', '2025-02-09 17:35:03', '2025-02-09 19:12:24', 1.35210000, 103.81980000),
(4, 'Stress Management Workshop', '2024-08-20 14:00:00', 'Singapore', 'Discover techniques to manage stress effectively in your daily life.', 'Health & Wellness', 18.00, 100, 'test.jpg', 'test.jpg', 'upcoming', '2025-02-09 17:35:03', '2025-02-09 19:12:24', 1.35210000, 103.81980000),
(5, 'Startup Growth Conference', '2024-09-05 13:00:00', 'Jakarta, Indonesia', 'Learn how to scale your startup with proven strategies.', 'Startup World', 50.00, 500, 'test.jpg', 'test.jpg', 'upcoming', '2025-02-09 17:35:03', '2025-02-09 19:12:24', -6.20880000, 106.84560000),
(6, 'Cybersecurity Summit 2024', '2024-10-10 08:45:00', 'Bangkok, Thailand', 'Understand the latest trends in cybersecurity and data protection.', 'CyberSecure', 65.00, 1000, 'test.jpg', 'test.jpg', 'upcoming', '2025-02-09 17:35:03', '2025-02-09 19:12:24', 13.75630000, 100.50180000),
(7, 'Game Developers Meetup', '2024-11-14 15:00:00', 'Manila, Philippines', 'Meet game developers and explore the gaming industry.', 'Indie Game Devs', 30.00, 150, 'test.jpg', 'test.jpg', 'upcoming', '2025-02-09 17:35:03', '2025-02-09 19:12:24', 14.59950000, 120.98420000),
(8, 'Blockchain & Crypto Summit', '2024-12-02 11:00:00', 'Hong Kong', 'Deep dive into blockchain, NFTs, and the future of crypto.', 'CryptoX', 55.00, 400, 'test.jpg', 'test.jpg', 'upcoming', '2025-02-09 17:35:03', '2025-02-09 19:12:24', 22.31930000, 114.16940000),
(9, 'Fitness & Wellness Expo', '2025-01-10 12:00:00', 'Dubai, UAE', 'Explore new fitness trends and health technologies.', 'FitLife', 20.00, 800, 'test.jpg', 'test.jpg', 'upcoming', '2025-02-09 17:35:03', '2025-02-09 19:12:24', 25.27698700, 55.29624900),
(10, 'Smart Cities Innovation Forum', '2025-02-20 09:00:00', 'Tokyo, Japan', 'Discuss smart city solutions and urban innovation.', 'SmartWorld', 60.00, 600, 'test.jpg', 'test.jpg', 'upcoming', '2025-02-09 17:35:03', '2025-02-09 19:12:24', 35.68950000, 139.69170000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
