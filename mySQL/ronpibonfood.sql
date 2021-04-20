-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2021 at 09:40 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ronpibonfood`
--

-- --------------------------------------------------------

--
-- Table structure for table `usertable`
--

CREATE TABLE `usertable` (
  `id` int(11) NOT NULL,
  `ChooseType` text NOT NULL,
  `Name` text NOT NULL,
  `User` text NOT NULL,
  `Password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usertable`
--

INSERT INTO `usertable` (`id`, `ChooseType`, `Name`, `User`, `Password`) VALUES
(1, 'chooseType', 'name', 'user', 'password'),
(7, 'User', 'ff1', 'ff1', '123'),
(9, 'User', 'wqqe', 'tt1', '123'),
(10, 'User', 'eqw', 'tt1', 'qwe'),
(11, 'User', 'we', 'tt2', 'wqe'),
(12, 'User', 'tt21', 'tt23', '312'),
(13, 'User', 'qwe', 'rt2', '123'),
(14, 'User', 'qwe', 'rt23', '123'),
(15, 'User', 'qwe', 'rt233', '123'),
(16, 'User', 'qwe', 'rt23322', '123'),
(17, 'User', 'สมมมใจ', 't22', '22'),
(18, 'User', 'wqe', 't2241', '22'),
(19, 'User', 'wqe', 't2241a', '22'),
(20, 'User', 'wqe', 't2241q', '22'),
(21, 'Shop', 'aa', 'aa1', 'aa'),
(22, 'Rider', 'rider', 'rider', '123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `usertable`
--
ALTER TABLE `usertable`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `usertable`
--
ALTER TABLE `usertable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
