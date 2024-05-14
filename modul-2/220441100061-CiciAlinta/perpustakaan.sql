CREATE DATABASE perpustakaan;

USE perpustakaan;

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

SELECT * FROM petugas;

INSERT INTO petugas VALUES
('P1', 'petugas1', '111', 'ahmad'),
('P2', 'petugas2', '222', 'seila'),
('P3', 'petugas3', '333', 'barizi'),
('P4', 'petugas4', '444', 'neza'),
('P5', 'petugas5', '555', 'naila');

SELECT * FROM anggota;

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


SELECT * FROM buku;
 
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
('BK20', 'Rindu', 'Tere Liye', 'Gramedia Pustaka Utama', '2006', '55', 'Baru', 'Baik');
 
 SELECT * FROM peminjaman;
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
 
 SELECT * FROM pengembalian;
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

/*NO 1*/
CREATE VIEW peminjam_terbanyak AS
SELECT a.id_anggota, a.nama_anggota, COUNT(p.kode_peminjaman) AS jumlah_peminjaman
FROM anggota a
JOIN peminjaman p ON a.id_anggota = p.id_anggota
GROUP BY a.id_anggota, a.nama_anggota
HAVING COUNT(p.kode_peminjaman) > 5;

SELECT * FROM peminjam_terbanyak;


/*NO 2*/
CREATE VIEW petugas_transaksi AS SELECT ptg.id_petugas, ptg.nama, pmj.tanggal_pinjam,
COUNT(*) AS jumlah_transaksi FROM petugas ptg JOIN peminjaman pmj ON ptg.id_petugas = pmj.id_petugas
GROUP BY id_petugas;


SELECT * FROM petugas_transaksi;

/*NO 3*/
CREATE VIEW petugas_terbanyak_transaksi AS
SELECT a.id_petugas, a.nama, MAX(jumlah_transaksi) FROM petugas_transaksi a, peminjaman p
WHERE a.id_petugas = p.id_petugas AND jumlah_transaksi >= ALL (SELECT jumlah_transaksi FROM petugas_transaksi)
GROUP BY a.id_petugas;

SELECT * FROM petugas_terbanyak_transaksi;

/*NO 4*/
CREATE VIEW view_buku AS
SELECT p.kode_buku, b.judul_buku, COUNT(p.kode_peminjaman) AS jumlah_dipinjam
FROM peminjaman p 
JOIN buku b ON p.kode_buku = b.kode_buku 
GROUP BY p.kode_buku, b.judul_buku
HAVING jumlah_dipinjam = (SELECT MAX(jumlah_dipinjam) FROM (SELECT COUNT(kode_peminjaman) AS jumlah_dipinjam 
FROM peminjaman GROUP BY kode_buku) AS jumlah_dipinjam_table);

SELECT * FROM view_buku;