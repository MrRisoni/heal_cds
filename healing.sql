-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2023 at 07:46 AM
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

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `AkumaiNymue` ()   SELECT t.stamp,ba.enemy_spell_id,ba.enemy_color, ba.short_title , p.color,p.name, s.friendly_spell_id
FROM boss_timing t 
JOIN boss_abilities ba ON ba.id = t.ability_id
JOIN assignments a ON a.timer_id = t.id
JOIN players p ON p.id = a.player_id
JOIN spells s ON s.id = a.heal_spell_id
WHERE ba.boss_id  =2
ORDER BY t.order_id ASC$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `id` int(10) UNSIGNED NOT NULL,
  `timer_id` int(10) UNSIGNED NOT NULL,
  `heal_spell_id` tinyint(3) UNSIGNED NOT NULL,
  `player_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `plan_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `assignments`
--

INSERT INTO `assignments` (`id`, `timer_id`, `heal_spell_id`, `player_id`, `plan_id`) VALUES
(1, 2, 1, 1, 1),
(2, 4, 2, 1, 1),
(3, 5, 1, 1, 1),
(4, 6, 2, 1, 1),
(5, 7, 1, 1, 1),
(6, 8, 2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bosses`
--

CREATE TABLE `bosses` (
  `id` int(10) UNSIGNED NOT NULL,
  `raid_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 3,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `bosses`
--

INSERT INTO `bosses` (`id`, `raid_id`, `name`) VALUES
(24, 1, 'Broodmother'),
(22, 1, 'Dathea'),
(19, 1, 'Eranog'),
(23, 1, 'Kurog'),
(26, 1, 'Primal Council'),
(25, 1, 'Razageth'),
(21, 1, 'Sennath'),
(20, 1, 'Terros'),
(11, 2, 'Amalgamation  Chambers'),
(13, 2, 'Assault of Zaqali'),
(17, 2, 'Echo of Neltharion'),
(12, 2, 'Forgotten Experiments'),
(10, 2, 'Kazzara'),
(16, 2, 'Magmorax'),
(14, 2, 'Rashok'),
(18, 2, 'Sarkareth'),
(15, 2, 'Zskarn'),
(5, 3, 'Council of Dreams'),
(9, 3, 'Fyrakk'),
(1, 3, 'Gnarlroot'),
(2, 3, 'Igira'),
(4, 3, 'Larodar'),
(6, 3, 'Nymue'),
(7, 3, 'Smolderon'),
(8, 3, 'Tindral'),
(3, 3, 'Volcoross');

-- --------------------------------------------------------

--
-- Table structure for table `boss_abilities`
--

CREATE TABLE `boss_abilities` (
  `id` int(10) UNSIGNED NOT NULL,
  `boss_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `short_title` varchar(45) NOT NULL,
  `full_name` varchar(45) NOT NULL,
  `enemy_spell_id` varchar(15) NOT NULL,
  `enemy_color` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `boss_abilities`
--

INSERT INTO `boss_abilities` (`id`, `boss_id`, `short_title`, `full_name`, `enemy_spell_id`, `enemy_color`) VALUES
(1, 1, 'On pull', 'On pull', '0', ''),
(2, 1, 'Tortured Scream', 'Tortured Scream', '', ''),
(3, 1, '\nFlaming Pestilence', '\nFlaming Pestilence', '420929', ''),
(4, 6, 'Rain dmge', 'Viridian Rain', '420907', 'cffF88379'),
(5, 6, 'Phase 2 Dmg', 'Continuum', '420846', 'cffCC0000'),
(6, 6, 'Rot Dmg', 'Surging Growth', '425357', 'cffFFD700'),
(7, 4, 'Furious Outburst', 'Furious Outburst', '425025', '425025'),
(8, 4, 'Intermission AoE', 'Raging Inferno', '', ''),
(9, 4, 'Inferno', ' Raging Inferno', '417634', ''),
(10, 4, 'Flames', 'Consuming Flames', '421316', ''),
(11, 4, 'Ash', 'Searing Ash', '421407', ''),
(12, 4, 'Embers', 'Falling Embers', '47252', ''),
(13, 1, 'Controlled Burn', 'Controlled Burn', '', ''),
(14, 1, 'Tainted Bloom', 'Tainted Bloom', '', ''),
(15, 1, ' Doom Cultivation', ' Doom Cultivation', '', ''),
(16, 1, 'Uprooted Agony', 'Uprooted Agony', '', '');

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
(5, 4, '00:22', 1),
(8, 4, '03:06', 8),
(7, 5, '01:54', 3),
(9, 5, '03:58', 9),
(6, 6, '00:50', 2),
(10, 7, '00:26', 1),
(11, 7, '00:48', 2),
(12, 7, '01:12', 3),
(13, 7, '01:34', 4);

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` tinyint(4) NOT NULL,
  `hex` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(25) NOT NULL,
  `color` varchar(12) NOT NULL DEFAULT 'cfffefefe'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `name`, `color`) VALUES
(1, 'Akumai', 'cfffefefe'),
(2, 'Solziege', 'cfffef');

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
-- Table structure for table `raid_plans`
--

CREATE TABLE `raid_plans` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `raid_plans`
--

INSERT INTO `raid_plans` (`id`, `title`) VALUES
(1, 'Disc Priest'),
(2, 'Holy Paladin');

-- --------------------------------------------------------

--
-- Table structure for table `spells`
--

CREATE TABLE `spells` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(20) NOT NULL,
  `friendly_spell_id` varchar(12) NOT NULL,
  `filename` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `spells`
--

INSERT INTO `spells` (`id`, `title`, `friendly_spell_id`, `filename`) VALUES
(1, 'Evangelism', '246287', 'evangelism'),
(2, 'Rupture', '47536', ''),
(3, 'Ultimate Penitence', '421453', 'uppies'),
(4, 'PW:Barrier', '', ''),
(5, 'Aura Mastery', '31821', '31821'),
(6, 'Divine Toll', '304971', ''),
(7, 'Daybreak', '414176', ''),
(8, 'Tyrs Deliverance', '200652', ''),
(9, 'Beacon of Virtue', '200025', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `timer_id` (`timer_id`,`heal_spell_id`,`player_id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `spell_id` (`heal_spell_id`),
  ADD KEY `plan_id` (`plan_id`);

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
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `hex` (`hex`);

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
-- Indexes for table `raid_plans`
--
ALTER TABLE `raid_plans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `bosses`
--
ALTER TABLE `bosses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `boss_abilities`
--
ALTER TABLE `boss_abilities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `boss_timing`
--
ALTER TABLE `boss_timing`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `raid_plans`
--
ALTER TABLE `raid_plans`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `spells`
--
ALTER TABLE `spells`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assignments`
--
ALTER TABLE `assignments`
  ADD CONSTRAINT `assignments_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`),
  ADD CONSTRAINT `assignments_ibfk_2` FOREIGN KEY (`heal_spell_id`) REFERENCES `spells` (`id`),
  ADD CONSTRAINT `assignments_ibfk_3` FOREIGN KEY (`timer_id`) REFERENCES `boss_timing` (`id`),
  ADD CONSTRAINT `assignments_ibfk_4` FOREIGN KEY (`plan_id`) REFERENCES `raid_plans` (`id`);

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
