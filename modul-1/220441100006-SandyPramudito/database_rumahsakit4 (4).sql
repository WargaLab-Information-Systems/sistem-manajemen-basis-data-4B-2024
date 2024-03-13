-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Jun 2023 pada 09.16
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database_rumahsakit4`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokter`
--

CREATE TABLE `dokter` (
  `no_urut` int(3) NOT NULL,
  `id_dokter` varchar(15) NOT NULL,
  `nama` varchar(70) NOT NULL,
  `tanggal_lahir` varchar(5000) NOT NULL,
  `jenis_kelamin` varchar(50) NOT NULL,
  `spesialis` varchar(50) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `mulai_bekerja` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `dokter`
--

INSERT INTO `dokter` (`no_urut`, `id_dokter`, `nama`, `tanggal_lahir`, `jenis_kelamin`, `spesialis`, `alamat`, `mulai_bekerja`) VALUES
(1, 'RSHMD00001', 'dr.Martin Harahap Sp.PD', '1990-06-21', 'LAKI-LAKI', 'PENYAKIT DALAM', 'KP. BABAKAN', '2003-12-12'),
(2, 'RSHMD0002', 'dr. Arif Praditya Sp.P', '1992-01-16', 'LAKI-LAKI', 'PARU', 'KP. KOJA', '2022-01-20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasien`
--

CREATE TABLE `pasien` (
  `no_id` int(10) NOT NULL,
  `no_rekam_medis` varchar(15) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `penjamin` varchar(20) NOT NULL,
  `tanggal_lahir` varchar(30) NOT NULL,
  `jenis_kelamin` varchar(30) NOT NULL,
  `alamat` varchar(190) NOT NULL,
  `poli` varchar(20) NOT NULL,
  `dpjp` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pasien`
--

INSERT INTO `pasien` (`no_id`, `no_rekam_medis`, `nama`, `penjamin`, `tanggal_lahir`, `jenis_kelamin`, `alamat`, `poli`, `dpjp`) VALUES
(1, 'RSHM00001', 'ALFIAN KHOIRUL SOLEH', 'UMUM', '2001-03-10', 'LAKI-LAKI', 'KENJERAN UTARA', 'MATA', 'DOKTER MATA2'),
(2, 'RSHM0002', 'IMANUEL MARTIN J. HARAHAP', 'UMUM', '2011-02-11', 'LAKI-LAKI', 'KP. BERLIN', 'MATA', 'DOKTER MATA'),
(3, 'RSHM0003', 'AFDHAN AZRIEL', 'UMUM', '2005-03-22', 'LAKI-LAKI', 'KP. CIKETING', 'JANTUNG', 'DOKTER JANTUNG'),
(4, 'RSHM0004', 'JULHAN ARYANDIKA', 'UMUM', '2003-03-12', 'LAKI-LAKI', 'KP. MUSTIKA', 'JANTUNG', 'DOKTER JANTUNG'),
(5, 'RSHM0005', 'FIRSTLY SHUURESH', 'ASURANSI', '2003-03-03', 'PEREMPUAN', 'NAROGONG', 'MATA', 'DOKTER MATA'),
(6, 'RSHM0006', 'IMMANUEL KRISTO LIMBONG', 'UMUM', '2004-02-27', 'LAKI-LAKI', 'MUSTIKASARI', 'PARU', 'DOKTER PARU'),
(7, 'RSHM0007', 'FIA KHALDA', 'UMUM', '2003-12-12', 'PEREMPUAN', 'RAWALUMBU', 'JANTUNG', 'DOKTER JANTUNG'),
(8, 'RSHM0008', 'AKAIELLA DAFFA HIRZI', 'UMUM', '2004-03-20', 'LAKI-LAKI', 'RAWALUMBU', 'JANTUNG', 'DOKTER JANTUNG'),
(9, 'RSHM0010', 'ILHAM AVIN PRATAMA', 'ASURANSI', '2004-12-12', 'LAKI-LAKI', 'BANTAR GEBANG', 'JANTUNG', 'DOKTER JANTUNG'),
(10, 'RSHM00011', 'AHMAD ILMI', 'UMUM', '2003-02-12', 'LAKI-LAKI', 'JATIASIH', 'PARU', 'DOKTER  PARU');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penghitungan_biaya`
--

CREATE TABLE `penghitungan_biaya` (
  `id` int(11) NOT NULL,
  `no_id` int(11) DEFAULT NULL,
  `lama_rawat_inap` int(11) DEFAULT NULL,
  `total_obat` int(11) DEFAULT NULL,
  `total_laboratorium` int(11) DEFAULT NULL,
  `total_biaya` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tindakan`
--

CREATE TABLE `tindakan` (
  `id_tindakan` int(11) NOT NULL,
  `nama_tindakan` varchar(255) DEFAULT NULL,
  `biaya` varchar(300) NOT NULL,
  `no_id` int(11) DEFAULT NULL,
  `no_urut` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tindakan`
--

INSERT INTO `tindakan` (`id_tindakan`, `nama_tindakan`, `biaya`, `no_id`, `no_urut`) VALUES
(2, 'rawat inap', '50000', NULL, NULL),
(3, 'laboratorium', '200000', NULL, NULL),
(4, 'obat', '150000', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`no_urut`);

--
-- Indeks untuk tabel `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`no_id`);

--
-- Indeks untuk tabel `penghitungan_biaya`
--
ALTER TABLE `penghitungan_biaya`
  ADD PRIMARY KEY (`id`),
  ADD KEY `no_id` (`no_id`);

--
-- Indeks untuk tabel `tindakan`
--
ALTER TABLE `tindakan`
  ADD PRIMARY KEY (`id_tindakan`),
  ADD KEY `no_id` (`no_id`),
  ADD KEY `no_urut` (`no_urut`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `dokter`
--
ALTER TABLE `dokter`
  MODIFY `no_urut` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pasien`
--
ALTER TABLE `pasien`
  MODIFY `no_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `penghitungan_biaya`
--
ALTER TABLE `penghitungan_biaya`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tindakan`
--
ALTER TABLE `tindakan`
  MODIFY `id_tindakan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `penghitungan_biaya`
--
ALTER TABLE `penghitungan_biaya`
  ADD CONSTRAINT `penghitungan_biaya_ibfk_1` FOREIGN KEY (`no_id`) REFERENCES `pasien` (`no_id`);

--
-- Ketidakleluasaan untuk tabel `tindakan`
--
ALTER TABLE `tindakan`
  ADD CONSTRAINT `tindakan_ibfk_1` FOREIGN KEY (`no_id`) REFERENCES `pasien` (`no_id`),
  ADD CONSTRAINT `tindakan_ibfk_2` FOREIGN KEY (`no_urut`) REFERENCES `dokter` (`no_urut`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
