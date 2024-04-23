
CREATE DATABASE perpustkn;
USE perpustkn;

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
VALUES ( 'BK20', 'Promise', 'Dwitasari', 'Loveable', '2016','35', 'Baru', 'Baik'),
( 'BK21', 'Negeri & Menara', 'Ahmad Fuedi', 'PT.Gramedia Pustaka Utama', '2009', '25','Baru', 'Baik'),
( 'BK22', 'Pantai dan Kehidupannya', 'Edy Karsono', 'PT.INDAHJAYA Adipratama', '2003','10', 'Baru', 'Baik'),
( 'BK23', 'Koala Kumal', 'Raditya Dika', 'Gagas Media ', '2015','15', 'Baru', 'Baik'),
( 'BK24', 'Motivasi Bob Sadino', 'Ayu Utami', 'Best Media', '2018','20', 'Baru', 'Baik'),
( 'BK25', 'Sang Mimpi', 'Andrea Hirata', 'Bintang Pustaka', '2019','30', 'Baru', 'Baik'),
( 'BK26', 'Dear Nathan', 'Erisca Febrianti', 'Best Media', '2019','45', 'Baru', 'Baik'),
( 'BK27', 'Sepatu Dahlan', 'Khrisna Pabichara ', 'Noura Book', '2017','35', 'Baru', 'Baik'),
( 'BK28', 'Cinta Brontosaurus', 'Raditya Dika', 'Gagas Media', '2018','30', 'Baru', 'Baik'),
( 'BK29', 'Laskar Pelangi', 'Andrea Hirata', 'Bintang Pustaka', '2015','20', 'Baru', 'Baik');

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


NO 1

-- data anggota yang meminjam buku lebih dari 5

SELECT a.id_anggota, a.nama_anggota, COUNT(p.kode_peminjaman) AS jumlah_peminjaman
FROM anggota a
JOIN peminjaman p ON a.id_anggota = p.id_anggota
GROUP BY a.id_anggota, a.nama_anggota
HAVING COUNT(p.kode_peminjaman) > 5;

SELECT * FROM peminjam_terbanyak_new;


NO 2 
-- data petugas transaksi dan jumlah buku yang terpinjam ketika bertugas

CREATE VIEW petugas_peminjam_buku AS 
SELECT tugas.id_petugas, tugas.nama, pinjam.tanggal_pinjam, COUNT(*) AS jumlah_transaksi 
FROM petugas tugas 
JOIN peminjaman pinjam ON tugas.id_petugas = pinjam.id_petugas 
GROUP BY tugas.id_petugas;

SELECT * FROM petugas_peminjam_buku;

NO 3
-- petugas yang melayani transaksi terbanyak 
CREATE OR REPLACE VIEW petugas_transaksi_terbanyak AS
SELECT p.id_petugas, p.nama, COUNT(*) AS jumlah_transaksi
FROM peminjaman pm
JOIN petugas p ON pm.id_petugas = p.id_petugas
GROUP BY p.id_petugas, p.nama
ORDER BY jumlah_transaksi DESC
LIMIT 1;

SELECT * FROM petugas_transaksi_terbanyak;


NO 4
-- Menampilkan data buku dengan jumlah peminjaman terbanyak

CREATE VIEW view_buku AS
SELECT p.kode_buku, b.judul_buku, COUNT(p.kode_peminjaman) AS jumlah_dipinjam
FROM peminjaman p 
JOIN buku b ON p.kode_buku = b.kode_buku 
GROUP BY p.kode_buku, b.judul_buku
HAVING jumlah_dipinjam = (SELECT MAX(jumlah_dipinjam) FROM (SELECT COUNT(kode_peminjaman) AS jumlah_dipinjam 
FROM peminjaman GROUP BY kode_buku) AS jumlah_dipinjam_table);

SELECT * FROM view_buku;


DROP VIEW buku_terbanyak;




-------- Delimiter. -----------

--Nomer 1
DELIMITER //
CREATE PROCEDURE getJKanggota(IN jeniskelamin VARCHAR(15))
BEGIN
	SELECT * FROM anggota WHERE jenis_kelamin = jeniskelamin;
END //
DELIMITER //

CALL getJKanggota ('Perempuan');

--Nomer 2
DELIMITER //
CREATE PROCEDURE getKodeBuku(IN kodebuku VARCHAR(10))
BEGIN
	SELECT * FROM peminjaman WHERE kode_buku = kodebuku;
END //
DELIMITER//

CALL getKodeBuku('BK23');

--Nomer 3 
DELIMITER //
CREATE PROCEDURE getJudulPengarang(
        IN judul VARCHAR (25),
        IN pengarang VARCHAR (30))
BEGIN
	SELECT * FROM buku WHERE judul_buku = judul 
	AND pengarang_buku = pengarang;
END //
DELIMITER;

CALL getJudulPengarang("Laskar Pelangi","Andrea Hirata");

-Nomer 4
DELIMITER //
CREATE PROCEDURE getNamaAngktnLahir(
        IN nama VARCHAR (20), 
        IN angkatan VARCHAR (6),
        IN tmptlahir VARCHAR (20))
BEGIN
	SELECT * FROM anggota WHERE nama_anggota = nama
	AND angkatan_anggota = angkatan 
	AND tempat_lahir = tmptlahir;
END //
DELIMITER;

CALL getNamaAngktnlahir("Arthur ", "2022", "Surabaya");

-- Nomer 5
DELIMITER //
CREATE PROCEDURE getTambahAnggota(
        IN id_anggota VARCHAR(10),
        IN nama_anggota VARCHAR(20),
        IN angkatan_anggota VARCHAR(6), 
        IN tempat_lahir VARCHAR(20),
        IN tanggal_lahir DATE,
        IN no_telp INT (12),
        IN jenis_kelamin VARCHAR (15),
        IN status_pinjam VARCHAR (15))
BEGIN
	INSERT INTO anggota 
	VALUES (id_anggota, nama_anggota, angkatan_anggota, tempat_lahir, tanggal_lahir, no_telp, jenis_kelamin, status_pinjam);
END //
DELIMITER ;

CALL getTambahAnggota('8031','Raini','2021','Bali','2002-03-05','088356894445','Perempuan','pinjam');
SELECT * FROM anggota;

-- Nomer 6 
DELIMITER //
CREATE PROCEDURE getJumlahBuku(OUT jumlahBuku  INT(3))
BEGIN
	SELECT COUNT(jumlah_buku) INTO jumlahBuku FROM buku;
END //
DELIMITER ;

CALL getJumlahBuku(@jumlahBuku);
SELECT @jumlahBuku;

-- Nomer 7
DELIMITER //
CREATE PROCEDURE getBuku(
	IN KodeBuku VARCHAR (10),
	OUT KodeBukuOUT VARCHAR (10),
	OUT JudulBukuOUT VARCHAR (25), 
	OUT PengarangBukuOUT VARCHAR (20))
	
	BEGIN
		SELECT kode_buku,judul_buku,pengarang_buku INTO KodeBukuOUT,JudulBukuOUT,PengarangBukuOUT
		FROM buku WHERE kode_buku = KodeBuku;
	
END //
DELIMITER ;
CALL getBuku('BK23', @KodeBukuOUT, @JudulBukuOUT, @PengarangBukuOUT);
SELECT @KodeBukuOUT, @JudulBukuOUT, @PengarangBukuOUT;

DROP PROCEDURE tambah; 