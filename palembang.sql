-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 08, 2018 at 02:27 PM
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
-- Table structure for table `tbl_dinas`
--

CREATE TABLE `tbl_dinas` (
  `id` int(11) NOT NULL,
  `dinas` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_dinas`
--

INSERT INTO `tbl_dinas` (`id`, `dinas`) VALUES
(1, 'Dinas Pendidikan'),
(2, 'Dinas Perikanan'),
(3, 'Dinas Kehutanan'),
(4, 'sayaaang'),
(5, 'sayaaang'),
(6, 'sayaaang'),
(7, 'sayaaang'),
(8, 'sayaaang'),
(9, 'sayaaang'),
(10, 'sayaaang'),
(11, 'sayaaang'),
(12, 'sayaaang'),
(13, 'sayaaang'),
(14, 'sayaaang'),
(15, 'sayaaang'),
(16, 'sayaaang'),
(17, 'sayaaang'),
(18, 'sayaaang'),
(19, 'sayaaang'),
(20, 'sayaaang'),
(21, 'aaa'),
(22, 'aaa');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jenis_pekerjaan`
--

CREATE TABLE `tbl_jenis_pekerjaan` (
  `id` int(11) NOT NULL,
  `jenisPekerjaan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_jenis_pekerjaan`
--

INSERT INTO `tbl_jenis_pekerjaan` (`id`, `jenisPekerjaan`) VALUES
(1, 'Project jalanan'),
(2, 'Project Pembangunan'),
(3, 'Project Kereta'),
(4, 'asdfasdf'),
(5, 'asdfasdf'),
(6, 'asdfasdf'),
(7, 'asdfasdf'),
(8, 'asdfasdf'),
(9, 'asdfasdf'),
(10, 'asdfasdf'),
(11, 'asdfasdf'),
(12, 'asdfasdf'),
(13, 'asdfasdf'),
(14, 'asdfasdf'),
(15, 'asdfasdf'),
(16, 'asdfasdf'),
(17, 'asdfasdf'),
(18, 'asdfasdf'),
(19, 'asdfasdf'),
(20, 'asdfasdf'),
(21, 'asdfasdf'),
(22, 'asdfasdf'),
(23, 'asdfasdf'),
(24, 'asdfasdf'),
(25, 'asdfasdf'),
(26, 'asdfasdf'),
(27, 'asdfasdf');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kecamatan`
--

CREATE TABLE `tbl_kecamatan` (
  `idKec` int(5) NOT NULL,
  `kecamatan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_kecamatan`
--

INSERT INTO `tbl_kecamatan` (`idKec`, `kecamatan`) VALUES
(1, 'ABAD'),
(2, 'BENAKAT'),
(3, 'GELUMBANG'),
(4, 'GUNUNG MEGANG'),
(5, 'KELEKAR'),
(6, 'LAWANG KIDUL');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kelurahan`
--

CREATE TABLE `tbl_kelurahan` (
  `idKel` int(5) NOT NULL,
  `idKec` int(4) NOT NULL,
  `kelurahan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_kelurahan`
--

INSERT INTO `tbl_kelurahan` (`idKel`, `idKec`, `kelurahan`) VALUES
(1, 1, 'BETUNG'),
(2, 1, 'BETUNG BARAT'),
(3, 1, 'KARANG AGUNG'),
(4, 1, 'PENGABUAN'),
(5, 1, 'PERAMBATAN'),
(6, 1, 'TANJUNG KURUNG'),
(7, 2, 'BANAKAT'),
(8, 2, 'HIDUP BARU'),
(9, 2, 'PADANG BINDU'),
(10, 2, 'PAGAR DEWA'),
(11, 2, 'PAGAR JATI'),
(12, 2, 'RAMI PASAI'),
(13, 3, 'BITIS'),
(14, 3, 'GAUNG TELANG'),
(15, 3, 'GELUMBANG'),
(16, 4, 'BANGUN'),
(17, 4, 'BELIMBING'),
(18, 4, 'BERUGO'),
(19, 5, 'EMBACANG KELEKAR'),
(20, 5, 'MENANTI'),
(21, 5, 'MENANTI SELATAN'),
(22, 6, 'DARMO'),
(23, 6, 'KEBAN AGUNG'),
(24, 6, 'LINGGA');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_level`
--

CREATE TABLE `tbl_level` (
  `id` int(2) NOT NULL,
  `nama_level` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_level`
--

INSERT INTO `tbl_level` (`id`, `nama_level`) VALUES
(1, 'MASTER'),
(2, 'ADMIN'),
(3, 'KORNAS');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pesan_broadcast`
--

CREATE TABLE `tbl_pesan_broadcast` (
  `id` int(11) NOT NULL,
  `dari` int(11) NOT NULL,
  `kepada` varchar(100) NOT NULL,
  `enumerator` int(1) NOT NULL,
  `data_entry` int(1) NOT NULL,
  `isi` text NOT NULL,
  `mulai` date NOT NULL,
  `selesai` date NOT NULL,
  `date_entry` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pesan_broadcast`
--

INSERT INTO `tbl_pesan_broadcast` (`id`, `dari`, `kepada`, `enumerator`, `data_entry`, `isi`, `mulai`, `selesai`, `date_entry`) VALUES
(3, 1, '1,2,3', 0, 0, 'asdfasdf', '2018-09-04', '2018-09-24', '2018-09-04 12:36:14');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pesan_khusus`
--

CREATE TABLE `tbl_pesan_khusus` (
  `id` int(11) NOT NULL,
  `dari` int(11) NOT NULL,
  `kepada` int(11) NOT NULL,
  `isi` text NOT NULL,
  `response` int(1) NOT NULL,
  `date_entry` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pesan_khusus`
--

INSERT INTO `tbl_pesan_khusus` (`id`, `dari`, `kepada`, `isi`, `response`, `date_entry`) VALUES
(2, 1, 5, 'hayy', 0, '2018-09-04 14:01:13'),
(3, 1, 3, 'aaa', 0, '2018-09-04 14:02:39'),
(4, 1, 3, 'aaa', 0, '2018-09-04 14:03:45'),
(5, 1, 3, 'asdfasd', 0, '2018-09-04 14:05:26'),
(6, 1, 5, 'asdfasdf', 0, '2018-09-04 14:07:26'),
(7, 1, 3, 'aaaa', 0, '2018-09-04 14:11:25'),
(9, 1, 3, 'sdafsadf', 0, '2018-09-07 00:41:07'),
(10, 6, 1, 'asdfasdf', 0, '2018-09-07 00:43:09'),
(11, 6, 1, 'asdfasdf', 0, '2018-09-07 00:43:25'),
(12, 1, 3, 'asdf', 0, '2018-09-08 16:27:31'),
(13, 1, 3, 'asdf', 0, '2018-09-08 16:27:32'),
(14, 1, 3, 'asdf', 0, '2018-09-08 16:27:32'),
(15, 1, 3, 'asdf', 0, '2018-09-08 16:27:32'),
(16, 1, 3, 'asdf', 0, '2018-09-08 16:27:32'),
(17, 1, 3, 'asdf', 0, '2018-09-08 16:27:33'),
(18, 1, 3, 'asdf', 0, '2018-09-08 16:27:33'),
(19, 1, 3, 'asdf', 0, '2018-09-08 16:27:33'),
(20, 1, 3, 'asdf', 0, '2018-09-08 16:27:33'),
(21, 1, 3, 'asdf', 0, '2018-09-08 16:27:33'),
(22, 1, 3, 'asdf', 0, '2018-09-08 16:27:37'),
(23, 1, 3, 'asdf', 0, '2018-09-08 16:27:37'),
(24, 1, 3, 'asdf', 0, '2018-09-08 16:27:37'),
(25, 1, 3, 'asdf', 0, '2018-09-08 16:27:37'),
(26, 1, 3, 'asdf', 0, '2018-09-08 16:27:37');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_project`
--

CREATE TABLE `tbl_project` (
  `idProject` int(5) NOT NULL,
  `idKec` int(5) NOT NULL,
  `idKel` int(5) NOT NULL,
  `idDinas` int(5) NOT NULL,
  `idJenisPekerjaan` int(5) NOT NULL,
  `idUser` int(5) NOT NULL,
  `ketSurvei` text NOT NULL,
  `gambar1` text NOT NULL,
  `gambar2` text NOT NULL,
  `gambar3` text NOT NULL,
  `persen` int(5) NOT NULL,
  `status` int(5) NOT NULL,
  `mulai` date NOT NULL,
  `selesai` date NOT NULL,
  `dateEntry` date NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_project`
--

INSERT INTO `tbl_project` (`idProject`, `idKec`, `idKel`, `idDinas`, `idJenisPekerjaan`, `idUser`, `ketSurvei`, `gambar1`, `gambar2`, `gambar3`, `persen`, `status`, `mulai`, `selesai`, `dateEntry`, `time`) VALUES
(1, 1, 1, 1, 1, 6, 'bla bla bla', 'survei1.jpg', 'survei2.jpg', 'survei3.jpg', 70, 2, '2018-09-07', '2018-09-15', '2018-09-07', '2018-09-07 00:00:00'),
(2, 1, 1, 1, 1, 6, 'bla bla bla', 'survei1.jpg', 'survei2.jpg', 'survei3.jpg', 70, 2, '2018-09-07', '2018-09-15', '2018-09-07', '2018-09-07 00:00:00'),
(3, 1, 1, 1, 1, 6, 'bla bla bla', 'survei1.jpg', 'survei2.jpg', 'survei3.jpg', 70, 2, '2018-09-07', '2018-09-15', '2018-09-07', '2018-09-07 00:00:00'),
(4, 1, 1, 1, 1, 6, 'bla bla bla', 'survei1.jpg', 'survei2.jpg', 'survei3.jpg', 70, 2, '2018-09-07', '2018-09-15', '2018-09-07', '2018-09-07 00:00:00'),
(5, 1, 1, 1, 1, 6, 'bla bla bla', 'survei1.jpg', 'survei2.jpg', 'survei3.jpg', 70, 2, '2018-09-07', '2018-09-15', '2018-09-07', '2018-09-07 00:00:00'),
(6, 1, 1, 1, 1, 6, 'bla bla bla', 'survei1.jpg', 'survei2.jpg', 'survei3.jpg', 70, 2, '2018-09-07', '2018-09-15', '2018-09-07', '2018-09-07 00:00:00'),
(7, 1, 1, 1, 1, 6, 'bla bla bla', 'survei1.jpg', 'survei2.jpg', 'survei3.jpg', 70, 1, '2018-09-07', '2018-09-15', '2018-09-07', '2018-09-07 00:00:00'),
(8, 1, 1, 1, 1, 6, 'bla bla bla', 'survei1.jpg', 'survei2.jpg', 'survei3.jpg', 70, 1, '2018-09-07', '2018-09-15', '2018-09-07', '2018-09-07 00:00:00'),
(9, 1, 1, 1, 1, 6, 'bla bla bla', 'survei1.jpg', 'survei2.jpg', 'survei3.jpg', 70, 1, '2018-09-07', '2018-09-15', '2018-09-07', '2018-09-07 00:00:00'),
(10, 1, 1, 1, 1, 6, 'bla bla bla', 'survei1.jpg', 'survei2.jpg', 'survei3.jpg', 70, 1, '2018-09-07', '2018-09-15', '2018-09-07', '2018-09-07 00:00:00'),
(11, 1, 1, 1, 1, 6, 'bla bla bla', 'survei1.jpg', 'survei2.jpg', 'survei3.jpg', 70, 1, '2018-09-07', '2018-09-15', '2018-09-07', '2018-09-07 00:00:00'),
(12, 1, 1, 1, 1, 6, 'bla bla bla', 'survei1.jpg', 'survei2.jpg', 'survei3.jpg', 70, 1, '2018-09-07', '2018-09-15', '2018-09-07', '2018-09-07 00:00:00'),
(13, 1, 1, 1, 1, 6, 'bla bla bla', 'survei1.jpg', 'survei2.jpg', 'survei3.jpg', 70, 1, '2018-09-07', '2018-09-15', '2018-09-07', '2018-09-07 00:00:00'),
(14, 1, 1, 1, 1, 6, 'bla bla bla', 'survei1.jpg', 'survei2.jpg', 'survei3.jpg', 70, 1, '2018-09-07', '2018-09-15', '2018-09-07', '2018-09-07 00:00:00'),
(15, 1, 1, 1, 1, 6, 'bla bla bla', 'survei1.jpg', 'survei2.jpg', 'survei3.jpg', 70, 1, '2018-09-07', '2018-09-15', '2018-09-07', '2018-09-07 00:00:00'),
(16, 1, 1, 1, 1, 6, 'bla bla bla', 'survei1.jpg', 'survei2.jpg', 'survei3.jpg', 70, 1, '2018-09-07', '2018-09-15', '2018-09-07', '2018-09-07 00:00:00'),
(17, 1, 1, 1, 1, 6, 'bla bla bla', 'survei1.jpg', 'survei2.jpg', 'survei3.jpg', 70, 1, '2018-09-07', '2018-09-15', '2018-09-07', '2018-09-07 00:00:00'),
(18, 1, 1, 1, 1, 6, 'bla bla bla', 'survei1.jpg', 'survei2.jpg', 'survei3.jpg', 70, 1, '2018-09-07', '2018-09-15', '2018-09-07', '2018-09-07 00:00:00'),
(19, 1, 1, 1, 1, 6, 'bla bla bla', 'survei1.jpg', 'survei2.jpg', 'survei3.jpg', 70, 1, '2018-09-07', '2018-09-15', '2018-09-07', '2018-09-07 00:00:00'),
(20, 1, 1, 1, 1, 6, 'bla bla bla', 'survei1.jpg', 'survei2.jpg', 'survei3.jpg', 70, 1, '2018-09-07', '2018-09-15', '2018-09-07', '2018-09-07 00:00:00'),
(21, 1, 1, 1, 1, 6, 'bla bla bla', 'survei1.jpg', 'survei2.jpg', 'survei3.jpg', 70, 1, '2018-09-07', '2018-09-15', '2018-09-07', '2018-09-07 00:00:00'),
(22, 1, 1, 1, 1, 6, 'bla bla bla', 'survei1.jpg', 'survei2.jpg', 'survei3.jpg', 70, 3, '2018-09-07', '2018-09-15', '2018-09-07', '2018-09-07 00:00:00'),
(23, 1, 1, 1, 1, 6, 'bla bla bla', 'survei1.jpg', 'survei2.jpg', 'survei3.jpg', 70, 3, '2018-09-07', '2018-09-15', '2018-09-07', '2018-09-07 00:00:00'),
(24, 1, 1, 1, 1, 6, 'bla bla bla', 'survei1.jpg', 'survei2.jpg', 'survei3.jpg', 70, 3, '2018-09-07', '2018-09-15', '2018-09-07', '2018-09-07 00:00:00'),
(25, 1, 1, 1, 1, 6, 'bla bla bla', 'survei1.jpg', 'survei2.jpg', 'survei3.jpg', 70, 3, '2018-09-07', '2018-09-15', '2018-09-07', '2018-09-07 00:00:00'),
(26, 1, 1, 1, 1, 6, 'bla bla bla', 'survei1.jpg', 'survei2.jpg', 'survei3.jpg', 70, 3, '2018-09-07', '2018-09-15', '2018-09-07', '2018-09-07 00:00:00'),
(27, 1, 1, 1, 1, 6, 'bla bla bla', 'survei1.jpg', 'survei2.jpg', 'survei3.jpg', 70, 3, '2018-09-07', '2018-09-15', '2018-09-07', '2018-09-07 00:00:00'),
(28, 1, 1, 1, 1, 6, 'bla bla bla', 'survei1.jpg', 'survei2.jpg', 'survei3.jpg', 70, 3, '2018-09-07', '2018-09-15', '2018-09-07', '2018-09-07 00:00:00'),
(29, 1, 1, 1, 1, 6, 'bla bla bla', 'survei1.jpg', 'survei2.jpg', 'survei3.jpg', 70, 3, '2018-09-07', '2018-09-15', '2018-09-07', '2018-09-07 00:00:00'),
(30, 1, 1, 1, 1, 6, 'bla bla bla', 'survei1.jpg', 'survei2.jpg', 'survei3.jpg', 70, 3, '2018-09-07', '2018-09-15', '2018-09-07', '2018-09-07 00:00:00'),
(31, 1, 1, 1, 1, 6, 'bla bla bla', 'survei1.jpg', 'survei2.jpg', 'survei3.jpg', 70, 3, '2018-09-07', '2018-09-15', '2018-09-07', '2018-09-07 00:00:00'),
(32, 1, 1, 1, 1, 6, 'bla bla bla', 'survei1.jpg', 'survei2.jpg', 'survei3.jpg', 70, 3, '2018-09-07', '2018-09-15', '2018-09-07', '2018-09-07 00:00:00'),
(33, 1, 1, 1, 1, 6, 'bla bla bla', 'survei1.jpg', 'survei2.jpg', 'survei3.jpg', 70, 3, '2018-09-07', '2018-09-15', '2018-09-07', '2018-09-07 00:00:00'),
(34, 1, 1, 1, 1, 6, 'bla bla bla', 'survei1.jpg', 'survei2.jpg', 'survei3.jpg', 70, 3, '2018-09-07', '2018-09-15', '2018-09-07', '2018-09-07 00:00:00'),
(35, 1, 1, 1, 1, 6, 'bla bla bla', 'survei1.jpg', 'survei2.jpg', 'survei3.jpg', 70, 3, '2018-09-07', '2018-09-15', '2018-09-07', '2018-09-07 00:00:00'),
(36, 1, 1, 1, 1, 6, 'bla bla bla', 'survei1.jpg', 'survei2.jpg', 'survei3.jpg', 70, 3, '2018-09-07', '2018-09-15', '2018-09-07', '2018-09-07 00:00:00'),
(37, 1, 1, 1, 1, 6, 'bla bla bla', 'survei1.jpg', 'survei2.jpg', 'survei3.jpg', 70, 3, '2018-09-07', '2018-09-15', '2018-09-07', '2018-09-07 00:00:00'),
(38, 1, 1, 1, 1, 6, 'bla bla bla', 'survei1.jpg', 'survei2.jpg', 'survei3.jpg', 70, 3, '2018-09-07', '2018-09-15', '2018-09-07', '2018-09-07 00:00:00'),
(39, 1, 1, 1, 1, 6, 'bla bla bla', 'survei1.jpg', 'survei2.jpg', 'survei3.jpg', 70, 3, '2018-09-07', '2018-09-15', '2018-09-07', '2018-09-07 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_project_history`
--

CREATE TABLE `tbl_project_history` (
  `idProjectHistory` int(5) NOT NULL,
  `idProject` int(5) NOT NULL,
  `idKec` int(5) NOT NULL,
  `idKel` int(5) NOT NULL,
  `idDinas` int(5) NOT NULL,
  `idJenisPekerjaan` int(5) NOT NULL,
  `idUser` int(5) NOT NULL,
  `ketSurvei` text NOT NULL,
  `gambar1` text NOT NULL,
  `gambar2` text NOT NULL,
  `gambar3` text NOT NULL,
  `persen` int(5) NOT NULL,
  `dateEntry` date NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_status`
--

CREATE TABLE `tbl_status` (
  `id` int(5) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_status`
--

INSERT INTO `tbl_status` (`id`, `status`) VALUES
(1, 'FINISH'),
(2, 'ON PROGRESS'),
(3, 'OVERDU');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `level` int(1) NOT NULL,
  `kornas` varchar(225) NOT NULL,
  `id_prov` char(3) NOT NULL,
  `korwil` varchar(225) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(225) NOT NULL,
  `last_access` datetime NOT NULL,
  `date_entry` datetime NOT NULL,
  `date_update` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `nama`, `no_telp`, `email`, `level`, `kornas`, `id_prov`, `korwil`, `username`, `password`, `last_access`, `date_entry`, `date_update`) VALUES
(1, 'Kians Azizatikarna', '089611711597', 'kians_7fold@yahoo.com', 1, '', '', '', 'master', '121cc7e9d998dbea5fb9f00b75484aa9f7627240', '2018-09-07 11:13:45', '2018-09-04 11:14:16', '0000-00-00 00:00:00'),
(3, 'admin', '0000', 'admin@gmail.com', 2, '', '', '', 'admin', '7b2e9f54cdff413fcde01f330af6896c3cd7e6cd', '2018-09-06 05:43:26', '2018-09-04 11:50:43', '0000-00-00 00:00:00'),
(6, 'audit', '00000', 'audit@gmail.com', 2, '', '', '', 'audit', '48540491b5faaae678d275257ee06e7296a8d9d2', '2018-09-07 11:11:22', '2018-09-06 10:45:00', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_dinas`
--
ALTER TABLE `tbl_dinas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_jenis_pekerjaan`
--
ALTER TABLE `tbl_jenis_pekerjaan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_kecamatan`
--
ALTER TABLE `tbl_kecamatan`
  ADD PRIMARY KEY (`idKec`);

--
-- Indexes for table `tbl_kelurahan`
--
ALTER TABLE `tbl_kelurahan`
  ADD PRIMARY KEY (`idKel`);

--
-- Indexes for table `tbl_level`
--
ALTER TABLE `tbl_level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_pesan_broadcast`
--
ALTER TABLE `tbl_pesan_broadcast`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_pesan_khusus`
--
ALTER TABLE `tbl_pesan_khusus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_project`
--
ALTER TABLE `tbl_project`
  ADD PRIMARY KEY (`idProject`);

--
-- Indexes for table `tbl_project_history`
--
ALTER TABLE `tbl_project_history`
  ADD PRIMARY KEY (`idProjectHistory`);

--
-- Indexes for table `tbl_status`
--
ALTER TABLE `tbl_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_dinas`
--
ALTER TABLE `tbl_dinas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tbl_jenis_pekerjaan`
--
ALTER TABLE `tbl_jenis_pekerjaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tbl_kecamatan`
--
ALTER TABLE `tbl_kecamatan`
  MODIFY `idKec` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_kelurahan`
--
ALTER TABLE `tbl_kelurahan`
  MODIFY `idKel` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tbl_level`
--
ALTER TABLE `tbl_level`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_pesan_broadcast`
--
ALTER TABLE `tbl_pesan_broadcast`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_pesan_khusus`
--
ALTER TABLE `tbl_pesan_khusus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tbl_project`
--
ALTER TABLE `tbl_project`
  MODIFY `idProject` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `tbl_project_history`
--
ALTER TABLE `tbl_project_history`
  MODIFY `idProjectHistory` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_status`
--
ALTER TABLE `tbl_status`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
