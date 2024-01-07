-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2024 at 08:04 AM
-- Server version: 8.0.35
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
-- Table structure for table `bosses`
--

CREATE TABLE `bosses` (
  `id` int UNSIGNED NOT NULL,
  `raid_id` tinyint UNSIGNED NOT NULL DEFAULT '3',
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
  `id` int UNSIGNED NOT NULL,
  `boss_id` int UNSIGNED NOT NULL DEFAULT '1',
  `short_title` varchar(45) NOT NULL,
  `full_name` varchar(45) NOT NULL,
  `enemy_spell_id` varchar(15) NOT NULL,
  `enemy_color` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
(31, 8, 'Falling Star', 'Falling Star', '424580', ''),
(32, 8, 'Mass Entanglement', 'Mass Entanglement', '424495', 'cffFF8000'),
(33, 8, 'Blazing Mushroom', 'Blazing Mushroom', '423260', ''),
(34, 8, 'Fiery Growth', 'Fiery Growth', '424581', ''),
(35, 8, 'Incarnation: Moonkin', 'Incarnation: Moonkin', '', 'cff8B4513'),
(36, 8, ' Fire Beam', ' Fire Beam', '423649', ''),
(37, 8, ' Supernova', ' Supernova', '424140', ''),
(38, 8, 'Incarnation: Tree of Flame', 'Incarnation: Tree of Flame', '430584', 'cff8B4513'),
(39, 8, 'Flaming Germination', 'Flaming Germination', '', ''),
(40, 8, 'Typhoon', 'Typhoon', '', ''),
(41, 9, 'Wildfire', 'Wildfire', '420422', ''),
(42, 9, 'Dream Rend', 'Dream Rend', '417455', ''),
(43, 9, 'Incarnate', 'Incarnate', '412761', ''),
(44, 9, 'Corrupt', 'Corrupt', '419144', ''),
(46, 9, 'Flamefall', 'Flamefall', '419123', ''),
(47, 9, ' Lifeforce Barrier', ' Lifeforce Barrier', '', ''),
(48, 9, 'Shadowflame Devastation', 'Shadowflame Devastation', '422524', ''),
(49, 9, 'Eternal Firestorm', 'Eternal Firestorm', '419060', ''),
(50, 9, 'Apocalypse Roar', 'Apocalypse Roar', 'enemy_spell_id', ''),
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
-- Table structure for table `custom_timers`
--

CREATE TABLE `custom_timers` (
  `id` int UNSIGNED NOT NULL,
  `boss_id` int UNSIGNED NOT NULL DEFAULT '9',
  `plan_id` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `spell_id` tinyint UNSIGNED NOT NULL,
  `boss_spell_id` int UNSIGNED NOT NULL DEFAULT '0',
  `boss_spell_name` varchar(45) NOT NULL,
  `stamp` varchar(5) NOT NULL,
  `timer` smallint UNSIGNED NOT NULL,
  `priority` tinyint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `custom_timers`
--

INSERT INTO `custom_timers` (`id`, `boss_id`, `plan_id`, `spell_id`, `boss_spell_id`, `boss_spell_name`, `stamp`, `timer`, `priority`) VALUES
(1, 4, 2, 8, 1, '', '00:11', 11, 1),
(2, 4, 2, 7, 1, '', '1:11', 71, 1),
(3, 7, 2, 12, 1, '', '0:14', 14, 1),
(4, 7, 2, 12, 1, '', '2:14', 134, 1),
(5, 7, 2, 7, 1, '', '1:10', 70, 1),
(6, 7, 2, 6, 1, '', '1:11', 71, 1),
(7, 7, 2, 7, 1, '', '2:24', 144, 1),
(8, 7, 2, 6, 1, '', '2:25', 145, 1),
(9, 7, 2, 7, 1, '', '2:45', 165, 1),
(10, 7, 2, 6, 1, '', '2:46', 166, 1),
(11, 7, 2, 7, 1, '', '4:23', 263, 1),
(12, 7, 2, 6, 1, '', '4:24', 264, 1),
(13, 9, 2, 6, 1, '', '00:07', 7, 1),
(14, 9, 2, 7, 1, '', '00:08', 8, 1),
(15, 9, 2, 9, 1, '', '00:09', 9, 1),
(16, 9, 2, 7, 1, '', '01:22', 82, 1),
(17, 9, 2, 9, 1, '', '01:24', 84, 1),
(21, 9, 1, 1, 1, '', '00:14', 14, 1),
(22, 9, 1, 2, 1, '', '00:34', 34, 1),
(23, 9, 1, 3, 1, '', '00:49', 49, 1),
(24, 9, 1, 1, 1, '', '01:45', 105, 1),
(25, 9, 1, 2, 1, '', '02:15', 135, 1),
(26, 9, 1, 1, 1, '', '03:25', 205, 1),
(27, 9, 1, 2, 1, '', '03:55', 235, 1),
(28, 9, 1, 3, 1, '', '04:13', 253, 1),
(29, 9, 1, 1, 1, '', '05:04', 304, 1),
(30, 9, 1, 2, 1, '', '05:35', 335, 1),
(31, 9, 1, 1, 1, '', '06:35', 395, 1),
(32, 9, 1, 2, 1, '', '07:08', 428, 1),
(33, 9, 1, 3, 1, '', '07:23', 443, 1),
(35, 8, 1, 1, 32, 'Roots', '00:16', 16, 1),
(36, 8, 1, 2, 35, 'Roots', '00:56', 56, 1),
(37, 8, 1, 4, 35, 'Roots', '02:35', 155, 1),
(38, 8, 1, 14, 37, 'Mini Ramp supernova', '02:06', 126, 1),
(40, 8, 1, 1, 38, 'Seeds', '03:07', 187, 1),
(41, 8, 1, 3, 38, 'Seeds', '03:07', 187, 2),
(42, 8, 1, 1, 32, 'Roots', '03:23', 203, 1),
(43, 8, 1, 2, 38, 'Seeds', '03:55', 235, 1),
(44, 8, 1, 14, 37, 'Mini Ramp supernova', '04:42', 282, 1),
(45, 8, 1, 1, 38, 'Seeds', '05:57', 357, 1),
(46, 8, 1, 2, 38, 'Seeds', '07:01', 421, 1),
(47, 8, 1, 1, 38, 'Seeds', '08:03', 483, 1),
(48, 8, 1, 3, 38, 'Seeds', '08:03', 483, 2);

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` tinyint UNSIGNED NOT NULL,
  `spec_id` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `name` varchar(25) NOT NULL,
  `color` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'cfffefefe'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `spec_id`, `name`, `color`) VALUES
(1, 2, 'Akumai', 'cfffefefe'),
(2, 1, 'Solziege', 'cfff38bb9');

-- --------------------------------------------------------

--
-- Table structure for table `raids`
--

CREATE TABLE `raids` (
  `id` tinyint UNSIGNED NOT NULL,
  `title` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
  `id` tinyint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `raid_plans`
--

INSERT INTO `raid_plans` (`id`, `title`) VALUES
(1, 'Discipline Priest Amidrassil'),
(2, 'Holy Paladin Amirdrassil');

-- --------------------------------------------------------

--
-- Table structure for table `specs`
--

CREATE TABLE `specs` (
  `id` tinyint UNSIGNED NOT NULL,
  `title` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
  `id` tinyint UNSIGNED NOT NULL,
  `spec_id` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `title` varchar(20) NOT NULL,
  `friendly_spell_id` varchar(12) NOT NULL,
  `filename` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `spells`
--

INSERT INTO `spells` (`id`, `spec_id`, `title`, `friendly_spell_id`, `filename`) VALUES
(1, 2, 'Evangelism', '246287', 'evangelism'),
(2, 2, 'Rapture', '47536', 'holy_rapture'),
(3, 2, 'Ultimate Penitence', '421453', 'uppies'),
(4, 2, 'PW:Barrier', '62618', 'pw_barrier'),
(5, 1, 'Aura Mastery', '31821', 'am'),
(6, 1, 'Divine Toll', '304971', 'dt'),
(7, 1, 'Daybreak', '414176', 'day'),
(8, 1, 'Tyrs Deliverance', '200652', 'tyr'),
(9, 1, 'Beacon of Virtue', '200025', 'bov'),
(10, 1, 'Beacon of Light', '', 'bol'),
(11, 1, 'Divine Steed', '190784', 'holy_pony'),
(12, 1, 'Avenging Wrath', '31884', 'wings'),
(13, 2, 'Shadowfiend', '34433', 'sfiend'),
(14, 2, 'PW:Radiance', '194509', 'pw_radiance');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `custom_timers`
--
ALTER TABLE `custom_timers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `boss_id` (`boss_id`),
  ADD KEY `spell_id` (`spell_id`),
  ADD KEY `plan_id` (`plan_id`),
  ADD KEY `boss_spell_id` (`boss_spell_id`);

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
-- AUTO_INCREMENT for table `bosses`
--
ALTER TABLE `bosses`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `boss_abilities`
--
ALTER TABLE `boss_abilities`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `custom_timers`
--
ALTER TABLE `custom_timers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` tinyint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `raids`
--
ALTER TABLE `raids`
  MODIFY `id` tinyint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `raid_plans`
--
ALTER TABLE `raid_plans`
  MODIFY `id` tinyint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `specs`
--
ALTER TABLE `specs`
  MODIFY `id` tinyint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `spells`
--
ALTER TABLE `spells`
  MODIFY `id` tinyint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

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
-- Constraints for table `custom_timers`
--
ALTER TABLE `custom_timers`
  ADD CONSTRAINT `custom_timers_ibfk_1` FOREIGN KEY (`boss_id`) REFERENCES `bosses` (`id`),
  ADD CONSTRAINT `custom_timers_ibfk_2` FOREIGN KEY (`spell_id`) REFERENCES `spells` (`id`),
  ADD CONSTRAINT `custom_timers_ibfk_3` FOREIGN KEY (`plan_id`) REFERENCES `raid_plans` (`id`),
  ADD CONSTRAINT `custom_timers_ibfk_4` FOREIGN KEY (`boss_spell_id`) REFERENCES `boss_abilities` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

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
