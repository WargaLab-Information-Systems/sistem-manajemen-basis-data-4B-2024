/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 10.4.32-MariaDB : Database - perpustakaan
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`perpustakaan` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `perpustakaan`;

/*Table structure for table `anggota` */

DROP TABLE IF EXISTS `anggota`;

CREATE TABLE `anggota` (
  `ID_Anggota` int(11) NOT NULL AUTO_INCREMENT,
  `Nama` varchar(100) DEFAULT NULL,
  `Alamat` varchar(255) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Anggota`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `anggota` */

insert  into `anggota`(`ID_Anggota`,`Nama`,`Alamat`,`Email`) values 
(1,'John Doe','Jl. ABC No. 123','john@example.com'),
(2,'Jane Smith','Jl. XYZ No. 456','jane@example.com'),
(3,'Lana','Bojonegoro','lana@gmail.com'),
(4,'Hapsah','Sugeng','hapsah@gmaila.com'),
(5,'Agung','Lamongan','agung@gmail.com'),
(6,'Haqi','Surabaya','haqi@gmail.com'),
(7,'Mahsus','Bangkalan','mahsus@gmail.com'),
(8,'Fikri','Bangkalan','fikri@gmail.com'),
(9,'Indra','Siduarjo','indra@gmail.com'),
(10,'Alfa','Lamongan','alfa@gmail.com'),
(11,'Dodik','Bangkalan','dodik@gmail.com'),
(12,'Imam','Bangkalan','imam@gmail.com'),
(13,'Aldo','Tangerang','aldo@gmail.com'),
(14,'David','Gresik','david@gmail.com'),
(15,'Hapsah','Lamongan','hapsah@gmail.com'),
(16,'Maulana','Surabaya','maulana@gmail.com'),
(17,'Fiko','Bangkalan','fiko@gmail.com'),
(18,'Agnes','Bangkalan','agnes@gmail.com'),
(19,'Kristy','Rajangan','kristy@gmail.com'),
(20,'NIsa','Sumenep','nisa@gmail.com');

/*Table structure for table `buku` */

DROP TABLE IF EXISTS `buku`;

CREATE TABLE `buku` (
  `ID_Buku` int(11) NOT NULL AUTO_INCREMENT,
  `Judul` varchar(255) DEFAULT NULL,
  `Pengarang` varchar(100) DEFAULT NULL,
  `Penerbit` varchar(100) DEFAULT NULL,
  `Tahun_Terbit` year(4) DEFAULT NULL,
  PRIMARY KEY (`ID_Buku`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `buku` */

insert  into `buku`(`ID_Buku`,`Judul`,`Pengarang`,`Penerbit`,`Tahun_Terbit`) values 
(1,'Harry Potter dan Batu','J.K. Rowling','Gramedia',1997),
(2,'The Hobbit','J.R.R. Tolkien','Pustaka Jaya',1937),
(3,'Mawar Ungu','Rafi','Gramedia',2000),
(4,'Kuningan','Samsul','Pustaka Jaya',2001),
(5,'Pudar Cinta','David','Sinar Dunia',2002),
(6,'Berbekas','Gisel','Gramedia',2003),
(7,'Prinsip Iman','Annan','Sinar Mass',2004),
(8,'Momongan','Aldo','Go Kampus',2005),
(9,'Sex edukasi','Abib','Erlangga',2006),
(10,'Mendapatkan Kebahagiaan','Nisa','Bentang Pustaka',2007),
(11,'Tolak Sedih','Ardi','Greenbook',NULL),
(12,'Preasure','Cindi','Mizan Publishing',2008),
(13,'Dont Cry','Mulfika','Pustaka Alvabet',NULL),
(14,'The Imo','Sabauan','GagasMedia',2009),
(15,'Happy Angels','Surung','Widina',2010),
(16,'Train Sunday','Sudung','Sinat Edu',2011),
(17,'Powerfull','Alfina','Publikasi Ilmiah',2012),
(18,'Graduation Baby','Anvina','Karunia',2013),
(19,'Love Language','Andi','Gagasan Media',2014),
(20,'The Narnia','Zubait','Karya Cipta',2015);

/*Table structure for table `detail_buku` */

DROP TABLE IF EXISTS `detail_buku`;

CREATE TABLE `detail_buku` (
  `ID_Detail` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Buku` int(11) DEFAULT NULL,
  `ID_Kategori` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Detail`),
  KEY `ID_Buku` (`ID_Buku`),
  KEY `ID_Kategori` (`ID_Kategori`),
  CONSTRAINT `detail_buku_ibfk_1` FOREIGN KEY (`ID_Buku`) REFERENCES `buku` (`ID_Buku`),
  CONSTRAINT `detail_buku_ibfk_2` FOREIGN KEY (`ID_Kategori`) REFERENCES `kategori` (`ID_Kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `detail_buku` */

insert  into `detail_buku`(`ID_Detail`,`ID_Buku`,`ID_Kategori`) values 
(1,1,1),
(2,2,1),
(3,3,1),
(4,4,2),
(5,5,2),
(6,6,1),
(7,7,1),
(8,3,2),
(9,4,1),
(10,5,2),
(11,6,2),
(12,7,1),
(13,3,2),
(14,4,2),
(15,5,1),
(16,6,1),
(17,7,1),
(18,3,2),
(19,4,2),
(20,5,1);

/*Table structure for table `kategori` */

DROP TABLE IF EXISTS `kategori`;

CREATE TABLE `kategori` (
  `ID_Kategori` int(11) NOT NULL AUTO_INCREMENT,
  `Nama_Kategori` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_Kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `kategori` */

insert  into `kategori`(`ID_Kategori`,`Nama_Kategori`) values 
(1,'Fiksi'),
(2,'Non-Fiksi'),
(3,'Sains'),
(4,'Sejarah'),
(5,'Biografi'),
(6,'Teknologi'),
(7,'Seni'),
(8,'Olahraga'),
(9,'Pendidikan'),
(10,'Politik'),
(11,'Agama'),
(12,'Hukum'),
(13,'Musik'),
(14,'Bisnis'),
(15,'Kesehatan'),
(16,'Lingkungan'),
(17,'Wisata'),
(18,'Kuliner'),
(19,'Mode'),
(20,'Keluarga');

/*Table structure for table `peminjaman` */

DROP TABLE IF EXISTS `peminjaman`;

CREATE TABLE `peminjaman` (
  `ID_Peminjaman` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Anggota` int(11) DEFAULT NULL,
  `ID_Buku` int(11) DEFAULT NULL,
  `Tanggal_Pinjam` date DEFAULT NULL,
  `Tanggal_Kembali` date DEFAULT NULL,
  `Status` enum('Dipinjam','Dikembalikan') DEFAULT NULL,
  PRIMARY KEY (`ID_Peminjaman`),
  KEY `ID_Anggota` (`ID_Anggota`),
  KEY `ID_Buku` (`ID_Buku`),
  CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`ID_Anggota`) REFERENCES `anggota` (`ID_Anggota`),
  CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`ID_Buku`) REFERENCES `buku` (`ID_Buku`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `peminjaman` */

insert  into `peminjaman`(`ID_Peminjaman`,`ID_Anggota`,`ID_Buku`,`Tanggal_Pinjam`,`Tanggal_Kembali`,`Status`) values 
(1,1,1,'2024-03-25','2024-04-01','Dipinjam'),
(2,2,2,'2024-03-20','2024-03-28','Dikembalikan'),
(3,2,3,'2024-03-01','2024-03-12','Dikembalikan'),
(4,4,4,'2024-03-02','2024-03-13','Dipinjam'),
(5,5,5,'2024-03-03','2024-03-14','Dipinjam'),
(6,6,6,'2024-03-04','2024-03-15','Dikembalikan'),
(7,7,7,'2024-03-05','2024-03-16','Dipinjam'),
(8,8,8,'2024-04-06','2024-03-17','Dikembalikan'),
(9,9,9,'2024-03-07','2024-03-18','Dipinjam'),
(10,10,10,'2024-03-08','2024-03-19','Dikembalikan'),
(11,12,11,'2024-03-09','2024-03-20','Dipinjam'),
(12,13,12,'2024-03-10','2024-03-21','Dipinjam'),
(13,14,14,'2024-03-11','2024-03-22','Dikembalikan'),
(14,15,15,'2024-03-12','2024-03-23','Dikembalikan'),
(15,16,16,'2024-03-13','2024-03-24','Dipinjam'),
(16,17,17,'2024-03-14','2024-03-25','Dikembalikan'),
(17,17,17,'2024-03-15','2024-03-26','Dipinjam'),
(18,18,18,'2024-03-16','2024-03-27','Dikembalikan'),
(19,19,19,'2024-03-17','2024-03-28','Dipinjam'),
(20,20,20,'2024-03-18','2024-03-29','Dikembalikan');

/*Table structure for table `perpus` */

DROP TABLE IF EXISTS `perpus`;

CREATE TABLE `perpus` (
  `no_buku` int(11) NOT NULL,
  `judul_buku` varchar(100) NOT NULL,
  `pengarang` varchar(30) NOT NULL,
  `tahun` int(4) NOT NULL,
  `penerbit` varchar(100) NOT NULL,
  PRIMARY KEY (`no_buku`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `perpus` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
