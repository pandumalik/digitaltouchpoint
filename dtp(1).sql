-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 30 Des 2018 pada 06.39
-- Versi Server: 10.1.30-MariaDB
-- PHP Version: 5.6.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dtp`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `apruval`
--

CREATE TABLE `apruval` (
  `id_apruval` int(11) NOT NULL,
  `id_nota` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_bidang`
--

CREATE TABLE `tbl_bidang` (
  `id_bidang` int(11) NOT NULL,
  `nama_bidang` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_bidang`
--

INSERT INTO `tbl_bidang` (`id_bidang`, `nama_bidang`) VALUES
(1, 'bidang penyelengaraan E-Government'),
(2, 'biddang pengelolaan informasi dan komunikasi publik'),
(4, 'kepala dinas komunikasi dan informatika sekertariat'),
(5, 'bidang layanan komunikasi dan informatika');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_login`
--

CREATE TABLE `tbl_login` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `level` int(11) NOT NULL,
  `id_bidang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_login`
--

INSERT INTO `tbl_login` (`id`, `nama`, `username`, `password`, `level`, `id_bidang`) VALUES
(8, 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 4, 1),
(9, 'user', 'user', 'ee11cbb19052e40b07aac0ca060c23ee', 1, 2),
(10, 'Data Owner', 'dataowner', '145b99a22eebae53d173dad487670294', 2, 1),
(11, 'DG Council', 'dgcouncil', '17c6b73cd509fcc0c523fdf4f2ab863b', 3, 5),
(12, 'kabid', 'kabid', '6d6827e38b382572cc5be098158174d3', 5, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_nota`
--

CREATE TABLE `tbl_nota` (
  `id_nota` int(11) NOT NULL,
  `nomor` varchar(100) NOT NULL,
  `disposisi` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `id_seksi` int(11) NOT NULL,
  `isi_nota` text NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `file` text NOT NULL,
  `last_edit` varchar(50) NOT NULL,
  `tobeuser` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_seksi`
--

CREATE TABLE `tbl_seksi` (
  `id_seksi` int(11) NOT NULL,
  `nama_seksi` text NOT NULL,
  `id_bidang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_seksi`
--

INSERT INTO `tbl_seksi` (`id_seksi`, `nama_seksi`, `id_bidang`) VALUES
(1, 'kasubag umum & kepegawaian', 1),
(2, 'kasubag program & pelaporan', 4),
(4, 'sekertaris diskominfo', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_transaksi`
--

CREATE TABLE `tbl_transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_nota` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `aksi` varchar(10) NOT NULL,
  `tgl` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `catatan` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `userID` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jabatan` varchar(50) NOT NULL,
  `bidang` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apruval`
--
ALTER TABLE `apruval`
  ADD PRIMARY KEY (`id_apruval`);

--
-- Indexes for table `tbl_bidang`
--
ALTER TABLE `tbl_bidang`
  ADD PRIMARY KEY (`id_bidang`);

--
-- Indexes for table `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bidang` (`id_bidang`);

--
-- Indexes for table `tbl_nota`
--
ALTER TABLE `tbl_nota`
  ADD PRIMARY KEY (`id_nota`),
  ADD KEY `id_seksi` (`id_seksi`);

--
-- Indexes for table `tbl_seksi`
--
ALTER TABLE `tbl_seksi`
  ADD PRIMARY KEY (`id_seksi`),
  ADD KEY `id_bidang` (`id_bidang`);

--
-- Indexes for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apruval`
--
ALTER TABLE `apruval`
  MODIFY `id_apruval` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_bidang`
--
ALTER TABLE `tbl_bidang`
  MODIFY `id_bidang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_login`
--
ALTER TABLE `tbl_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_nota`
--
ALTER TABLE `tbl_nota`
  MODIFY `id_nota` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_seksi`
--
ALTER TABLE `tbl_seksi`
  MODIFY `id_seksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD CONSTRAINT `tbl_login_ibfk_1` FOREIGN KEY (`id_bidang`) REFERENCES `tbl_bidang` (`id_bidang`);

--
-- Ketidakleluasaan untuk tabel `tbl_nota`
--
ALTER TABLE `tbl_nota`
  ADD CONSTRAINT `tbl_nota_ibfk_1` FOREIGN KEY (`id_seksi`) REFERENCES `tbl_seksi` (`id_seksi`);

--
-- Ketidakleluasaan untuk tabel `tbl_seksi`
--
ALTER TABLE `tbl_seksi`
  ADD CONSTRAINT `tbl_seksi_ibfk_1` FOREIGN KEY (`id_bidang`) REFERENCES `tbl_bidang` (`id_bidang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
