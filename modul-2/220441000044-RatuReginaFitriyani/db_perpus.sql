/*
SQLyog Community v12.4.0 (64 bit)
MySQL - 10.4.27-MariaDB : Database - db_perpus
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_perpus` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `db_perpus`;

/*Table structure for table `anggota` */

DROP TABLE IF EXISTS `anggota`;

CREATE TABLE `anggota` (
  `id_anggota` varchar(10) NOT NULL,
  `nama_anggota` varchar(20) DEFAULT NULL,
  `angkatan_anggota` varchar(6) DEFAULT NULL,
  `tempat_lahir` varchar(20) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `no_telp` int(12) DEFAULT NULL,
  `jenis_kelamin` varchar(15) DEFAULT NULL,
  `status_pinjam` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_anggota`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `anggota` */

insert  into `anggota`(`id_anggota`,`nama_anggota`,`angkatan_anggota`,`tempat_lahir`,`tanggal_lahir`,`no_telp`,`jenis_kelamin`,`status_pinjam`) values 
('a1','Jono','2021','Bangkalan','2001-12-09',2147483647,'Laki-laki','pinjam'),
('a2','Andre','2021','Bangkalan','2000-06-05',2147483647,'Laki-laki','pinjam'),
('a3','Melisa','2022','Sampang','2001-06-06',2147483647,'Perempuan','pinjam'),
('a4','Nagita','2022','Sumenep','2001-08-09',2147483647,'Perempuan','pinjam'),
('a5','Renata','2021','Bangkalan','2000-11-10',2147483647,'Perempuan','pinjam'),
('a6','Udin','2021','Pamekasan','2000-11-03',2147483647,'Laki-laki','pinjam');

/*Table structure for table `buku` */

DROP TABLE IF EXISTS `buku`;

CREATE TABLE `buku` (
  `kode_buku` varchar(10) NOT NULL,
  `judul_buku` varchar(25) DEFAULT NULL,
  `pengarang_buku` varchar(30) DEFAULT NULL,
  `penerbit_buku` varchar(30) DEFAULT NULL,
  `tahun_buku` varchar(10) DEFAULT NULL,
  `jumlah_buku` varchar(15) DEFAULT NULL,
  `status_buku` varchar(10) DEFAULT NULL,
  `klasifikasi_buku` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`kode_buku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `buku` */

insert  into `buku`(`kode_buku`,`judul_buku`,`pengarang_buku`,`penerbit_buku`,`tahun_buku`,`jumlah_buku`,`status_buku`,`klasifikasi_buku`) values 
('bk-01','Lautku','Ivan Hadibroso','Andre Laksamana','2000','5','baik','Sea'),
('bk-02','Pemrograman','Bambang Purnomo','Hardiyanto','2010','3','baik','IT'),
('bk-03','5cm','Donny Dhirgantoro','Sunil Soraya','2012','10','baik','Mountain'),
('bk-04','Sikecil Kancil','Santoso','Aldo Pratama','2005','2','baik','Forest'),
('bk-05','Anjay','Reza Chandra','Haryono Setiawan','2015','5','baik','Words');

/*Table structure for table `peminjaman` */

DROP TABLE IF EXISTS `peminjaman`;

CREATE TABLE `peminjaman` (
  `kode_peminjaman` varchar(10) NOT NULL,
  `id_anggota` varchar(10) DEFAULT NULL,
  `id_petugas` varchar(10) DEFAULT NULL,
  `tanggal_pinjam` date DEFAULT NULL,
  `tanggal_kembali` date DEFAULT NULL,
  `kode_buku` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`kode_peminjaman`),
  KEY `id_petugas` (`id_petugas`),
  KEY `kode_buku` (`kode_buku`),
  KEY `id_anggota` (`id_anggota`),
  CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`),
  CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`kode_buku`) REFERENCES `buku` (`kode_buku`),
  CONSTRAINT `peminjaman_ibfk_3` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `peminjaman` */

insert  into `peminjaman`(`kode_peminjaman`,`id_anggota`,`id_petugas`,`tanggal_pinjam`,`tanggal_kembali`,`kode_buku`) values 
('kp-01','a1','p1','2023-03-27','2023-03-30','bk-01'),
('kp-02','a2','p2','2023-02-10','2023-02-15','bk-02'),
('kp-03','a3','p3','2023-05-05','2023-05-10','bk-03'),
('kp-04','a4','p4','2023-04-06','2023-04-09','bk-04'),
('kp-05','a5','p5','2023-01-01','2023-01-06','bk-05'),
('kp-06','a5','p5','2023-01-01','2023-01-06','bk-04'),
('kp-07','a5','p5','2023-01-01','2023-01-06','bk-03'),
('kp-08','a5','p5','2023-01-01','2023-01-06','bk-02'),
('kp-09','a5','p5','2023-01-01','2023-01-06','bk-03'),
('kp-10','a5','p5','2023-01-01','2023-01-06','bk-05');

/*Table structure for table `pengembalian` */

DROP TABLE IF EXISTS `pengembalian`;

CREATE TABLE `pengembalian` (
  `kode_kembali` varchar(10) NOT NULL,
  `id_anggota` varchar(10) DEFAULT NULL,
  `kode_buku` varchar(10) DEFAULT NULL,
  `id_petugas` varchar(10) DEFAULT NULL,
  `tanggal_pinjam` date DEFAULT NULL,
  `tanggal_kembali` date DEFAULT NULL,
  `denda` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`kode_kembali`),
  KEY `id_petugas` (`id_petugas`),
  KEY `kode_buku` (`kode_buku`),
  KEY `id_anggota` (`id_anggota`),
  CONSTRAINT `pengembalian_ibfk_1` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`),
  CONSTRAINT `pengembalian_ibfk_2` FOREIGN KEY (`kode_buku`) REFERENCES `buku` (`kode_buku`),
  CONSTRAINT `pengembalian_ibfk_3` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `pengembalian` */

insert  into `pengembalian`(`kode_kembali`,`id_anggota`,`kode_buku`,`id_petugas`,`tanggal_pinjam`,`tanggal_kembali`,`denda`) values 
('kb-01','a1','bk-01','p1','2023-03-27','2023-03-30','0'),
('kb-02','a2','bk-02','p2','2023-02-10','2023-02-15','0'),
('kb-03','a3','bk-03','p3','2023-05-05','2023-05-10','0'),
('kb-04','a4','bk-04','p4','2023-04-06','2023-04-09','0'),
('kb-05','a5','bk-05','p5','2023-01-01','2023-01-06','0'),
('kb-06','a2','bk-02','p2','2023-02-10','2023-02-15','0'),
('kb-07','a4','bk-04','p4','2023-04-06','2023-04-09','0'),
('kb-08','a4','bk-04','p4','2023-04-06','2023-04-09','0'),
('kb-09','a4','bk-04','p4','2023-04-06','2023-04-09','0');

/*Table structure for table `petugas` */

DROP TABLE IF EXISTS `petugas`;

CREATE TABLE `petugas` (
  `id_petugas` varchar(10) NOT NULL,
  `username` varchar(15) DEFAULT NULL,
  `PASSWORD` varchar(15) DEFAULT NULL,
  `nama` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_petugas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `petugas` */

insert  into `petugas`(`id_petugas`,`username`,`PASSWORD`,`nama`) values 
('p1','admin01','123','Arie'),
('p2','admin02','123','Fira'),
('p3','admin03','123','Aldi'),
('p4','admin04','123','Dika'),
('p5','admin05','123','Putri'),
('p6','admin06','112233','Dono');

/*Table structure for table `buku_terbanyak` */

DROP TABLE IF EXISTS `buku_terbanyak`;

/*!50001 DROP VIEW IF EXISTS `buku_terbanyak` */;
/*!50001 DROP TABLE IF EXISTS `buku_terbanyak` */;

/*!50001 CREATE TABLE  `buku_terbanyak`(
 `kode_buku` varchar(10) ,
 `judul_buku` varchar(25) ,
 `pengarang_buku` varchar(30) ,
 `jumlah_dipinjam` bigint(21) 
)*/;

/*Table structure for table `petugas_transaksi` */

DROP TABLE IF EXISTS `petugas_transaksi`;

/*!50001 DROP VIEW IF EXISTS `petugas_transaksi` */;
/*!50001 DROP TABLE IF EXISTS `petugas_transaksi` */;

/*!50001 CREATE TABLE  `petugas_transaksi`(
 `id_petugas` varchar(10) ,
 `nama` varchar(25) ,
 `tanggal_pinjam` date ,
 `jumlah_transaksi` bigint(21) 
)*/;

/*Table structure for table `view_anggota_lebih_dari_5_buku` */

DROP TABLE IF EXISTS `view_anggota_lebih_dari_5_buku`;

/*!50001 DROP VIEW IF EXISTS `view_anggota_lebih_dari_5_buku` */;
/*!50001 DROP TABLE IF EXISTS `view_anggota_lebih_dari_5_buku` */;

/*!50001 CREATE TABLE  `view_anggota_lebih_dari_5_buku`(
 `id_anggota` varchar(10) ,
 `nama_anggota` varchar(20) ,
 `jumlah_peminjaman` bigint(21) 
)*/;

/*View structure for view buku_terbanyak */

/*!50001 DROP TABLE IF EXISTS `buku_terbanyak` */;
/*!50001 DROP VIEW IF EXISTS `buku_terbanyak` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `buku_terbanyak` AS select `p`.`kode_buku` AS `kode_buku`,`b`.`judul_buku` AS `judul_buku`,`b`.`pengarang_buku` AS `pengarang_buku`,count(0) AS `jumlah_dipinjam` from (`buku` `b` join `peminjaman` `p` on(`p`.`kode_buku` = `b`.`kode_buku`)) group by `p`.`kode_buku` */;

/*View structure for view petugas_transaksi */

/*!50001 DROP TABLE IF EXISTS `petugas_transaksi` */;
/*!50001 DROP VIEW IF EXISTS `petugas_transaksi` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `petugas_transaksi` AS select `ptg`.`id_petugas` AS `id_petugas`,`ptg`.`nama` AS `nama`,`pmj`.`tanggal_pinjam` AS `tanggal_pinjam`,count(0) AS `jumlah_transaksi` from (`petugas` `ptg` join `peminjaman` `pmj` on(`ptg`.`id_petugas` = `pmj`.`id_petugas`)) group by `ptg`.`id_petugas` */;

/*View structure for view view_anggota_lebih_dari_5_buku */

/*!50001 DROP TABLE IF EXISTS `view_anggota_lebih_dari_5_buku` */;
/*!50001 DROP VIEW IF EXISTS `view_anggota_lebih_dari_5_buku` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_anggota_lebih_dari_5_buku` AS select `a`.`id_anggota` AS `id_anggota`,`a`.`nama_anggota` AS `nama_anggota`,count(`p`.`kode_peminjaman`) AS `jumlah_peminjaman` from (`anggota` `a` join `peminjaman` `p` on(`a`.`id_anggota` = `p`.`id_anggota`)) group by `a`.`id_anggota`,`a`.`nama_anggota` having count(`p`.`kode_peminjaman`) > 5 */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
