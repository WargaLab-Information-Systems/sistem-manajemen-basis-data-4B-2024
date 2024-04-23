CREATE DATABASE db_perpustakaan

USE db_pepustakaan

CREATE TABLE buku (
id_buku INT (4) NOT NULL,
judul_buku VARCHAR (100) NOT NULL,
pengarang_buku VARCHAR (100) NOT NULL,
penerbit_buku VARCHAR (100) NOT NULL,
tahun_buku INT (4) NOT NULL,
jumlah_buku INT (4) NOT NULL, 
status_buku VARCHAR (100) NOT NULL,
klasifikasi_buku VARCHAR (100) NOT NULL,
PRIMARY KEY (id_buku)
)

INSERT INTO buku (id_buku, judul_buku, pengarang_buku, penerbit_buku, tahun_buku, 
jumlah_buku, status_buku, klasifikasi_buku) 
VALUES
(1110, 'Laskar Pelangi', 'Andrea Hiraja', 'Bentang Pustaka', 2005, 20, 'Tersedia', 'Fiksi'),
(1111, 'Ayat-Ayat Cinta', 'Habbiburahman', 'Republika', 2004, 30, 'Tersedia', 'Fiksi Romantis'),
(1112, 'Bumi Manusia', 'Pramoedya Ananta', 'Hasta Mitra', 1980, 10, 'Tidak Tersedia', 'Fiksi Sejarah' ),
(1113, 'Cinta di Dalam Gelas', 'Andrea Hirata', 'Bentang Pustaka', 2006, 50, 'Tersedia', 'Fiksi'),
(1114, 'Ronggeng Dukuh Paruk', 'Ahmad Tohari', 'Gramedia Pustaka Utama', 1982, 10, 'Tidak Tersedia', 'Fiksi Sejarah'),
(1115, 'Perahu Kertas', 'Dee Lestari', 'Bentang Pustaka', 2008, 25, 'Tersedia', 'Fiksi Romantis'),
(1116, 'Bidadari-Bidadari Surga', 'Tere Liye', 'Gramedia Pustaka Utama', 2010, 70, 'Tersedia', 'Fiksi'),
(1117, 'Sang Pemimpin', 'Andrea Hirata', 'Bentang Pustaka', 2006, 55, 'Tersedia', 'Fiksi'),
(1118, 'Pulang', 'Tere Liye', 'Gramedia Pustaka Utama', 2014, 63, 'Tersedia', 'Fiksi'),
(1119, 'Hujan', 'Tere Liye', 'Gramedia Pustaka Utama', 2013, 20, 'Tersedia', 'Fiksi');

CREATE TABLE petugas (
id_petugas INT (4) NOT NULL,
username VARCHAR (100) NOT NULL,
pasword VARCHAR (15) NOT NULL,
nama VARCHAR (100) NOT NULL,
PRIMARY KEY (id_petugas)
)

INSERT INTO petugas(id_petugas, username, pasword, nama )
VALUES
(2220, 'agus_setiawan', 's3ti4w4n', 'Agus Setiawan'),
(2221, 'jayden_kurniawan', 'j4yd3n123', 'Jayden Kurniawan'),
(2222, 'mila_azhari', 'm1l4zhar1', 'Mila Azhari'),
(2223, 'olivia_putri', '0l1v14p', 'Olivia Putri'),
(2224, 'noah_ramadhan', 'n04hr4m', 'Noah Ramadhan' ),
(2225, 'ava_wijaya', '4v4w1j4y4', 'Ava Wijaya' ),
(2226, 'jaxon_hakim', 'j4x0nh4k1m', 'Jaxon Hakim'),
(2227, 'zara_kusuma', 'z4r4ku', 'Zara Kusuma'),
(2228, 'leo_fernando', 'l30f3rn4nd0', 'Leo Fernando'),
(2229, 'mia_siregar', 'm14s1r3g4r', 'Mia Siregar');

CREATE TABLE anggota (
id_anggota INT (4) NOT NULL,
nama_anggota VARCHAR (100) NOT NULL, 
angkatan_anggota INT (4) NOT NULL,
tempat_lahir_anggota VARCHAR (100) NOT NULL,
tanggal_lahir_anggota DATE,
no_telp INT (12) NOT NULL,
jenis_kelamin VARCHAR (50) NOT NULL,
status_pinjam VARCHAR (50) NOT NULL,
PRIMARY KEY (id_anggota)
)

INSERT INTO anggota (id_anggota, nama_anggota, angkatan_anggota, tempat_lahir_anggota, 
tanggal_lahir_anggota, no_telp, jenis_kelamin, status_pinjam)
VALUES
(3330, 'Rina Pratiwi', 2022, 'Jakarta', '2004-03-01', 083456789021, 'Perempuan', 'Aktif'),
(3331, 'Budi Santoso', 2023, 'Jakarta', '2000-05-15', 083456789012, 'Laki-laki', 'Aktif'),
(3332, 'Anita Sari', 2019, 'Bandung', '2001-07-20', 083456789013, 'Perempuan', 'Aktif'),
(3333, 'Faisal Rahman', 2020, 'Surabaya', '2002-09-25', 083456789014, 'Laki-laki', 'Tidak Aktif'),
(3334, 'Citra Dewi', 2021, 'Medan', '2003-11-30', 083456789015, 'Perempuan', 'Aktif'),
(3335, 'Rudi Hidayat', 2022, 'Medan', '2004-02-05', 083456789016, 'Laki-laki', 'Tidak Aktif'),
(3336, 'Dewi Lestari', 2023, 'Semarang', '2000-06-10', 083456789017, 'Perempuan', 'Aktif'),
(3337, 'Adi Nugroho', 2019, 'Bandung', '2001-08-15', 083456789018, 'Laki-laki', 'Aktif'),
(3338, 'Siska Putri', 2020, 'Jakarta', '2002-10-20', 083456789019, 'Perempuan', 'Tidak Aktif'),
(3339, 'Agung Wijaya', 2021, 'Surabaya', '2003-12-25', 083456789020, 'Laki-laki', 'Aktif');


CREATE TABLE peminjaman (
id_peminjaman INT (4) NOT NULL,
id_anggota INT (4) NOT NULL,
id_petugas INT (4) NOT NULL,
id_buku INT (4) NOT NULL,
tanggal_pinjam DATE,
tanggal_kembali DATE,
PRIMARY KEY (id_peminjaman),
FOREIGN KEY (id_anggota) REFERENCES anggota (id_anggota),
FOREIGN KEY (id_petugas) REFERENCES petugas (id_petugas),
FOREIGN KEY (id_buku) REFERENCES buku (id_buku)
)

INSERT INTO peminjaman (id_peminjaman, id_anggota, id_petugas, id_buku, tanggal_pinjam, 
tanggal_kembali)
VALUES
(4440, 3330, 2220, 1111, '2024-01-01', '2024-01-10'),
(4441, 3336, 2221, 1111, '2024-02-03', '2024-02-12'),
(4442, 3332, 2222, 1115, '2024-03-07', '2024-03-16'),
(4443, 3336, 2223, 1113, '2024-04-10', '2024-04-19'),
(4444, 3334, 2223, 1114, '2024-05-15', '2024-05-24'),
(4445, 3336, 2225, 1115, '2024-06-18', '2024-06-27'),
(4446, 3336, 2226, 1116, '2024-07-21', '2024-07-30'),
(4447, 3336, 2223, 1117, '2024-08-24', '2024-09-02'),
(4448, 3336, 2228, 1115, '2024-09-27', '2024-10-06'),
(4449, 3339, 2229, 1119, '2024-10-30', '2024-11-08');

CREATE TABLE pengembalian (
id_kembali INT (4) NOT NULL,
id_anggota INT (4) NOT NULL,
id_petugas INT (4) NOT NULL,
id_buku INT (4) NOT NULL,
tgl_pinjam DATE,
tgl_kembali DATE,
denda DECIMAL (10, 2),
PRIMARY KEY (id_kembali),
FOREIGN KEY (id_anggota) REFERENCES anggota (id_anggota),
FOREIGN KEY (id_petugas) REFERENCES petugas (id_petugas),
FOREIGN KEY (id_buku) REFERENCES buku (id_buku)
)

INSERT INTO pengembalian (id_kembali, id_anggota, id_petugas, id_buku, tgl_pinjam,
tgl_kembali, denda)
VALUES
(5550, 3330, 2220, 1110, '2024-01-01', '2024-01-10', 0),
(5551, 3331, 2221, 1111, '2024-02-03', '2024-02-13', 10000),
(5552, 3332, 2222, 1112, '2024-04-10', '2024-03-18', 20000),
(5553, 3333, 2223, 1113, '2024-04-10', '2024-04-19', 0),
(5554, 3334, 2224, 1114, '2024-05-15', '2024-05-24', 0),
(5555, 3335, 2225, 1115, '2024-06-18', '2024-06-28', 10000),
(5556, 3336, 2226, 1116, '2024-07-21', '2024-08-03', 30000),
(5557, 3337, 2227, 1117, '2024-08-24', '2024-09-02', 0),
(5558, 3338, 2228, 1118, '2024-09-27', '2024-10-12', 20000),
(5559, 3339, 2229, 1119, '2024-10-30', '2024-11-13', 50000);

-- soal 1
CREATE VIEW anggota_lebih_dari_5_buku AS
SELECT a.id_anggota, a.nama_anggota, COUNT(p.id_peminjaman) AS jumlah_peminjaman
FROM anggota a
JOIN peminjaman p ON a.id_anggota = p.id_anggota
GROUP BY a.id_anggota, a.nama_anggota
HAVING COUNT(p.id_peminjaman) > 5;

SELECT * FROM anggota_lebih_dari_5_buku

-- soal 2
CREATE VIEW transaksi_petugas AS
SELECT p.id_petugas, p.nama AS nama_petugas, 
       COUNT(CASE WHEN t.tanggal_pinjam IS NOT NULL THEN t.id_peminjaman END) AS jumlah_peminjaman,
       COUNT(CASE WHEN k.tgl_pinjam IS NOT NULL THEN k.id_kembali END) AS jumlah_pengembalian
FROM petugas p
LEFT JOIN peminjaman t ON p.id_petugas = t.id_petugas
LEFT JOIN pengembalian k ON p.id_petugas = k.id_petugas
GROUP BY p.id_petugas, p.nama;

SELECT * FROM transaksi_petugas

-- soal 3
CREATE VIEW petugas_terbanyak AS
SELECT p.id_petugas, p.nama AS nama_petugas, 
       COUNT(CASE WHEN t.tanggal_pinjam IS NOT NULL THEN t.id_peminjaman END) AS jumlah_peminjaman,
       COUNT(CASE WHEN k.tgl_pinjam IS NOT NULL THEN k.id_kembali END) AS jumlah_pengembalian
FROM petugas p
LEFT JOIN peminjaman t ON p.id_petugas = t.id_petugas
LEFT JOIN pengembalian k ON p.id_petugas = k.id_petugas
GROUP BY p.id_petugas, p.nama
ORDER BY (COUNT(t.id_peminjaman) + COUNT(k.id_kembali)) DESC
LIMIT 1;

SELECT * FROM petugas_terbanyak

CREATE VIEW tugas_terbanyak AS
SELECT p.id_petugas, p.nama AS nama_petugas, 
       COUNT(CASE WHEN t.tanggal_pinjam IS NOT NULL THEN t.id_peminjaman END) AS jumlah_peminjaman,
       COUNT(CASE WHEN k.tgl_pinjam IS NOT NULL THEN k.id_kembali END) AS jumlah_pengembalian
FROM petugas p
LEFT JOIN peminjaman t ON p.id_petugas = t.id_petugas
LEFT JOIN pengembalian k ON p.id_petugas = k.id_petugas
GROUP BY p.id_petugas, p.nama
ORDER BY (COUNT(t.id_peminjaman) + COUNT(k.id_kembali)) 
LIMIT 1;

SELECT * FROM tugas_terbanyak

-- soal 4
CREATE VIEW view_buku AS
SELECT p.id_buku, b.judul_buku, b.klasifikasi_buku, COUNT(p.id_peminjaman) AS jumlah_dipinjam
FROM peminjaman p 
JOIN buku b ON p.id_buku = b.id_buku 
GROUP BY p.id_buku, b.judul_buku, b.klasifikasi_buku
HAVING jumlah_dipinjam = (SELECT MAX(jumlah_dipinjam) FROM (SELECT COUNT(id_peminjaman) AS jumlah_dipinjam 
FROM peminjaman GROUP BY id_buku) AS jumlah_dipinjam_table);

SELECT * FROM view_buku

SELECT * FROM buku
SELECT * FROM petugas
SELECT * FROM anggota
SELECT * FROM peminjaman
SELECT * FROM pengembalian

DROP TABLE peminjaman;
DROP VIEW transaksi_petugas;