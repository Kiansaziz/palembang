-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 17, 2018 at 12:41 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.1.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `palembang`
--

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `tgl_upload` date NOT NULL,
  `file_name` varchar(50) NOT NULL,
  `file_size` int(20) NOT NULL,
  `file_type` varchar(5) NOT NULL,
  `idProjectHistory` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `tgl_upload`, `file_name`, `file_size`, `file_type`, `idProjectHistory`) VALUES
(1, '2018-09-17', 'IMG_1304.JPG', 139612, 'JPG', 11),
(2, '2018-09-17', 'IMG_1313.JPG', 160170, 'JPG', 11),
(3, '2018-09-17', 'IMG_1709.JPG', 196157, 'JPG', 11),
(4, '2018-09-17', 'IMG_1709-1.JPG', 196157, 'JPG', 14),
(5, '2018-09-17', 'IMG_1707.JPG', 192068, 'JPG', 14),
(6, '2018-09-17', 'IMG_1704.JPG', 181428, 'JPG', 14),
(7, '2018-09-17', 'IMG_1709-2.JPG', 196157, 'JPG', 14),
(8, '2018-09-17', 'IMG_1709-3.JPG', 196157, 'JPG', 14);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
