/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 10.4.32-MariaDB : Database - stored_procedure_perpustakaan
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`stored_procedure_perpustakaan` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `stored_procedure_perpustakaan`;

/*Table structure for table `library_anggota` */

DROP TABLE IF EXISTS `library_anggota`;

CREATE TABLE `library_anggota` (
  `IdAnggota` varchar(10) NOT NULL,
  `Nama_Anggota` varchar(20) NOT NULL,
  `Angkatan_Anggota` varchar(6) NOT NULL,
  `Tempat_Lahir_Anggota` varchar(20) NOT NULL,
  `Tanggal_Lahir_Anggota` date NOT NULL,
  `Jenis_Kelamin` varchar(15) NOT NULL,
  `Status_Pinjam` varchar(15) NOT NULL,
  PRIMARY KEY (`IdAnggota`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `library_anggota` */

/*Table structure for table `library_buku` */

DROP TABLE IF EXISTS `library_buku`;

CREATE TABLE `library_buku` (
  `Kode_Buku` varchar(10) NOT NULL,
  `Judul_Buku` varchar(25) NOT NULL,
  `Pengarang_Buku` varchar(30) NOT NULL,
  `Penerbit_Buku` varchar(30) NOT NULL,
  `Tahun_Buku` varchar(10) NOT NULL,
  `Jumlah_Buku` varchar(5) NOT NULL,
  `Status_Buku` varchar(10) NOT NULL,
  `Klasifikasi_Buku` varchar(20) NOT NULL,
  PRIMARY KEY (`Kode_Buku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `library_buku` */

insert  into `library_buku`(`Kode_Buku`,`Judul_Buku`,`Pengarang_Buku`,`Penerbit_Buku`,`Tahun_Buku`,`Jumlah_Buku`,`Status_Buku`,`Klasifikasi_Buku`) values 
('BK001','Harry Potter','J.K. Rowling','Gramedia','2000','10','Dipinjam','Fiksi');

/*Table structure for table `library_peminjaman` */

DROP TABLE IF EXISTS `library_peminjaman`;

CREATE TABLE `library_peminjaman` (
  `Kode_Peminjaman` varchar(10) NOT NULL,
  `IdAnggota` varchar(10) NOT NULL,
  `IdPetugas` varchar(10) NOT NULL,
  `Tanggal_Pinjam` date NOT NULL,
  `Tanggal_Kembali` date NOT NULL,
  `Kode_Buku` varchar(10) NOT NULL,
  PRIMARY KEY (`Kode_Peminjaman`),
  KEY `IdAnggota` (`IdAnggota`),
  KEY `IdPetugas` (`IdPetugas`),
  KEY `Kode_Buku` (`Kode_Buku`),
  CONSTRAINT `library_peminjaman_ibfk_1` FOREIGN KEY (`IdAnggota`) REFERENCES `library_anggota` (`IdAnggota`),
  CONSTRAINT `library_peminjaman_ibfk_2` FOREIGN KEY (`IdPetugas`) REFERENCES `library_petugas` (`IdPetugas`),
  CONSTRAINT `library_peminjaman_ibfk_3` FOREIGN KEY (`Kode_Buku`) REFERENCES `library_buku` (`Kode_Buku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `library_peminjaman` */

/*Table structure for table `library_pengembalian` */

DROP TABLE IF EXISTS `library_pengembalian`;

CREATE TABLE `library_pengembalian` (
  `Kode_Kembali` varchar(10) NOT NULL,
  `IdAnggota` varchar(10) NOT NULL,
  `Kode_Buku` varchar(10) NOT NULL,
  `IdPetugas` varchar(10) NOT NULL,
  `Tgl_Pinjam` date NOT NULL,
  `Tgl_Kembali` date NOT NULL,
  `Denda` varchar(15) NOT NULL,
  PRIMARY KEY (`Kode_Kembali`),
  KEY `IdAnggota` (`IdAnggota`),
  KEY `Kode_Buku` (`Kode_Buku`),
  KEY `IdPetugas` (`IdPetugas`),
  CONSTRAINT `library_pengembalian_ibfk_1` FOREIGN KEY (`IdAnggota`) REFERENCES `library_anggota` (`IdAnggota`),
  CONSTRAINT `library_pengembalian_ibfk_2` FOREIGN KEY (`Kode_Buku`) REFERENCES `library_buku` (`Kode_Buku`),
  CONSTRAINT `library_pengembalian_ibfk_3` FOREIGN KEY (`IdPetugas`) REFERENCES `library_petugas` (`IdPetugas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `library_pengembalian` */

/*Table structure for table `library_petugas` */

DROP TABLE IF EXISTS `library_petugas`;

CREATE TABLE `library_petugas` (
  `IdPetugas` varchar(10) NOT NULL,
  `Username` varchar(15) NOT NULL,
  `Password` varchar(15) NOT NULL,
  `Nama` varchar(25) NOT NULL,
  PRIMARY KEY (`IdPetugas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `library_petugas` */

/* Procedure structure for procedure `lihat_buku_berdasarkan_judul_dan_pengarang` */

/*!50003 DROP PROCEDURE IF EXISTS  `lihat_buku_berdasarkan_judul_dan_pengarang` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `lihat_buku_berdasarkan_judul_dan_pengarang`(
    IN judul VARCHAR(25),
    IN pengarang VARCHAR(30)
)
BEGIN
    SELECT * FROM library_buku WHERE Judul_Buku = judul AND Pengarang_Buku = pengarang;
END */$$
DELIMITER ;

/* Procedure structure for procedure `lihat_buku_berdasarkan_judul_pengarang_dan_penerbit` */

/*!50003 DROP PROCEDURE IF EXISTS  `lihat_buku_berdasarkan_judul_pengarang_dan_penerbit` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `lihat_buku_berdasarkan_judul_pengarang_dan_penerbit`(
    IN judul VARCHAR(25),
    IN pengarang VARCHAR(30),
    IN penerbit VARCHAR(30)
)
BEGIN
    SELECT * FROM library_buku 
    WHERE Judul_Buku = judul 
    AND Pengarang_Buku = pengarang 
    AND Penerbit_Buku = penerbit;
END */$$
DELIMITER ;

/* Procedure structure for procedure `lihat_buku_berdasarkan_pengarang` */

/*!50003 DROP PROCEDURE IF EXISTS  `lihat_buku_berdasarkan_pengarang` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `lihat_buku_berdasarkan_pengarang`(
    IN pengarang VARCHAR(30)
)
BEGIN
    SELECT * FROM library_buku WHERE Pengarang_Buku = pengarang;
END */$$
DELIMITER ;

/* Procedure structure for procedure `pinjam_buku` */

/*!50003 DROP PROCEDURE IF EXISTS  `pinjam_buku` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `pinjam_buku`(
    INOUT kode_buku VARCHAR(10),
    OUT judul_buku VARCHAR(25),
    OUT pengarang_buku VARCHAR(30),
    OUT penerbit_buku VARCHAR(30),
    OUT status_buku VARCHAR(10)
)
BEGIN
    SELECT Judul_Buku, Pengarang_Buku, Penerbit_Buku, Status_Buku 
    INTO judul_buku, pengarang_buku, penerbit_buku, status_buku 
    FROM library_buku WHERE Kode_Buku = kode_buku;
    
    -- Update status buku menjadi 'Dipinjam'
    UPDATE library_buku SET Status_Buku = 'Dipinjam' WHERE Kode_Buku = kode_buku;
END */$$
DELIMITER ;

/* Procedure structure for procedure `tambah_anggota` */

/*!50003 DROP PROCEDURE IF EXISTS  `tambah_anggota` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `tambah_anggota`(
    IN nama_anggota VARCHAR(50),
    IN angkatan_anggota VARCHAR(4),
    IN tempat_lahir VARCHAR(50),
    IN tanggal_lahir DATE,
    IN jenis_kelamin VARCHAR(10),
    IN status_pinjam VARCHAR(10)
)
BEGIN
    INSERT INTO library_anggota (Nama_Anggota, Angkatan_Anggota, Tempat_Lahir_Anggota, Tanggal_Lahir_Anggota, Jenis_Kelamin, Status_Pinjam)
    VALUES (nama_anggota, angkatan_anggota, tempat_lahir, tanggal_lahir, jenis_kelamin, status_pinjam);
END */$$
DELIMITER ;

/* Procedure structure for procedure `tambah_buku` */

/*!50003 DROP PROCEDURE IF EXISTS  `tambah_buku` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `tambah_buku`(
    IN kode_buku VARCHAR(10),
    IN judul_buku VARCHAR(25),
    IN pengarang_buku VARCHAR(30),
    IN penerbit_buku VARCHAR(30),
    IN tahun_buku VARCHAR(10),
    IN jumlah_buku VARCHAR(5),
    IN status_buku VARCHAR(10),
    IN klasifikasi_buku VARCHAR(20)
)
BEGIN
    INSERT INTO library_buku (Kode_Buku, Judul_Buku, Pengarang_Buku, Penerbit_Buku, Tahun_Buku, Jumlah_Buku, Status_Buku, Klasifikasi_Buku)
    VALUES (kode_buku, judul_buku, pengarang_buku, penerbit_buku, tahun_buku, jumlah_buku, status_buku, klasifikasi_buku);
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
