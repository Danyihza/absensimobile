-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2020 at 12:43 PM
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
-- Database: `absensi`
--

-- --------------------------------------------------------

--
-- Table structure for table `absen`
--

CREATE TABLE `absen` (
  `id` int(11) NOT NULL,
  `pertemuan` int(2) NOT NULL,
  `kode_matkul` varchar(10) NOT NULL,
  `nim` varchar(10) NOT NULL,
  `status` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `absen`
--

INSERT INTO `absen` (`id`, `pertemuan`, `kode_matkul`, `nim`, `status`) VALUES
(1, 1, 'TIF4602', 'E41181930', 'H'),
(2, 2, 'TIF4602', 'E41181930', 'A'),
(3, 3, 'TIF4602', 'E41181930', 'H'),
(4, 4, 'TIF4602', 'E41181930', 'H'),
(5, 5, 'TIF4602', 'E41181930', 'H'),
(6, 1, 'TIF4606', 'E41181930', 'H'),
(7, 2, 'TIF4602', 'E41181930', 'H'),
(8, 4, 'TIF4602', 'E41182273', 'H'),
(9, 2, 'TIF4606', 'E41181930', 'A'),
(10, 6, 'TIF4607', 'E41181930', 'S');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `nip` varchar(20) NOT NULL,
  `password_dosen` varchar(30) NOT NULL,
  `kode_prodi` varchar(10) NOT NULL,
  `nama_dosen` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`nip`, `password_dosen`, `kode_prodi`, `nama_dosen`) VALUES
('197306172018051001', '123', 'MIF', 'Ely Mulyadi, SE, M.Kom'),
('197405192003121002', '1', 'TIF', 'Adi Heru Utomo, S.Kom, M.Kom'),
('197810112005012002', '123', 'TIF', 'Elly Antika, ST, M.Kom'),
('198608022015042002', '3', 'TIF', 'Ratih Ayuninghemi, S.ST, M.Kom'),
('198907102019031010', '5', 'TIF', ' Ery Setiyawan Jullev Atmadji, S.Kom, M.Cs'),
('199112112018031001', '1', 'TIF', 'Khafidurrohman Agustianto, S.Pd, M.Eng'),
('199408122019031013', '4', 'TIF', ' Mukhamad Angga Gumilang, S. Pd., M. Eng.'),
('6', 'rt', 'TKK', 'abdul');

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
(5, 'Jumat');

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
  `golongan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`kode_jadwal`, `kode_matkul`, `kode_waktu`, `kode_hari`, `ruangan`, `golongan`) VALUES
(3, 'TIF1404', 1, 1, 'Gedung TI 3.9', 'E'),
(4, 'TIF1423', 3, 5, 'Pasca 5.1', 'E'),
(5, 'TIF1404', 4, 2, 'Gedung TI Lab KSI ', 'D'),
(6, 'TIF4606', 2, 4, 'Kelas TI 3.11', 'E'),
(7, 'TIF4607', 1, 2, 'Workshop KSI', 'E'),
(8, 'TIF4607', 2, 2, 'Workshop KSI', 'E'),
(9, 'sse', 4, 4, 'Pancasila', 'E');

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
  `password_mahasiswa` varchar(20) NOT NULL,
  `golongan` varchar(10) NOT NULL,
  `semester` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `kode_prodi`, `nama_mahasiswa`, `password_mahasiswa`, `golongan`, `semester`) VALUES
('E41181930', 'TIF', 'Muhammad Rofiq Hidayatullah', 'E3', 'E', 4),
('E41182273', 'TIF', 'Aan Nur Shofii', 'E26', 'E', 4),
('E41182274', 'TIF', 'Mohammad Rizki Yanuarianto', 'E27', 'E', 4);

-- --------------------------------------------------------

--
-- Table structure for table `matkul`
--

CREATE TABLE `matkul` (
  `kode_matkul` varchar(10) NOT NULL,
  `kode_prodi` varchar(10) NOT NULL,
  `nama_matkul` varchar(30) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `semester` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matkul`
--

INSERT INTO `matkul` (`kode_matkul`, `kode_prodi`, `nama_matkul`, `nip`, `semester`) VALUES
('sse', 'TIF', 'komputer', '197405192003121002', 4),
('TIF4602', 'TIF', 'Kewirausahaan', '197306172018051001', 4),
('TIF4606', 'TIF', 'SI Jasa Berbasis Layanan', '197810112005012002', 4),
('TIF4607', 'TIF', 'Workshop Mobile', '198907102019031010', 4);

-- --------------------------------------------------------

--
-- Table structure for table `pengajar`
--

CREATE TABLE `pengajar` (
  `pengajar` varchar(20) NOT NULL,
  `kode_matkul` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengajar`
--

INSERT INTO `pengajar` (`pengajar`, `kode_matkul`) VALUES
('197405192003121002', 'TIF4606'),
('198907102019031010', 'TIF4607'),
('6', 'TIF4606'),
('6', 'TIF4602');

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
  `pertemuan` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qrdata`
--

INSERT INTO `qrdata` (`id`, `kode_matkul`, `pertemuan`) VALUES
('5ebbf6a9892ce', 'TIF4606', '7'),
('5ed7423645e95', 'TIF4606', '2');

-- --------------------------------------------------------

--
-- Stand-in structure for view `rekap_absen`
-- (See below for the actual view)
--
CREATE TABLE `rekap_absen` (
`pertemuan` int(2)
,`nama_matkul` varchar(30)
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
,`golongan` varchar(10)
,`nama_matkul` varchar(30)
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
,`golongan` varchar(10)
,`nama_matkul` varchar(30)
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
(1, '07:30:00', '09:30:00'),
(2, '09:30:00', '11:30:00'),
(3, '12:30:00', '14:30:00'),
(4, '14:30:00', '16:30:00');

-- --------------------------------------------------------

--
-- Structure for view `rekap_absen`
--
DROP TABLE IF EXISTS `rekap_absen`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rekap_absen`  AS  select `absen`.`pertemuan` AS `pertemuan`,`matkul`.`nama_matkul` AS `nama_matkul`,`mahasiswa`.`nama_mahasiswa` AS `nama_mahasiswa`,`absen`.`status` AS `status` from ((`absen` join `matkul`) join `mahasiswa`) where ((`absen`.`kode_matkul` = `matkul`.`kode_matkul`) and (`absen`.`nim` = `mahasiswa`.`nim`)) order by `absen`.`pertemuan` ;

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
  ADD KEY `nim` (`nim`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `hari`
--
ALTER TABLE `hari`
  MODIFY `kode_hari` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `kode_jadwal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `waktu`
--
ALTER TABLE `waktu`
  MODIFY `kode_waktu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `absen`
--
ALTER TABLE `absen`
  ADD CONSTRAINT `absen_ibfk_1` FOREIGN KEY (`kode_matkul`) REFERENCES `matkul` (`kode_matkul`),
  ADD CONSTRAINT `absen_ibfk_2` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`);

--
-- Constraints for table `dosen`
--
ALTER TABLE `dosen`
  ADD CONSTRAINT `dosen_ibfk_1` FOREIGN KEY (`kode_prodi`) REFERENCES `prodi` (`kode_prodi`) ON DELETE CASCADE;

--
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `jadwal_ibfk_1` FOREIGN KEY (`kode_waktu`) REFERENCES `waktu` (`kode_waktu`),
  ADD CONSTRAINT `jadwal_ibfk_2` FOREIGN KEY (`kode_matkul`) REFERENCES `matkul` (`kode_matkul`),
  ADD CONSTRAINT `jadwal_ibfk_3` FOREIGN KEY (`kode_hari`) REFERENCES `hari` (`kode_hari`);

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`kode_prodi`) REFERENCES `prodi` (`kode_prodi`);

--
-- Constraints for table `matkul`
--
ALTER TABLE `matkul`
  ADD CONSTRAINT `matkul_ibfk_1` FOREIGN KEY (`kode_prodi`) REFERENCES `prodi` (`kode_prodi`) ON DELETE CASCADE,
  ADD CONSTRAINT `matkul_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `dosen` (`nip`);

--
-- Constraints for table `pengajar`
--
ALTER TABLE `pengajar`
  ADD CONSTRAINT `pengajar_ibfk_1` FOREIGN KEY (`pengajar`) REFERENCES `dosen` (`nip`),
  ADD CONSTRAINT `pengajar_ibfk_2` FOREIGN KEY (`kode_matkul`) REFERENCES `matkul` (`kode_matkul`);

--
-- Constraints for table `prodi`
--
ALTER TABLE `prodi`
  ADD CONSTRAINT `prodi_ibfk_1` FOREIGN KEY (`kode_jurusan`) REFERENCES `jurusan` (`kode_jurusan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
