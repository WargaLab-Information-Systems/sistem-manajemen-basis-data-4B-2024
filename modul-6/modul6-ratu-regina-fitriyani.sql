DROP DATABASE db_perpus
CREATE DATABASE db_perpus

USE `db_perpus`;



CREATE TABLE `anggota` (
  `id_anggota` VARCHAR(10) NOT NULL,
  `nama_anggota` VARCHAR(20) DEFAULT NULL,
  `angkatan_anggota` VARCHAR(6) DEFAULT NULL,
  `tempat_lahir` VARCHAR(20) DEFAULT NULL,
  `tanggal_lahir` DATE DEFAULT NULL,
  `no_telp` INT(12) DEFAULT NULL,
  `jenis_kelamin` VARCHAR(15) DEFAULT NULL,
  `status_pinjam` VARCHAR(15) DEFAULT NULL,
  PRIMARY KEY (`id_anggota`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `anggota` */

INSERT  INTO `anggota`(`id_anggota`,`nama_anggota`,`angkatan_anggota`,`tempat_lahir`,`tanggal_lahir`,`no_telp`,`jenis_kelamin`,`status_pinjam`) VALUES 

('a1','Jono','2021','Bangkalan','2001-12-09',2147483647,'Laki-laki','pinjam'),

('a2','Andre','2021','Bangkalan','2000-06-05',2147483647,'Laki-laki','pinjam'),

('a3','Melisa','2022','Sampang','2001-06-06',2147483647,'Perempuan','pinjam'),

('a4','Nagita','2022','Sumenep','2001-08-09',2147483647,'Perempuan','pinjam'),

('a5','Renata','2021','Bangkalan','2000-11-10',2147483647,'Perempuan','pinjam'),

('a6','Udin','2021','Pamekasan','2000-11-03',2147483647,'Laki-laki','pinjam');


INSERT  INTO `anggota`(`id_anggota`,`nama_anggota`,`angkatan_anggota`,`tempat_lahir`,`tanggal_lahir`,`no_telp`,`jenis_kelamin`,`status_pinjam`) VALUES 


('a7','Mulyono','2021','Bangkalan','2000-04-03',2147483647,'Laki-laki','tidak pinjam'),

('a6','Udin','2021','Pamekasan','2000-11-03',2147483647,'Laki-laki','tidak pinjam');


CREATE TABLE `buku` (
  `kode_buku` VARCHAR(10) NOT NULL,
  `judul_buku` VARCHAR(25) DEFAULT NULL,
  `pengarang_buku` VARCHAR(30) DEFAULT NULL,
  `penerbit_buku` VARCHAR(30) DEFAULT NULL,
  `tahun_buku` VARCHAR(10) DEFAULT NULL,
  `jumlah_buku` VARCHAR(15) DEFAULT NULL,
  `status_buku` VARCHAR(10) DEFAULT NULL,
  `klasifikasi_buku` VARCHAR(20) DEFAULT NULL,
  PRIMARY KEY (`kode_buku`)
)

/*Data for the table `buku` */

INSERT  INTO `buku`(`kode_buku`,`judul_buku`,`pengarang_buku`,`penerbit_buku`,`tahun_buku`,`jumlah_buku`,`status_buku`,`klasifikasi_buku`) VALUES 

('bk-01','Lautku','Ivan Hadibroso','Andre Laksamana','2000','5','baik','Sea'),

('bk-02','Pemrograman','Bambang Purnomo','Hardiyanto','2010','3','baik','IT'),

('bk-03','5cm','Donny Dhirgantoro','Sunil Soraya','2012','10','baik','Mountain'),

('bk-04','Sikecil Kancil','Santoso','Aldo Pratama','2005','2','baik','Forest'),

('bk-05','Anjay','Reza Chandra','Haryono Setiawan','2015','5','baik','Words');



CREATE TABLE `petugas` (
  `id_petugas` VARCHAR(10) NOT NULL,
  `username` VARCHAR(15) DEFAULT NULL,
  `PASSWORD` VARCHAR(15) DEFAULT NULL,
  `nama` VARCHAR(25) DEFAULT NULL,
  PRIMARY KEY (`id_petugas`)
)
/*Data for the table `petugas` */

INSERT  INTO `petugas`(`id_petugas`,`username`,`PASSWORD`,`nama`) VALUES 

('p1','admin01','123','Arie'),

('p2','admin02','123','Fira'),

('p3','admin03','123','Aldi'),

('p4','admin04','123','Dika'),

('p5','admin05','123','Putri'),

('p6','admin06','112233','Dono');

CREATE TABLE `peminjaman` (
  `kode_peminjaman` VARCHAR(10) NOT NULL,
  `id_anggota` VARCHAR(10) DEFAULT NULL,
  `id_petugas` VARCHAR(10) DEFAULT NULL,
  `tanggal_pinjam` DATE DEFAULT NULL,
  `tanggal_kembali` DATE DEFAULT NULL,
  `kode_buku` VARCHAR(10) DEFAULT NULL,
  PRIMARY KEY (`kode_peminjaman`),
  KEY `id_petugas` (`id_petugas`),
  KEY `kode_buku` (`kode_buku`),
  KEY `id_anggota` (`id_anggota`),
  CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`),
  CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`kode_buku`) REFERENCES `buku` (`kode_buku`),
  CONSTRAINT `peminjaman_ibfk_3` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`)
) 

INSERT  INTO `peminjaman`(`kode_peminjaman`,`id_anggota`,`id_petugas`,`tanggal_pinjam`,`tanggal_kembali`,`kode_buku`) VALUES 

('kp-01','a1','p1','2023-07-02', '2023-07-04','bk-01'),

('kp-02','a2','p2','2023-07-01', '2023-07-07','bk-02'),

('kp-03','a3','p3','2023-05-05','2023-05-10','bk-03'),

('kp-04','a4','p4','2023-04-06','2023-04-09','bk-04'),

('kp-05','a5','p5','2023-01-01','2023-01-06','bk-05'),

('kp-06','a5','p5','2023-01-01','2023-01-06','bk-04'),

('kp-07','a5','p5','2023-01-01','2023-01-06','bk-03'),

('kp-08','a5','p5','2023-01-01','2023-01-06','bk-02'),

('kp-09','a5','p5','2023-01-01','2023-01-06','bk-03'),

('kp-10','a5','p5','2023-01-01','2023-01-06','bk-05'),

('kp-11','a6','p1','2023-03-22','2023-03-28','bk-04'),
('kp-12','a2','p4','2023-03-18','2023-03-22','bk-03');

DROP TABLE peminjaman



/*Table structure for table `pengembalian` */

CREATE TABLE `pengembalian` (
  `kode_kembali` VARCHAR(10) NOT NULL,
  `id_anggota` VARCHAR(10) DEFAULT NULL,
  `kode_buku` VARCHAR(10) DEFAULT NULL,
  `id_petugas` VARCHAR(10) DEFAULT NULL,
  `tanggal_pinjam` DATE DEFAULT NULL,
  `tanggal_kembali` DATE DEFAULT NULL,
  `denda` VARCHAR(15) DEFAULT NULL,
  PRIMARY KEY (`kode_kembali`),
  KEY `id_petugas` (`id_petugas`),
  KEY `kode_buku` (`kode_buku`),
  KEY `id_anggota` (`id_anggota`),
  CONSTRAINT `pengembalian_ibfk_1` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`),
  CONSTRAINT `pengembalian_ibfk_2` FOREIGN KEY (`kode_buku`) REFERENCES `buku` (`kode_buku`),
  CONSTRAINT `pengembalian_ibfk_3` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`)
) 

/*Data for the table `pengembalian` */

INSERT  INTO `pengembalian`(`kode_kembali`,`id_anggota`,`kode_buku`,`id_petugas`,`tanggal_pinjam`,`tanggal_kembali`,`denda`) VALUES 

('kb-01','a1','bk-01','p1','2023-03-27','2023-03-29','0'),

('kb-02','a2','bk-02','p2','2023-02-10','2023-02-15','0'),

('kb-03','a3','bk-03','p3','2023-05-05','2023-05-10','0'),

('kb-04','a4','bk-04','p4','2023-04-06','2023-04-09','0'),

('kb-05','a5','bk-05','p5','2023-01-01','2023-01-09','6000'),

('kb-06','a2','bk-02','p2','2023-02-10','2023-02-15','0'),

('kb-07','a4','bk-04','p4','2023-04-06','2023-04-10','2000'),

('kb-08','a4','bk-04','p4','2023-04-06','2023-04-09','0'),

('kb-09','a4','bk-04','p4','2023-04-06','2023-04-12','6000');

UPDATE anggota
SET status_pinjam ='tidak pinjam'
WHERE id_anggota = 'a7';
