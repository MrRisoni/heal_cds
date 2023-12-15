-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 15, 2023 at 10:30 AM
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `copyShortFull` ()   UPDATE `boss_abilities` SET  `full_name` =`short_title`$$

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
(12, 32, 10, 2, 2),
(13, 20, 5, 2, 2),
(14, 35, 5, 2, 2),
(15, 33, 9, 2, 2),
(16, 36, 9, 2, 2),
(17, 39, 9, 2, 2),
(18, 41, 6, 2, 2),
(19, 41, 7, 2, 2),
(20, 38, 8, 2, 2),
(21, 78, 5, 2, 2),
(22, 75, 6, 2, 2),
(24, 75, 7, 2, 2),
(27, 77, 6, 2, 2),
(28, 80, 7, 2, 2),
(29, 80, 6, 2, 2);

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
(6, 6, 'Rot Dmg', 'Rot Dmg', '425357', 'cffFFD700'),
(7, 4, 'Furious Outburst', 'Furious Outburst', '425025', '425025'),
(8, 4, 'Intermission AoE', 'Intermission AoE', '', ''),
(9, 4, ' Raging Inferno', ' Raging Inferno', '417634', ''),
(10, 4, 'Flames', 'Flames', '421316', ''),
(11, 4, 'Ash', 'Ash', '421407', ''),
(12, 4, 'Embers', 'Embers', '47252', ''),
(13, 1, 'Controlled Burn', 'Controlled Burn', '', ''),
(14, 1, 'Tainted Bloom', 'Tainted Bloom', '', ''),
(15, 1, ' Doom Cultivation', ' Doom Cultivation', '', ''),
(16, 1, 'Uprooted Agony', 'Uprooted Agony', '', ''),
(17, 2, 'Pull Igira', 'Pull Igira', '', ''),
(18, 2, 'Mark for Torment', 'Mark for Torment', '', ''),
(19, 2, 'Umbral Destruction', 'Umbral Destruction', '', ''),
(20, 3, 'Serpent\'s Fury', 'Serpent\'s Fury', '', ''),
(21, 3, ' Coiling Flames', ' Coiling Flames', '', ''),
(22, 3, 'Flood of the Firelands', 'Flood of the Firelands', '', ''),
(23, 4, 'Flash Fire', 'Flash Fire', '', ''),
(24, 5, 'Barreling Charge', 'Barreling Charge', '', ''),
(25, 5, ' Emerald Winds', ' Emerald Winds', '', ''),
(26, 5, 'Blind Rage', 'Blind Rage', '', ''),
(27, 5, 'Constricting Thicket', 'Constricting Thicket', '', ''),
(28, 7, 'Brand of Damnation', 'Brand of Damnation', '', ''),
(29, 7, 'Searing Aftermath', 'Searing Aftermath', '', ''),
(30, 7, 'World In Flames', 'World In Flames', '', ''),
(31, 8, 'Falling Star', 'Falling Star', '', ''),
(32, 8, 'Mass Entanglement', 'Mass Entanglement', '', ''),
(33, 8, 'Blazing Mushroom', 'Blazing Mushroom', '', ''),
(34, 8, 'Fiery Growth', 'Fiery Growth', '', ''),
(35, 8, 'Incarnation: Moonkin', 'Incarnation: Moonkin', '', ''),
(36, 8, ' Fire Beam', ' Fire Beam', '', ''),
(37, 8, ' Supernova', ' Supernova', '', ''),
(38, 8, 'Incarnation: Tree of Flame', 'Incarnation: Tree of Flame', '', ''),
(39, 8, 'Flaming Germination', 'Flaming Germination', '', ''),
(40, 8, 'Typhoon', 'Typhoon', '', ''),
(41, 9, 'Wildfire', 'Wildfire', '', ''),
(42, 9, 'Dream Rend', 'Dream Rend', '', ''),
(43, 9, 'Incarnate', 'Incarnate', '', ''),
(44, 9, 'Corrupt', 'Corrupt', '', ''),
(46, 9, 'Flamefall', 'Flamefall', '', ''),
(47, 9, ' Lifeforce Barrier', ' Lifeforce Barrier', '', ''),
(48, 9, 'Shadowflame Devastation', 'Shadowflame Devastation', '', ''),
(49, 9, 'Eternal Firestorm', 'Eternal Firestorm', '', ''),
(50, 9, ' Apocalypse Roar', ' Apocalypse Roar', '', ''),
(51, 19, 'Incinerating Roar', 'Incinerating Roar', '', ''),
(52, 19, 'Pulsing Flames', 'Pulsing Flames', '', ''),
(53, 20, 'Rock Blast', 'Rock Blast', '', ''),
(54, 20, 'Concussive Slam', 'Concussive Slam', '', ''),
(55, 20, 'Shattering Impact', 'Shattering Impact', '', ''),
(56, 20, 'Resonating Annihilation', 'Resonating Annihilation', '', ''),
(57, 26, 'Conductive Mark', 'Conductive Mark', '', ''),
(58, 26, 'Meteor Axes', 'Meteor Axes', '', ''),
(59, 26, 'Primal Blizzard', 'Primal Blizzard', '', ''),
(60, 22, 'Conductive Mark', 'Conductive Mark', '', ''),
(61, 22, ' Cyclone', ' Cyclone', '', ''),
(62, 22, 'Blowback', 'Blowback', '', ''),
(63, 21, 'Chilling Aura', 'Chilling Aura', '', ''),
(64, 21, 'Chilling Blast', 'Chilling Blast', '', ''),
(65, 21, 'Gossamer Burst', 'Gossamer Burst', '', ''),
(66, 23, 'Primal Shift', 'Primal Shift', '', ''),
(67, 23, 'Flame Dominance', 'Flame Dominance', '', ''),
(68, 23, 'Biting Chill', 'Biting Chill', '', ''),
(69, 23, 'Frost Dominance', 'Frost Dominance', '', ''),
(70, 23, 'Absolute Zero', 'Absolute Zero', '', ''),
(71, 23, 'Blistering Presence', 'Blistering Presence', '', ''),
(72, 23, 'Earth Dominance', 'Earth Dominance', '', ''),
(73, 23, 'Storm Dominance', 'Storm Dominance', '', ''),
(74, 24, 'Wildfire', 'Wildfire', '', ''),
(75, 24, 'Greatstaff of the Broodkeeper', 'Greatstaff of the Broodkeeper', '', ''),
(76, 24, 'Clutchwatcher\'s Rage', 'Clutchwatcher\'s Rage', '', ''),
(77, 24, 'Frozen Shroud', 'Frozen Shroud', '', ''),
(78, 25, 'Static Charge', 'Static Charge', '', ''),
(79, 25, 'Hurricane Wing', 'Hurricane Wing', '', ''),
(80, 25, 'Volatile Current', 'Volatile Current', '', ''),
(81, 25, 'Lightning Devastation', 'Lightning Devastation', '', ''),
(82, 25, 'Stormsurge', 'Stormsurge', '', ''),
(83, 25, 'Tempest Wing', 'Tempest Wing', '', ''),
(84, 25, 'Thunderous Energy', 'Thunderous Energy', '', ''),
(85, 25, 'Magnetic Charge', 'Magnetic Charge', '', ''),
(86, 2, 'Blistering Spear', 'Blistering Spear', '', ''),
(87, 10, 'Wings of Extinction', 'Wings of Extinction', '', ''),
(88, 10, 'Hellsteel Carnage', 'Hellsteel Carnage', '', ''),
(89, 10, 'Hellbeam', 'Hellbeam', '', ''),
(90, 11, 'Corrupting Shadow', 'Corrupting Shadow', '', ''),
(91, 11, 'Molten Eruption', 'Molten Eruption', '', ''),
(92, 11, 'Convergent Eruption', 'Convergent Eruption', '', ''),
(93, 11, 'Blistering Twilight', 'Blistering Twilight', '', ''),
(94, 11, 'Gloom Conflagration', 'Gloom Conflagration', '', ''),
(95, 11, 'Gloom Combustion', 'Gloom Combustion', '', ''),
(96, 12, 'Bellowing Roar', 'Bellowing Roar', '', ''),
(97, 12, 'Rending Charge', 'Rending Charge', '', ''),
(98, 12, 'Unstable Essence', 'Unstable Essence', '', ''),
(99, 12, 'Violent Eruption', 'Violent Eruption', '', ''),
(102, 12, 'Disintegrate', 'Disintegrate', '', ''),
(103, 12, 'Erratic Burst', 'Erratic Burst', '', ''),
(104, 12, 'Temporal Anomaly', 'Temporal Anomaly', '', ''),
(105, 12, 'Deep Breath', 'Deep Breath', '', ''),
(106, 13, 'Molten Barrier', 'Molten Barrier', '', ''),
(107, 13, ' Magma Flow', ' Magma Flow', '', ''),
(108, 13, 'Flaming Cudgel', 'Flaming Cudgel', '', ''),
(110, 14, 'Smoldering Rage', 'Smoldering Rage', '', ''),
(111, 14, 'Charged Smash', 'Charged Smash', '', ''),
(114, 14, 'Doom Flames', 'Doom Flames', '', ''),
(115, 14, 'Shadowlava Blast', 'Shadowlava Blast', '', ''),
(116, 14, 'Scorching Heatwave', 'Scorching Heatwave', '', ''),
(117, 15, 'Unstable Embers', 'Unstable Embers', '', ''),
(118, 15, 'Blast Wave', 'Blast Wave', '', ''),
(119, 15, 'Dragonfire Traps', 'Dragonfire Traps', '', ''),
(120, 15, 'Tactical Destruction', 'Tactical Destruction', '', ''),
(121, 16, 'Igniting Roar', 'Igniting Roar', '', ''),
(122, 16, 'Molten Spittle', 'Molten Spittle', '', ''),
(123, 16, 'Blazing Breath', 'Blazing Breath', '', ''),
(124, 16, 'Overpowering Stomp', 'Overpowering Stomp', '', ''),
(125, 17, 'Rushing Darkness', 'Rushing Darkness', '', ''),
(126, 17, 'Echoing Fissure', 'Echoing Fissure', '', ''),
(127, 17, 'Raze the Earth', 'Raze the Earth', '', ''),
(128, 17, 'Surrender to Corruption', 'Surrender to Corruption', '', ''),
(129, 17, 'Umbral Annihilation', 'Umbral Annihilation', '', ''),
(130, 17, 'Shatter', 'Shatter', '', ''),
(131, 17, 'Ebon Destruction', 'Ebon Destruction', '', ''),
(132, 18, 'Scorching Bomb', 'Scorching Bomb', '', ''),
(133, 18, 'Glittering Surge', 'Glittering Surge', '', ''),
(134, 18, 'Oppressing Howl', 'Oppressing Howl', '', ''),
(135, 18, 'Scorching Detonation', 'Scorching Detonation', '', ''),
(136, 18, 'Mass Disintegrate', 'Mass Disintegrate', '', ''),
(137, 18, 'Echoing Howl', 'Echoing Howl', '', ''),
(138, 18, 'Searing Breath', 'Searing Breath', '', ''),
(139, 18, 'Abyssal Breath', 'Abyssal Breath', '', ''),
(140, 18, 'Desolate Blossom', 'Desolate Blossom', '', ''),
(141, 18, 'Void Bomb', 'Void Bomb', '', ''),
(142, 18, 'Dread', 'Dread', '', ''),
(143, 18, 'Cosmic Ascension', 'Cosmic Ascension', '', ''),
(144, 18, 'Embrace of Nothingness', 'Embrace of Nothingness', '', ''),
(145, 18, 'Scouring Eternity', 'Scouring Eternity', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `boss_timing`
--

CREATE TABLE `boss_timing` (
  `id` int(10) UNSIGNED NOT NULL,
  `ability_id` int(10) UNSIGNED NOT NULL,
  `stamp` varchar(5) NOT NULL,
  `order_id` tinyint(3) UNSIGNED NOT NULL,
  `timer` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `boss_timing`
--

INSERT INTO `boss_timing` (`id`, `ability_id`, `stamp`, `order_id`, `timer`) VALUES
(14, 1, '00:00', 1, 0),
(15, 2, '00:05', 2, 5),
(16, 3, '00:18', 4, 18),
(17, 2, '00:28', 3, 28),
(18, 13, '00:31', 5, 31),
(19, 14, '00:38', 6, 38),
(20, 2, '00:51', 7, 51),
(21, 3, '00:55', 8, 55),
(22, 14, '00:56', 9, 56),
(23, 13, '01:06', 10, 66),
(24, 14, '01:12', 11, 72),
(25, 2, '01:15', 12, 75),
(26, 14, '01:30', 13, 90),
(27, 15, '01:40', 14, 100),
(28, 2, '02:35', 15, 155),
(29, 3, '02:47', 16, 167),
(30, 2, '02:58', 17, 178),
(31, 13, '03:01', 18, 181),
(32, 17, '00:00', 1, 0),
(33, 20, '00:12', 1, 12),
(34, 21, '00:17', 2, 17),
(35, 22, '01:15', 3, 75),
(36, 20, '01:22', 4, 82),
(37, 21, '01:27', 5, 87),
(38, 22, '02:25', 6, 145),
(39, 20, '02:32', 7, 152),
(40, 21, '02:37', 8, 157),
(41, 22, '03:34', 9, 214),
(42, 20, '03:42', 10, 222),
(43, 21, '03:47', 11, 227),
(75, 7, '0:26', 1, 26),
(76, 7, '0:48', 2, 48),
(77, 7, '1:12', 3, 72),
(78, 9, '1:34', 4, 94),
(79, 7, '1:48', 5, 108),
(80, 7, '2:12', 6, 132),
(81, 7, '2:40', 7, 160),
(82, 7, '3:06', 8, 186),
(83, 9, '3:16', 9, 196),
(84, 11, '3:43', 10, 223),
(85, 12, '3:50', 11, 230),
(86, 11, '3:55', 12, 235),
(87, 11, '4:07', 13, 247),
(88, 23, '4:10', 14, 250),
(89, 12, '4:17', 15, 257),
(90, 23, '4:18', 16, 258),
(91, 11, '4:19', 17, 259),
(92, 11, '4:31', 18, 271),
(93, 12, '4:42', 19, 282),
(94, 11, '4:43', 20, 283),
(95, 11, '4:55', 21, 295),
(96, 23, '4:57', 22, 297),
(97, 12, '5:05', 23, 305),
(98, 11, '5:07', 24, 307),
(99, 11, '5:19', 25, 319),
(100, 23, '5:23', 26, 323),
(101, 23, '5:24', 27, 324),
(102, 23, '5:25', 28, 325),
(103, 23, '5:30', 29, 330),
(104, 11, '5:31', 30, 331),
(105, 12, '5:35', 31, 335),
(108, 24, '0:12', 1, 12),
(109, 24, '0:33', 2, 33),
(110, 25, '0:48', 3, 48),
(111, 26, '1:00', 4, 60),
(112, 24, '1:13', 5, 73),
(113, 24, '1:33', 6, 93),
(114, 25, '1:49', 7, 109),
(115, 24, '1:59', 8, 119),
(116, 27, '2:00', 9, 120),
(117, 24, '2:18', 10, 138),
(118, 24, '2:38', 11, 158),
(119, 25, '2:53', 12, 173),
(120, 24, '3:38', 13, 218),
(121, 24, '3:58', 14, 238),
(122, 25, '4:13', 15, 253),
(123, 26, '4:25', 16, 265),
(124, 24, '4:42', 17, 282),
(125, 24, '5:02', 18, 302),
(126, 25, '5:18', 19, 318),
(127, 24, '5:28', 20, 328),
(128, 27, '5:29', 21, 329),
(129, 4, '00:21', 1, 21),
(130, 4, '0:41', 2, 41),
(131, 4, '1:01', 3, 61),
(132, 5, '1:51', 4, 111),
(133, 4, '2:24', 5, 144),
(134, 4, '2:44', 6, 164),
(135, 4, '3:04', 7, 184),
(136, 5, '3:58', 8, 238),
(137, 4, '4:30', 9, 270),
(138, 4, '4:50', 10, 290),
(139, 28, '0:15', 1, 15),
(140, 29, '0:22', 2, 22),
(141, 28, '0:45', 3, 45),
(142, 29, '0:52', 4, 52),
(149, 30, '1:07', 5, 67),
(150, 28, '1:53', 6, 113),
(151, 29, '1:59', 7, 119),
(152, 28, '2:23', 8, 143),
(153, 29, '2:29', 9, 149),
(154, 30, '2:45', 10, 165),
(155, 28, '3:31', 11, 211),
(156, 29, '3:37', 12, 217),
(157, 28, '4:01', 13, 241),
(158, 29, '4:07', 14, 247),
(159, 30, '4:23', 15, 263),
(160, 31, '0:08', 1, 8),
(161, 32, '0:10', 2, 10),
(162, 33, '0:23', 3, 23),
(163, 34, '0:26', 4, 26),
(164, 35, '0:28', 5, 28),
(165, 36, '0:36', 6, 36),
(166, 32, '0:50', 7, 50),
(167, 33, '1:03', 8, 63),
(168, 34, '1:06', 9, 66),
(169, 35, '1:08', 10, 68),
(170, 36, '1:16', 11, 76),
(171, 40, '1:27', 12, 87),
(172, 37, '2:08', 13, 128),
(173, 32, '2:28', 14, 148),
(174, 31, '2:40', 15, 160),
(175, 33, '2:48', 16, 168),
(176, 34, '2:51', 17, 171),
(177, 38, '2:54', 18, 174),
(178, 39, '3:06', 19, 186),
(179, 32, '3:16', 20, 196),
(180, 31, '3:28', 21, 208),
(181, 40, '3:42', 22, 222),
(182, 37, '4:10', 23, 250),
(183, 34, '4:35', 24, 275),
(184, 32, '4:39', 25, 279),
(185, 31, '4:52', 26, 292),
(186, 35, '4:56', 27, 296),
(187, 36, '5:04', 28, 304),
(188, 33, '5:10', 29, 310),
(189, 38, '5:12', 30, 312),
(190, 39, '5:20', 31, 320),
(191, 32, '5:36', 32, 336),
(192, 31, '5:51', 33, 351),
(193, 33, '5:53', 34, 353),
(194, 35, '5:54', 35, 354),
(195, 36, '6:04', 36, 364),
(196, 34, '6:15', 37, 375),
(197, 38, '6:21', 38, 381),
(198, 39, '6:24', 39, 384),
(199, 41, '0:05', 1, 5),
(200, 41, '0:29', 2, 29),
(201, 42, '0:44', 3, 44),
(202, 41, '1:23', 4, 83),
(203, 42, '1:37', 5, 97),
(204, 43, '1:49', 6, 109),
(205, 44, '2:02', 7, 122),
(206, 46, '2:35', 8, 155),
(207, 47, '2:42', 9, 162),
(208, 43, '3:11', 10, 191),
(209, 47, '3:12', 11, 192),
(210, 48, '3:23', 12, 203),
(211, 47, '3:42', 13, 222),
(212, 46, '3:50', 14, 230),
(213, 47, '4:12', 15, 252),
(214, 43, '4:31', 16, 271),
(215, 47, '4:42', 17, 282),
(216, 48, '4:43', 18, 283),
(217, 46, '5:10', 19, 310),
(218, 47, '5:12', 20, 312),
(219, 43, '5:50', 21, 350),
(220, 49, '6:00', 22, 360),
(221, 50, '6:39', 23, 399),
(222, 50, '7:20', 24, 440),
(223, 50, '8:01', 25, 481),
(224, 51, '0:12', 1, 12),
(225, 51, '0:36', 2, 36),
(226, 51, '0:58', 3, 58),
(227, 51, '1:20', 4, 80),
(228, 52, '1:40', 5, 100),
(229, 52, '1:47', 6, 107),
(230, 52, '1:54', 7, 114),
(231, 51, '2:12', 8, 132),
(232, 51, '2:36', 9, 156),
(233, 51, '2:58', 10, 178),
(234, 51, '3:20', 11, 200),
(235, 53, '0:11', 1, 11),
(236, 54, '0:18', 2, 18),
(237, 55, '0:30', 3, 30),
(238, 54, '0:36', 4, 36),
(239, 53, '0:53', 5, 53),
(240, 54, '1:00', 6, 60),
(241, 55, '1:12', 7, 72),
(242, 54, '1:18', 8, 78),
(243, 56, '1:36', 9, 96),
(244, 53, '1:48', 10, 108),
(245, 54, '1:55', 11, 115),
(246, 55, '2:07', 12, 127),
(247, 54, '2:13', 13, 133),
(248, 53, '2:30', 14, 150),
(249, 54, '2:37', 15, 157),
(250, 55, '2:49', 16, 169),
(251, 54, '2:55', 17, 175),
(252, 56, '3:13', 18, 193),
(253, 53, '3:24', 19, 204),
(254, 54, '3:31', 20, 211),
(255, 55, '3:43', 21, 223),
(256, 54, '3:49', 22, 229),
(257, 53, '4:06', 23, 246),
(258, 54, '4:13', 24, 253),
(259, 55, '4:25', 25, 265),
(260, 54, '4:31', 26, 271),
(261, 56, '4:49', 27, 289),
(262, 53, '5:01', 28, 301),
(263, 54, '5:08', 29, 308),
(264, 55, '5:19', 30, 319),
(265, 54, '5:26', 31, 326),
(266, 53, '5:43', 32, 343),
(267, 54, '5:50', 33, 350),
(268, 55, '6:02', 34, 362),
(269, 54, '6:08', 35, 368),
(272, 57, '0:16', 1, 16),
(273, 58, '0:34', 2, 34),
(274, 59, '0:51', 3, 51),
(275, 57, '1:12', 4, 72),
(276, 58, '1:29', 5, 89),
(277, 57, '1:49', 6, 109),
(278, 58, '2:22', 7, 142),
(279, 57, '2:25', 8, 145),
(280, 59, '2:51', 9, 171),
(281, 57, '2:59', 10, 179),
(282, 58, '3:16', 11, 196),
(283, 57, '3:36', 12, 216),
(284, 58, '4:09', 13, 249),
(285, 57, '4:11', 14, 251),
(286, 59, '4:37', 15, 277),
(287, 57, '4:47', 16, 287),
(288, 58, '5:03', 17, 303),
(289, 57, '5:24', 18, 324),
(290, 58, '5:55', 19, 355),
(291, 60, '0:04', 1, 4),
(292, 60, '0:30', 2, 30),
(293, 61, '0:39', 3, 39),
(294, 60, '0:56', 4, 56),
(295, 62, '1:34', 5, 94),
(296, 60, '1:45', 6, 105),
(297, 61, '1:54', 7, 114),
(298, 62, '2:04', 8, 124),
(299, 60, '2:11', 9, 131),
(300, 62, '2:53', 10, 173),
(301, 60, '3:03', 11, 183),
(302, 61, '3:12', 12, 192),
(303, 62, '3:18', 13, 198),
(304, 60, '3:29', 14, 209),
(305, 62, '4:12', 15, 252),
(306, 60, '4:19', 16, 259),
(307, 61, '4:28', 17, 268),
(308, 62, '4:40', 18, 280),
(309, 60, '4:46', 19, 286),
(310, 60, '5:36', 20, 336),
(311, 61, '5:45', 21, 345),
(312, 63, '0:03', 1, 3),
(313, 63, '0:13', 2, 13),
(314, 64, '0:19', 3, 19),
(315, 64, '0:19', 4, 19),
(316, 65, '0:38', 5, 38),
(317, 64, '0:55', 6, 55),
(318, 65, '1:15', 7, 75),
(319, 64, '1:34', 8, 94),
(320, 63, '1:49', 9, 109),
(321, 63, '1:59', 10, 119),
(322, 64, '2:02', 11, 122),
(323, 65, '2:21', 12, 141),
(324, 64, '2:39', 13, 159),
(325, 65, '2:58', 14, 178),
(326, 64, '3:16', 15, 196),
(327, 63, '3:27', 16, 207),
(328, 63, '3:37', 17, 217),
(329, 64, '3:41', 18, 221),
(330, 65, '4:00', 19, 240),
(331, 64, '4:17', 20, 257),
(332, 65, '4:38', 21, 278),
(333, 64, '4:55', 22, 295),
(334, 64, '5:21', 23, 321),
(335, 64, '5:54', 24, 354),
(336, 66, '0:02', 1, 2),
(337, 67, '0:17', 2, 17),
(338, 67, '0:32', 3, 32),
(339, 67, '0:47', 4, 47),
(340, 66, '0:57', 5, 57),
(341, 68, '1:03', 6, 63),
(342, 69, '1:12', 7, 72),
(343, 69, '1:27', 8, 87),
(344, 68, '1:28', 9, 88),
(345, 70, '1:35', 10, 95),
(346, 69, '1:42', 11, 102),
(347, 68, '1:49', 12, 109),
(348, 69, '1:57', 13, 117),
(349, 71, '2:21', 14, 141),
(350, 71, '2:36', 15, 156),
(351, 71, '2:51', 16, 171),
(352, 71, '3:06', 17, 186),
(353, 71, '3:21', 18, 201),
(354, 66, '3:28', 19, 208),
(355, 72, '3:43', 20, 223),
(356, 72, '3:58', 21, 238),
(357, 72, '4:13', 22, 253),
(358, 72, '4:28', 23, 268),
(359, 66, '4:29', 24, 269),
(360, 73, '4:44', 25, 284),
(361, 73, '4:59', 26, 299),
(362, 74, '0:09', 1, 9),
(363, 75, '0:16', 2, 16),
(364, 76, '0:20', 3, 20),
(365, 74, '0:34', 4, 34),
(366, 75, '0:41', 5, 41),
(367, 76, '0:47', 6, 47),
(368, 74, '0:59', 7, 59),
(369, 75, '1:06', 8, 66),
(370, 76, '1:10', 9, 70),
(371, 74, '1:24', 10, 84),
(372, 75, '1:31', 11, 91),
(373, 76, '1:37', 12, 97),
(374, 74, '1:49', 13, 109),
(375, 75, '1:58', 14, 118),
(376, 76, '2:04', 15, 124),
(377, 74, '2:14', 16, 134),
(378, 75, '2:21', 17, 141),
(379, 76, '2:27', 18, 147),
(380, 74, '2:42', 19, 162),
(381, 75, '2:46', 20, 166),
(382, 76, '2:50', 21, 170),
(383, 74, '3:04', 22, 184),
(384, 75, '3:11', 23, 191),
(385, 76, '3:15', 24, 195),
(386, 74, '3:29', 25, 209),
(387, 75, '3:36', 26, 216),
(388, 76, '3:40', 27, 220),
(389, 74, '3:54', 28, 234),
(390, 75, '4:01', 29, 241),
(391, 76, '4:07', 30, 247),
(392, 74, '4:19', 31, 259),
(393, 75, '4:26', 32, 266),
(394, 76, '4:32', 33, 272),
(395, 74, '4:44', 34, 284),
(396, 75, '4:52', 35, 292),
(397, 76, '4:59', 36, 299),
(398, 74, '5:12', 37, 312),
(399, 75, '5:22', 38, 322),
(400, 74, '5:34', 39, 334),
(401, 74, '5:37', 40, 337),
(402, 77, '5:39', 41, 339),
(403, 75, '5:48', 42, 348),
(404, 74, '5:59', 43, 359),
(405, 74, '6:02', 44, 362),
(406, 75, '6:06', 45, 366),
(407, 77, '6:19', 46, 379),
(408, 74, '6:24', 47, 384),
(409, 74, '6:27', 48, 387),
(410, 75, '6:31', 49, 391),
(411, 74, '6:49', 50, 409),
(412, 74, '6:52', 51, 412),
(413, 75, '6:56', 52, 416),
(414, 77, '7:03', 53, 423),
(415, 74, '7:14', 54, 434),
(416, 74, '7:17', 55, 437),
(417, 75, '7:21', 56, 441),
(418, 74, '7:39', 57, 459),
(419, 74, '7:42', 58, 462),
(420, 77, '7:47', 59, 467),
(421, 75, '7:53', 60, 473),
(422, 74, '8:04', 61, 484),
(423, 78, '0:23', 1, 23),
(424, 79, '0:41', 2, 41),
(425, 78, '0:58', 3, 58),
(426, 79, '1:16', 4, 76),
(427, 80, '1:23', 5, 83),
(428, 78, '1:35', 6, 95),
(429, 81, '2:27', 7, 147),
(430, 81, '2:39', 8, 159),
(431, 81, '2:51', 9, 171),
(432, 81, '3:03', 10, 183),
(433, 81, '3:15', 11, 195),
(434, 81, '3:28', 12, 208),
(435, 82, '3:54', 13, 234),
(436, 83, '4:29', 14, 269),
(437, 80, '4:51', 15, 291),
(438, 83, '4:59', 16, 299),
(439, 82, '5:14', 17, 314),
(440, 80, '5:48', 18, 348),
(441, 83, '5:54', 19, 354),
(442, 83, '6:14', 20, 374),
(443, 82, '6:34', 21, 394),
(444, 81, '7:26', 22, 446),
(445, 81, '7:58', 23, 478),
(446, 84, '8:50', 24, 530),
(447, 85, '8:57', 25, 537),
(448, 84, '9:20', 26, 560),
(449, 83, '9:32', 27, 572),
(450, 84, '9:50', 28, 590),
(451, 85, '10:00', 29, 600),
(452, 84, '10:20', 30, 620),
(453, 85, '10:34', 31, 634),
(454, 83, '10:36', 32, 636),
(455, 87, '0:16', 1, 16),
(456, 88, '0:30', 2, 30),
(457, 89, '0:43', 3, 43),
(458, 87, '1:00', 4, 60),
(459, 88, '1:09', 5, 69),
(460, 89, '1:28', 6, 88),
(461, 87, '1:43', 7, 103),
(462, 88, '1:59', 8, 119),
(463, 89, '2:13', 9, 133),
(464, 87, '2:27', 10, 147),
(465, 89, '2:50', 11, 170),
(466, 87, '3:01', 12, 181),
(467, 89, '3:26', 13, 206),
(468, 90, '0:05', 1, 5),
(469, 91, '0:17', 2, 17),
(470, 90, '0:30', 3, 30),
(471, 93, '1:06', 4, 66),
(472, 92, '1:16', 5, 76),
(473, 94, '1:38', 6, 98),
(474, 94, '1:38', 7, 98),
(475, 95, '1:45', 8, 105),
(476, 93, '2:00', 9, 120),
(477, 92, '2:10', 10, 130),
(478, 94, '2:27', 11, 147),
(479, 94, '2:27', 12, 147),
(480, 95, '2:33', 13, 153),
(481, 93, '2:47', 14, 167),
(482, 92, '2:57', 15, 177),
(483, 94, '3:15', 16, 195),
(484, 95, '3:21', 17, 201),
(485, 93, '3:35', 18, 215),
(486, 92, '3:45', 19, 225),
(487, 96, '0:14', 1, 14),
(488, 97, '0:24', 2, 24),
(489, 97, '1:00', 3, 60),
(490, 98, '1:30', 4, 90),
(491, 99, '1:53', 5, 113),
(492, 99, '1:53', 6, 113),
(493, 98, '2:10', 7, 130),
(494, 98, '2:38', 8, 158),
(495, 103, '3:05', 9, 185),
(496, 102, '3:06', 10, 186),
(497, 102, '3:06', 11, 186),
(498, 103, '3:12', 12, 192),
(499, 104, '3:16', 13, 196),
(500, 105, '3:33', 14, 213),
(501, 105, '3:37', 15, 217),
(502, 102, '3:51', 16, 231),
(503, 104, '4:03', 17, 243),
(504, 105, '4:16', 18, 256),
(505, 105, '4:21', 19, 261),
(506, 102, '4:34', 20, 274),
(507, 104, '4:47', 21, 287),
(508, 106, '0:28', 1, 28),
(509, 106, '0:32', 2, 32),
(510, 106, '0:36', 3, 36),
(511, 106, '0:40', 4, 40),
(512, 106, '0:44', 5, 44),
(513, 106, '0:48', 6, 48),
(514, 106, '1:25', 7, 85),
(515, 106, '1:29', 8, 89),
(516, 106, '1:33', 9, 93),
(517, 106, '1:37', 10, 97),
(518, 106, '1:41', 11, 101),
(519, 106, '1:45', 12, 105),
(520, 107, '1:54', 13, 114),
(521, 108, '2:38', 14, 158),
(522, 108, '2:38', 15, 158),
(523, 108, '2:39', 16, 159),
(524, 108, '3:01', 17, 181),
(525, 108, '3:20', 18, 200),
(526, 108, '3:32', 19, 212),
(527, 110, '0:00', 1, 0),
(528, 111, '0:26', 2, 26),
(529, 114, '0:47', 3, 47),
(530, 114, '0:55', 4, 55),
(531, 111, '1:12', 5, 72),
(532, 115, '1:40', 6, 100),
(533, 116, '1:50', 7, 110),
(534, 116, '1:56', 8, 116),
(535, 116, '2:02', 9, 122),
(536, 111, '2:38', 10, 158),
(537, 114, '2:58', 11, 178),
(538, 114, '3:06', 12, 186),
(539, 111, '3:24', 13, 204),
(540, 115, '3:52', 14, 232),
(541, 116, '4:02', 15, 242),
(542, 116, '4:08', 16, 248),
(543, 116, '4:14', 17, 254),
(544, 111, '4:50', 18, 290),
(545, 114, '5:11', 19, 311),
(546, 114, '5:19', 20, 319),
(547, 111, '5:36', 21, 336),
(548, 117, '0:07', 1, 7),
(549, 118, '0:13', 2, 13),
(550, 119, '0:19', 3, 19),
(551, 117, '0:23', 4, 23),
(552, 117, '0:39', 5, 39),
(553, 118, '0:47', 6, 47),
(554, 119, '0:49', 7, 49),
(555, 117, '0:58', 8, 58),
(556, 120, '1:02', 9, 62),
(557, 117, '1:13', 10, 73),
(558, 118, '1:21', 11, 81),
(559, 119, '1:22', 12, 82),
(560, 117, '1:29', 13, 89),
(561, 117, '1:45', 14, 105),
(562, 119, '1:52', 15, 112),
(563, 118, '1:56', 16, 116),
(564, 117, '2:01', 17, 121),
(565, 120, '2:15', 18, 135),
(566, 117, '2:17', 19, 137),
(567, 119, '2:23', 20, 143),
(568, 118, '2:30', 21, 150),
(569, 117, '2:33', 22, 153),
(570, 117, '2:48', 23, 168),
(571, 119, '2:53', 24, 173),
(572, 118, '3:03', 25, 183),
(573, 117, '3:04', 26, 184),
(574, 117, '3:20', 27, 200),
(575, 119, '3:24', 28, 204),
(576, 120, '3:27', 29, 207),
(577, 118, '3:37', 30, 217),
(578, 117, '3:38', 31, 218),
(579, 119, '3:54', 32, 234),
(580, 117, '3:55', 33, 235),
(581, 117, '4:12', 34, 252),
(582, 119, '4:25', 35, 265),
(583, 121, '0:08', 1, 8),
(584, 122, '0:17', 2, 17),
(585, 123, '0:31', 3, 31),
(586, 122, '0:47', 4, 47),
(587, 121, '0:58', 5, 58),
(588, 123, '1:06', 6, 66),
(589, 122, '1:20', 7, 80),
(590, 124, '1:34', 8, 94),
(591, 121, '1:48', 9, 108),
(592, 122, '1:57', 10, 117),
(593, 123, '2:11', 11, 131),
(594, 122, '2:27', 12, 147),
(595, 121, '2:38', 13, 158),
(596, 123, '2:46', 14, 166),
(597, 122, '3:00', 15, 180),
(598, 124, '3:14', 16, 194),
(599, 121, '3:28', 17, 208),
(600, 122, '3:37', 18, 217),
(601, 123, '3:51', 19, 231),
(602, 125, '0:15', 1, 15),
(603, 126, '0:38', 2, 38),
(604, 125, '0:52', 3, 52),
(605, 126, '1:15', 4, 75),
(606, 125, '1:29', 5, 89),
(607, 127, '1:39', 6, 99),
(608, 128, '1:54', 7, 114),
(609, 129, '2:12', 8, 132),
(610, 125, '2:21', 9, 141),
(611, 130, '2:22', 10, 142),
(612, 129, '2:43', 11, 163),
(613, 125, '2:50', 12, 170),
(614, 129, '3:12', 13, 192),
(615, 125, '3:19', 14, 199),
(616, 129, '3:42', 15, 222),
(617, 125, '3:48', 16, 228),
(618, 125, '4:24', 17, 264),
(619, 131, '4:39', 18, 279),
(620, 125, '4:53', 19, 293),
(621, 131, '5:09', 20, 309),
(622, 125, '5:23', 21, 323),
(623, 132, '0:02', 1, 2),
(624, 133, '0:05', 2, 5),
(625, 132, '0:16', 3, 16),
(626, 135, '0:17', 4, 17),
(627, 136, '0:24', 5, 24),
(628, 137, '0:29', 6, 29),
(629, 132, '0:34', 7, 34),
(630, 137, '0:45', 8, 45),
(631, 136, '0:48', 9, 48),
(632, 135, '0:49', 10, 49),
(633, 132, '1:01', 11, 61),
(634, 138, '1:05', 12, 65),
(635, 136, '1:11', 13, 71),
(636, 135, '1:16', 14, 76),
(637, 137, '1:17', 15, 77),
(638, 132, '1:19', 16, 79),
(639, 136, '1:32', 17, 92),
(640, 135, '1:34', 18, 94),
(641, 133, '1:43', 19, 103),
(642, 133, '1:43', 20, 103),
(643, 139, '2:26', 21, 146),
(644, 140, '2:32', 22, 152),
(645, 141, '2:36', 23, 156),
(646, 142, '2:58', 24, 178),
(647, 139, '3:09', 25, 189),
(648, 140, '3:15', 26, 195),
(649, 141, '3:36', 27, 216),
(650, 142, '3:37', 28, 217),
(651, 139, '3:44', 29, 224),
(652, 140, '3:53', 30, 233),
(653, 143, '4:21', 31, 261),
(654, 142, '4:27', 32, 267),
(655, 144, '4:37', 33, 277),
(656, 141, '4:42', 34, 282),
(657, 145, '5:05', 35, 305),
(658, 143, '5:22', 36, 322),
(659, 142, '5:28', 37, 328),
(660, 141, '5:43', 38, 343),
(661, 145, '6:22', 39, 382),
(662, 144, '6:28', 40, 388),
(663, 141, '6:44', 41, 404);

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
-- Table structure for table `custom_timers`
--

CREATE TABLE `custom_timers` (
  `id` int(10) UNSIGNED NOT NULL,
  `boss_id` int(10) UNSIGNED NOT NULL DEFAULT 4,
  `plan_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 2,
  `spell_id` tinyint(3) UNSIGNED NOT NULL,
  `stamp` varchar(5) NOT NULL,
  `timer` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `custom_timers`
--

INSERT INTO `custom_timers` (`id`, `boss_id`, `plan_id`, `spell_id`, `stamp`, `timer`) VALUES
(1, 4, 2, 8, '00:11', 11),
(2, 4, 2, 7, '1:11', 71);

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `spec_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `name` varchar(25) NOT NULL,
  `color` varchar(12) NOT NULL DEFAULT 'cfffefefe'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `spec_id`, `name`, `color`) VALUES
(1, 2, 'Akumai', 'cfffefefe'),
(2, 1, 'Solziege', 'cfffef');

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
-- Table structure for table `specs`
--

CREATE TABLE `specs` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `specs`
--

INSERT INTO `specs` (`id`, `title`) VALUES
(2, 'Discipline Priest'),
(1, 'Holy Paladin'),
(3, 'Holy Priest'),
(6, 'Mistweaver'),
(5, 'Resto Druid'),
(4, 'Resto Shaman');

-- --------------------------------------------------------

--
-- Table structure for table `spells`
--

CREATE TABLE `spells` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `spec_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `title` varchar(20) NOT NULL,
  `friendly_spell_id` varchar(12) NOT NULL,
  `filename` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `spells`
--

INSERT INTO `spells` (`id`, `spec_id`, `title`, `friendly_spell_id`, `filename`) VALUES
(1, 2, 'Evangelism', '246287', 'evangelism'),
(2, 2, 'Rupture', '47536', ''),
(3, 2, 'Ultimate Penitence', '421453', 'uppies'),
(4, 2, 'PW:Barrier', '', ''),
(5, 1, 'Aura Mastery', '31821', 'am'),
(6, 1, 'Divine Toll', '304971', 'dt'),
(7, 1, 'Daybreak', '414176', 'day'),
(8, 1, 'Tyrs Deliverance', '200652', 'tyr'),
(9, 1, 'Beacon of Virtue', '200025', 'bov'),
(10, 1, 'Beacon of Light', '', 'bol');

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
-- Indexes for table `custom_timers`
--
ALTER TABLE `custom_timers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `boss_id` (`boss_id`),
  ADD KEY `spell_id` (`spell_id`),
  ADD KEY `plan_id` (`plan_id`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `spec_id` (`spec_id`);

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
-- Indexes for table `specs`
--
ALTER TABLE `specs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Indexes for table `spells`
--
ALTER TABLE `spells`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD KEY `spec_id` (`spec_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `bosses`
--
ALTER TABLE `bosses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `boss_abilities`
--
ALTER TABLE `boss_abilities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `boss_timing`
--
ALTER TABLE `boss_timing`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=664;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_timers`
--
ALTER TABLE `custom_timers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- AUTO_INCREMENT for table `specs`
--
ALTER TABLE `specs`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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

--
-- Constraints for table `custom_timers`
--
ALTER TABLE `custom_timers`
  ADD CONSTRAINT `custom_timers_ibfk_1` FOREIGN KEY (`boss_id`) REFERENCES `bosses` (`id`),
  ADD CONSTRAINT `custom_timers_ibfk_2` FOREIGN KEY (`spell_id`) REFERENCES `spells` (`id`),
  ADD CONSTRAINT `custom_timers_ibfk_3` FOREIGN KEY (`plan_id`) REFERENCES `raid_plans` (`id`);

--
-- Constraints for table `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`spec_id`) REFERENCES `specs` (`id`);

--
-- Constraints for table `spells`
--
ALTER TABLE `spells`
  ADD CONSTRAINT `spells_ibfk_1` FOREIGN KEY (`spec_id`) REFERENCES `specs` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
