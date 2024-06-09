/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 10.4.32-MariaDB : Database - mobildb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mobildb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `mobildb`;

/*Table structure for table `mobil` */

DROP TABLE IF EXISTS `mobil`;

CREATE TABLE `mobil` (
  `ID_MOBIL` int(11) NOT NULL AUTO_INCREMENT,
  `PLATNO` varchar(20) NOT NULL,
  `MERK` varchar(50) NOT NULL,
  `JENIS` varchar(50) NOT NULL,
  `HARGA_SEWA_PERHARI` int(11) NOT NULL,
  PRIMARY KEY (`ID_MOBIL`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `mobil` */

insert  into `mobil`(`ID_MOBIL`,`PLATNO`,`MERK`,`JENIS`,`HARGA_SEWA_PERHARI`) values 
(1,'B 1234 CD','Toyota','SUV',500000),
(2,'B 5678 EF','Honda','Sedan',400000),
(3,'B 9101 GH','Suzuki','Hatchback',300000),
(4,'B 1121 IJ','Nissan','MPV',450000),
(5,'B 3141 KL','Daihatsu','SUV',480000),
(6,'B 5161 MN','Mitsubishi','Sedan',430000),
(7,'B 7181 OP','Kia','Hatchback',350000),
(8,'B 9202 QR','Hyundai','MPV',470000),
(9,'B 1223 ST','Ford','SUV',520000),
(10,'B 3243 UV','Chevrolet','Sedan',410000);

/*Table structure for table `pelanggan` */

DROP TABLE IF EXISTS `pelanggan`;

CREATE TABLE `pelanggan` (
  `ID_PELANGGAN` int(11) NOT NULL AUTO_INCREMENT,
  `NAMA` varchar(50) NOT NULL,
  `ALAMAT` varchar(255) NOT NULL,
  `NO_TELEPON` varchar(20) NOT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `NIK` varchar(16) NOT NULL,
  PRIMARY KEY (`ID_PELANGGAN`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `pelanggan` */

insert  into `pelanggan`(`ID_PELANGGAN`,`NAMA`,`ALAMAT`,`NO_TELEPON`,`EMAIL`,`NIK`) values 
(1,'Andi','Jl. Merdeka No. 1','081234567890','andi@example.com',''),
(2,'Budi','Jl. Sudirman No. 2','081234567891','budi@example.com',''),
(3,'Cici','Jl. Thamrin No. 3','081234567892','cici@example.com',''),
(4,'Dewi','Jl. Gatot Subroto No. 4','081234567893','dewi@example.com',''),
(5,'Eko','Jl. MH Thamrin No. 5','081234567894','eko@example.com',''),
(6,'Fani','Jl. Rasuna Said No. 6','081234567895','fani@example.com',''),
(7,'Gita','Jl. Jendral Sudirman No. 7','081234567896','gita@example.com',''),
(8,'Hadi','Jl. Imam Bonjol No. 8','081234567897','hadi@example.com',''),
(9,'Irma','Jl. Diponegoro No. 9','081234567898','irma@example.com',''),
(10,'Joko','Jl. Gajah Mada No. 10','081234567899','joko@example.com','');

/*Table structure for table `peminjamanmobil` */

DROP TABLE IF EXISTS `peminjamanmobil`;

CREATE TABLE `peminjamanmobil` (
  `ID_PEMINJAMAN` int(11) NOT NULL AUTO_INCREMENT,
  `ID_MOBIL` int(11) NOT NULL,
  `ID_PELANGGAN` int(11) NOT NULL,
  `TGL_PINJAM` date NOT NULL,
  `TGL_RENCANA_KEMBALI` date NOT NULL,
  `TOTAL_HARI` int(11) NOT NULL,
  `TOTAL_BAYAR` int(11) NOT NULL,
  `TGL_KEMBALI` date DEFAULT NULL,
  `DENDA` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_PEMINJAMAN`),
  KEY `ID_MOBIL` (`ID_MOBIL`),
  KEY `ID_PELANGGAN` (`ID_PELANGGAN`),
  CONSTRAINT `peminjamanmobil_ibfk_1` FOREIGN KEY (`ID_MOBIL`) REFERENCES `mobil` (`ID_MOBIL`),
  CONSTRAINT `peminjamanmobil_ibfk_2` FOREIGN KEY (`ID_PELANGGAN`) REFERENCES `pelanggan` (`ID_PELANGGAN`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `peminjamanmobil` */

insert  into `peminjamanmobil`(`ID_PEMINJAMAN`,`ID_MOBIL`,`ID_PELANGGAN`,`TGL_PINJAM`,`TGL_RENCANA_KEMBALI`,`TOTAL_HARI`,`TOTAL_BAYAR`,`TGL_KEMBALI`,`DENDA`) values 
(1,1,1,'2023-05-01','2023-05-05',4,2000000,'2023-05-05',0),
(2,2,2,'2023-05-02','2023-05-06',4,1600000,'2023-05-07',100000),
(3,3,3,'2023-05-03','2023-05-08',5,1500000,'2023-05-08',0),
(4,4,4,'2023-05-04','2023-05-09',5,2250000,'2023-05-10',450000),
(5,5,5,'2023-05-05','2023-05-10',5,2400000,'2023-05-09',0),
(6,6,6,'2023-05-06','2023-05-11',5,2150000,'2023-05-11',0),
(7,7,7,'2023-05-07','2023-05-12',5,1750000,'2023-05-13',50000),
(8,8,8,'2023-05-08','2023-05-13',5,2350000,'2023-05-13',0),
(9,9,9,'2023-05-09','2023-05-14',5,2600000,'2023-05-15',100000),
(10,10,10,'2023-05-10','2023-05-15',5,2050000,'2023-05-16',50000);

/*Table structure for table `transaksi` */

DROP TABLE IF EXISTS `transaksi`;

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL AUTO_INCREMENT,
  `id_konsumen` int(11) NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  PRIMARY KEY (`id_transaksi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `transaksi` */

/* Trigger structure for table `mobil` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `cek_platno_sebelum_insert` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `cek_platno_sebelum_insert` BEFORE INSERT ON `mobil` FOR EACH ROW 
BEGIN
  IF NOT LEFT(NEW.PLATNO, 1) REGEXP '^[A-Za-z]$' AND NOT LEFT(NEW.PLATNO, 2) REGEXP '^[A-Za-z]{2}$' THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = '1 atau 2 karakter awal pada PLATNO harus berupa huruf';
  END IF;
END */$$


DELIMITER ;

/* Trigger structure for table `mobil` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `cek_platno_sebelum_update` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `cek_platno_sebelum_update` BEFORE UPDATE ON `mobil` FOR EACH ROW 
BEGIN
  IF NOT LEFT(NEW.PLATNO, 1) REGEXP '^[A-Za-z]$' AND NOT LEFT(NEW.PLATNO, 2) REGEXP '^[A-Za-z]{2}$' THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = '1 atau 2 karakter awal pada PLATNO harus berupa huruf';
  END IF;
END */$$


DELIMITER ;

/* Trigger structure for table `pelanggan` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `cek_panjang_nik_sebelum_insert` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `cek_panjang_nik_sebelum_insert` BEFORE INSERT ON `pelanggan` FOR EACH ROW 
BEGIN
  IF CHAR_LENGTH(NEW.NIK) <> 16 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Panjang NIK harus 16 karakter';
  END IF;
END */$$


DELIMITER ;

/* Trigger structure for table `pelanggan` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `cek_panjang_nik_sebelum_update` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `cek_panjang_nik_sebelum_update` BEFORE UPDATE ON `pelanggan` FOR EACH ROW 
BEGIN
  IF CHAR_LENGTH(NEW.NIK) <> 16 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Panjang NIK harus 16 karakter';
  END IF;
END */$$


DELIMITER ;

/* Trigger structure for table `peminjamanmobil` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `cek_tanggal_sebelum_insert` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `cek_tanggal_sebelum_insert` BEFORE INSERT ON `peminjamanmobil` FOR EACH ROW 
BEGIN
  IF NEW.TGL_RENCANA_KEMBALI < NEW.TGL_PINJAM THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'TGL_RENCANA_KEMBALI tidak boleh lebih awal dari TGL_PINJAM';
  END IF;
END */$$


DELIMITER ;

/* Trigger structure for table `peminjamanmobil` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `cek_tanggal_sebelum_update` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `cek_tanggal_sebelum_update` BEFORE UPDATE ON `peminjamanmobil` FOR EACH ROW 
BEGIN
  IF NEW.TGL_RENCANA_KEMBALI < NEW.TGL_PINJAM THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'TGL_RENCANA_KEMBALI tidak boleh lebih awal dari TGL_PINJAM';
  END IF;
END */$$


DELIMITER ;

/* Trigger structure for table `peminjamanmobil` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `update_on_return` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `update_on_return` BEFORE UPDATE ON `peminjamanmobil` FOR EACH ROW 
BEGIN
  -- Mengisi TGL_KEMBALI jika belum diisi
  IF NEW.TGL_KEMBALI IS NULL THEN
    SET NEW.TGL_KEMBALI = CURDATE();
  END IF;

  -- Menghitung TOTAL_HARI
  SET NEW.TOTAL_HARI = DATEDIFF(NEW.TGL_KEMBALI, NEW.TGL_PINJAM);

  -- Menghitung TOTAL_BAYAR dengan mengambil HARGA_SEWA_PERHARI dari tabel Mobil
  SET NEW.TOTAL_BAYAR = (SELECT NEW.TOTAL_HARI * HARGA_SEWA_PERHARI 
                         FROM Mobil 
                         WHERE Mobil.ID_MOBIL = NEW.ID_MOBIL);

  -- Menghitung DENDA jika TGL_KEMBALI lebih lambat dari TGL_RENCANA_KEMBALI
  IF NEW.TGL_KEMBALI > NEW.TGL_RENCANA_KEMBALI THEN
    SET NEW.DENDA = DATEDIFF(NEW.TGL_KEMBALI, NEW.TGL_RENCANA_KEMBALI) * 50000; -- Misalnya denda Rp50,000 per hari keterlambatan
  ELSE
    SET NEW.DENDA = 0;
  END IF;
END */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
