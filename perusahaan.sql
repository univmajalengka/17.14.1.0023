-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 23, 2019 at 05:33 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perusahaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensi`
--

CREATE TABLE `absensi` (
  `id_absensi` int(11) NOT NULL,
  `kehadiran` tinyint(4) NOT NULL,
  `tanggal_absen` datetime DEFAULT NULL,
  `id_karyawan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `absensi`
--

INSERT INTO `absensi` (`id_absensi`, `kehadiran`, `tanggal_absen`, `id_karyawan`) VALUES
(1, 1, '2019-06-12 00:00:00', 3),
(2, 2, '2019-06-25 00:00:00', 9);

-- --------------------------------------------------------

--
-- Table structure for table `agama`
--

CREATE TABLE `agama` (
  `id_agama` int(11) NOT NULL,
  `agama` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agama`
--

INSERT INTO `agama` (`id_agama`, `agama`) VALUES
(1, 'Islam'),
(2, 'Kristen'),
(3, 'Hindu'),
(4, 'Budha'),
(5, 'Protestan');

-- --------------------------------------------------------

--
-- Stand-in structure for view `Daftar Absen`
-- (See below for the actual view)
--
CREATE TABLE `Daftar Absen` (
`Tanggal_Absen` datetime
,`Nama_Karyawan` varchar(64)
,`Kehadiran` tinyint(4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `Daftar Karyawan`
-- (See below for the actual view)
--
CREATE TABLE `Daftar Karyawan` (
`Nama_Karyawan` varchar(64)
,`Jenis_Kelamin` varchar(10)
,`Pernikahan` varchar(8)
,`Agama` varchar(16)
,`Jabatan` varchar(16)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `Daftar Lembur`
-- (See below for the actual view)
--
CREATE TABLE `Daftar Lembur` (
`Tanggal_Lembur` datetime
,`Nama_Karyawan` varchar(64)
,`Uang_Lembur` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `gaji`
--

CREATE TABLE `gaji` (
  `id_gaji` int(11) NOT NULL,
  `jabatan` varchar(16) NOT NULL,
  `gaji_pokok` int(11) NOT NULL,
  `uang_makan` int(11) NOT NULL,
  `dibuat-pada` datetime NOT NULL,
  `dirubah-pada` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gaji`
--

INSERT INTO `gaji` (`id_gaji`, `jabatan`, `gaji_pokok`, `uang_makan`, `dibuat-pada`, `dirubah-pada`) VALUES
(1, 'Staff', 3000000, 100000, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Manager', 6000000, 250000, '0000-00-00 00:00:00', NULL),
(3, 'General Manager', 1000000, 500000, '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `id_karyawan` int(11) NOT NULL,
  `username` varchar(64) NOT NULL,
  `email` varchar(128) DEFAULT NULL,
  `password` varchar(64) NOT NULL,
  `nama` varchar(64) NOT NULL,
  `tempat_lahir` varchar(32) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `pendidikan_terakhir` varchar(64) NOT NULL,
  `no_telepon` varchar(16) NOT NULL,
  `alamat` varchar(45) NOT NULL,
  `dibuat-pada` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dirubah-pada` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_gaji` int(11) NOT NULL COMMENT '1 = Staff | 2 = Manager | 3 = General Manager',
  `id_agama` int(11) NOT NULL COMMENT '1 = Islam | 2 = Kristen | 3 = Hindu | 4 = Budha | 5 = Protestan',
  `id_kelamin` int(11) NOT NULL COMMENT '1 = Laki-laki | 2 = Perempuan',
  `id_status` int(11) NOT NULL COMMENT '1 = Lajang | 2 = Kawin | 3 = Cerai -> Laki-laki = Duda && Perempuan = Janda |'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`id_karyawan`, `username`, `email`, `password`, `nama`, `tempat_lahir`, `tanggal_lahir`, `pendidikan_terakhir`, `no_telepon`, `alamat`, `dibuat-pada`, `dirubah-pada`, `id_gaji`, `id_agama`, `id_kelamin`, `id_status`) VALUES
(1, 'amran', 'amrand24@gmail.com', 'de32fb5e98b43a2d36581598d842277e', 'Mochamad Amran', 'Majalengka', '1999-06-12', 'SD Sederajat', '081674876XXX', 'Kadipaten', '2019-06-23 20:30:28', '2019-06-23 20:30:28', 2, 1, 1, 1),
(2, 'fikri', 'fikri@gmail.com', 'd3ccb844ac68bc324e6c95e94c05e477', 'Fikri Anugrah', 'Majalengka', '1997-06-18', 'TK Belum Lulus', '081876567XXX', 'Jalan Olahraga', '2019-06-23 20:30:28', '2019-06-23 20:31:02', 3, 1, 1, 1),
(3, 'gilar', 'gilar.try@gmail.com', '080f651e3fcca17df3a47c2cecfcb880', 'Gilar Try Yuga', 'Majalengka', '1999-06-05', 'SD Keluar', '081903111XXX', 'Jadi Tujuh', '2019-06-23 20:45:39', '2019-06-23 20:45:39', 1, 1, 1, 2),
(4, 'ahmad', 'ahmad.taufik@gmail.com', 'd4305d7ed2ec97107cd6eb8dd4b6f6b7', 'Ahmad Taufik', 'Majalengka', '1996-06-18', 'SMP Sederajat', '089124431XXX', 'Kadipaten Kakulon Pohodeui', '2019-06-23 20:45:39', '2019-06-23 20:45:39', 1, 4, 1, 3),
(5, 'ujang', 'jajang@gmail.com', 'b56b57039c86f8626ece5a1a35f86175', 'Ujang Jajang', 'Majalengka', '2000-06-05', 'SMA Sederajat', '089122456XXX', 'Kasokandel', '2019-06-23 20:45:39', '2019-06-23 20:45:39', 1, 3, 1, 2),
(6, 'ai', 'ia@gmail.com', 'b40788f566d1124a95169068077031a9', 'Ai Ia', 'Maluku', '1997-06-18', 'SMK Kelas 2', '082312678XXX', 'Gunungsari', '2019-06-23 20:45:39', '2019-06-23 20:45:39', 1, 5, 2, 1),
(7, 'stratan', 'zunea@gmail.com', 'edcc709636d71722ac7d4aaae2a9cd0b', 'Stratan Zunea', 'Rusia', '2002-06-03', 'STM Sederajat', '04124678XXX', 'Sepastovel', '2019-06-23 20:45:39', '2019-06-23 20:46:04', 3, 1, 2, 1),
(8, 'dewa', 'dewa19@gmail.com', '1da8f7627159c675a062b32a7f526963', 'Dewa 19', 'Jakarta', '1996-06-04', 'SMA Sederajat', '081264180XXX', 'Jatinangor', '2019-06-23 20:45:39', '2019-06-23 20:45:39', 1, 2, 1, 2),
(9, 'kangen', 'pupus@gmail.com', '465884a3914208c71bd2e27224c38737', 'Kangen Dia', 'Cirebon', '2001-06-03', 'SMP Sederajat', '081348111XXX', 'Salatiga', '2019-06-23 20:45:39', '2019-06-23 20:45:39', 1, 4, 1, 1),
(10, 'drive', 'drive@gmail.com', 'cb366c641ef16e997502ffd7004a5bb3', 'Anji Drive', 'Bandung', '1980-05-07', 'SMA Sederajat', '081348754XXX', 'Bojong Soang', '2019-06-23 20:45:39', '2019-06-23 20:45:39', 2, 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `karyawan_lembur`
--

CREATE TABLE `karyawan_lembur` (
  `id_karyawan` int(11) NOT NULL,
  `id_lembur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `karyawan_lembur`
--

INSERT INTO `karyawan_lembur` (`id_karyawan`, `id_lembur`) VALUES
(1, 2),
(8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kelamin`
--

CREATE TABLE `kelamin` (
  `id_kelamin` int(11) NOT NULL,
  `kelamin` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelamin`
--

INSERT INTO `kelamin` (`id_kelamin`, `kelamin`) VALUES
(1, 'Laki-laki'),
(2, 'Perempuan');

-- --------------------------------------------------------

--
-- Table structure for table `lembur`
--

CREATE TABLE `lembur` (
  `id_lembur` int(11) NOT NULL,
  `uang_lembur` int(11) NOT NULL,
  `tanggal_lembur` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lembur`
--

INSERT INTO `lembur` (`id_lembur`, `uang_lembur`, `tanggal_lembur`) VALUES
(1, 500000, '2019-06-13 00:00:00'),
(2, 7500000, '2019-06-26 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id_status` int(11) NOT NULL,
  `status` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id_status`, `status`) VALUES
(1, 'Lajang'),
(2, 'Kawin'),
(3, 'Cerai');

-- --------------------------------------------------------

--
-- Structure for view `Daftar Absen`
--
DROP TABLE IF EXISTS `Daftar Absen`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `Daftar Absen`  AS  select `a`.`tanggal_absen` AS `Tanggal_Absen`,`b`.`nama` AS `Nama_Karyawan`,`a`.`kehadiran` AS `Kehadiran` from (`absensi` `a` join `karyawan` `b` on((`b`.`id_karyawan` = `a`.`id_karyawan`))) ;

-- --------------------------------------------------------

--
-- Structure for view `Daftar Karyawan`
--
DROP TABLE IF EXISTS `Daftar Karyawan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `Daftar Karyawan`  AS  select `a`.`nama` AS `Nama_Karyawan`,`b`.`kelamin` AS `Jenis_Kelamin`,`c`.`status` AS `Pernikahan`,`d`.`agama` AS `Agama`,`e`.`jabatan` AS `Jabatan` from ((((`karyawan` `a` join `kelamin` `b` on((`b`.`id_kelamin` = `a`.`id_kelamin`))) join `status` `c` on((`c`.`id_status` = `a`.`id_status`))) join `agama` `d` on((`d`.`id_agama` = `a`.`id_agama`))) join `gaji` `e` on((`e`.`id_gaji` = `a`.`id_gaji`))) ;

-- --------------------------------------------------------

--
-- Structure for view `Daftar Lembur`
--
DROP TABLE IF EXISTS `Daftar Lembur`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `Daftar Lembur`  AS  select `c`.`tanggal_lembur` AS `Tanggal_Lembur`,`b`.`nama` AS `Nama_Karyawan`,`c`.`uang_lembur` AS `Uang_Lembur` from ((`karyawan_lembur` `a` join `karyawan` `b` on((`b`.`id_karyawan` = `a`.`id_karyawan`))) join `lembur` `c` on((`c`.`id_lembur` = `a`.`id_lembur`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`id_absensi`),
  ADD KEY `fk_absensi_karyawan1_idx` (`id_karyawan`);

--
-- Indexes for table `agama`
--
ALTER TABLE `agama`
  ADD PRIMARY KEY (`id_agama`);

--
-- Indexes for table `gaji`
--
ALTER TABLE `gaji`
  ADD PRIMARY KEY (`id_gaji`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id_karyawan`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`),
  ADD KEY `fk_karyawan_gaji1_idx` (`id_gaji`),
  ADD KEY `fk_karyawan_status1_idx` (`id_status`),
  ADD KEY `fk_karyawan_agama1_idx` (`id_agama`),
  ADD KEY `fk_karyawan_kelamin1_idx` (`id_kelamin`);

--
-- Indexes for table `karyawan_lembur`
--
ALTER TABLE `karyawan_lembur`
  ADD KEY `fk_karyawan_has_lembur_lembur1_idx` (`id_lembur`),
  ADD KEY `fk_karyawan_has_lembur_karyawan1_idx` (`id_karyawan`);

--
-- Indexes for table `kelamin`
--
ALTER TABLE `kelamin`
  ADD PRIMARY KEY (`id_kelamin`);

--
-- Indexes for table `lembur`
--
ALTER TABLE `lembur`
  ADD PRIMARY KEY (`id_lembur`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id_status`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absensi`
--
ALTER TABLE `absensi`
  MODIFY `id_absensi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `agama`
--
ALTER TABLE `agama`
  MODIFY `id_agama` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `gaji`
--
ALTER TABLE `gaji`
  MODIFY `id_gaji` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id_karyawan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `kelamin`
--
ALTER TABLE `kelamin`
  MODIFY `id_kelamin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lembur`
--
ALTER TABLE `lembur`
  MODIFY `id_lembur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id_status` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absensi`
--
ALTER TABLE `absensi`
  ADD CONSTRAINT `fk_absensi_karyawan1` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id_karyawan`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD CONSTRAINT `fk_karyawan_agama1` FOREIGN KEY (`id_agama`) REFERENCES `agama` (`id_agama`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_karyawan_gaji1` FOREIGN KEY (`id_gaji`) REFERENCES `gaji` (`id_gaji`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_karyawan_kelamin1` FOREIGN KEY (`id_kelamin`) REFERENCES `kelamin` (`id_kelamin`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_karyawan_status1` FOREIGN KEY (`id_status`) REFERENCES `status` (`id_status`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `karyawan_lembur`
--
ALTER TABLE `karyawan_lembur`
  ADD CONSTRAINT `fk_karyawan_has_lembur_karyawan1` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id_karyawan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_karyawan_has_lembur_lembur1` FOREIGN KEY (`id_lembur`) REFERENCES `lembur` (`id_lembur`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
