/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 10.4.32-MariaDB : Database - pos_swalayanstore
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`pos_swalayanstore` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `pos_swalayanstore`;

/*Table structure for table `barang` */

DROP TABLE IF EXISTS `barang`;

CREATE TABLE `barang` (
  `ID_Barang` int(11) NOT NULL AUTO_INCREMENT,
  `Nama_Barang` varchar(100) DEFAULT NULL,
  `Harga_Satuan` decimal(10,2) DEFAULT NULL,
  `Stok` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Barang`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `barang` */

insert  into `barang`(`ID_Barang`,`Nama_Barang`,`Harga_Satuan`,`Stok`) values 
(1,'Laptop',8000000.00,20),
(2,'Printer',2000000.00,15),
(3,'Smartphone',5000000.00,30),
(4,'Tablet',3000000.00,25),
(5,'Headphone',500000.00,50),
(6,'Mouse',150000.00,40),
(7,'Keyboard',200000.00,35),
(8,'Monitor',1500000.00,10),
(9,'Speaker',1000000.00,20),
(10,'Webcam',500000.00,15);

/*Table structure for table `pelanggan` */

DROP TABLE IF EXISTS `pelanggan`;

CREATE TABLE `pelanggan` (
  `ID_Pelanggan` int(11) NOT NULL AUTO_INCREMENT,
  `Nama_Pelanggan` varchar(100) DEFAULT NULL,
  `Alamat` text DEFAULT NULL,
  `Nomor_Telepon` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ID_Pelanggan`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `pelanggan` */

insert  into `pelanggan`(`ID_Pelanggan`,`Nama_Pelanggan`,`Alamat`,`Nomor_Telepon`) values 
(1,'John Doe','Jl. Merdeka No. 123','08123456789'),
(2,'Jane Smith','Jl. Pahlawan No. 45','08567891234'),
(3,'Alice Johnson','Jl. Diponegoro No. 67','08765432100'),
(4,'Bob Lee','Jl. Sudirman No. 89','08111122233'),
(5,'Emma Brown','Jl. Gatot Subroto No. 101','08555443322'),
(6,'Michael Wilson','Jl. Thamrin No. 12','08888777666'),
(7,'Olivia Taylor','Jl. Ahmad Yani No. 23','08999887766'),
(8,'James Martinez','Jl. Imam Bonjol No. 34','08213456788'),
(9,'Sophia Anderson','Jl. Juanda No. 56','08133344455'),
(10,'William Garcia','Jl. Hayam Wuruk No. 78','08598765432');

/*Table structure for table `transaksi` */

DROP TABLE IF EXISTS `transaksi`;

CREATE TABLE `transaksi` (
  `ID_Transaksi` int(11) NOT NULL AUTO_INCREMENT,
  `Tipe_Transaksi` varchar(50) DEFAULT NULL,
  `ID_Pelanggan` int(11) DEFAULT NULL,
  `ID_Barang` int(11) DEFAULT NULL,
  `Jumlah_Barang` int(11) DEFAULT NULL,
  `Total_Harga` decimal(10,2) DEFAULT NULL,
  `Tanggal_Transaksi` date DEFAULT NULL,
  `Keterangan` text DEFAULT NULL,
  PRIMARY KEY (`ID_Transaksi`),
  KEY `ID_Pelanggan` (`ID_Pelanggan`),
  KEY `ID_Barang` (`ID_Barang`),
  CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`ID_Pelanggan`) REFERENCES `pelanggan` (`ID_Pelanggan`),
  CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`ID_Barang`) REFERENCES `barang` (`ID_Barang`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `transaksi` */

insert  into `transaksi`(`ID_Transaksi`,`Tipe_Transaksi`,`ID_Pelanggan`,`ID_Barang`,`Jumlah_Barang`,`Total_Harga`,`Tanggal_Transaksi`,`Keterangan`) values 
(1,'Penjualan',1,3,2,10000000.00,'2024-04-01','Penjualan kepada pelanggan John Doe'),
(2,'Penjualan',2,1,1,8000000.00,'2024-04-02','Penjualan kepada pelanggan Jane Smith'),
(3,'Pembelian',3,5,3,1500000.00,'2024-04-03','Pembelian oleh pelanggan Alice Johnson'),
(4,'Penjualan',4,2,1,2000000.00,'2024-04-04','Penjualan kepada pelanggan Bob Lee'),
(5,'Pembelian',5,7,2,400000.00,'2024-04-05','Pembelian oleh pelanggan Emma Brown'),
(6,'Penjualan',6,4,2,6000000.00,'2024-04-06','Penjualan kepada pelanggan Michael Wilson'),
(7,'Penjualan',7,9,1,1000000.00,'2024-04-07','Penjualan kepada pelanggan Olivia Taylor'),
(8,'Pembelian',8,6,4,600000.00,'2024-04-08','Pembelian oleh pelanggan James Martinez'),
(9,'Penjualan',9,8,1,1500000.00,'2024-04-09','Penjualan kepada pelanggan Sophia Anderson'),
(10,'Pembelian',10,10,2,1000000.00,'2024-04-10','Pembelian oleh pelanggan William Garcia');

/* Procedure structure for procedure `tambah_transaksi` */

/*!50003 DROP PROCEDURE IF EXISTS  `tambah_transaksi` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `tambah_transaksi`(
    IN tipe_transaksi VARCHAR(50),
    IN id_pelanggan INT,
    IN id_barang INT,
    IN jumlah_barang INT,
    IN total_harga DECIMAL(10, 2),
    IN tanggal DATE,
    IN keterangan TEXT
)
BEGIN
    DECLARE error_message TEXT;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1 error_message = MESSAGE_TEXT;
        SELECT CONCAT('Gagal menambahkan transaksi: ', error_message) AS result;
    END;

    START TRANSACTION;
    INSERT INTO Transaksi (Tipe_Transaksi, ID_Pelanggan, ID_Barang, Jumlah_Barang, Total_Harga, Tanggal_Transaksi, Keterangan) 
    VALUES (tipe_transaksi, id_pelanggan, id_barang, jumlah_barang, total_harga, tanggal, keterangan);

    IF error_message IS NULL THEN
        COMMIT;
        SELECT 'Transaksi berhasil ditambahkan' AS result;
    ELSE
        ROLLBACK;
    END IF;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
