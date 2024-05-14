CREATE DATABASE perpustakaan1

USE perpustakaan1

CREATE TABLE petugas (
id_petugas VARCHAR (10) PRIMARY KEY,
username VARCHAR (15),
pasword VARCHAR (15),
nama VARCHAR (25));

CREATE TABLE anggota (
id_anggota VARCHAR (10) PRIMARY KEY,
nama_anggota VARCHAR (20),
angkatan_anggota VARCHAR (6),
tempat_lahir_anggota VARCHAR (20),
tanggal_lahir_anggota DATE,
no_telp INT (12),
jenis_kelamin VARCHAR (15),
status_pinjam VARCHAR (15));

CREATE TABLE buku (
kode_buku VARCHAR (10) PRIMARY KEY,
judul_buku VARCHAR (25),
pengarang_buku VARCHAR (30),
penerbit_buku VARCHAR (30),
tahun_buku VARCHAR (10),
jumlah_buku VARCHAR (10),
status_buku VARCHAR (10),
klasifikasi_buku VARCHAR (20));

CREATE TABLE peminjaman (
kode_peminjaman VARCHAR (10) PRIMARY KEY,
id_anggota VARCHAR (10),
id_petugas VARCHAR (10),
tanggal_pinjam DATE,
tanggal_kembali DATE,
kode_buku VARCHAR (15), 
FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas),
FOREIGN KEY(id_anggota) REFERENCES anggota(id_anggota),
FOREIGN KEY(kode_buku) REFERENCES buku(kode_buku)); 

CREATE TABLE pengembalian (
kode_kembali VARCHAR (10) PRIMARY KEY,
id_anggota VARCHAR (10),
kode_buku VARCHAR (10),
id_petugas VARCHAR (10),
tanggal_pinjam DATE,
tanggal_kembali DATE,
denda VARCHAR (15),
FOREIGN KEY(id_petugas) REFERENCES petugas(id_petugas),
FOREIGN KEY(id_anggota) REFERENCES anggota(id_anggota),
FOREIGN KEY(kode_buku) REFERENCES buku(kode_buku));


INSERT INTO petugas VALUES
('P1', 'petugas1', '111', 'ahmad'),
('P2', 'petugas2', '222', 'seila'),
('P3', 'petugas3', '333', 'barizi'),
('P4', 'petugas4', '444', 'neza'),
('P5', 'petugas5', '555', 'naila');


INSERT INTO anggota VALUES
('1010', 'Firda', '2018', 'Lamongan', '2000-10-12', '081276384723', 'Perempuan', 'pinjam'),
('1011', 'Fajar', '2019', 'Jombang', '2000-11-20', '085647287345', 'Laki-laki', 'kembali'),
('1012', 'Hamdani', '2019', 'Malang', '2002-03-28', '085273845176', 'Laki-laki', 'pinjam'),
('1013', 'Aulia', '2018', 'Pasuruan', '2001-04-12', '081278365827', 'Perempuan', 'pinjam'),
('1014', 'Krisna', '2019', 'Batu', '2003-07-12', '085467837292', 'Laki-laki', 'kembali'),
('1015', 'Azizah', '2018', 'Surabaya', '2002-12-12', '085143785437', 'Perempuan', 'pinjam'),
('1016', 'Ninda', '2019', 'Mojokerto', '2004-03-12', '082198456785', 'Perempuan', 'pinjam'),
('1017', 'Linda', '2019', 'Kediri', '2000-01-01', '085475821384', 'Perempuan', 'kembali'),
('1018', 'Rendy', '2019', 'Bojonegoro', '2003-04-27', '085837193847', 'Laki-laki', 'pinjam'),
('1019', 'Adit', '2018', 'Sidoarjo', '2002-06-20', '085123847543', 'Laki-laki', 'pinjam');


INSERT INTO buku VALUES
('BK11', 'Sang Pemimpi', 'Andrea Hirata', 'Bentang Pustaka', '2006', '40', 'Baru', 'Baik'),
('BK12', 'Ayat-Ayat Cinta', 'Habiburrahman El Shirazy', 'Republika', '2004', '20', 'Baru', 'Baik'),
('BK13', 'Perahu Kertas', 'Dee Lestari', 'Bentang Pustaka', '2008', '45', 'Baru', 'Baik'),
('BK14', 'Laskar Pelangi', 'Andrea Hirata', 'Bentang Pustaka', '2005', '30', 'Baru', 'Baik'),
('BK15', 'Bumi Manusia', 'Pramoedya Ananta Toer', 'Hasta Mitra', '1980', '35', 'Baru', 'Baik'),
('BK16', 'Tenggelamnya Kapal van der Wijck', 'Hamka', 'Balai Pustaka', '1938', '25', 'Baru', 'Baik'),
('BK17', 'Matahari', 'Tere Liye', 'Gramedia Pustaka Utama', '2015', '50', 'Baru', 'Baik'),
('BK18', 'Sang Pencerah', 'Ahmad Tohari', 'Gramedia Pustaka Utama', '1999', '10', 'Baru', 'Baik'),
('BK19', 'Negeri 5 Menara', 'Ahmad Fuadi', 'Gramedia Pustaka Utama', '2009', '15', 'Baru', 'Baik'),
('BK20', 'Cinta Brontosaurus', 'Raditya Dika', 'Andi Publisher', '1998', '5', 'Baru', 'Baik');
 
 INSERT INTO peminjaman VALUES 
 ('PJ01', '1018', 'P1', '2024-03-10', '2024-03-20', 'BK15'),
 ('PJ02', '1018', 'P2', '2024-03-01', '2024-03-19', 'BK15'),
 ('PJ03', '1018', 'P3', '2024-03-10', '2024-03-20', 'BK15'),
 ('PJ04', '1018', 'P3', '2024-03-16', '2024-03-27', 'BK20'),
 ('PJ05', '1018', 'P3', '2024-03-10', '2024-03-20', 'BK15'),
 ('PJO6', '1018', 'P3', '2024-03-10', '2024-03-20', 'BK14'),
 ('PJ07', '1018', 'P3', '2024-03-10', '2024-03-20', 'BK15'),
 ('PJ08', '1018', 'P3', '2024-03-10', '2024-03-20', 'BK15'),
 ('PJ09', '1019', 'P4', '2024-03-08', '2024-03-17', 'BK13'),
 ('PJ10', '1015', 'P5', '2024-03-12', '2024-03-22', 'BK17');
 

 INSERT INTO pengembalian VALUES
 ('KB01', '1018', 'BK15', 'P1', '2024-03-10', '2024-03-20', '0'),
 ('KB02', '1018', 'BK15', 'P2', '2024-03-01', '2024-03-19', '0'),
 ('KB03', '1018', 'BK15', 'P3', '2024-03-10', '2024-03-20', '0'),
 ('KB04', '1018', 'BK20', 'P3', '2024-03-16', '2024-03-27', '0'),
 ('KB05', '1018', 'BK15', 'P3', '2024-03-10', '2024-03-20', '0'),
 ('KBO6', '1018', 'BK14', 'P3', '2024-03-10', '2024-03-20', '0'),
 ('KB07', '1018', 'BK15', 'P3', '2024-03-10', '2024-03-20', '0'),
 ('KB08', '1018', 'BK15', 'P3', '2024-03-10', '2024-03-20', '0'),
 ('KB09', '1019', 'BK13', 'P4', '2024-03-08', '2024-03-17', '0'),
 ('KB10', '1015', 'BK17', 'P5', '2024-03-12', '2024-03-22', '0');



## NO 1A
DELIMITER//
CREATE PROCEDURE umurBuku ()
BEGIN
	SELECT kode_buku, judul_buku, tahun_buku AS tahun_terbit, YEAR(CURDATE()) -tahun_buku
	AS umur_bukunya FROM buku;
END//
DELIMITER;
CALL umurBuku();



## NO 1B
DELIMITER//
CREATE PROCEDURE lamaPinjam()
BEGIN 
	SELECT id_anggota, tanggal_pinjam, tanggal_kembali, DATE(tanggal_kembali)-DATE(tanggal_pinjam)
	AS lama_peminjaman FROM pengembalian;
END//
DELIMITER;
CALL lamaPinjam();


##NO 2
DELIMITER//
CREATE PROCEDURE hapus_buku1()
BEGIN
	DELETE FROM buku WHERE buku.Tahun_Buku < 2000 
	AND penerbit_buku != 'Andi Publisher';
END//
DELIMITER;

CALL hapus_buku1();

SELECT * FROM buku;



## NO 3A
DELIMITER//
CREATE PROCEDURE peminjaman_buku (IN kodebuku_pinjam VARCHAR (10), IN jumlah VARCHAR (5))
BEGIN
	UPDATE buku SET jumlah_buku = jumlah_buku - jumlah WHERE kode_buku = kodebuku_pinjam;
END//
DELIMITER;
CALL peminjaman_buku ('BK11','10');
SELECT*FROM buku

## NO 3B
DELIMITER//
CREATE PROCEDURE kembalian_buku (IN kodebuku_pinjam VARCHAR(10), IN jumlah VARCHAR (5))
BEGIN
	UPDATE buku SET jumlah_buku = jumlah_buku + jumlah WHERE kode_buku = kodebuku_pinjam;
END//
DELIMITER;
CALL kembalian_buku('BK13','5');
SELECT*FROM buku

## NO 4
DELIMITER//
CREATE PROCEDURE jumlah_peminjaman (IN id_anggota VARCHAR (10))
BEGIN
	SELECT p.id_anggota, a.nama_anggota, COUNT(p.id_anggota)
	AS jumlahbuku_dipinjam FROM peminjaman p, anggota a
	WHERE a.id_anggota = p.id_anggota AND p.id_anggota = id_anggota;
END//
DELIMITER;
CALL jumlah_peminjaman('1018');

## NO 5 
DROP PROCEDURE jumlah_peminjaman;
