CREATE DATABASE perrpustakaan;
USE perrpustakaan;
DROP DATABASE perrpustakaan
CREATE TABLE petugas( id_petugas VARCHAR (10), 
username VARCHAR (15), 
pasword VARCHAR (15), 
nama VARCHAR (25), 
PRIMARY KEY (id_petugas));

CREATE TABLE anggota (id_anggota VARCHAR (10), 
nama_anggota VARCHAR (20),
angkatan_anggota VARCHAR (6),
tempat_lahir VARCHAR (20),
tanggal_lahir DATE,
no_telp INT (12),
jenis_kelamin VARCHAR (15),
status_pinjam VARCHAR (15),
PRIMARY KEY (id_anggota));

CREATE TABLE buku(kode_buku VARCHAR (10),
judul_buku VARCHAR (25),
pengarang_buku VARCHAR (30),
penerbit_buku VARCHAR (30),
tahun_buku VARCHAR (5),
jumlah_buku VARCHAR (5),
status_buku VARCHAR (10),
klasifikasi_buku VARCHAR (20),
PRIMARY KEY (kode_buku));

CREATE TABLE peminjaman (kode_peminjaman VARCHAR (20),
id_anggota VARCHAR (10),
id_petugas VARCHAR (10),
tanggal_pinjam DATE, 
tanggal_kembali DATE,
kode_buku VARCHAR (10),
PRIMARY KEY (kode_peminjaman), 
FOREIGN KEY(id_petugas) REFERENCES petugas (id_petugas),
FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota),
FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku));

CREATE TABLE pengembalian (kode_kembali VARCHAR (10),
id_anggota VARCHAR (10),
kode_buku VARCHAR (10),
id_petugas VARCHAR (10),
tanggal_pinjam DATE, 
tanggal_kembali DATE,
denda VARCHAR (15),
PRIMARY KEY (kode_kembali),
FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas),
FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota),
FOREIGN KEY (kode_buku) REFERENCES buku (kode_buku));

INSERT INTO petugas
VALUES ('PTGS1', 'Petugas1', 'Login', '	Zana'),
('PTGS2', 'Petugas2', 'Login', 'Wine'),
('PTGS3', 'Petugas3', 'Login', 'Darra'),
('PTGS4', 'Petugas4', 'Login', 'Zain'),
('PTGS5', 'Petugas5', 'Login', 'Nana');


INSERT INTO anggota
VALUES ('8020','Zam','2022','Kalimantan','2003-10-02','088235878128','laki-laki','pinjam'),
('8021','Qella','2021','Serang','2002-09-07','088267894356','Perempuan','pinjam'),
('8022','Zirra','2021','Bandung','2002-09-12','089245678790','Perempuan','pinjam'),
('8023','Zayn','2022','Jakarta','2003-12-25','085845673219','laki-laki','pinjam'),
('8024','Naomi','2022','Bandung','2003-10-20','088290879234','Perempuan','pinjam'),
('8025','Putin','2022','Surabaya','2003-02-02','089267898754','laki-laki','pinjam'),
('8026','Arthur','2022','Surabaya','2003-10-25','088235874512','laki-laki','pinjam'),
('8027','Cilla','2022','Bandung','2003-07-12','085376858765','Perempuan','pinjam'),
('8028','Yasmin','2021','Jogja','2002-03-08','085676768989','Perempuan','pinjam'),
('8029 ','Diego','2021','Surabaya','2002-01-15','089834251237 ','laki-laki','pinjam');

INSERT INTO buku 
VALUES ( 'BK20', 'Promise', 'Dwitasari', 'Loveable', '2016','35', 'Baru', 'Novel'),
( 'BK21', 'Negeri & Menara', 'Ahmad Fuedi', 'PT.Gramedia Pustaka Utama', '1999', '25','Baru', 'Novel'),
( 'BK22', 'Pantai dan Kehidupannya', 'Edy Karsono', 'PT.INDAHJAYA Adipratama', '2003','10', 'Baru', 'Novel'),
( 'BK23', 'Koala Kumal', 'Raditya Dika', 'Gagas Media ', '2015','45', 'Baru', 'Novel'),
( 'BK24', 'Motivasi Bob Sadino', 'Ayu Utami', 'Best Media', '2018','20', 'Baru', 'Novel'),
( 'BK25', 'Sang Mimpi', 'Andrea Hirata', 'Bintang Pustaka', '2019','30', 'Baru', 'Novel'),
( 'BK26', 'Dear Nathan', 'Erisca Febrianti', 'Best Media', '2019','45', 'Baru', 'Novel'),
( 'BK27', 'Sepatu Dahlan', 'Khrisna Pabichara ', 'Noura Book', '1995','35', 'Baru', 'Novel'),
( 'BK28', 'Cinta Brontosaurus', 'Raditya Dika', 'Andi Publisher', '1998','30', 'Baru', 'Novel'),
( 'BK29', 'Laskar Pelangi', 'Andrea Hirata', 'Bintang Pustaka', '1999','20', 'Baru', 'Novel');

INSERT INTO peminjaman 
VALUES ( 'PJ001', '8020' , 'PTGS1', '2024-03-18', '2024-03-25','BK20'),
( 'PJ002', '8028' , 'PTGS2', '2024-03-18', '2024-03-24','BK21'),
( 'PJ003', '8028' , 'PTGS3', '2024-03-19', '2024-03-22','BK22'),
( 'PJ004', '8028' , 'PTGS4', '2024-03-20', '2024-03-27','BK23'),
( 'PJ005', '8028' , 'PTGS5', '2024-03-20', '2024-03-27','BK23'),
( 'PJ006', '8028' , 'PTGS5', '2024-03-20', '2024-03-28','BK23'),
( 'PJ007', '8028' , 'PTGS5', '2024-03-20', '2024-03-29','BK23'),
( 'PJ008', '8028' , 'PTGS5', '2024-03-21', '2024-03-29','BK23'),
( 'PJ009', '8028' , 'PTGS5', '2024-03-21', '2024-03-29','BK23'),
( 'PJ010', '8027' , 'PTGS5', '2024-03-22', '2024-03-30','BK29');

INSERT INTO pengembalian
VALUES ('KB01', '8020' , 'BK20', 'PTGS1', '2024-03-18', '2024-03-25','0'),
('KB02', '8022' , 'BK21', 'PTGS1', '2024-03-18', '2024-03-24','0'),
('KB03', '8028' , 'BK22', 'PTGS3', '2024-03-19', '2024-03-22','0'),
('KB04', '8028' , 'BK23', 'PTGS2', '2024-03-20', '2024-03-27','0'),
('KB05', '8028' , 'BK24', 'PTGS4', '2024-03-20', '2024-03-27','0'),
('KB06', '8028' , 'BK23', 'PTGS1', '2024-03-20', '2024-03-28','0'),
('KB07', '8028' , 'BK23', 'PTGS1', '2024-03-20', '2024-03-29','0'),
('KB08', '8028' , 'BK23', 'PTGS1', '2024-03-21', '2024-03-29','0'),
('KB09', '8028' , 'BK23', 'PTGS1', '2024-03-21', '2024-03-29','0'),
('KB10', '8028' , 'BK29', 'PTGS1', '2024-03-22', '2024-03-30','0');


-- SOAL NO 1A (mengetahui umur buku kalau di lihat dari tahun penerbitan buku) --

DELIMITER //
CREATE PROCEDURE umur_buku()
BEGIN
     SELECT kode_buku, judul_buku, tahun_buku AS tahun_terbit, YEAR(CURDATE())-tahun_buku AS umur_bukunya
     FROM buku;
END //
DELIMITER ;

     CALL umur_buku();
     
-- SOAL NO 1B (menghitung berapa lama anggota tersebut meminjam buku) -

DELIMITER //
CREATE PROCEDURE lama_pinjam()
BEGIN
    SELECT id_anggota, tanggal_pinjam, tanggal_kembali, DATEDIFF(tanggal_kembali, tanggal_pinjam) AS lama_peminjaman
    FROM peminjaman;
END //
DELIMITER ;

CALL lama_pinjam()

-- SOAL NO 2 (mendelete daftar buku  di bawah tahun 2000, penerbitnya AndhiPublisher tidak dapat di delete) --

DELIMITER //
CREATE PROCEDURE hapus_data_buku()
BEGIN 
     DELETE FROM buku WHERE tahun_buku < 2000
     AND penerbit_buku != 'Andi Publisher';
END //
DELIMITER //

CALL hapus_data_buku();

SELECT * FROM buku
INSERT INTO 


-- SOAL NO 3A  jika ada transaksi peminjaman berdasarkan kode buku dan jumlah buku berkurang --

DELIMITER //
CREATE PROCEDURE peminjaman_buku(IN kodebuku_pinjam VARCHAR (10), IN jumlah VARCHAR (5))
BEGIN
UPDATE buku SET jumlah_buku = jumlah_buku - jumlah WHERE kode_buku = kodebuku_pinjam;
END //
DELIMITER //

CALL peminjaman_buku('BK23', '2');




-- SOAL NO 3B jika ada pengembalian buku dengan kode buku tertentu maka jumlah buku akan bertambah. --

DELIMITER //
CREATE PROCEDURE kembalian_buku(IN kodebuku_pinjam VARCHAR (10), IN jumlah VARCHAR (5))
BEGIN
UPDATE buku SET jumlah_buku = jumlah_buku + jumlah WHERE kode_buku = kodebuku_pinjam;
END //
DELIMITER //

CALL kembalian_buku('BK23','5');

-- SOAL NO 4 mengetahui berapa jumlah buku yang dipinjam anggota--

DELIMITER //
CREATE PROCEDURE jumlah_peminjaman( IN id_anggota VARCHAR (10))
BEGIN
SELECT p.id_anggota, a.nama_anggota, COUNT(p.id_anggota)
AS jumlahbuku_dipinjam
FROM peminjaman p, anggota a
WHERE a.id_anggota = p.id_anggota AND p.id_anggota = id_anggota;
END //
DELIMITER //

CALL jumlah_peminjaman('8028');

-- SOAL NO 5 --
DROP PROCEDURE peminjaman_buku;

DROP DATABASE perrpustakaan;
























