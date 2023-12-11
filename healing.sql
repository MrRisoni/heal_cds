-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2023 at 02:09 PM
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
  `player_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 2,
  `plan_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `assignments`
--

INSERT INTO `assignments` (`id`, `timer_id`, `heal_spell_id`, `player_id`, `plan_id`) VALUES
(1, 17, 6, 2, 2),
(2, 17, 7, 2, 2),
(3, 15, 9, 2, 2),
(4, 20, 9, 2, 2),
(5, 25, 9, 2, 2),
(6, 17, 9, 2, 2),
(7, 27, 9, 2, 2),
(8, 14, 8, 2, 2),
(9, 27, 8, 2, 2),
(10, 26, 7, 2, 2),
(11, 26, 6, 2, 2),
(12, 32, 10, 2, 2);

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
(4, 6, 'Viridian Rain', 'Viridian Rain', '420907', 'cffF88379'),
(5, 6, 'Continuum', 'Continuum', '420846', 'cffCC0000'),
(6, 6, 'Rot Dmg', 'Surging Growth', '425357', 'cffFFD700'),
(7, 4, 'Furious Outburst', 'Furious Outburst', '425025', '425025'),
(8, 4, 'Intermission AoE', 'Raging Inferno', '', ''),
(9, 4, ' Raging Inferno', ' Raging Inferno', '417634', ''),
(10, 4, 'Flames', 'Consuming Flames', '421316', ''),
(11, 4, 'Ash', 'Searing Ash', '421407', ''),
(12, 4, 'Embers', 'Falling Embers', '47252', ''),
(13, 1, 'Controlled Burn', 'Controlled Burn', '', ''),
(14, 1, 'Tainted Bloom', 'Tainted Bloom', '', ''),
(15, 1, ' Doom Cultivation', ' Doom Cultivation', '', ''),
(16, 1, 'Uprooted Agony', 'Uprooted Agony', '', ''),
(17, 2, 'Pull Igira', '', '', ''),
(18, 2, 'Mark for Torment', 'Mark for Torment', '', ''),
(19, 2, 'Umbral Destruction', '', '', ''),
(20, 3, 'Serpent\'s Fury', '', '', ''),
(21, 3, ' Coiling Flames', '', '', ''),
(22, 3, 'Flood of the Firelands', '', '', ''),
(23, 4, 'Flash Fire', '', '', ''),
(24, 5, 'Barreling Charge', '', '', ''),
(25, 5, ' Emerald Winds', '', '', ''),
(26, 5, 'Blind Rage', '', '', ''),
(27, 5, 'Constricting Thicket', '', '', ''),
(28, 7, 'Brand of Damnation', '', '', ''),
(29, 7, 'Searing Aftermath', '', '', ''),
(30, 7, 'World In Flames', '', '', ''),
(31, 8, 'Falling Star', '', '', ''),
(32, 8, 'Mass Entanglement', '', '', ''),
(33, 8, 'Blazing Mushroom', '', '', ''),
(34, 8, 'Fiery Growth', '', '', ''),
(35, 8, 'Incarnation: Moonkin', '', '', ''),
(36, 8, ' Fire Beam', '', '', ''),
(37, 8, ' Supernova', '', '', ''),
(38, 8, 'Incarnation: Tree of Flame', '', '', ''),
(39, 8, 'Flaming Germination', '', '', ''),
(40, 8, 'Typhoon', '', '', ''),
(41, 9, 'Wildfire', '', '', ''),
(42, 9, 'Dream Rend', '', '', ''),
(43, 9, 'Incarnate', '', '', ''),
(44, 9, 'Corrupt', '', '', ''),
(46, 9, 'Flamefall', '', '', ''),
(47, 9, ' Lifeforce Barrier', '', '', ''),
(48, 9, 'Shadowflame Devastation', '', '', ''),
(49, 9, 'Eternal Firestorm', '', '', ''),
(50, 9, ' Apocalypse Roar', '', '', '');

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
(14, 1, '00:00', 1),
(15, 2, '00:05', 2),
(17, 2, '00:28', 3),
(20, 2, '00:51', 7),
(25, 2, '01:15', 12),
(28, 2, '02:35', 15),
(30, 2, '02:58', 17),
(16, 3, '00:18', 4),
(21, 3, '00:55', 8),
(29, 3, '02:47', 16),
(129, 4, '0:21', 1),
(130, 4, '0:41', 2),
(131, 4, '1:01', 3),
(133, 4, '2:24', 5),
(134, 4, '2:44', 6),
(135, 4, '3:04', 7),
(137, 4, '4:30', 9),
(138, 4, '4:50', 10),
(132, 5, '1:51', 4),
(136, 5, '3:58', 8),
(75, 7, '0:26', 1),
(76, 7, '0:48', 2),
(77, 7, '1:12', 3),
(79, 7, '1:48', 5),
(80, 7, '2:12', 6),
(81, 7, '2:40', 7),
(82, 7, '3:06', 8),
(78, 9, '1:34', 4),
(83, 9, '3:16', 9),
(84, 11, '3:43', 10),
(86, 11, '3:55', 12),
(87, 11, '4:07', 13),
(91, 11, '4:19', 17),
(92, 11, '4:31', 18),
(94, 11, '4:43', 20),
(95, 11, '4:55', 21),
(98, 11, '5:07', 24),
(99, 11, '5:19', 25),
(104, 11, '5:31', 30),
(85, 12, '3:50', 11),
(89, 12, '4:17', 15),
(93, 12, '4:42', 19),
(97, 12, '5:05', 23),
(105, 12, '5:35', 31),
(18, 13, '00:31', 5),
(23, 13, '01:06', 10),
(31, 13, '03:01', 18),
(19, 14, '00:38', 6),
(22, 14, '00:56', 9),
(24, 14, '01:12', 11),
(26, 14, '01:30', 13),
(27, 15, '01:40', 14),
(32, 17, '00:00', 1),
(33, 20, '00:12', 1),
(36, 20, '01:22', 4),
(39, 20, '02:32', 7),
(42, 20, '03:42', 10),
(34, 21, '00:17', 2),
(37, 21, '01:27', 5),
(40, 21, '02:37', 8),
(43, 21, '03:47', 11),
(35, 22, '01:15', 3),
(38, 22, '02:25', 6),
(41, 22, '03:34', 9),
(88, 23, '4:10', 14),
(90, 23, '4:18', 16),
(96, 23, '4:57', 22),
(100, 23, '5:23', 26),
(101, 23, '5:24', 27),
(102, 23, '5:25', 28),
(103, 23, '5:30', 29),
(108, 24, '0:12', 1),
(109, 24, '0:33', 2),
(112, 24, '1:13', 5),
(113, 24, '1:33', 6),
(115, 24, '1:59', 8),
(117, 24, '2:18', 10),
(118, 24, '2:38', 11),
(120, 24, '3:38', 13),
(121, 24, '3:58', 14),
(124, 24, '4:42', 17),
(125, 24, '5:02', 18),
(127, 24, '5:28', 20),
(110, 25, '0:48', 3),
(114, 25, '1:49', 7),
(119, 25, '2:53', 12),
(122, 25, '4:13', 15),
(126, 25, '5:18', 19),
(111, 26, '1:00', 4),
(123, 26, '4:25', 16),
(116, 27, '2:00', 9),
(128, 27, '5:29', 21),
(139, 28, '0:15', 1),
(141, 28, '0:45', 3),
(150, 28, '1:53', 6),
(152, 28, '2:23', 8),
(155, 28, '3:31', 11),
(157, 28, '4:01', 13),
(140, 29, '0:22', 2),
(142, 29, '0:52', 4),
(151, 29, '1:59', 7),
(153, 29, '2:29', 9),
(156, 29, '3:37', 12),
(158, 29, '4:07', 14),
(149, 30, '1:07', 5),
(154, 30, '2:45', 10),
(159, 30, '4:23', 15),
(160, 31, '0:08', 1),
(174, 31, '2:40', 15),
(180, 31, '3:28', 21),
(185, 31, '4:52', 26),
(192, 31, '5:51', 33),
(161, 32, '0:10', 2),
(166, 32, '0:50', 7),
(173, 32, '2:28', 14),
(179, 32, '3:16', 20),
(184, 32, '4:39', 25),
(191, 32, '5:36', 32),
(162, 33, '0:23', 3),
(167, 33, '1:03', 8),
(175, 33, '2:48', 16),
(188, 33, '5:10', 29),
(193, 33, '5:53', 34),
(163, 34, '0:26', 4),
(168, 34, '1:06', 9),
(176, 34, '2:51', 17),
(183, 34, '4:35', 24),
(196, 34, '6:15', 37),
(164, 35, '0:28', 5),
(169, 35, '1:08', 10),
(186, 35, '4:56', 27),
(194, 35, '5:54', 35),
(165, 36, '0:36', 6),
(170, 36, '1:16', 11),
(187, 36, '5:04', 28),
(195, 36, '6:04', 36),
(172, 37, '2:08', 13),
(182, 37, '4:10', 23),
(177, 38, '2:54', 18),
(189, 38, '5:12', 30),
(197, 38, '6:21', 38),
(178, 39, '3:06', 19),
(190, 39, '5:20', 31),
(198, 39, '6:24', 39),
(171, 40, '1:27', 12),
(181, 40, '3:42', 22),
(199, 41, '0:05', 1),
(200, 41, '0:29', 2),
(202, 41, '1:23', 4),
(201, 42, '0:44', 3),
(203, 42, '1:37', 5),
(204, 43, '1:49', 6),
(208, 43, '3:11', 10),
(214, 43, '4:31', 16),
(219, 43, '5:50', 21),
(205, 44, '2:02', 7),
(206, 46, '2:35', 8),
(212, 46, '3:50', 14),
(217, 46, '5:10', 19),
(207, 47, '2:42', 9),
(209, 47, '3:12', 11),
(211, 47, '3:42', 13),
(213, 47, '4:12', 15),
(215, 47, '4:42', 17),
(218, 47, '5:12', 20),
(210, 48, '3:23', 12),
(216, 48, '4:43', 18),
(220, 49, '6:00', 22),
(221, 50, '6:39', 23),
(222, 50, '7:20', 24),
(223, 50, '8:01', 25);

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
(5, 'Aura Mastery', '31821', 'am'),
(6, 'Divine Toll', '304971', 'dt'),
(7, 'Daybreak', '414176', 'day'),
(8, 'Tyrs Deliverance', '200652', 'tyr'),
(9, 'Beacon of Virtue', '200025', 'bov'),
(10, 'Beacon of Light', '', 'bol');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `bosses`
--
ALTER TABLE `bosses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `boss_abilities`
--
ALTER TABLE `boss_abilities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `boss_timing`
--
ALTER TABLE `boss_timing`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=224;

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
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
