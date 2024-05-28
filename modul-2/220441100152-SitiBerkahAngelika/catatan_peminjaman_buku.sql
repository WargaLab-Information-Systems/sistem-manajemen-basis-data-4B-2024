/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 10.4.32-MariaDB : Database - catatan_peminjaman_buku
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`catatan_peminjaman_buku` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `catatan_peminjaman_buku`;

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
  KEY `IdAnggota` (`IdAnggota`),
  KEY `IdPetugas` (`IdPetugas`),
  KEY `Kode_Buku` (`Kode_Buku`),
  CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`IdAnggota`) REFERENCES `anggota` (`IdAnggota`),
  CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`IdPetugas`) REFERENCES `petugas` (`IdPetugas`),
  CONSTRAINT `peminjaman_ibfk_3` FOREIGN KEY (`Kode_Buku`) REFERENCES `buku` (`Kode_Buku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `peminjaman` */

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
  KEY `IdAnggota` (`IdAnggota`),
  KEY `IdPetugas` (`IdPetugas`),
  KEY `Kode_Buku` (`Kode_Buku`),
  CONSTRAINT `pengembalian_ibfk_1` FOREIGN KEY (`IdAnggota`) REFERENCES `anggota` (`IdAnggota`),
  CONSTRAINT `pengembalian_ibfk_2` FOREIGN KEY (`IdPetugas`) REFERENCES `petugas` (`IdPetugas`),
  CONSTRAINT `pengembalian_ibfk_3` FOREIGN KEY (`Kode_Buku`) REFERENCES `buku` (`Kode_Buku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `pengembalian` */

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

/*Table structure for table `anggota_minjam_lima_buku` */

DROP TABLE IF EXISTS `anggota_minjam_lima_buku`;

/*!50001 DROP VIEW IF EXISTS `anggota_minjam_lima_buku` */;
/*!50001 DROP TABLE IF EXISTS `anggota_minjam_lima_buku` */;

/*!50001 CREATE TABLE  `anggota_minjam_lima_buku`(
 `IdAnggota` varchar(10) ,
 `Nama_Anggota` varchar(20) ,
 `Angkatan_Anggota` varchar(6) ,
 `Tempat_Lahir_Anggota` varchar(20) ,
 `Tanggal_Lahir_Anggota` date ,
 `No_Telp` int(12) ,
 `Jenis_Kelamin` varchar(15) ,
 `Status_Pinjam` varchar(15) 
)*/;

/*Table structure for table `buku_terpeminjam_terbanyak` */

DROP TABLE IF EXISTS `buku_terpeminjam_terbanyak`;

/*!50001 DROP VIEW IF EXISTS `buku_terpeminjam_terbanyak` */;
/*!50001 DROP TABLE IF EXISTS `buku_terpeminjam_terbanyak` */;

/*!50001 CREATE TABLE  `buku_terpeminjam_terbanyak`(
 `Kode_Buku` varchar(10) ,
 `Judul_Buku` varchar(25) ,
 `Pengarang_Buku` varchar(30) ,
 `Penerbit_Buku` varchar(30) ,
 `Jumlah_Peminjaman` bigint(21) 
)*/;

/*Table structure for table `transaksi_petugas` */

DROP TABLE IF EXISTS `transaksi_petugas`;

/*!50001 DROP VIEW IF EXISTS `transaksi_petugas` */;
/*!50001 DROP TABLE IF EXISTS `transaksi_petugas` */;

/*!50001 CREATE TABLE  `transaksi_petugas`(
 `IdPetugas` varchar(10) ,
 `Username` varchar(15) ,
 `Jumlah_Transaksi` bigint(21) ,
 `Jumlah_Buku_Terpeminjam` decimal(23,0) 
)*/;

/*Table structure for table `transaksi_terbanyak_petugas` */

DROP TABLE IF EXISTS `transaksi_terbanyak_petugas`;

/*!50001 DROP VIEW IF EXISTS `transaksi_terbanyak_petugas` */;
/*!50001 DROP TABLE IF EXISTS `transaksi_terbanyak_petugas` */;

/*!50001 CREATE TABLE  `transaksi_terbanyak_petugas`(
 `IdPetugas` varchar(10) ,
 `Username` varchar(15) ,
 `Jumlah_Transaksi` bigint(21) ,
 `Jumlah_Buku_Terpeminjam` decimal(23,0) 
)*/;

/*View structure for view anggota_minjam_lima_buku */

/*!50001 DROP TABLE IF EXISTS `anggota_minjam_lima_buku` */;
/*!50001 DROP VIEW IF EXISTS `anggota_minjam_lima_buku` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `anggota_minjam_lima_buku` AS select `a`.`IdAnggota` AS `IdAnggota`,`a`.`Nama_Anggota` AS `Nama_Anggota`,`a`.`Angkatan_Anggota` AS `Angkatan_Anggota`,`a`.`Tempat_Lahir_Anggota` AS `Tempat_Lahir_Anggota`,`a`.`Tanggal_Lahir_Anggota` AS `Tanggal_Lahir_Anggota`,`a`.`No_Telp` AS `No_Telp`,`a`.`Jenis_Kelamin` AS `Jenis_Kelamin`,`a`.`Status_Pinjam` AS `Status_Pinjam` from `anggota` `a` where (select count(0) from `peminjaman` `p` where `p`.`IdAnggota` = `a`.`IdAnggota`) = 5 */;

/*View structure for view buku_terpeminjam_terbanyak */

/*!50001 DROP TABLE IF EXISTS `buku_terpeminjam_terbanyak` */;
/*!50001 DROP VIEW IF EXISTS `buku_terpeminjam_terbanyak` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `buku_terpeminjam_terbanyak` AS select `pb`.`Kode_Buku` AS `Kode_Buku`,`b`.`Judul_Buku` AS `Judul_Buku`,`b`.`Pengarang_Buku` AS `Pengarang_Buku`,`b`.`Penerbit_Buku` AS `Penerbit_Buku`,count(0) AS `Jumlah_Peminjaman` from (`peminjaman` `pb` join `buku` `b` on(`pb`.`Kode_Buku` = `b`.`Kode_Buku`)) group by `pb`.`Kode_Buku`,`b`.`Judul_Buku`,`b`.`Pengarang_Buku`,`b`.`Penerbit_Buku` order by count(0) desc limit 1 */;

/*View structure for view transaksi_petugas */

/*!50001 DROP TABLE IF EXISTS `transaksi_petugas` */;
/*!50001 DROP VIEW IF EXISTS `transaksi_petugas` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `transaksi_petugas` AS select `p`.`IdPetugas` AS `IdPetugas`,`p`.`Username` AS `Username`,count(0) AS `Jumlah_Transaksi`,sum(case when `t`.`Tipe_Transaksi` = 'Peminjaman' then 1 else -1 end) AS `Jumlah_Buku_Terpeminjam` from (`petugas` `p` left join (select `peminjaman`.`IdPetugas` AS `IdPetugas`,'Peminjaman' AS `Tipe_Transaksi` from `peminjaman` union all select `pengembalian`.`IdPetugas` AS `IdPetugas`,'Pengembalian' AS `Tipe_Transaksi` from `pengembalian`) `t` on(`p`.`IdPetugas` = `t`.`IdPetugas`)) group by `p`.`IdPetugas`,`p`.`Username` */;

/*View structure for view transaksi_terbanyak_petugas */

/*!50001 DROP TABLE IF EXISTS `transaksi_terbanyak_petugas` */;
/*!50001 DROP VIEW IF EXISTS `transaksi_terbanyak_petugas` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `transaksi_terbanyak_petugas` AS select `p`.`IdPetugas` AS `IdPetugas`,`p`.`Username` AS `Username`,count(0) AS `Jumlah_Transaksi`,sum(case when `t`.`Tipe_Transaksi` = 'Peminjaman' then 1 else -1 end) AS `Jumlah_Buku_Terpeminjam` from (`petugas` `p` left join (select `peminjaman`.`IdPetugas` AS `IdPetugas`,'Peminjaman' AS `Tipe_Transaksi` from `peminjaman` union all select `pengembalian`.`IdPetugas` AS `IdPetugas`,'Pengembalian' AS `Tipe_Transaksi` from `pengembalian`) `t` on(`p`.`IdPetugas` = `t`.`IdPetugas`)) group by `p`.`IdPetugas`,`p`.`Username` order by count(0) desc limit 1 */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
