-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2023 at 09:14 AM
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
-- Database: `healing`
--

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `id` int(10) UNSIGNED NOT NULL,
  `timer_id` int(10) UNSIGNED NOT NULL,
  `heal_spell_id` tinyint(3) UNSIGNED NOT NULL,
  `player_id` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `assignments`
--

INSERT INTO `assignments` (`id`, `timer_id`, `heal_spell_id`, `player_id`) VALUES
(1, 2, 1, 1),
(2, 4, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bosses`
--

CREATE TABLE `bosses` (
  `id` int(10) UNSIGNED NOT NULL,
  `raid_id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `bosses`
--

INSERT INTO `bosses` (`id`, `raid_id`, `name`) VALUES
(1, 3, 'Volcoross');

-- --------------------------------------------------------

--
-- Table structure for table `boss_abilities`
--

CREATE TABLE `boss_abilities` (
  `id` int(10) UNSIGNED NOT NULL,
  `boss_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `short_title` varchar(45) NOT NULL,
  `full_name` varchar(45) NOT NULL,
  `enemy_spell_id` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `boss_abilities`
--

INSERT INTO `boss_abilities` (`id`, `boss_id`, `short_title`, `full_name`, `enemy_spell_id`) VALUES
(1, 1, 'On pull', '-', '0'),
(2, 1, 'Fury AoE', 'Serpent\'s Fury', '421671'),
(3, 1, 'Big AoE Soak', 'Flood of the Firelands', '420929');

-- --------------------------------------------------------

--
-- Table structure for table `boss_timing`
--

CREATE TABLE `boss_timing` (
  `id` int(10) UNSIGNED NOT NULL,
  `ability_id` int(10) UNSIGNED NOT NULL,
  `stamp` varchar(5) NOT NULL,
  `order_id` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `boss_timing`
--

INSERT INTO `boss_timing` (`id`, `ability_id`, `stamp`, `order_id`) VALUES
(1, 1, '00:03', 1),
(2, 2, '00:12', 2),
(4, 2, '01:22', 4),
(3, 3, '01:15', 3);

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `name`) VALUES
(1, 'Akumai'),
(2, 'Solziege');

-- --------------------------------------------------------

--
-- Table structure for table `raids`
--

CREATE TABLE `raids` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `raids`
--

INSERT INTO `raids` (`id`, `title`) VALUES
(1, 'Vault of Incarnates'),
(2, 'Aberrus'),
(3, 'Amirdrassil');

-- --------------------------------------------------------

--
-- Table structure for table `spells`
--

CREATE TABLE `spells` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(20) NOT NULL,
  `friendly_spell_id` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `spells`
--

INSERT INTO `spells` (`id`, `title`, `friendly_spell_id`) VALUES
(1, 'Evangelism', '246287'),
(2, 'Rupture', '47536'),
(3, 'Ultimate Penitence', '421453');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `spell_id` (`heal_spell_id`),
  ADD KEY `timer_id` (`timer_id`);

--
-- Indexes for table `bosses`
--
ALTER TABLE `bosses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `raid_id` (`raid_id`,`name`);

--
-- Indexes for table `boss_abilities`
--
ALTER TABLE `boss_abilities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `boss_id` (`boss_id`,`short_title`);

--
-- Indexes for table `boss_timing`
--
ALTER TABLE `boss_timing`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ability_id` (`ability_id`,`stamp`,`order_id`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `raids`
--
ALTER TABLE `raids`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `spells`
--
ALTER TABLE `spells`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bosses`
--
ALTER TABLE `bosses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `boss_abilities`
--
ALTER TABLE `boss_abilities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `boss_timing`
--
ALTER TABLE `boss_timing`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `raids`
--
ALTER TABLE `raids`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `spells`
--
ALTER TABLE `spells`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assignments`
--
ALTER TABLE `assignments`
  ADD CONSTRAINT `assignments_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`),
  ADD CONSTRAINT `assignments_ibfk_2` FOREIGN KEY (`heal_spell_id`) REFERENCES `spells` (`id`),
  ADD CONSTRAINT `assignments_ibfk_3` FOREIGN KEY (`timer_id`) REFERENCES `boss_timing` (`id`);

--
-- Constraints for table `bosses`
--
ALTER TABLE `bosses`
  ADD CONSTRAINT `bosses_ibfk_1` FOREIGN KEY (`raid_id`) REFERENCES `raids` (`id`);

--
-- Constraints for table `boss_abilities`
--
ALTER TABLE `boss_abilities`
  ADD CONSTRAINT `boss_abilities_ibfk_1` FOREIGN KEY (`boss_id`) REFERENCES `bosses` (`id`);

--
-- Constraints for table `boss_timing`
--
ALTER TABLE `boss_timing`
  ADD CONSTRAINT `boss_timing_ibfk_1` FOREIGN KEY (`ability_id`) REFERENCES `boss_abilities` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
