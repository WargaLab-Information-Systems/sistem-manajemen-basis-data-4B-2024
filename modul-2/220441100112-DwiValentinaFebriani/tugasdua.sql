CREATE DATABASE tugasdua;
USE tugasdua;

CREATE TABLE `anggota` (
  `IdAnggota` VARCHAR(10) NOT NULL,
  `Nama_Anggota` VARCHAR(20) DEFAULT NULL,
  `Angkatan_Anggota` VARCHAR(6) DEFAULT NULL,
  `Tempat_Lahir_Anggota` VARCHAR(20) DEFAULT NULL,
  `Tanggal_Lahir_Anggota` DATE DEFAULT NULL,
  `No_Telp` INT(12) DEFAULT NULL,
  `Jenis_Kelamin` VARCHAR(15) DEFAULT NULL,
  `Status_Pinjam` VARCHAR(15) DEFAULT NULL,
  PRIMARY KEY (`IdAnggota`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT  INTO `anggota`(`IdAnggota`,`Nama_Anggota`,`Angkatan_Anggota`,`Tempat_Lahir_Anggota`,`Tanggal_Lahir_Anggota`,`No_Telp`,`Jenis_Kelamin`,`Status_Pinjam`) VALUES 
('A001','Andi','2020','Jakarta','2000-01-01',2147483647,'Laki-laki','Tidak'),
('A002','Budi','2021','Surabaya','2001-02-02',2147483647,'Laki-laki','Tidak'),
('A003','Cici','2020','Bandung','2000-03-03',2147483647,'Perempuan','Ya'),
('A004','Dini','2021','Yogyakarta','2001-04-04',2147483647,'Perempuan','Ya'),
('A005','Eva','2020','Semarang','2000-05-05',2147483647,'Perempuan','Ya');

CREATE TABLE `buku` (
  `Kode_Buku` VARCHAR(10) NOT NULL,
  `Judul_Buku` VARCHAR(25) DEFAULT NULL,
  `Pengarang_Buku` VARCHAR(30) DEFAULT NULL,
  `Penerbit_Buku` VARCHAR(30) DEFAULT NULL,
  `Tahun_Buku` VARCHAR(10) DEFAULT NULL,
  `Jumlah_Buku` VARCHAR(5) DEFAULT NULL,
  `Status_Buku` VARCHAR(10) DEFAULT NULL,
  `Klasifikasi_Buku` VARCHAR(20) DEFAULT NULL,
  PRIMARY KEY (`Kode_Buku`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `peminjaman` (
  `Kode_Peminjaman` VARCHAR(10) NOT NULL,
  `IdAnggota` VARCHAR(10) DEFAULT NULL,
  `IdPetugas` VARCHAR(10) DEFAULT NULL,
  `Tanggal_Pinjam` DATE DEFAULT NULL,
  `Tanggal_Kembali` DATE DEFAULT NULL,
  `Kode_Buku` VARCHAR(10) DEFAULT NULL,
  PRIMARY KEY (`Kode_Peminjaman`),
  KEY `fk_peminjaman_anggota` (`IdAnggota`),
  KEY `fk_peminjaman_buku` (`Kode_Buku`),
  KEY `fk_peminjaman_petugas` (`IdPetugas`),
  CONSTRAINT `fk_peminjaman_anggota` FOREIGN KEY (`IdAnggota`) REFERENCES `anggota` (`IdAnggota`),
  CONSTRAINT `fk_peminjaman_buku` FOREIGN KEY (`Kode_Buku`) REFERENCES `buku` (`Kode_Buku`),
  CONSTRAINT `fk_peminjaman_petugas` FOREIGN KEY (`IdPetugas`) REFERENCES `petugas` (`IdPetugas`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `pengembalian` (
  `Kode_Kembali` VARCHAR(10) NOT NULL,
  `IdAnggota` VARCHAR(10) DEFAULT NULL,
  `Kode_Buku` VARCHAR(10) DEFAULT NULL,
  `IdPetugas` VARCHAR(10) DEFAULT NULL,
  `Tgl_Pinjam` DATE DEFAULT NULL,
  `Tgl_Kembali` DATE DEFAULT NULL,
  `Denda` VARCHAR(15) DEFAULT NULL,
  PRIMARY KEY (`Kode_Kembali`),
  KEY `fk_pengembalian_buku` (`Kode_Buku`),
  KEY `fk_pengembalian_anggota` (`IdAnggota`),
  KEY `fk_pengembalian_petugas` (`IdPetugas`),
  CONSTRAINT `fk_pengembalian_anggota` FOREIGN KEY (`IdAnggota`) REFERENCES `anggota` (`IdAnggota`),
  CONSTRAINT `fk_pengembalian_buku` FOREIGN KEY (`Kode_Buku`) REFERENCES `buku` (`Kode_Buku`),
  CONSTRAINT `fk_pengembalian_petugas` FOREIGN KEY (`IdPetugas`) REFERENCES `petugas` (`IdPetugas`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `petugas` (
  `IdPetugas` VARCHAR(10) NOT NULL,
  `Username` VARCHAR(15) DEFAULT NULL,
  `Password` VARCHAR(15) DEFAULT NULL,
  `Nama` VARCHAR(25) DEFAULT NULL,
  PRIMARY KEY (`IdPetugas`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- no 1
CREATE VIEW anggota_meminjam_buku AS
SELECT a.IdAnggota, a.Nama_Anggota, COUNT(p.Kode_Buku) AS Jumlah_Buku_Dipinjam
FROM anggota a
JOIN peminjaman p ON a.IdAnggota = p.IdAnggota
GROUP BY a.IdAnggota, a.Nama_Anggota
HAVING COUNT(p.Kode_Buku) > 5;

-- nomor 2

CREATE VIEW petugas_transaksi AS
SELECT p.IdPetugas, p.Nama, COUNT(pr.Kode_Peminjaman) AS Jumlah_Transaksi
FROM petugas p
JOIN peminjaman pr ON p.IdPetugas = pr.IdPetugas
GROUP BY p.IdPetugas, p.Nama;


-- nomor 3

CREATE VIEW petugas_transaksi_terbanyak AS
SELECT p.IdPetugas, p.Nama, COUNT(pr.Kode_Peminjaman) AS Jumlah_Transaksi
FROM petugas p
JOIN peminjaman pr ON p.IdPetugas = pr.IdPetugas
GROUP BY p.IdPetugas, p.Nama
ORDER BY Jumlah_Transaksi DESC
LIMIT 1;

-- nomor 4

CREATE VIEW buku_terpinjam_paling_banyak AS
SELECT p.Kode_Buku, b.Judul_Buku, b.Pengarang_Buku, b.Penerbit_Buku, b.Tahun_Buku, COUNT(p.Kode_Buku) AS Jumlah_Peminjaman
FROM peminjaman p
JOIN buku b ON p.Kode_Buku = b.Kode_Buku
GROUP BY p.Kode_Buku, b.Judul_Buku, b.Pengarang_Buku, b.Penerbit_Buku, b.Tahun_Buku
ORDER BY Jumlah_Peminjaman DESC
LIMIT 1;
