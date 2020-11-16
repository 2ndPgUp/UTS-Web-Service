-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2020 at 05:01 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gamestore`
--

-- --------------------------------------------------------

--
-- Table structure for table `developer`
--

CREATE TABLE `developer` (
  `DeveloperId` int(11) NOT NULL,
  `DeveloperName` varchar(100) NOT NULL,
  `DeveloperLocation` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `developer`
--

INSERT INTO `developer` (`DeveloperId`, `DeveloperName`, `DeveloperLocation`) VALUES
(1, 'Electronic Arts(EA)', 'California, US'),
(2, 'Ubisoft', 'Paris, France'),
(3, 'Nintendo', 'Washington, US'),
(4, 'Sony Interactive Entertainment', 'Tokyo, Japan'),
(5, 'Activition Blizzard', 'California, US'),
(6, 'Epic Games', 'North Carolina, US'),
(7, 'Gameloft', 'Paris, France'),
(8, 'Square Enix', 'California, US');

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE `games` (
  `GamesId` int(11) NOT NULL,
  `GamesName` varchar(150) NOT NULL,
  `Year` int(11) NOT NULL,
  `DeveloperId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`GamesId`, `GamesName`, `Year`, `DeveloperId`) VALUES
(5, 'Apex Legends', 2019, 1),
(6, 'Overwatch', 2015, 5),
(7, 'Spiderman: Miles Morales', 2020, 6),
(8, 'Super Smash Bros', 2016, 2),
(9, 'Mario', 2002, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `developer`
--
ALTER TABLE `developer`
  ADD PRIMARY KEY (`DeveloperId`);

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`GamesId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `developer`
--
ALTER TABLE `developer`
  MODIFY `DeveloperId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `GamesId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
