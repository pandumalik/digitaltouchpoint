-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Des 2018 pada 09.18
-- Versi server: 10.1.37-MariaDB
-- Versi PHP: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database-notasurat`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `prihal`
--

CREATE TABLE `prihal` (
  `id_prihal` int(11) NOT NULL,
  `nama_prihal` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `prihal`
--

INSERT INTO `prihal` (`id_prihal`, `nama_prihal`) VALUES
(11, 'asdasda'),
(13, 'DINAS');

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
(8, 'admin', 'admin', 'd8671d1cb097a3bd26b2344ee25a0562', 1, 1),
(9, 'kasubag', 'kasubag', '143ad2695caf8f2368b5d9ef03d37ee8', 2, 2),
(10, 'lobby', 'lobby', 'd8671d1cb097a3bd26b2344ee25a0562', 3, 1),
(11, 'sekdis', 'sekdis', '5f20f129bd6bd931be0d3e99fc2fb720', 4, 5),
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
  `last_edit` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_nota`
--

INSERT INTO `tbl_nota` (`id_nota`, `nomor`, `disposisi`, `status`, `id_seksi`, `isi_nota`, `tanggal`, `file`, `last_edit`) VALUES
(9, '109812', 'Pending', 1, 2, '<p><b>test boss</b><br></p>', '2018-12-21 07:28:06', '', 'admin');

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
-- Struktur dari tabel `tbl_tembusan`
--

CREATE TABLE `tbl_tembusan` (
  `id_tembusan` int(11) NOT NULL,
  `id_nota` int(11) NOT NULL,
  `id_bidang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_tembusan`
--

INSERT INTO `tbl_tembusan` (`id_tembusan`, `id_nota`, `id_bidang`) VALUES
(1, 9, 1),
(2, 9, 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `prihal`
--
ALTER TABLE `prihal`
  ADD PRIMARY KEY (`id_prihal`);

--
-- Indeks untuk tabel `tbl_bidang`
--
ALTER TABLE `tbl_bidang`
  ADD PRIMARY KEY (`id_bidang`);

--
-- Indeks untuk tabel `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bidang` (`id_bidang`);

--
-- Indeks untuk tabel `tbl_nota`
--
ALTER TABLE `tbl_nota`
  ADD PRIMARY KEY (`id_nota`),
  ADD KEY `id_seksi` (`id_seksi`);

--
-- Indeks untuk tabel `tbl_seksi`
--
ALTER TABLE `tbl_seksi`
  ADD PRIMARY KEY (`id_seksi`),
  ADD KEY `id_bidang` (`id_bidang`);

--
-- Indeks untuk tabel `tbl_tembusan`
--
ALTER TABLE `tbl_tembusan`
  ADD PRIMARY KEY (`id_tembusan`),
  ADD KEY `id_bidang` (`id_bidang`),
  ADD KEY `id_nota` (`id_nota`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `prihal`
--
ALTER TABLE `prihal`
  MODIFY `id_prihal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `tbl_bidang`
--
ALTER TABLE `tbl_bidang`
  MODIFY `id_bidang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tbl_login`
--
ALTER TABLE `tbl_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `tbl_nota`
--
ALTER TABLE `tbl_nota`
  MODIFY `id_nota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `tbl_seksi`
--
ALTER TABLE `tbl_seksi`
  MODIFY `id_seksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tbl_tembusan`
--
ALTER TABLE `tbl_tembusan`
  MODIFY `id_tembusan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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

--
-- Ketidakleluasaan untuk tabel `tbl_tembusan`
--
ALTER TABLE `tbl_tembusan`
  ADD CONSTRAINT `tbl_tembusan_ibfk_1` FOREIGN KEY (`id_bidang`) REFERENCES `tbl_bidang` (`id_bidang`),
  ADD CONSTRAINT `tbl_tembusan_ibfk_2` FOREIGN KEY (`id_nota`) REFERENCES `tbl_nota` (`id_nota`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
