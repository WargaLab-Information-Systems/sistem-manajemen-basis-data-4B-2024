/*
SQLyog Ultimate v12.4.3 (64 bit)
MySQL - 10.4.32-MariaDB : Database - tugasdua
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tugasdua` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `tugasdua`;

/*Table structure for table `anggota` */

DROP TABLE IF EXISTS `anggota`;

CREATE TABLE `anggota` (
  `IdAnggota` varchar(10) NOT NULL,
  `Nama_Anggota` varchar(20) DEFAULT NULL,
  `Angkatan_Anggota` varchar(6) DEFAULT NULL,
  `Tempat_Lahir_Anggota` varchar(20) DEFAULT NULL,
  `Tanggal_Lahir_Anggota` date DEFAULT NULL,
  `No_Telp` int(12) DEFAULT NULL,
  `Jenis_Kelamin` varchar(15) DEFAULT NULL,
  `Status_Pinjam` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`IdAnggota`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `anggota` */

insert  into `anggota`(`IdAnggota`,`Nama_Anggota`,`Angkatan_Anggota`,`Tempat_Lahir_Anggota`,`Tanggal_Lahir_Anggota`,`No_Telp`,`Jenis_Kelamin`,`Status_Pinjam`) values 
('A001','Andi','2020','Jakarta','2000-01-01',2147483647,'Laki-laki','Tidak'),
('A002','Budi','2021','Surabaya','2001-02-02',2147483647,'Laki-laki','Tidak'),
('A003','Cici','2020','Bandung','2000-03-03',2147483647,'Perempuan','Ya'),
('A004','Dini','2021','Yogyakarta','2001-04-04',2147483647,'Perempuan','Ya'),
('A005','Eva','2020','Semarang','2000-05-05',2147483647,'Perempuan','Ya');

/*Table structure for table `buku` */

DROP TABLE IF EXISTS `buku`;

CREATE TABLE `buku` (
  `Kode_Buku` varchar(10) NOT NULL,
  `Judul_Buku` varchar(25) DEFAULT NULL,
  `Pengarang_Buku` varchar(30) DEFAULT NULL,
  `Penerbit_Buku` varchar(30) DEFAULT NULL,
  `Tahun_Buku` varchar(10) DEFAULT NULL,
  `Jumlah_Buku` varchar(5) DEFAULT NULL,
  `Status_Buku` varchar(10) DEFAULT NULL,
  `Klasifikasi_Buku` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Kode_Buku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `buku` */

insert  into `buku`(`Kode_Buku`,`Judul_Buku`,`Pengarang_Buku`,`Penerbit_Buku`,`Tahun_Buku`,`Jumlah_Buku`,`Status_Buku`,`Klasifikasi_Buku`) values 
('B001','Java Programming','Rizki','Penerbit A','2020','10','Tersedia','Teknologi'),
('B002','Python Programming','Lia','Penerbit B','2021','8','Tersedia','Teknologi'),
('B003','Database Management','Sari','Penerbit C','2019','12','Tersedia','Teknologi'),
('B004','Web Development','Dewi','Penerbit A','2021','7','Tersedia','Teknologi'),
('B005','Networking Basics','Bima','Penerbit B','2020','9','Tersedia','Teknologi');

/*Table structure for table `peminjaman` */

DROP TABLE IF EXISTS `peminjaman`;

CREATE TABLE `peminjaman` (
  `Kode_Peminjaman` varchar(10) NOT NULL,
  `IdAnggota` varchar(10) DEFAULT NULL,
  `IdPetugas` varchar(10) DEFAULT NULL,
  `Tanggal_Pinjam` date DEFAULT NULL,
  `Tanggal_Kembali` date DEFAULT NULL,
  `Kode_Buku` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Kode_Peminjaman`),
  KEY `fk_peminjaman_anggota` (`IdAnggota`),
  KEY `fk_peminjaman_buku` (`Kode_Buku`),
  KEY `fk_peminjaman_petugas` (`IdPetugas`),
  CONSTRAINT `fk_peminjaman_anggota` FOREIGN KEY (`IdAnggota`) REFERENCES `anggota` (`IdAnggota`),
  CONSTRAINT `fk_peminjaman_buku` FOREIGN KEY (`Kode_Buku`) REFERENCES `buku` (`Kode_Buku`),
  CONSTRAINT `fk_peminjaman_petugas` FOREIGN KEY (`IdPetugas`) REFERENCES `petugas` (`IdPetugas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `peminjaman` */

insert  into `peminjaman`(`Kode_Peminjaman`,`IdAnggota`,`IdPetugas`,`Tanggal_Pinjam`,`Tanggal_Kembali`,`Kode_Buku`) values 
('PJ001','A003','P001','2024-01-01','2024-01-10','B001'),
('PJ002','A003','P001','2024-02-01','2024-02-10','B002'),
('PJ003','A003','P001','2024-03-01','2024-03-10','B003'),
('PJ004','A003','P002','2024-04-01','2024-04-10','B004'),
('PJ005','A003','P002','2024-05-01','2024-05-10','B005'),
('PJ006','A004','P003','2024-01-01','2024-01-10','B001'),
('PJ007','A004','P003','2024-02-01','2024-02-10','B002'),
('PJ008','A005','P004','2024-03-01','2024-03-10','B003'),
('PJ009','A005','P004','2024-04-01','2024-04-10','B004'),
('PJ010','A005','P005','2024-05-01','2024-05-10','B005'),
('PJ011','A003','P005','2024-06-01','2024-06-10','B001'),
('PJ012','A003','P005','2024-07-01','2024-07-10','B002'),
('PJ013','A003','P005','2024-08-01','2024-08-10','B003'),
('PJ014','A003','P005','2024-09-01','2024-09-10','B004'),
('PJ015','A003','P005','2024-10-01','2024-10-10','B005'),
('PJ016','A004','P001','2024-11-01','2024-11-10','B001');

/*Table structure for table `pengembalian` */

DROP TABLE IF EXISTS `pengembalian`;

CREATE TABLE `pengembalian` (
  `Kode_Kembali` varchar(10) NOT NULL,
  `IdAnggota` varchar(10) DEFAULT NULL,
  `Kode_Buku` varchar(10) DEFAULT NULL,
  `IdPetugas` varchar(10) DEFAULT NULL,
  `Tgl_Pinjam` date DEFAULT NULL,
  `Tgl_Kembali` date DEFAULT NULL,
  `Denda` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Kode_Kembali`),
  KEY `fk_pengembalian_buku` (`Kode_Buku`),
  KEY `fk_pengembalian_anggota` (`IdAnggota`),
  KEY `fk_pengembalian_petugas` (`IdPetugas`),
  CONSTRAINT `fk_pengembalian_anggota` FOREIGN KEY (`IdAnggota`) REFERENCES `anggota` (`IdAnggota`),
  CONSTRAINT `fk_pengembalian_buku` FOREIGN KEY (`Kode_Buku`) REFERENCES `buku` (`Kode_Buku`),
  CONSTRAINT `fk_pengembalian_petugas` FOREIGN KEY (`IdPetugas`) REFERENCES `petugas` (`IdPetugas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `pengembalian` */

insert  into `pengembalian`(`Kode_Kembali`,`IdAnggota`,`Kode_Buku`,`IdPetugas`,`Tgl_Pinjam`,`Tgl_Kembali`,`Denda`) values 
('PK001','A003','B001','P001','2024-01-01','2024-01-10','0'),
('PK002','A003','B002','P001','2024-02-01','2024-02-10','0'),
('PK003','A003','B003','P001','2024-03-01','2024-03-10','0'),
('PK004','A003','B004','P002','2024-04-01','2024-04-10','0'),
('PK005','A003','B005','P002','2024-05-01','2024-05-10','0'),
('PK006','A004','B001','P003','2024-01-01','2024-01-10','0'),
('PK007','A004','B002','P003','2024-02-01','2024-02-10','0'),
('PK008','A005','B003','P004','2024-03-01','2024-03-10','0'),
('PK009','A005','B004','P004','2024-04-01','2024-04-10','0'),
('PK010','A005','B005','P005','2024-05-01','2024-05-10','0'),
('PK011','A004','B001','P001','2024-11-01','2024-11-10','0');

/*Table structure for table `petugas` */

DROP TABLE IF EXISTS `petugas`;

CREATE TABLE `petugas` (
  `IdPetugas` varchar(10) NOT NULL,
  `Username` varchar(15) DEFAULT NULL,
  `Password` varchar(15) DEFAULT NULL,
  `Nama` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`IdPetugas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `petugas` */

insert  into `petugas`(`IdPetugas`,`Username`,`Password`,`Nama`) values 
('P001','petugas1','password1','Petugas Satu'),
('P002','petugas2','password2','Petugas Dua'),
('P003','petugas3','password3','Petugas Tiga'),
('P004','petugas4','password4','Petugas Empat'),
('P005','petugas5','password5','Petugas Lima');



-- nomer1 --
USE tugasdua;
CREATE VIEW anggota_lebih_dari_5_buku AS
SELECT a.IdAnggota, a.Nama_Anggota, COUNT(p.Kode_Buku) AS Jumlah_Buku_Dipinjam
FROM anggota a
JOIN peminjaman p ON a.IdAnggota = p.IdAnggota
GROUP BY a.IdAnggota, a.Nama_Anggota
HAVING COUNT(p.Kode_Buku) > 5;

SELECT * FROM  anggota_lebih_dari_5_buku;

-- nomer2 --
USE tugasdua;
CREATE VIEW petugas_transaksi AS
SELECT p.IdPetugas, p.Nama, COUNT(pj.Kode_Peminjaman) AS Jumlah_Transaksi
FROM petugas p
JOIN peminjaman pj ON p.IdPetugas = pj.IdPetugas
GROUP BY p.IdPetugas, p.Nama;

SELECT * FROM petugas_transaksi;

-- nomer 3 --
USE tugasdua;

CREATE VIEW petugas_transaksi_terbanyak AS
SELECT p.IdPetugas, p.Nama, COUNT(pj.Kode_Peminjaman) AS Jumlah_Transaksi
FROM petugas p
JOIN peminjaman pj ON p.IdPetugas = pj.IdPetugas
GROUP BY p.IdPetugas, p.Nama
ORDER BY Jumlah_Transaksi DESC
LIMIT 1;

SELECT * FROM petugas_transaksi_terbanyak;

-- nomer 4--
USE tugasdua;

CREATE VIEW buku_terpinjam_paling_banyak AS
SELECT b.Kode_Buku, b.Judul_Buku, b.Pengarang_Buku, b.Penerbit_Buku, b.Tahun_Buku, COUNT(p.Kode_Buku) AS Jumlah_Peminjaman
FROM peminjaman p
JOIN buku b ON p.Kode_Buku = b.Kode_Buku
GROUP BY b.Kode_Buku, b.Judul_Buku, b.Pengarang_Buku, b.Penerbit_Buku, b.Tahun_Buku
ORDER BY Jumlah_Peminjaman DESC
LIMIT 1;

SELECT * FROM buku_terpinjam_paling_banyak;

