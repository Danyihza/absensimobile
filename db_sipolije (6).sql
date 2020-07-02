-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 02, 2020 at 09:14 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sipolije`
--

-- --------------------------------------------------------

--
-- Table structure for table `absen`
--

CREATE TABLE `absen` (
  `id` int(11) NOT NULL,
  `id_pertemuan` varchar(30) NOT NULL,
  `kode_matkul` varchar(10) NOT NULL,
  `nim` varchar(10) NOT NULL,
  `semester_absen` int(1) NOT NULL,
  `golongan_absen` varchar(20) NOT NULL,
  `status` varchar(1) NOT NULL,
  `tanggal_absen` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `absen`
--

INSERT INTO `absen` (`id`, `id_pertemuan`, `kode_matkul`, `nim`, `semester_absen`, `golongan_absen`, `status`, `tanggal_absen`) VALUES
(1, '5ed7423645e95', 'TIF4606', 'E41181930', 4, 'E', 'H', '0000-00-00 00:00:00'),
(2, '5ef4bfaa5cae5', 'TIF4606', 'E41181930', 4, 'E', 'H', '0000-00-00 00:00:00'),
(3, '5ebbf6a9892ce', 'TIF4606', 'E41181930', 4, 'E', 'A', '0000-00-00 00:00:00'),
(4, '5ef8b3f0280af', 'TIF4606', 'E41181930', 4, 'E', 'H', '0000-00-00 00:00:00'),
(5, '5ef8b412454a0', 'TIF4602', 'E41181930', 4, 'E', 'H', '0000-00-00 00:00:00'),
(6, '5ed7423645e95', 'TIF4606', 'E41182006', 4, 'E', 'H', '0000-00-00 00:00:00'),
(7, '5ef4bfaa5cae5', 'TIF4606', 'E41182006', 4, 'E', 'H', '0000-00-00 00:00:00'),
(8, '5ebbf6a9892ce', 'TIF4606', 'E41182006', 4, 'E', 'S', '0000-00-00 00:00:00'),
(9, '5ef8b412454a0', 'TIF4602', 'E41182006', 4, 'E', 'H', '0000-00-00 00:00:00'),
(16, '5ef8b3f0280af', 'TIF4606', 'E41182006', 4, 'E', 'H', '2020-07-02 04:39:36'),
(17, '5efgrty65cts7ds', 'TIF4602', 'E41182006', 4, 'E', 'H', '2020-07-02 04:58:44'),
(18, '5efgrty65cts7ds', 'TIF4602', 'E41182322', 4, 'D', 'H', '2020-07-02 05:01:43');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL,
  `kode_jurusan` varchar(10) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `kode_jurusan`, `password`) VALUES
('1927827217381', 'TI', '81dc9bdb52d04dc20036dbd8313ed055');

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `nip` varchar(50) NOT NULL,
  `password_dosen` varchar(255) NOT NULL,
  `kode_prodi` varchar(10) NOT NULL,
  `nama_dosen` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`nip`, `password_dosen`, `kode_prodi`, `nama_dosen`) VALUES
('19279817821710112', '9cc07d79f881a445e568c2ab58f004f2', 'TIF', 'Ghanesya Hari Murti'),
('197111151998021001', '1f3d561f226326a284fb2216b1f10f2e', 'TIF', 'Adi Heru Utomo'),
('197306172018051001', '3e3c7319379433a59f9854109f1b034f', 'MIF', 'Ely Mulyadi'),
('197405192003121002', '2284d513707660147800797914681e3e', 'TIF', 'Nugroho Setyo Wibowo'),
('197810112005012002', '4b2090751569b0e894d375fc0ee6c12c', 'TIF', 'Elly Antika'),
('198608022015042002', '9f8570872c9054870a1c018c62e2da31', 'TIF', 'Ratih Ayuninghemi'),
('198907102019031010', '7f2968f47d4050b25b6b8e9a7cfe1efb', 'TIF', ' Ery Setiyawan Jullev Atmadji'),
('199112112018031001', '185ccb6d6aea25715fb73a6a91b6b4cc', 'TIF', 'Khafidurrohman Agustianto'),
('199205282018032001', '64d303fa40a70808ccc6b4c49815d4bf', 'TIF', 'Bety Etikasari'),
('199408122019031013', '7862ab0a1bd6f6cee44c7b1177c732ff', 'TIF', ' Mukhamad Angga Gumilang'),
('lukieperdanasari05@gmail.com', '7a5f302bf27da29101da94effbd7144d', 'TIF', 'Lukie Perdanasari');

-- --------------------------------------------------------

--
-- Table structure for table `hari`
--

CREATE TABLE `hari` (
  `kode_hari` int(1) NOT NULL,
  `nama_hari` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hari`
--

INSERT INTO `hari` (`kode_hari`, `nama_hari`) VALUES
(1, 'Senin'),
(2, 'Selasa'),
(3, 'Rabu'),
(4, 'Kamis'),
(5, 'Jumat'),
(6, 'Sabtu'),
(7, 'Minggu');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `kode_jadwal` int(11) NOT NULL,
  `kode_matkul` varchar(10) NOT NULL,
  `kode_waktu` int(11) NOT NULL,
  `kode_hari` int(1) NOT NULL,
  `ruangan` varchar(30) NOT NULL,
  `golongan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`kode_jadwal`, `kode_matkul`, `kode_waktu`, `kode_hari`, `ruangan`, `golongan`) VALUES
(1, 'TIF0271', 2, 3, 'KELAS TI 3.4', 'E'),
(10, 'TIF0272', 8, 2, 'KELAS TI 3.6', 'E'),
(11, 'TIF4602', 9, 4, 'KELAS TI 3.3', 'E'),
(12, 'TIF4606', 3, 4, 'KELAS TI 3.11', 'E'),
(13, 'TIF4607', 2, 2, 'Workshop Komputasi Dan Sistem ', 'E'),
(14, 'TIF4607', 3, 2, 'Workshop Komputasi Dan Sistem ', 'E'),
(15, 'TIF4611', 2, 1, 'Lab Komputasi Sistem Informasi', 'E'),
(16, 'TIF4611', 3, 1, 'Lab Komputasi Sistem Informasi', 'E'),
(17, 'TIF4611', 4, 3, 'KELAS TI 3.9', 'E'),
(18, 'TIF4611', 6, 3, 'KELAS TI 3.9', 'E'),
(19, 'TIF4612', 3, 3, 'KELAS TI 3.12', 'E'),
(20, 'TIF4613', 2, 4, 'KELAS TI 3.11', 'E'),
(21, 'TIF4614', 1, 5, 'Kelas TI 3.10', 'E'),
(22, 'TIF4607', 5, 5, 'Workshop Komputasi Dan Sistem ', 'E'),
(23, 'TIF4607', 7, 5, 'Workshop Komputasi Dan Sistem ', 'E'),
(24, 'TIF0271', 2, 3, 'KELAS TI 3.4', 'D'),
(25, 'TIF4612', 3, 3, 'KELAS TI 3.12', 'D'),
(26, 'TIF4606', 3, 4, 'KELAS TI 3.11', 'D'),
(27, 'TIF4613', 2, 4, 'KELAS TI 3.11', 'D'),
(28, 'TIF4602', 9, 4, 'KELAS TI 3.3', 'D'),
(29, 'TIF3201', 1, 1, 'KELAS TI 3.12', 'E'),
(30, 'TIF3202', 1, 2, 'KELAS TI 3.12', 'E'),
(31, 'TIF3203', 5, 2, 'KELAS TI 3.5', 'E'),
(32, 'TIF3203', 7, 2, 'KELAS TI 3.5', 'E'),
(33, 'MIF3301', 1, 1, 'KELAS TI 3.4', 'E'),
(34, 'MIF4301', 1, 1, 'KELAS TI 3.3', 'E');

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `kode_jurusan` varchar(10) NOT NULL,
  `nama_jurusan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`kode_jurusan`, `nama_jurusan`) VALUES
('KS', 'Kesehatan'),
('TI', 'Teknologi Informasi');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` varchar(9) NOT NULL,
  `kode_prodi` varchar(10) NOT NULL,
  `nama_mahasiswa` varchar(50) NOT NULL,
  `password_mahasiswa` varchar(255) NOT NULL,
  `golongan` varchar(20) NOT NULL,
  `semester` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `kode_prodi`, `nama_mahasiswa`, `password_mahasiswa`, `golongan`, `semester`) VALUES
('E41181212', 'TIF', 'Fahrul Irsyad', 'b4f0dba58efb9c61713db20413ec92e8', 'D', 4),
('E41181930', 'TIF', 'Muhammad Rofiq Hidayatullah', '2e8caa441fb772ecd63219f01fe96459', 'E', 4),
('E41182006', 'TIF', 'Arini Firdausiyah', '4e370e2eedfe67517f4dae110b276ad5', 'E', 4),
('E41182273', 'TIF', 'Aan Nur Shofii', 'e00949ef2a481f115c1cb9b9f6926359', 'E', 4),
('E41182274', 'TIF', 'Mohammad Rizki Yanuarianto', '256cdb89f9f1b39b8d48d942e6f2a92e', 'E', 4),
('E41182322', 'TIF', 'Rendy Wisnu', 'c4ca4238a0b923820dcc509a6f75849b', 'D', 4),
('E41191112', 'TIF', 'Antares', '8dbea8bed1d3b56d2029ae17473d758c', 'A', 2),
('E41192112', 'TIF', 'Sarah Maharani', 'ab7699e967f77ffd0e5aef6aeef6b5ec', 'E', 2),
('M41182627', 'MIF', 'Mikayla Akbar', 'eda542d6f1fe1f835eb831555536892d', 'E', 4);

-- --------------------------------------------------------

--
-- Table structure for table `matkul`
--

CREATE TABLE `matkul` (
  `kode_matkul` varchar(10) NOT NULL,
  `kode_prodi` varchar(10) NOT NULL,
  `nama_matkul` varchar(50) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `semester` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matkul`
--

INSERT INTO `matkul` (`kode_matkul`, `kode_prodi`, `nama_matkul`, `nip`, `semester`) VALUES
('MIF3301', 'MIF', 'Manajemen Dasar Informatika', '197306172018051001', 3),
('MIF4301', 'MIF', 'Manajemen Sistem Informasi', '197306172018051001', 4),
('TIF0271', 'TIF', 'Applied English', '19279817821710112', 4),
('TIF0272', 'TIF', 'Praktek Applied English', '19279817821710112', 4),
('TIF3201', 'TIF', 'Analisis Dan Desain Algoritma', '197405192003121002', 3),
('TIF3202', 'TIF', 'Interaksi Manusia Dan Komputer', '199112112018031001', 3),
('TIF3203', 'TIF', 'Workshop Pengembangan Perangkat Lunak', '199112112018031001', 3),
('TIF4602', 'TIF', 'Kewirausahaan', '197810112005012002', 4),
('TIF4606', 'TIF', 'Sistem Informasi Jasa Berbasis Layanan', '198608022015042002', 4),
('TIF4607', 'TIF', 'Workshop Aplikasi Mobile', '198907102019031010', 4),
('TIF4611', 'TIF', 'Workshop Web Framework', '199112112018031001', 4),
('TIF4612', 'TIF', 'Administrasi Basis Data', '199205282018032001', 4),
('TIF4613', 'TIF', 'Perawatan Perangkat Lunak', '197405192003121002', 4),
('TIF4614', 'TIF', 'Praktek Kewirausahaan', '197810112005012002', 4);

-- --------------------------------------------------------

--
-- Table structure for table `pengajar`
--

CREATE TABLE `pengajar` (
  `pengajar` varchar(50) NOT NULL,
  `kode_matkul` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengajar`
--

INSERT INTO `pengajar` (`pengajar`, `kode_matkul`) VALUES
('lukieperdanasari05@gmail.com', 'TIF4607'),
('199408122019031013', 'TIF4611');

-- --------------------------------------------------------

--
-- Table structure for table `pertemuan`
--

CREATE TABLE `pertemuan` (
  `minggu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pertemuan`
--

INSERT INTO `pertemuan` (`minggu`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16);

-- --------------------------------------------------------

--
-- Table structure for table `prodi`
--

CREATE TABLE `prodi` (
  `kode_prodi` varchar(10) NOT NULL,
  `kode_jurusan` varchar(10) NOT NULL,
  `nama_prodi` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prodi`
--

INSERT INTO `prodi` (`kode_prodi`, `kode_jurusan`, `nama_prodi`) VALUES
('MIF', 'TI', 'Manajemen Informatika'),
('TIF', 'TI', 'Teknik Informatika'),
('TKK', 'TI', 'Teknik Komputer');

-- --------------------------------------------------------

--
-- Table structure for table `qrdata`
--

CREATE TABLE `qrdata` (
  `id` varchar(30) NOT NULL,
  `kode_matkul` varchar(10) NOT NULL,
  `tanggal_pertemuan` datetime NOT NULL,
  `pertemuan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qrdata`
--

INSERT INTO `qrdata` (`id`, `kode_matkul`, `tanggal_pertemuan`, `pertemuan`) VALUES
('5ebbf6a9892ce', 'TIF4606', '0000-00-00 00:00:00', 7),
('5ed7423645e95', 'TIF4606', '0000-00-00 00:00:00', 2),
('5ef4bfaa5cae5', 'TIF4606', '0000-00-00 00:00:00', 3),
('5ef8b3f0280af', 'TIF4606', '2020-06-30 00:00:00', 8),
('5ef8b412454a0', 'TIF4602', '0000-00-00 00:00:00', 9),
('5efgrty65cts7ds', 'TIF4602', '2020-07-01 00:00:30', 10);

-- --------------------------------------------------------

--
-- Stand-in structure for view `rekap_absen`
-- (See below for the actual view)
--
CREATE TABLE `rekap_absen` (
`kode_pertemuan` varchar(30)
,`pertemuan` int(11)
,`nama_matkul` varchar(50)
,`nama_mahasiswa` varchar(50)
,`status` varchar(1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `tampil`
-- (See below for the actual view)
--
CREATE TABLE `tampil` (
`kode_jadwal` int(11)
,`kode_prodi` varchar(10)
,`semester` int(1)
,`golongan` varchar(20)
,`nama_matkul` varchar(50)
,`nama_dosen` varchar(50)
,`waktu_mulai` time
,`waktu_selesai` time
,`ruangan` varchar(30)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `tampil_jadwal`
-- (See below for the actual view)
--
CREATE TABLE `tampil_jadwal` (
`kode_jadwal` int(11)
,`kode_prodi` varchar(10)
,`semester` int(1)
,`golongan` varchar(20)
,`nama_matkul` varchar(50)
,`nama_dosen` varchar(50)
,`nama_hari` varchar(9)
,`waktu_mulai` time
,`waktu_selesai` time
,`ruangan` varchar(30)
);

-- --------------------------------------------------------

--
-- Table structure for table `waktu`
--

CREATE TABLE `waktu` (
  `kode_waktu` int(11) NOT NULL,
  `waktu_mulai` time NOT NULL,
  `waktu_selesai` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `waktu`
--

INSERT INTO `waktu` (`kode_waktu`, `waktu_mulai`, `waktu_selesai`) VALUES
(1, '07:00:00', '09:00:00'),
(2, '07:30:00', '09:30:00'),
(3, '09:30:00', '11:30:00'),
(4, '12:30:00', '14:30:00'),
(5, '13:00:00', '15:00:00'),
(6, '14:30:00', '16:30:00'),
(7, '15:00:00', '17:00:00'),
(8, '18:00:00', '20:00:00'),
(9, '12:30:00', '13:30:00');

-- --------------------------------------------------------

--
-- Structure for view `rekap_absen`
--
DROP TABLE IF EXISTS `rekap_absen`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rekap_absen`  AS  select `absen`.`id_pertemuan` AS `kode_pertemuan`,`qrdata`.`pertemuan` AS `pertemuan`,`matkul`.`nama_matkul` AS `nama_matkul`,`mahasiswa`.`nama_mahasiswa` AS `nama_mahasiswa`,`absen`.`status` AS `status` from (((`absen` join `matkul`) join `mahasiswa`) join `qrdata`) where ((`absen`.`kode_matkul` = `matkul`.`kode_matkul`) and (`absen`.`nim` = `mahasiswa`.`nim`) and (`absen`.`id_pertemuan` = `qrdata`.`id`)) order by `qrdata`.`pertemuan` ;

-- --------------------------------------------------------

--
-- Structure for view `tampil`
--
DROP TABLE IF EXISTS `tampil`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tampil`  AS  select `jadwal`.`kode_jadwal` AS `kode_jadwal`,`matkul`.`kode_prodi` AS `kode_prodi`,`matkul`.`semester` AS `semester`,`jadwal`.`golongan` AS `golongan`,`matkul`.`nama_matkul` AS `nama_matkul`,`dosen`.`nama_dosen` AS `nama_dosen`,`waktu`.`waktu_mulai` AS `waktu_mulai`,`waktu`.`waktu_selesai` AS `waktu_selesai`,`jadwal`.`ruangan` AS `ruangan` from (((`jadwal` join `matkul`) join `waktu`) join `dosen`) where ((`jadwal`.`kode_matkul` = `matkul`.`kode_matkul`) and (`jadwal`.`kode_waktu` = `waktu`.`kode_waktu`) and (`matkul`.`nip` = `dosen`.`nip`)) ;

-- --------------------------------------------------------

--
-- Structure for view `tampil_jadwal`
--
DROP TABLE IF EXISTS `tampil_jadwal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tampil_jadwal`  AS  select `jadwal`.`kode_jadwal` AS `kode_jadwal`,`matkul`.`kode_prodi` AS `kode_prodi`,`matkul`.`semester` AS `semester`,`jadwal`.`golongan` AS `golongan`,`matkul`.`nama_matkul` AS `nama_matkul`,`dosen`.`nama_dosen` AS `nama_dosen`,`hari`.`nama_hari` AS `nama_hari`,`waktu`.`waktu_mulai` AS `waktu_mulai`,`waktu`.`waktu_selesai` AS `waktu_selesai`,`jadwal`.`ruangan` AS `ruangan` from ((((`jadwal` join `matkul`) join `dosen`) join `hari`) join `waktu`) where ((`jadwal`.`kode_matkul` = `matkul`.`kode_matkul`) and (`matkul`.`nip` = `dosen`.`nip`) and (`jadwal`.`kode_waktu` = `waktu`.`kode_waktu`) and (`jadwal`.`kode_hari` = `hari`.`kode_hari`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absen`
--
ALTER TABLE `absen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_matkul` (`kode_matkul`),
  ADD KEY `nim` (`nim`),
  ADD KEY `id_pertemuan` (`id_pertemuan`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`),
  ADD KEY `kode_jurusan` (`kode_jurusan`);

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`nip`),
  ADD KEY `kode_prodi` (`kode_prodi`);

--
-- Indexes for table `hari`
--
ALTER TABLE `hari`
  ADD PRIMARY KEY (`kode_hari`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`kode_jadwal`),
  ADD KEY `kode_matkul` (`kode_matkul`),
  ADD KEY `kode_waktu` (`kode_waktu`),
  ADD KEY `kode_hari` (`kode_hari`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`kode_jurusan`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`),
  ADD KEY `kode_prodi` (`kode_prodi`);

--
-- Indexes for table `matkul`
--
ALTER TABLE `matkul`
  ADD PRIMARY KEY (`kode_matkul`),
  ADD KEY `kode_prodi` (`kode_prodi`),
  ADD KEY `nip` (`nip`);

--
-- Indexes for table `pengajar`
--
ALTER TABLE `pengajar`
  ADD KEY `nip` (`pengajar`),
  ADD KEY `kode_matkul` (`kode_matkul`);

--
-- Indexes for table `prodi`
--
ALTER TABLE `prodi`
  ADD PRIMARY KEY (`kode_prodi`),
  ADD KEY `kode_jurusan` (`kode_jurusan`);

--
-- Indexes for table `qrdata`
--
ALTER TABLE `qrdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_matkul` (`kode_matkul`);

--
-- Indexes for table `waktu`
--
ALTER TABLE `waktu`
  ADD PRIMARY KEY (`kode_waktu`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absen`
--
ALTER TABLE `absen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `hari`
--
ALTER TABLE `hari`
  MODIFY `kode_hari` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `kode_jadwal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `waktu`
--
ALTER TABLE `waktu`
  MODIFY `kode_waktu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `absen`
--
ALTER TABLE `absen`
  ADD CONSTRAINT `absen_ibfk_1` FOREIGN KEY (`kode_matkul`) REFERENCES `matkul` (`kode_matkul`),
  ADD CONSTRAINT `absen_ibfk_2` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`),
  ADD CONSTRAINT `absen_ibfk_3` FOREIGN KEY (`id_pertemuan`) REFERENCES `qrdata` (`id`);

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`kode_jurusan`) REFERENCES `jurusan` (`kode_jurusan`);

--
-- Constraints for table `dosen`
--
ALTER TABLE `dosen`
  ADD CONSTRAINT `dosen_ibfk_1` FOREIGN KEY (`kode_prodi`) REFERENCES `prodi` (`kode_prodi`) ON DELETE CASCADE;

--
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `jadwal_ibfk_1` FOREIGN KEY (`kode_hari`) REFERENCES `hari` (`kode_hari`),
  ADD CONSTRAINT `jadwal_ibfk_2` FOREIGN KEY (`kode_waktu`) REFERENCES `waktu` (`kode_waktu`),
  ADD CONSTRAINT `jadwal_ibfk_3` FOREIGN KEY (`kode_matkul`) REFERENCES `matkul` (`kode_matkul`);

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`kode_prodi`) REFERENCES `prodi` (`kode_prodi`);

--
-- Constraints for table `matkul`
--
ALTER TABLE `matkul`
  ADD CONSTRAINT `matkul_ibfk_1` FOREIGN KEY (`kode_prodi`) REFERENCES `prodi` (`kode_prodi`),
  ADD CONSTRAINT `matkul_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `dosen` (`nip`);

--
-- Constraints for table `pengajar`
--
ALTER TABLE `pengajar`
  ADD CONSTRAINT `pengajar_ibfk_1` FOREIGN KEY (`kode_matkul`) REFERENCES `matkul` (`kode_matkul`),
  ADD CONSTRAINT `pengajar_ibfk_2` FOREIGN KEY (`pengajar`) REFERENCES `dosen` (`nip`);

--
-- Constraints for table `prodi`
--
ALTER TABLE `prodi`
  ADD CONSTRAINT `prodi_ibfk_1` FOREIGN KEY (`kode_jurusan`) REFERENCES `jurusan` (`kode_jurusan`);

--
-- Constraints for table `qrdata`
--
ALTER TABLE `qrdata`
  ADD CONSTRAINT `qrdata_ibfk_1` FOREIGN KEY (`kode_matkul`) REFERENCES `matkul` (`kode_matkul`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
