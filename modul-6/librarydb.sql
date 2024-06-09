/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 10.4.32-MariaDB : Database - librarydb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`librarydb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `librarydb`;

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
  `Hobi` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IdAnggota`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `anggota` */

insert  into `anggota`(`IdAnggota`,`Nama_Anggota`,`Angkatan_Anggota`,`Tempat_Lahir_Anggota`,`Tanggal_Lahir_Anggota`,`No_Telp`,`Jenis_Kelamin`,`Status_Pinjam`,`Hobi`) values 
('AG001','Michael Brown','2018','New York','2000-05-15',1234567890,'Male','None','Membaca'),
('AG002','Sarah Johnson','2019','Los Angeles','1999-08-23',2147483647,'Female','Borrowed','Berenang'),
('AG003','David Williams','2020','Chicago','2001-12-12',2147483647,'Male','None','Mendaki'),
('AG004','Emma Davis','2017','Houston','2000-03-22',2147483647,'Female','None','Memasak'),
('AG005','Olivia Wilson','2018','Phoenix','1999-11-11',2147483647,'Female','Borrowed','Bepergian'),
('AG006','Liam Moore','2019','Philadelphia','2000-09-09',2147483647,'Male','None','Fotografi'),
('AG007','Noah Taylor','2020','San Antonio','2001-07-07',2147483647,'Male','Borrowed','Menari'),
('AG008','Ava Anderson','2017','San Diego','1999-05-05',2147483647,'Female','None','Menggambar'),
('AG009','Sophia Thomas','2018','Dallas','2000-02-02',2147483647,'Female','Borrowed','Berkebun'),
('AG010','James Martinez','2019','San Jose','2001-01-01',1230984567,'Male','None','Menulis');

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
('BK001','Learning SQL','Alan Beaulieu','O\'Reilly Media','2020','5','Available','Technology'),
('BK002','Python Programming','John Zelle','Franklin, Beedle & Associates','2016','3','Borrowed','Programming'),
('BK003','Database Design','Adrienne Watt','BCcampus','2012','2','Available','Technology'),
('BK004','Clean Code','Robert C. Martin','Prentice Hall','2008','4','Available','Programming'),
('BK005','Design Patterns','Erich Gamma','Addison-Wesley','1994','6','Available','Programming'),
('BK006','Introduction to Algorithm','Thomas H. Cormen','MIT Press','2009','5','Available','Technology'),
('BK007','The Pragmatic Programmer','Andrew Hunt','Addison-Wesley','1999','2','Borrowed','Programming'),
('BK008','Code Complete','Steve McConnell','Microsoft Press','2004','3','Available','Programming'),
('BK009','Artificial Intelligence','Stuart Russell','Pearson','2010','4','Available','Technology'),
('BK010','The Art of Computer Progr','Donald Knuth','Addison-Wesley','1997','2','Available','Technology');

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

insert  into `peminjaman`(`Kode_Peminjaman`,`IdAnggota`,`IdPetugas`,`Tanggal_Pinjam`,`Tanggal_Kembali`,`Kode_Buku`) values 
('PMJ001','AG002','PTG001','2023-05-01','2023-05-15','BK002'),
('PMJ002','AG001','PTG002','2023-06-10','2023-06-24','BK001'),
('PMJ003','AG005','PTG003','2023-07-15','2023-07-30','BK005'),
('PMJ004','AG007','PTG004','2023-08-05','2023-08-20','BK007'),
('PMJ005','AG009','PTG005','2023-09-12','2023-09-26','BK009'),
('PMJ006','AG004','PTG006','2023-10-01','2023-10-15','BK004'),
('PMJ007','AG006','PTG007','2023-11-11','2023-11-25','BK006'),
('PMJ008','AG008','PTG008','2023-12-15','2023-12-30','BK008'),
('PMJ009','AG010','PTG009','2024-01-05','2024-01-20','BK010'),
('PMJ010','AG003','PTG010','2024-02-14','2024-02-28','BK003');

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
  `Status_Denda` varchar(20) DEFAULT 'Belum Dibayar',
  PRIMARY KEY (`Kode_Kembali`),
  KEY `IdAnggota` (`IdAnggota`),
  KEY `Kode_Buku` (`Kode_Buku`),
  KEY `IdPetugas` (`IdPetugas`),
  CONSTRAINT `pengembalian_ibfk_1` FOREIGN KEY (`IdAnggota`) REFERENCES `anggota` (`IdAnggota`),
  CONSTRAINT `pengembalian_ibfk_2` FOREIGN KEY (`Kode_Buku`) REFERENCES `buku` (`Kode_Buku`),
  CONSTRAINT `pengembalian_ibfk_3` FOREIGN KEY (`IdPetugas`) REFERENCES `petugas` (`IdPetugas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `pengembalian` */

insert  into `pengembalian`(`Kode_Kembali`,`IdAnggota`,`Kode_Buku`,`IdPetugas`,`Tgl_Pinjam`,`Tgl_Kembali`,`Denda`,`Status_Denda`) values 
('KMB001','AG002','BK002','PTG001','2023-05-01','2023-05-15','0','Belum Dibayar'),
('KMB002','AG001','BK001','PTG002','2023-06-10','2023-06-24','0','Belum Dibayar'),
('KMB003','AG005','BK005','PTG003','2023-07-15','2023-07-30','0','Belum Dibayar'),
('KMB004','AG007','BK007','PTG004','2023-08-05','2023-08-20','0','Sudah Dibayar'),
('KMB005','AG009','BK009','PTG005','2023-09-12','2023-09-26','0','Sudah Dibayar'),
('KMB006','AG004','BK004','PTG006','2023-10-01','2023-10-15','0','Sudah Dibayar'),
('KMB007','AG006','BK006','PTG007','2023-11-11','2023-11-25','0','Sudah Dibayar'),
('KMB008','AG008','BK008','PTG008','2023-12-15','2023-12-30','0','Sudah Dibayar'),
('KMB009','AG010','BK010','PTG009','2024-01-05','2024-01-20','0','Sudah Dibayar'),
('KMB010','AG003','BK003','PTG010','2024-02-14','2024-02-28','0','Sudah Dibayar');

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
('PTG001','jdoe','password123','John Doe'),
('PTG002','asmith','passw0rd','Alice Smith'),
('PTG003','bjones','mypassword','Bob Jones'),
('PTG004','cliu','cliu12345','Chris Liu'),
('PTG005','djohnson','djohnson','Diana Johnson'),
('PTG006','emiller','emiller456','Eve Miller'),
('PTG007','fwhite','fwhite789','Frank White'),
('PTG008','gthomas','gthomas000','Grace Thomas'),
('PTG009','hlee','hleeblack','Hannah Lee'),
('PTG010','ijackson','ijacksonred','Ian Jackson');

/* Procedure structure for procedure `CekDendaMahasiswa` */

/*!50003 DROP PROCEDURE IF EXISTS  `CekDendaMahasiswa` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `CekDendaMahasiswa`(IN mahasiswa_id VARCHAR(10))
BEGIN
    DECLARE denda_terdapat INT;
    
    -- Cek apakah ada denda yang belum dibayar
    SELECT COUNT(*) INTO denda_terdapat
    FROM pengembalian
    WHERE IdAnggota = mahasiswa_id AND Status_Denda = 'Belum Dibayar';
    
    IF denda_terdapat > 0 THEN
        -- Tampilkan data denda yang belum dibayarkan
        SELECT 
            pengembalian.Kode_Kembali,
            pengembalian.IdAnggota,
            anggota.Nama_Anggota,
            pengembalian.Kode_Buku,
            buku.Judul_Buku,
            pengembalian.Tgl_Pinjam,
            pengembalian.Tgl_Kembali,
            pengembalian.Denda,
            pengembalian.Status_Denda
        FROM pengembalian
        JOIN anggota ON pengembalian.IdAnggota = anggota.IdAnggota
        JOIN buku ON pengembalian.Kode_Buku = buku.Kode_Buku
        WHERE pengembalian.IdAnggota = mahasiswa_id AND pengembalian.Status_Denda = 'Belum Dibayar';
    ELSE
        -- Tampilkan pesan bahwa tidak ada tanggungan denda
        SELECT 'Mahasiswa tersebut tidak memiliki tanggungan denda atau semua denda sudah dibayar' AS Pesan;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `CetakDataPeminjaman` */

/*!50003 DROP PROCEDURE IF EXISTS  `CetakDataPeminjaman` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `CetakDataPeminjaman`()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE total INT;
    DECLARE selesai INT DEFAULT FALSE;
    DECLARE kodePeminjaman VARCHAR(10);
    DECLARE idAnggota VARCHAR(10);
    DECLARE idPetugas VARCHAR(10);
    DECLARE tanggalPinjam DATE;
    DECLARE tanggalKembali DATE;
    DECLARE kodeBuku VARCHAR(10);
    
    -- Deklarasi cursor untuk mengambil data
    DECLARE peminjaman_cursor CURSOR FOR
        SELECT Kode_Peminjaman, IdAnggota, IdPetugas, Tanggal_Pinjam, Tanggal_Kembali, Kode_Buku
        FROM peminjaman ORDER BY Kode_Peminjaman;
        
    -- Deklarasi handler untuk akhir cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET selesai = TRUE;
    
    -- Buka cursor
    OPEN peminjaman_cursor;
    
    -- Loop melalui cursor
    the_loop: LOOP
        FETCH peminjaman_cursor INTO kodePeminjaman, idAnggota, idPetugas, tanggalPinjam, tanggalKembali, kodeBuku;
        
        -- Periksa jika selesai
        IF selesai THEN
            LEAVE the_loop;
        END IF;
        
        -- Tampilkan baris yang diambil
        SELECT kodePeminjaman AS 'Kode Peminjaman', 
               idAnggota AS 'ID Anggota', 
               idPetugas AS 'ID Petugas', 
               tanggalPinjam AS 'Tanggal Pinjam', 
               tanggalKembali AS 'Tanggal Kembali', 
               kodeBuku AS 'Kode Buku';
        
        -- Tingkatkan counter
        SET i = i + 1;
        
        -- Keluar dari loop setelah 10 iterasi
        IF i > 10 THEN
            LEAVE the_loop;
        END IF;
    END LOOP;
    
    -- Tutup cursor
    CLOSE peminjaman_cursor;
END */$$
DELIMITER ;

/* Procedure structure for procedure `PengingatPengembalian` */

/*!50003 DROP PROCEDURE IF EXISTS  `PengingatPengembalian` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `PengingatPengembalian`()
BEGIN
    SELECT 
        peminjaman.Kode_Peminjaman,
        peminjaman.IdAnggota,
        anggota.Nama_Anggota,
        peminjaman.Kode_Buku,
        buku.Judul_Buku,
        peminjaman.Tanggal_Pinjam,
        peminjaman.Tanggal_Kembali,
        CASE 
            WHEN peminjaman.Tanggal_Kembali < CURDATE() THEN 'Terlambat'
            WHEN peminjaman.Tanggal_Kembali BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 3 DAY) THEN 'Segera Dikembalikan'
            ELSE 'Masih dalam Batas Waktu'
        END AS Keterangan
    FROM peminjaman
    JOIN anggota ON peminjaman.IdAnggota = anggota.IdAnggota
    JOIN buku ON peminjaman.Kode_Buku = buku.Kode_Buku;
END */$$
DELIMITER ;

/* Procedure structure for procedure `TampilkanBiodata` */

/*!50003 DROP PROCEDURE IF EXISTS  `TampilkanBiodata` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `TampilkanBiodata`()
BEGIN
    SELECT 
        IdAnggota AS NIM, 
        Nama_Anggota AS Nama,
        Tempat_Lahir_Anggota AS Alamat, 
        No_Telp AS 'No Telepon', 
        Jenis_Kelamin AS 'Jenis Kelamin',
        Hobi, 
        TIMESTAMPDIFF(YEAR, Tanggal_Lahir_Anggota, CURDATE()) AS Umur
    FROM anggota;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
