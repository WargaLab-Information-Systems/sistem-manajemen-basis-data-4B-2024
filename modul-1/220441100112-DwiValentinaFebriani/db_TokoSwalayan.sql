/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 10.4.27-MariaDB : Database - db_tokoswalayan
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_tokoswalayan` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `db_tokoswalayan`;

/*Table structure for table `barang` */

DROP TABLE IF EXISTS `barang`;

CREATE TABLE `barang` (
  `ID_barang` int(11) NOT NULL,
  `Nama_barang` varchar(50) DEFAULT NULL,
  `Harga` decimal(18,2) DEFAULT NULL,
  `Stok` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `barang` */

insert  into `barang`(`ID_barang`,`Nama_barang`,`Harga`,`Stok`) values 
(1,'Gula',15000.00,100),
(2,'Kopi',25000.00,50),
(3,'Sabun Mandi',10000.00,80),
(4,'Sampo',20000.00,70),
(5,'Beras',20000.00,120),
(6,'Garam',8000.00,90),
(7,'Minyak Goreng',12000.00,110),
(8,'Teh',15000.00,60),
(9,'Mie Instan',5000.00,150),
(10,'Susu',25000.00,40);

/*Table structure for table `keuangan` */

DROP TABLE IF EXISTS `keuangan`;

CREATE TABLE `keuangan` (
  `ID_keuangan` int(11) NOT NULL,
  `Jenis_keuangan` enum('Penjualan','Pembelian') DEFAULT NULL,
  `Jumlah` decimal(18,2) DEFAULT NULL,
  `Tanggal_transaksi` date DEFAULT NULL,
  PRIMARY KEY (`ID_keuangan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `keuangan` */

insert  into `keuangan`(`ID_keuangan`,`Jenis_keuangan`,`Jumlah`,`Tanggal_transaksi`) values 
(1,'Penjualan',50000.00,'2024-03-01'),
(2,'Pembelian',60000.00,'2024-03-02'),
(3,'Penjualan',20000.00,'2024-03-03'),
(4,'Penjualan',40000.00,'2024-03-04'),
(5,'Pembelian',24000.00,'2024-03-05'),
(6,'Penjualan',24000.00,'2024-03-06'),
(7,'Pembelian',25000.00,'2024-03-07'),
(8,'Penjualan',10000.00,'2024-03-08'),
(9,'Penjualan',30000.00,'2024-03-09'),
(10,'Penjualan',10000.00,'2024-03-10');

/*Table structure for table `laporan_penjualan` */

DROP TABLE IF EXISTS `laporan_penjualan`;

CREATE TABLE `laporan_penjualan` (
  `ID_laporan_penjualan` int(11) NOT NULL,
  `Tanggal_laporan` date DEFAULT NULL,
  `Total_penjualan` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`ID_laporan_penjualan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `laporan_penjualan` */

insert  into `laporan_penjualan`(`ID_laporan_penjualan`,`Tanggal_laporan`,`Total_penjualan`) values 
(1,'2024-03-01',50000.00),
(2,'2024-03-02',0.00),
(3,'2024-03-03',20000.00),
(4,'2024-03-04',40000.00),
(5,'2024-03-05',0.00),
(6,'2024-03-06',24000.00),
(7,'2024-03-07',0.00),
(8,'2024-03-08',10000.00),
(9,'2024-03-09',30000.00),
(10,'2024-03-10',10000.00);

/*Table structure for table `laporan_stok` */

DROP TABLE IF EXISTS `laporan_stok`;

CREATE TABLE `laporan_stok` (
  `ID_laporan_stok` int(11) NOT NULL,
  `Tanggal_laporan` date DEFAULT NULL,
  `ID_barang` int(11) DEFAULT NULL,
  `Stok_terjual` int(11) DEFAULT NULL,
  `Stok_tersisa` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_laporan_stok`),
  KEY `ID_barang` (`ID_barang`),
  CONSTRAINT `laporan_stok_ibfk_1` FOREIGN KEY (`ID_barang`) REFERENCES `barang` (`ID_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `laporan_stok` */

insert  into `laporan_stok`(`ID_laporan_stok`,`Tanggal_laporan`,`ID_barang`,`Stok_terjual`,`Stok_tersisa`) values 
(1,'2022-01-01',2,2,48),
(2,'2022-01-02',5,3,117),
(3,'2022-01-03',1,1,99),
(4,'2022-01-04',4,2,68),
(5,'2022-01-05',7,2,108),
(6,'2022-01-06',6,3,87),
(7,'2022-01-07',10,1,39),
(8,'2022-01-08',3,1,79),
(9,'2022-01-09',8,2,58),
(10,'2022-01-10',9,2,148);

/*Table structure for table `pelanggan` */

DROP TABLE IF EXISTS `pelanggan`;

CREATE TABLE `pelanggan` (
  `ID_pelanggan` int(11) NOT NULL,
  `Nama_pelanggan` varchar(50) DEFAULT NULL,
  `Alamat` varchar(100) DEFAULT NULL,
  `No_telepon` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ID_pelanggan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `pelanggan` */

insert  into `pelanggan`(`ID_pelanggan`,`Nama_pelanggan`,`Alamat`,`No_telepon`) values 
(1,'Putri Ajeng','Jl. Sudirman No. 123','081234567890'),
(2,'Adyama','Jl. Gatot Subroto No. 456','081234567891'),
(3,'Asafwa','Jl. Pahlawan No. 789','081234567892'),
(4,'Nafis','Jl. Thamrin No. 321','081234567893'),
(5,'Valentina','Jl. Asia Afrika No. 555','081234567894'),
(6,'Lois','Jl. Cendrawasih No. 999','081234567895'),
(7,'Yuyun','Jl. Kebon Jeruk No. 777','081234567896'),
(8,'Syafira','Jl. Merdeka No. 654','081234567897'),
(9,'Febriani','Jl. Kartini No. 111','081234567898'),
(10,'David','Jl. Diponegoro No. 222','081234567899');

/*Table structure for table `transaksi` */

DROP TABLE IF EXISTS `transaksi`;

CREATE TABLE `transaksi` (
  `ID_transaksi` int(11) NOT NULL,
  `Jenis_transaksi` enum('Penjualan','Pengembalian','Pembelian','Koreksi_stok') DEFAULT NULL,
  `ID_pelanggan` int(11) DEFAULT NULL,
  `ID_barang` int(11) DEFAULT NULL,
  `Jumlah` int(11) DEFAULT NULL,
  `Tanggal_transaksi` date DEFAULT NULL,
  PRIMARY KEY (`ID_transaksi`),
  KEY `ID_pelanggan` (`ID_pelanggan`),
  KEY `ID_barang` (`ID_barang`),
  CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`ID_pelanggan`) REFERENCES `pelanggan` (`ID_pelanggan`),
  CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`ID_barang`) REFERENCES `barang` (`ID_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `transaksi` */

insert  into `transaksi`(`ID_transaksi`,`Jenis_transaksi`,`ID_pelanggan`,`ID_barang`,`Jumlah`,`Tanggal_transaksi`) values 
(1,'Penjualan',1,2,2,'2024-03-01'),
(2,'Pembelian',2,5,3,'2024-03-02'),
(3,'Penjualan',3,1,1,'2024-03-03'),
(4,'Penjualan',4,4,2,'2024-03-04'),
(5,'Pembelian',5,7,2,'2024-03-05'),
(6,'Penjualan',6,6,3,'2024-03-06'),
(7,'Pembelian',7,10,1,'2024-03-07'),
(8,'Pengembalian',8,3,1,'2024-03-08'),
(9,'Koreksi_stok',9,8,2,'2024-03-09'),
(10,'Penjualan',10,9,2,'2024-03-10');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
