/*
SQLyog Community v13.2.1 (64 bit)
MySQL - 10.4.32-MariaDB : Database - db_tls
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_tls` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `db_20-138`;

/*Table structure for table `anggota` */

DROP TABLE IF EXISTS `anggota`;

CREATE TABLE `anggota` (
  `IdAnggota` INT(11) NOT NULL AUTO_INCREMENT,
  `Nama Lengkap` VARCHAR(255) NOT NULL,
  `Alamat` VARCHAR(255) NOT NULL,
  `No Telepon` VARCHAR(255) NOT NULL,
  `Email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`IdAnggota`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `anggota` */

/*Table structure for table `buku` */

DROP TABLE IF EXISTS `buku`;

CREATE TABLE `buku` (
  `Kode Buku` INT(11) NOT NULL AUTO_INCREMENT,
  `Judul Buku` VARCHAR(255) NOT NULL,
  `Penulis` VARCHAR(255) NOT NULL,
  `Penerbit` VARCHAR(255) NOT NULL,
  `Tahun Terbit` YEAR(4) NOT NULL,
  `Genre` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Kode Buku`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `buku` */

/*Table structure for table `inventory` */

DROP TABLE IF EXISTS `inventory`;

CREATE TABLE `inventory` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` INT(10) UNSIGNED NOT NULL,
  `month` INT(11) NOT NULL,
  `year` INT(11) NOT NULL,
  `quantity` INT(11) NOT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=INNODB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `inventory` */

INSERT  INTO `inventory`(`id`,`product_id`,`month`,`year`,`quantity`,`date`) VALUES 
(1,2,1,2016,3070,'2016-01-05'),
(2,2,2,2016,2905,'2016-02-05'),
(3,2,3,2016,3046,'2016-03-05'),
(4,2,4,2016,3035,'2016-04-05'),
(5,2,5,2016,3176,'2016-05-05'),
(6,2,6,2016,1741,'2016-06-05'),
(7,2,7,2016,3381,'2016-07-05'),
(8,2,8,2016,2670,'2016-08-05'),
(9,2,9,2016,2881,'2016-09-05'),
(10,2,10,2016,3093,'2016-10-05'),
(11,2,11,2016,3375,'2016-11-05'),
(12,2,12,2016,2929,'2016-12-05'),
(13,2,1,2017,2588,'2017-01-05'),
(14,2,2,2017,2658,'2017-02-05'),
(15,2,3,2017,2823,'2017-03-05'),
(16,2,4,2017,2728,'2017-04-05'),
(17,2,5,2017,2708,'2017-05-05'),
(18,2,6,2017,1787,'2017-06-05'),
(19,2,7,2017,3010,'2017-07-05'),
(20,2,8,2017,3082,'2017-08-05'),
(21,2,9,2017,2599,'2017-09-05'),
(22,2,10,2017,3272,'2017-10-05'),
(23,2,11,2017,2623,'2017-11-05'),
(24,2,12,2017,2717,'2017-12-05'),
(25,2,1,2018,2596,'2018-01-05'),
(26,2,2,2018,2658,'2018-02-05'),
(27,2,3,2018,2846,'2018-03-05'),
(28,2,4,2018,2728,'2018-04-05'),
(29,2,5,2018,2713,'2018-05-05'),
(30,2,6,2018,1787,'2018-06-05'),
(31,2,7,2018,3010,'2018-07-05'),
(32,2,8,2018,3082,'2018-08-05'),
(33,2,9,2018,2500,'2018-09-05'),
(34,2,10,2018,3200,'2018-10-05'),
(35,2,11,2018,2600,'2018-11-05'),
(36,2,12,2018,2700,'2018-12-05'),
(37,2,1,2019,2232,'2019-01-05');

/*Table structure for table `m2_buku` */

DROP TABLE IF EXISTS `m2_buku`;

CREATE TABLE `m2_buku` (
  `Kode_buku` VARCHAR(10) NOT NULL,
  `Judul_buku` VARCHAR(25) NOT NULL,
  `Pengarang_buku` VARCHAR(30) NOT NULL,
  `Penerbit_buku` VARCHAR(30) NOT NULL,
  `Tahun_buku` VARCHAR(10) NOT NULL,
  `Jumlah_buku` VARCHAR(5) NOT NULL,
  `Status_buku` VARCHAR(10) NOT NULL,
  `Klasifikasi_buku` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Kode_buku`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `m2_buku` */

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(100) NOT NULL,
  `name` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=INNODB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `product` */

INSERT  INTO `product`(`id`,`code`,`name`) VALUES 
(2,'300454','NABATI RCE 8g'),
(4,'300458','NABATI RCE 50g'),
(5,'301234','NABATI RCO 8g'),
(6,'301241','NABATI RCO 50g'),
(7,'301211','NABATI RCO 145g'),
(8,'301242','NABATI RCW 50g');

/*Table structure for table `sale` */

DROP TABLE IF EXISTS `sale`;

CREATE TABLE `sale` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` INT(10) UNSIGNED NOT NULL,
  `month` INT(10) NOT NULL,
  `year` INT(10) NOT NULL,
  `quantity` INT(11) NOT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `sale_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=INNODB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `sale` */

INSERT  INTO `sale`(`id`,`product_id`,`month`,`year`,`quantity`,`date`) VALUES 
(1,2,1,2016,3070,'2016-01-05'),
(2,2,2,2016,2905,'2016-02-05'),
(3,2,3,2016,3046,'2016-03-05'),
(4,2,4,2016,3035,'2016-04-05'),
(5,2,5,2016,3176,'2016-05-05'),
(6,2,6,2016,1741,'2016-06-05'),
(7,2,7,2016,3381,'2016-07-05'),
(8,2,8,2016,2670,'2016-08-05'),
(9,2,9,2016,2881,'2016-09-05'),
(10,2,10,2016,3093,'2016-10-05'),
(11,2,11,2016,3375,'2016-11-05'),
(12,2,12,2016,2929,'2016-12-05'),
(13,2,1,2017,2588,'2017-01-05'),
(14,2,2,2017,2658,'2017-02-05'),
(15,2,3,2017,2823,'2017-03-05'),
(16,2,4,2017,2728,'2017-04-05'),
(17,2,5,2017,2708,'2017-05-05'),
(18,2,6,2017,1787,'2017-06-05'),
(19,2,7,2017,3010,'2017-07-05'),
(20,2,8,2017,3082,'2017-08-05'),
(21,2,9,2017,2599,'2017-09-05'),
(22,2,10,2017,3272,'2017-10-05'),
(23,2,11,2017,2623,'2017-11-05'),
(24,2,12,2017,2717,'2017-12-05'),
(25,2,1,2018,2596,'2018-01-05'),
(26,2,2,2018,2658,'2018-02-05'),
(27,2,3,2018,2846,'2018-03-05'),
(28,2,4,2018,2728,'2018-04-05'),
(29,2,5,2018,2713,'2018-05-05'),
(30,2,6,2018,1787,'2018-06-05'),
(31,2,7,2018,3010,'2018-07-05'),
(32,2,8,2018,3082,'2018-08-05'),
(33,2,9,2018,2599,'2018-09-05'),
(34,2,10,2018,3270,'2018-10-05'),
(35,2,11,2018,2623,'2018-11-05'),
(36,2,12,2018,2717,'2018-12-05'),
(38,2,1,2019,2222,'2019-01-05');

/*Table structure for table `table_groups` */

DROP TABLE IF EXISTS `table_groups`;

CREATE TABLE `table_groups` (
  `id` MEDIUMINT(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  `description` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `table_groups` */

INSERT  INTO `table_groups`(`id`,`name`,`description`) VALUES 
(1,'admin','Administrator'),
(2,'user','General User'),
(3,'manager','manager');

/*Table structure for table `table_log` */

DROP TABLE IF EXISTS `table_log`;

CREATE TABLE `table_log` (
  `log_id` INT(11) NOT NULL AUTO_INCREMENT,
  `log_action` TEXT NOT NULL,
  `log_datetime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  `log_ipaddress` VARCHAR(20) NOT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=INNODB AUTO_INCREMENT=309 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `table_log` */

INSERT  INTO `table_log`(`log_id`,`log_action`,`log_datetime`,`log_ipaddress`,`user_id`) VALUES 
(1,'add data user','2018-07-13 17:28:10','::1',1),
(2,'update data skpd','2018-07-13 17:39:14','::1',1),
(3,'add data userprofile','2018-07-16 10:25:17','::1',1),
(4,'update data userprofile','2018-07-16 11:11:59','::1',1),
(5,'add data usulan','2018-07-16 17:41:07','::1',1),
(6,'add data menu','2018-07-17 00:30:32','::1',1),
(7,'update data menu','2018-07-17 00:31:37','::1',1),
(8,'add data submenu','2018-07-17 01:26:16','::1',1),
(9,'add data submenu','2018-07-17 01:28:16','::1',1),
(10,'add data menu','2018-07-17 01:33:25','::1',1),
(11,'add data menu','2018-07-17 01:33:41','::1',1),
(12,'add data menu','2018-07-17 01:33:54','::1',1),
(13,'add data menu','2018-07-17 01:34:07','::1',1),
(14,'add data menu','2018-07-17 01:34:21','::1',1),
(15,'add data menu','2018-07-17 01:35:37','::1',1),
(16,'add data group','2018-07-17 01:50:39','::1',1),
(17,'add data groupmenu','2018-07-17 02:05:13','::1',1),
(18,'add data groupmenu','2018-07-17 02:14:49','::1',1),
(19,'add data groupmenu','2018-07-17 02:16:15','::1',1),
(20,'add data groupmenu','2018-07-17 02:16:20','::1',1),
(21,'add data groupmenu','2018-07-17 02:16:24','::1',1),
(22,'add data groupmenu','2018-07-17 02:16:30','::1',1),
(23,'add data groupmenu','2018-07-17 02:16:34','::1',1),
(24,'add data groupmenu','2018-07-17 02:16:56','::1',1),
(25,'update data menu','2018-07-17 11:15:15','::1',1),
(26,'add data submenu','2018-07-17 11:16:13','::1',1),
(27,'add data group','2018-07-17 12:25:11','::1',1),
(28,'add data group','2018-07-17 12:25:31','::1',1),
(29,'add data user','2018-07-17 12:34:18','::1',1),
(30,'add data user','2018-07-17 12:35:16','::1',1),
(31,'update data user','2018-07-17 12:35:25','::1',1),
(32,'add data groupmenu','2018-07-17 12:39:40','::1',1),
(33,'add data groupmenu','2018-07-17 12:39:58','::1',1),
(34,'add data menu','2018-07-17 12:40:36','::1',1),
(35,'add data groupmenu','2018-07-17 12:41:01','::1',1),
(36,'add data groupmenu','2018-07-17 12:41:30','::1',1),
(37,'add data groupmenu','2018-07-17 12:41:35','::1',1),
(38,'add data groupmenu','2018-07-17 12:41:52','::1',1),
(39,'add data groupmenu','2018-07-17 12:42:25','::1',1),
(40,'add data groupmenu','2018-07-17 12:42:30','::1',1),
(41,'add data groupmenu','2018-07-17 12:42:38','::1',1),
(42,'update data user','2018-07-17 12:44:16','::1',1),
(43,'update data user','2018-07-17 14:11:00','::1',1),
(44,'update data user','2018-07-17 14:11:16','::1',1),
(45,'add data skpd','2018-07-17 21:03:32','::1',1),
(46,'add data skpd','2018-07-17 21:03:58','::1',1),
(47,'update data user','2018-07-17 21:04:35','::1',1),
(48,'add data usulan','2018-07-17 21:23:15','::1',10),
(49,'add data skpd','2018-07-17 21:31:28','::1',1),
(50,'add data user','2018-07-17 21:32:24','::1',1),
(51,'update data periksa','2018-07-17 22:15:15','::1',9),
(52,'add data menu','2018-07-18 00:06:04','::1',1),
(53,'add data groupmenu','2018-07-18 00:06:31','::1',1),
(54,'add data menu','2018-07-18 00:08:28','::1',1),
(55,'update data menu','2018-07-18 00:08:44','::1',1),
(56,'add data submenu','2018-07-18 00:09:05','::1',1),
(57,'add data submenu','2018-07-18 00:09:44','::1',1),
(58,'add data groupmenu','2018-07-18 00:11:00','::1',1),
(59,'update data menu','2018-07-18 00:16:14','::1',1),
(60,'add data submenu','2018-07-18 00:20:41','::1',1),
(61,'add data menu','2018-07-18 00:32:54','::1',1),
(62,'add data menu','2018-07-18 00:33:20','::1',1),
(63,'add data groupmenu','2018-07-18 00:33:32','::1',1),
(64,'add data groupmenu','2018-07-18 00:33:39','::1',1),
(65,'add data pengumuman','2018-07-18 00:34:14','::1',1),
(66,'add data user','2018-07-18 00:38:07','::1',1),
(67,'add data user','2018-07-18 00:40:09','::1',1),
(68,'update data periksa','2018-07-18 01:04:43','::1',13),
(69,'add data usulan','2018-07-18 17:39:25','::1',12),
(70,'update data skpd','2018-07-18 18:19:33','::1',1),
(71,'update data skpd','2018-07-18 18:19:57','::1',1),
(72,'add data skpd','2018-07-18 18:20:19','::1',1),
(73,'update data skpd','2018-07-18 18:20:24','::1',1),
(74,'update data skpd','2018-07-18 18:20:31','::1',1),
(75,'add data skpd','2018-07-18 18:22:05','::1',1),
(76,'add data skpd','2018-07-18 18:22:34','::1',1),
(77,'add data user','2018-07-18 18:24:48','::1',1),
(78,'add data usulan','2018-07-18 18:54:06','::1',12),
(79,'add data usulan','2018-07-18 19:18:53','::1',12),
(80,'update data periksa','2018-07-18 19:20:18','::1',13),
(81,'add data usulan','2018-07-18 20:11:16','192.168.1.25',12),
(82,'update data periksa','2018-07-18 20:16:51','192.168.1.19',13),
(83,'add data usulan','2018-07-18 20:37:43','::1',12),
(84,'add data usulan','2018-07-18 20:41:25','192.168.1.22',12),
(85,'add data usulan','2018-07-18 20:56:07','192.168.1.25',12),
(86,'add data usulan','2018-07-18 21:02:50','192.168.1.25',12),
(87,'add data usulan','2018-07-19 06:00:20','::1',12),
(88,'add data usulan','2018-07-19 06:00:38','::1',12),
(89,'add data usulan','2018-07-19 06:06:40','::1',12),
(90,'add data usulan','2018-07-19 06:18:19','::1',14),
(91,'add data usulan','2018-07-19 06:23:37','::1',14),
(92,'add data usulan','2018-07-19 06:24:25','::1',14),
(93,'add data usulan','2018-07-19 06:24:57','::1',14),
(94,'add data usulan','2018-07-19 06:49:16','::1',14),
(95,'add data usulan','2018-07-19 07:14:44','::1',14),
(96,'add data usulan','2018-07-19 07:15:48','::1',14),
(97,'update data periksa','2018-07-19 07:17:15','::1',13),
(98,'update data periksa','2018-07-19 07:18:07','::1',13),
(99,'add data usulan','2018-07-19 08:42:30','192.168.43.103',12),
(100,'update data periksa','2018-07-19 08:44:35','192.168.43.13',13),
(101,'add data skpd','2018-07-19 09:40:23','192.168.43.13',1),
(102,'add data skpd','2018-07-19 09:41:21','192.168.43.13',1),
(103,'add data skpd','2018-07-19 09:41:52','192.168.43.13',1),
(104,'add data skpd','2018-07-19 09:42:09','192.168.43.13',1),
(105,'add data user','2018-07-19 09:43:13','192.168.43.13',1),
(106,'add data user','2018-07-19 09:44:33','192.168.43.13',1),
(107,'add data user','2018-07-19 09:51:52','192.168.0.110',1),
(108,'add data skpd','2018-07-19 09:52:09','192.168.0.110',1),
(109,'add data skpd','2018-07-19 09:52:26','192.168.0.110',1),
(110,'add data user','2018-07-19 09:52:48','192.168.0.110',1),
(111,'add data user','2018-07-19 09:53:09','192.168.0.110',1),
(112,'add data usulan','2018-07-19 09:58:56','192.168.0.120',12),
(113,'add data usulan','2018-07-19 09:59:52','192.168.0.110',12),
(114,'add data usulan','2018-07-19 10:00:00','192.168.0.115',12),
(115,'add data usulan','2018-07-19 10:01:59','192.168.0.126',18),
(116,'update data periksa','2018-07-19 10:02:45','192.168.0.110',13),
(117,'add data usulan','2018-07-19 10:05:44','192.168.0.119',15),
(118,'add data usulan','2018-07-19 10:06:00','192.168.0.111',15),
(119,'update data periksa','2018-07-19 10:07:49','192.168.0.110',13),
(120,'add data usulan','2018-07-19 10:08:38','192.168.0.127',18),
(121,'add data usulan','2018-07-19 10:09:33','192.168.0.115',12),
(122,'add data usulan','2018-07-19 10:09:38','192.168.0.116',16),
(123,'add data usulan','2018-07-19 10:10:22','192.168.0.124',17),
(124,'update data usulan','2018-07-19 10:11:23','192.168.0.115',12),
(125,'update data periksa','2018-07-19 10:12:04','192.168.0.110',13),
(126,'add data usulan','2018-07-19 10:12:16','192.168.0.114',19),
(127,'update data periksa','2018-07-19 10:13:00','192.168.0.110',13),
(128,'update data usulan','2018-07-19 10:13:31','192.168.0.127',18),
(129,'update data periksa','2018-07-19 10:14:07','192.168.0.110',13),
(130,'add data usulan','2018-07-19 10:15:34','192.168.0.128',14),
(131,'update data usulan','2018-07-19 10:27:42','192.168.0.110',16),
(132,'update data periksa','2018-07-19 10:29:57','192.168.0.110',13),
(133,'add data userprofile','2018-07-19 10:41:58','192.168.0.119',15),
(134,'add data userprofile','2018-07-19 10:44:20','192.168.0.119',15),
(135,'add data menu','2018-10-11 01:31:53','::1',1),
(136,'add data menu','2018-11-12 14:51:08','::1',1),
(137,'update data menu','2018-11-13 10:07:31','::1',1),
(138,'update data menu','2018-11-13 11:49:46','::1',1),
(139,'update data menu','2018-11-13 11:50:01','::1',1),
(140,'update data menu','2018-11-13 11:50:48','::1',1),
(141,'add data menu','2018-11-14 09:06:36','::1',1),
(142,'update data menu','2018-11-14 09:06:52','::1',1),
(143,'add data menu','2018-11-14 10:23:21','::1',1),
(144,'update data menu','2018-11-14 10:29:51','::1',1),
(145,'update data menu','2018-11-14 10:30:12','::1',1),
(146,'update data menu','2018-11-14 10:33:48','::1',1),
(147,'add data menu','2018-11-14 13:34:49','::1',1),
(148,'add data menu','2018-11-15 10:13:50','::1',1),
(149,'update data menu','2018-11-15 10:14:19','::1',1),
(150,'update data menu','2018-11-15 10:14:59','::1',1),
(151,'add data crud','2018-11-15 10:43:27','::1',1),
(152,'add data crud','2018-11-15 10:55:51','::1',1),
(153,'update data crud','2018-11-15 11:01:42','::1',1),
(154,'update data crud','2018-11-15 11:17:29','::1',1),
(155,'update data crud','2018-11-15 11:17:41','::1',1),
(156,'update data crud','2018-11-15 11:17:47','::1',1),
(157,'add data crud','2018-11-15 11:21:11','::1',1),
(158,'add data crud','2018-11-15 11:22:08','::1',1),
(159,'add data crudfield','2018-11-15 11:46:49','::1',1),
(160,'add data crud','2018-11-19 11:15:20','::1',1),
(161,'add data crud','2018-11-19 11:16:56','::1',1),
(162,'add data crud','2018-11-19 11:18:20','::1',1),
(163,'add data crud','2018-11-19 11:18:44','::1',1),
(164,'add data crud','2018-11-19 11:19:19','::1',1),
(165,'add data crud','2018-11-19 11:22:37','::1',1),
(166,'add data crud','2018-11-19 11:24:19','::1',1),
(167,'update data crudfield','2018-11-19 14:20:09','::1',1),
(168,'add data crud','2018-11-19 14:24:35','::1',1),
(169,'add data crudfield','2018-11-19 14:43:22','::1',1),
(170,'add data crud','2018-11-19 14:44:06','::1',1),
(171,'add data crud','2018-11-19 14:52:43','::1',1),
(172,'update data crudfield','2018-11-21 11:32:16','::1',1),
(173,'update data crudfield','2018-11-21 11:34:46','::1',1),
(174,'update data crudfield','2018-11-21 11:53:47','::1',1),
(175,'update data crudfield','2018-11-21 11:54:47','::1',1),
(176,'update data crudfield','2018-11-21 11:56:02','::1',1),
(177,'add data crud','2018-11-21 11:56:45','::1',1),
(178,'update data crud','2018-11-21 11:56:54','::1',1),
(179,'update data crud','2018-11-21 11:57:10','::1',1),
(180,'update data crud','2018-11-21 11:57:16','::1',1),
(181,'add data crud','2018-11-21 11:57:46','::1',1),
(182,'update data crud','2018-11-21 11:58:57','::1',1),
(183,'update data crud','2018-11-21 11:59:34','::1',1),
(184,'add data crud','2018-11-21 12:03:36','::1',1),
(185,'update data crud','2018-11-21 12:05:01','::1',1),
(186,'update data crud','2018-11-21 12:05:54','::1',1),
(187,'update data crud','2018-11-21 12:06:08','::1',1),
(188,'add data menu','2018-11-21 12:26:46','::1',1),
(189,'update data menu','2018-11-21 12:33:10','::1',1),
(190,'add data menu','2018-11-22 09:33:28','::1',1),
(191,'add data menu','2018-11-22 14:35:10','::1',1),
(192,'update data menu','2018-11-22 14:35:19','::1',1),
(193,'add data menu','2018-11-22 15:36:53','::1',1),
(194,'update data menu','2018-11-22 16:12:26','::1',1),
(195,'add data menu','2018-11-22 16:19:49','::1',1),
(196,'add data menu','2018-11-22 16:20:16','::1',1),
(197,'add data crud','2018-11-23 12:52:03','::1',1),
(198,'add data crud','2018-11-26 10:26:05','::1',1),
(199,'add data crudfield','2018-11-26 10:27:06','::1',1),
(200,'add data crudfield','2018-11-26 10:39:18','::1',1),
(201,'add data crudfield','2018-11-26 10:45:28','::1',1),
(202,'update data crud','2018-11-26 10:54:50','::1',1),
(203,'add data crudfield','2018-11-26 12:22:27','::1',1),
(204,'update data crudfield','2018-11-26 12:22:38','::1',1),
(205,'add data menu','2018-11-26 12:36:14','::1',1),
(206,'update data menu','2018-11-26 13:32:59','::1',1),
(207,'update data menu','2018-11-26 13:33:21','::1',1),
(208,'update data menu','2018-11-26 13:33:35','::1',1),
(209,'update data menu','2018-11-26 13:39:07','::1',1),
(210,'update data crud','2018-11-27 11:42:15','::1',1),
(211,'update data crud','2018-11-27 11:42:23','::1',1),
(212,'update data crud','2018-11-27 11:43:19','::1',1),
(213,'update data crud','2018-11-27 11:56:24','::1',1),
(214,'update data crud','2018-11-27 12:12:10','::1',1),
(215,'update data crud','2018-11-27 12:12:57','::1',1),
(216,'update data crud','2018-11-27 12:48:49','::1',1),
(217,'update data crud','2018-11-27 12:49:06','::1',1),
(218,'add data menu','2018-11-27 13:20:58','::1',1),
(219,'update data menu','2018-11-27 13:21:05','::1',1),
(220,'update data menu','2018-11-27 13:24:11','::1',1),
(221,'update data menu','2018-11-27 13:29:58','::1',1),
(222,'update data menu','2018-11-27 13:31:33','::1',1),
(223,'add data menu','2018-11-27 15:21:54','::1',1),
(224,'update data menu','2018-11-27 15:23:27','::1',1),
(225,'add data menu','2018-11-27 15:25:47','::1',1),
(226,'add data crudfield','2018-11-27 15:26:45','::1',1),
(227,'update data crudfield','2018-11-27 15:26:51','::1',1),
(228,'update data crudfield','2018-11-27 15:30:20','::1',1),
(229,'add data user','2018-11-30 10:52:01','::1',1),
(230,'update data user','2018-11-30 10:54:39','::1',1),
(231,'add data crud','2018-11-30 11:20:05','::1',1),
(232,'add data group','2018-11-30 11:32:43','::1',1),
(233,'update data group','2018-11-30 11:33:32','::1',1),
(234,'update data group','2018-11-30 11:33:45','::1',1),
(235,'update data group','2018-11-30 15:03:05','::1',1),
(236,'add data group','2018-11-30 15:04:23','::1',1),
(237,'add data crud','2018-11-30 15:11:23','::1',1),
(238,'add data group','2018-11-30 17:10:06','::1',1),
(239,'add data menu','2018-11-30 17:10:19','::1',1),
(240,'update data user','2018-12-01 07:39:57','::1',1),
(241,'add data user','2018-12-01 07:46:52','::1',1),
(242,'update data user','2018-12-01 07:57:38','::1',1),
(243,'update data user','2018-12-01 07:57:51','::1',1),
(244,'add data user','2018-12-01 08:05:47','::1',1),
(245,'add data group','2018-12-01 13:14:49','::1',1),
(246,'add data menu','2018-12-01 13:15:05','::1',1),
(247,'add data crud','2018-12-02 14:23:33','::1',1),
(248,'add data userprofile','2018-12-03 13:34:28','::1',1),
(249,'add data menu','2018-12-03 13:44:05','::1',1),
(250,'add data menu','2018-12-03 13:44:31','::1',1),
(251,'update data menu','2018-12-04 11:23:45','::1',1),
(252,'update password user','2018-12-05 10:36:43','::1',1),
(253,'add data user','2019-01-02 19:43:06','::1',1),
(254,'update data user','2019-01-02 19:52:56','::1',1),
(255,'update password user','2019-01-02 20:19:35','::1',1),
(256,'add data group','2019-01-02 20:36:34','::1',1),
(257,'update data group','2019-01-02 20:45:16','::1',1),
(258,'update data menu','2019-01-03 10:36:43','::1',1),
(259,'update data menu','2019-01-03 10:37:02','::1',1),
(260,'update data group','2019-01-03 10:38:05','::1',1),
(261,'update data menu','2019-01-03 10:39:21','::1',1),
(262,'add data menu','2019-01-03 10:48:04','::1',1),
(263,'update data menu','2019-01-03 10:48:17','::1',1),
(264,'update data menu','2019-01-03 10:56:12','::1',1),
(265,'update data menu','2019-01-03 10:59:32','::1',1),
(266,'update data menu','2019-01-03 10:59:40','::1',1),
(267,'add data crud','2019-01-03 11:14:42','::1',1),
(268,'add data menugroup','2019-01-03 11:19:18','::1',1),
(269,'update data menugroup','2019-01-03 11:19:36','::1',1),
(270,'add data menugroup','2019-01-03 11:19:51','::1',1),
(271,'add data crud','2019-01-03 11:59:03','::1',1),
(272,'add data group','2019-01-07 09:14:27','::1',1),
(273,'add data group','2019-01-07 09:15:01','::1',1),
(274,'add data group','2019-01-07 10:40:22','::1',1),
(275,'update data group','2019-01-07 11:18:20','::1',1),
(276,'update data group','2019-01-07 11:24:02','::1',1),
(277,'update data group','2019-01-07 11:25:40','::1',1),
(278,'update data group','2019-01-07 11:30:22','::1',1),
(279,'update data group','2019-01-07 11:32:30','::1',1),
(280,'update data group','2019-01-07 11:33:34','::1',1),
(281,'add data group','2019-01-07 11:48:54','::1',1),
(282,'add data menu','2019-01-07 12:06:43','::1',1),
(283,'add data menu','2019-01-07 12:09:46','::1',1),
(284,'add data group','2019-01-07 12:23:13','::1',1),
(285,'add data group','2019-01-07 12:23:21','::1',1),
(286,'update data group','2019-01-07 17:05:27','::1',1),
(287,'update data group','2019-01-07 17:06:53','::1',1),
(288,'update data group','2019-01-07 17:09:02','::1',1),
(289,'update data group','2019-01-07 17:09:15','::1',1),
(290,'update data group','2019-01-07 17:09:30','::1',1),
(291,'update data group','2019-01-07 17:09:30','::1',1),
(292,'update data group','2019-01-07 17:40:03','::1',1),
(293,'update data group','2019-01-07 17:40:43','::1',1),
(294,'add data group','2019-01-07 17:41:26','::1',1),
(295,'update data group','2019-01-07 18:03:44','::1',1),
(296,'update data group','2019-01-07 18:11:01','::1',1),
(297,'update data group','2019-01-07 18:19:13','::1',1),
(298,'update data group','2019-01-07 18:19:22','::1',1),
(299,'update data group','2019-01-07 18:19:22','::1',1),
(300,'update data group','2019-01-07 18:19:32','::1',1),
(301,'update data group','2019-01-07 18:20:06','::1',1),
(302,'update data group','2019-01-07 18:20:18','::1',1),
(303,'update data group','2019-01-07 18:23:08','::1',1),
(304,'update data group','2019-01-07 18:23:23','::1',1),
(305,'update data group','2019-01-07 18:23:35','::1',1),
(306,'update data group','2019-01-07 18:23:43','::1',1),
(307,'add data group','2019-01-07 18:39:30','::1',1),
(308,'update data group','2019-01-07 18:39:39','::1',1);

/*Table structure for table `table_login_attempts` */

DROP TABLE IF EXISTS `table_login_attempts`;

CREATE TABLE `table_login_attempts` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip_address` VARCHAR(45) NOT NULL,
  `login` VARCHAR(100) NOT NULL,
  `time` INT(11) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `table_login_attempts` */

/*Table structure for table `table_menus` */

DROP TABLE IF EXISTS `table_menus`;

CREATE TABLE `table_menus` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `menu_id` INT(10) UNSIGNED NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `link` VARCHAR(50) NOT NULL,
  `list_id` VARCHAR(200) NOT NULL,
  `icon` VARCHAR(50) NOT NULL,
  `status` TINYINT(1) NOT NULL,
  `position` TINYINT(4) NOT NULL,
  `description` TEXT NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `table_menus` */

INSERT  INTO `table_menus`(`id`,`menu_id`,`name`,`link`,`list_id`,`icon`,`status`,`position`,`description`) VALUES 
(21,1,'Beranda','admin/','home_index','home',1,1,'-'),
(23,1,'Group','admin/group','group_index','people',1,1,'-'),
(24,1,'Setting','admin/setting','admin_setting','settings',1,1,'-'),
(25,24,'Menu','admin/menus','menus_index','home',1,1,'-'),
(31,1,'User','admin/user_management','user_management_index','people',1,1,'-'),
(32,2,'Beranda','user/home','home_index','home',1,1,'-'),
(33,2,'Produk','user/product','product_index','home',1,2,'-'),
(37,2,'Prediksi','user/prediction/','prediction_index','home',0,4,'-'),
(38,2,'Laporan','user/report','report_index','home',1,5,'-'),
(39,2,'Data','user/','-','home',1,3,'-'),
(40,39,'Inventori','user/inventory','inventory_index','home',1,1,'-'),
(41,39,'Penjualan','user/sale','sale_index','home',1,1,'-'),
(42,37,'Inventori','user/prediction/inventory','prediction_inventory','home',0,1,'-'),
(43,37,'Penjualan','user/prediction/sale','prediction_sale','home',1,1,'-'),
(44,3,'Beranda','user/home','home_index','home',1,1,'-'),
(45,3,'Produk','user/product','product_index','home',1,2,'-'),
(46,3,'Data','user/','-','home',1,3,'-'),
(47,46,'Inventori','user/inventory','inventory_index','home',1,1,'-'),
(48,46,'Penjualan','user/sale','sale_index','home',1,2,'-'),
(49,3,'Prediksi','manager/','-','home',1,4,'-'),
(50,49,'Inventori','user/prediction/inventory','prediction_inventory','home',0,1,'-'),
(51,49,'Penjualan','user/prediction/sale','prediction_sale','home',1,2,'-'),
(52,3,'Laporan','user/report','report_index','home',1,5,'-');

/*Table structure for table `table_profile` */

DROP TABLE IF EXISTS `table_profile`;

CREATE TABLE `table_profile` (
  `profile_id` INT(11) NOT NULL AUTO_INCREMENT,
  `profile_title` VARCHAR(200) NOT NULL,
  `profile_content` TEXT NOT NULL,
  `profile_postdate` DATE NOT NULL,
  `profile_postime` DATETIME NOT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`profile_id`)
) ENGINE=INNODB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `table_profile` */

INSERT  INTO `table_profile`(`profile_id`,`profile_title`,`profile_content`,`profile_postdate`,`profile_postime`,`user_id`) VALUES 
(5,'Visi & Misi','Konten Visi dan Misi','2018-07-16','0000-00-00 00:00:00',1),
(6,'Dasar Hukum','Isi Dasar Hukum 1','2018-07-17','0000-00-00 00:00:00',1),
(7,'Struktur Organisasi','Daftar Struktur Organisasi','2018-07-17','0000-00-00 00:00:00',1),
(8,'Tugas & Fungsi','Is Tugas dan Fungsi','2018-07-17','0000-00-00 00:00:00',1);

/*Table structure for table `table_userprofiles` */

DROP TABLE IF EXISTS `table_userprofiles`;

CREATE TABLE `table_userprofiles` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `surename` VARCHAR(200) NOT NULL,
  `birthplace` VARCHAR(200) NOT NULL,
  `sex` ENUM('Pria','Wanita','','') NOT NULL,
  `phone` VARCHAR(20) NOT NULL,
  `address` TEXT NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `table_userprofiles` */

INSERT  INTO `table_userprofiles`(`id`,`surename`,`birthplace`,`sex`,`phone`,`address`) VALUES 
(3,'M. TAHIR R,SH','','Pria','082293270367','Desa Tojabi, Kec. Lasusua'),
(16,'Admin','','Pria','-','-'),
(20,'Raviq Lahadi','','Pria','08128891210012','Jln Mangga no 37'),
(21,'raviq','1996-02-20','Pria','0812','#');

/*Table structure for table `table_users` */

DROP TABLE IF EXISTS `table_users`;

CREATE TABLE `table_users` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `group_id` MEDIUMINT(8) UNSIGNED NOT NULL,
  `ip_address` VARCHAR(45) NOT NULL,
  `username` VARCHAR(100) DEFAULT NULL,
  `password` VARCHAR(255) NOT NULL,
  `email` VARCHAR(254) NOT NULL,
  `activation_selector` VARCHAR(255) DEFAULT NULL,
  `activation_code` VARCHAR(255) DEFAULT NULL,
  `forgotten_password_selector` VARCHAR(255) DEFAULT NULL,
  `forgotten_password_code` VARCHAR(255) DEFAULT NULL,
  `forgotten_password_time` INT(11) UNSIGNED DEFAULT NULL,
  `remember_selector` VARCHAR(255) DEFAULT NULL,
  `remember_code` VARCHAR(255) DEFAULT NULL,
  `created_on` INT(11) UNSIGNED NOT NULL,
  `last_login` INT(11) UNSIGNED DEFAULT NULL,
  `active` TINYINT(1) UNSIGNED DEFAULT NULL,
  `first_name` VARCHAR(50) DEFAULT NULL,
  `last_name` VARCHAR(50) DEFAULT NULL,
  `phone` VARCHAR(20) DEFAULT NULL,
  `image` TEXT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_email` (`email`),
  UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  UNIQUE KEY `uc_remember_selector` (`remember_selector`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `table_users_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `table_groups` (`id`)
) ENGINE=INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `table_users` */

INSERT  INTO `table_users`(`id`,`group_id`,`ip_address`,`username`,`password`,`email`,`activation_selector`,`activation_code`,`forgotten_password_selector`,`forgotten_password_code`,`forgotten_password_time`,`remember_selector`,`remember_code`,`created_on`,`last_login`,`active`,`first_name`,`last_name`,`phone`,`image`) VALUES 
(1,1,'127.0.0.1','admin@admin.com','$2y$10$CquJ/t1YiAugcfD3gHyGDOIp/gJUOcqjXTXedjSJash9TYG.EQCmG','admin@admin.com',NULL,'',NULL,NULL,NULL,NULL,NULL,1268889823,1568889846,1,'Admin','istrator','081342989185','USER_1_1568688392.jpg'),
(2,2,'::1','admin@gmail.com','$2y$10$MIefZA8pYS74hnO7LlBU8u.D/qexKH39s.TYvcdzb8tIa9Up2E1Z2','admin@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1563601662,1568889919,1,'admin','admin','081342989185','USER_2_1568439487.png'),
(3,3,'::1','manager@gmail.com','$2y$10$tdrKZ3Dwa7qf2Gszwz47/eK7Q7xMpDiO/CbKzoDnAu9K7WwemgbFK','manager@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1568441196,1570935942,1,'manager','manager','123443211234','USER_3_1568441323.png');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
