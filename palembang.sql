-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 09, 2018 at 10:57 PM
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
(2, 'Dinas Pembangunan'),
(3, 'Dinas Parawisata'),
(4, 'Dinas Kelautan'),
(5, 'Dinas Kesehatan');

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
(1, 'Proyek Pembangunan'),
(2, 'Proyek Perdagangan Online'),
(3, 'Proyek Pendidikan Beasiswa'),
(4, 'Proyek Pembangunan Sekolah'),
(5, 'Proyek Alat Alat Kesehatan');

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
-- Table structure for table `tbl_login_failed`
--

CREATE TABLE `tbl_login_failed` (
  `id` int(11) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `try_username` varchar(30) NOT NULL,
  `try_password` varchar(30) NOT NULL,
  `tanggal` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_login_failed`
--

INSERT INTO `tbl_login_failed` (`id`, `ip`, `try_username`, `try_password`, `tanggal`) VALUES
(1, '::1', 'master', 'a', '2018-09-10 02:08:50');

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
(5, 1, '1,2', 0, 0, 'Silahkan di QA', '2018-09-03', '2018-09-25', '2018-09-10 02:48:22');

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
(2, 1, 3, 'hay', 0, '2018-09-10 02:47:11'),
(3, 1, 6, 'hello', 0, '2018-09-10 03:46:18');

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
(3, 4, 16, 1, 1, 1, 'Pembangunan sekolah di daerah Kecamatan Abad Kelurahan Betung', '', '', '', 40, 2, '2018-08-31', '2018-09-10', '2018-09-10', '2018-09-10 02:15:09'),
(4, 4, 16, 1, 1, 1, 'Pembangunan sekolah di daerah Kecamatan Abad Kelurahan Betung', '', '', '', 40, 2, '2018-08-31', '2018-09-10', '2018-09-10', '2018-09-10 02:15:13'),
(5, 4, 16, 1, 1, 1, 'Pembangunan sekolah di daerah Kecamatan Abad Kelurahan Betung', '', '', '', 40, 2, '2018-08-31', '2018-09-10', '2018-09-10', '2018-09-10 02:15:13'),
(6, 6, 23, 2, 1, 1, 'Pembangunan Jembatan TImbang', '', '', '', 40, 2, '2018-08-31', '2018-09-10', '2018-09-10', '2018-09-10 02:15:39'),
(7, 6, 22, 2, 1, 1, 'Pembangunan Jembatan TImbang', '', '', '', 40, 2, '2018-08-31', '2018-09-10', '2018-09-10', '2018-09-10 02:15:41'),
(8, 6, 24, 2, 1, 1, 'Pembangunan Jembatan TImbang', '', '', '', 40, 2, '2018-08-31', '2018-09-10', '2018-09-10', '2018-09-10 02:15:44'),
(9, 5, 24, 2, 1, 1, 'Pembangunan Jembatan TImbang', '', '', '', 40, 2, '2018-08-31', '2018-09-10', '2018-09-10', '2018-09-10 02:15:46'),
(10, 5, 19, 2, 1, 1, 'Pembangunan Jembatan TImbang', '', '', '', 40, 2, '2018-08-31', '2018-09-10', '2018-09-10', '2018-09-10 02:15:48'),
(11, 5, 21, 2, 1, 1, 'Pembangunan Jembatan TImbang', '', '', '', 40, 2, '2018-08-31', '2018-09-10', '2018-09-10', '2018-09-10 02:15:51'),
(12, 3, 14, 3, 1, 1, 'Pembangunan wisata daerah gaung telang', '', '', '', 70, 2, '2018-09-18', '2018-09-27', '2018-09-10', '2018-09-10 02:17:56'),
(13, 3, 14, 3, 1, 1, 'Pembangunan wisata daerah gaung telang', '', '', '', 70, 2, '2018-09-18', '2018-09-27', '2018-09-10', '2018-09-10 02:17:56'),
(14, 3, 14, 3, 1, 1, 'Pembangunan wisata daerah gaung telang', '', '', '', 70, 2, '2018-09-18', '2018-09-27', '2018-09-10', '2018-09-10 02:17:57'),
(15, 3, 14, 3, 1, 1, 'Pembangunan wisata daerah gaung telang', '', '', '', 70, 2, '2018-09-18', '2018-09-27', '2018-09-10', '2018-09-10 02:17:58'),
(16, 3, 14, 3, 1, 1, 'Pembangunan wisata daerah gaung telang', '', '', '', 70, 2, '2018-09-18', '2018-09-27', '2018-09-10', '2018-09-10 02:17:59'),
(19, 2, 7, 2, 2, 1, 'Pembangunan wisata daerah gaung telang', '', '', '', 80, 2, '2018-09-18', '2018-09-27', '2018-09-10', '2018-09-10 03:48:46'),
(21, 1, 1, 4, 1, 1, 'Pembangungan proyek minyak dan gas di daerah lautan', '', '', '', 90, 2, '2018-09-09', '2019-01-03', '2018-09-10', '2018-09-10 03:44:37'),
(23, 3, 13, 5, 5, 1, 'Proyek pembeli alat kesehatan untuk rumah sakit negeri', '', '', '', 30, 2, '2018-09-09', '2018-09-19', '2018-09-10', '2018-09-10 03:47:39'),
(24, 4, 13, 5, 5, 1, 'Proyek pembeli alat kesehatan untuk rumah sakit negeri', '', '', '', 30, 2, '2018-09-09', '2018-09-19', '2018-09-10', '2018-09-10 03:47:45'),
(25, 4, 17, 5, 5, 1, 'Proyek pembeli alat kesehatan untuk rumah sakit negeri', '', '', '', 30, 2, '2018-09-09', '2018-09-19', '2018-09-10', '2018-09-10 03:47:47'),
(26, 2, 12, 5, 5, 1, 'Proyek pembeli alat kesehatan untuk rumah sakit negeri', '', '', '', 50, 2, '2018-09-09', '2018-09-19', '2018-09-10', '2018-09-10 03:48:21');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_project_history`
--

CREATE TABLE `tbl_project_history` (
  `idProjectHistory` int(5) NOT NULL,
  `idProject` int(5) NOT NULL,
  `ketSurvei` text NOT NULL,
  `gambar1` text NOT NULL,
  `gambar2` text NOT NULL,
  `gambar3` text NOT NULL,
  `persentase` int(5) NOT NULL,
  `dateEntry` date NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_project_history`
--

INSERT INTO `tbl_project_history` (`idProjectHistory`, `idProject`, `ketSurvei`, `gambar1`, `gambar2`, `gambar3`, `persentase`, `dateEntry`, `time`) VALUES
(24, 21, 'Pembangungan proyek minyak dan gas di daerah lautan', '', '', '', 70, '2018-09-10', '2018-09-10 02:50:54'),
(27, 21, 'Pembangungan proyek minyak dan gas di daerah lautan', '', '', '', 80, '2018-09-10', '2018-09-10 03:44:34'),
(28, 21, 'Pembangungan proyek minyak dan gas di daerah lautan', '', '', '', 90, '2018-09-10', '2018-09-10 03:44:37'),
(29, 26, 'Proyek pembeli alat kesehatan untuk rumah sakit negeri', '', '', '', 40, '2018-09-10', '2018-09-10 03:48:18'),
(30, 26, 'Proyek pembeli alat kesehatan untuk rumah sakit negeri', '', '', '', 50, '2018-09-10', '2018-09-10 03:48:21'),
(31, 19, 'Pembangunan wisata daerah gaung telang', '', '', '', 80, '2018-09-10', '2018-09-10 03:48:44');

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
(1, 'Kians Azizatikarna', '089611711597', 'kians_7fold@yahoo.com', 1, '', '', '', 'master', '121cc7e9d998dbea5fb9f00b75484aa9f7627240', '2018-09-09 21:08:47', '2018-09-04 11:14:16', '0000-00-00 00:00:00'),
(3, 'annisa sayban', '0000', 'annisa@gmail.com', 2, '', '', '', 'annisa', 'd2cad9f3070dd165dff2c450ce544cc7a9ec10d5', '2018-09-06 05:43:26', '2018-09-04 11:50:43', '2018-09-10 02:46:59'),
(6, 'Dahlia', '00000', 'audit@gmail.com', 2, '', '', '', 'Dahlia', '93d983122cc9371bd0e86800d68249b37eea34f1', '2018-09-07 11:11:22', '2018-09-06 10:45:00', '2018-09-10 02:20:55'),
(7, 'Faisal Ismawan', '222', 'mail.kianaaaa@gmail.com', 1, '', '', '', 'faisal', '59438e2d004cd3051968605bf935de37e4c90ab7', '0000-00-00 00:00:00', '2018-09-09 23:25:15', '2018-09-10 02:20:13'),
(8, 'Kamal', '2222', 'aaa@gmail.com', 1, '', '', '', 'kamal', '4e00da2bd05698b8728096b5cf26e061b3071b8a', '0000-00-00 00:00:00', '2018-09-10 01:46:29', '2018-09-10 02:20:30'),
(9, 'KOMAR', '0892288118', 'KOMAR@GMAIL.COM', 2, '', '', '', 'komar', '8ce28566038b22ae7042ee8374863bb57e6deee5', '0000-00-00 00:00:00', '2018-09-10 02:46:35', '0000-00-00 00:00:00'),
(10, 'Lala', '0009900', 'lala@gmail.com', 1, '', '', '', 'lalalala', '4f5f1c7efb8f5334fb813a0a3930822a3f985db2', '0000-00-00 00:00:00', '2018-09-10 03:45:51', '2018-09-10 03:46:03');

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
-- Indexes for table `tbl_login_failed`
--
ALTER TABLE `tbl_login_failed`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_jenis_pekerjaan`
--
ALTER TABLE `tbl_jenis_pekerjaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
-- AUTO_INCREMENT for table `tbl_login_failed`
--
ALTER TABLE `tbl_login_failed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_pesan_broadcast`
--
ALTER TABLE `tbl_pesan_broadcast`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_pesan_khusus`
--
ALTER TABLE `tbl_pesan_khusus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_project`
--
ALTER TABLE `tbl_project`
  MODIFY `idProject` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tbl_project_history`
--
ALTER TABLE `tbl_project_history`
  MODIFY `idProjectHistory` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `tbl_status`
--
ALTER TABLE `tbl_status`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
