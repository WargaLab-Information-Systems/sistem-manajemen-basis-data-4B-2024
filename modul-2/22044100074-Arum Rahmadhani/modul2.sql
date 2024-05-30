USE DATABASE perpustakaan;

CREATE TABLE petugas (
id_petugas CHAR (10)PRIMARY KEY,
username CHAR (15),
PASSWORD CHAR (15),
nama CHAR (25)
)

CREATE TABLE peminjaman (
kode_peminjaman CHAR(10) PRIMARY KEY,
id_anggota CHAR(10),
id_petugas CHAR(10),
tanggal_pinjam DATE,
tanggal_kembali DATE,
kode_buku CHAR(10),
FOREIGN KEY (id_petugas) REFERENCES petugas (id_petugas),
FOREIGN KEY (id_anggota) REFERENCES anggota (id_anggota),
FOREIGN KEY (kode_buku) REFERENCES buku (kode_buku)
)

CREATE TABLE buku (
kode_buku CHAR (10) PRIMARY KEY,
judul_buku CHAR (25),
pengarang_buku CHAR (30),
penerbit_buku CHAR (30),
tahun_buku CHAR (10),
jumlah_buku CHAR (5),
status_buku CHAR (10),
klasifikasi_buku CHAR (20)
)

CREATE TABLE pengembalian (
kode_kembali CHAR(10) PRIMARY KEY,
id_anggota CHAR(10),
kode_buku CHAR(10),
id_petugas CHAR(10),
tgl_pinjam DATE,
tgl_kembali DATE,
denda CHAR(15),
FOREIGN KEY (id_anggota) REFERENCES anggota (id_anggota),
FOREIGN KEY (kode_buku) REFERENCES buku (kode_buku),
FOREIGN KEY (id_petugas) REFERENCES petugas (id_petugas)
)

CREATE TABLE anggota (
id_anggota CHAR (10) PRIMARY KEY,
nama_anggota CHAR (20),
angkatan_anggota CHAR (6),
tempat_lahir_anggota CHAR (20),
tanggal_lahir_anggota DATE,
no_telp INT (12),
jenis_kelamin CHAR (15),
status_pinjam CHAR (15)
)

INSERT INTO petugas (id_petugas, username, PASSWORD, nama)
VALUES 
('P001', 'petugas1', 'password1', 'Nathania Syifa'),
('P002', 'petugas2', 'password2', 'Arum Rahma'),
('P003', 'petugas3', 'password3', 'Nobita Nobi'),
('P004', 'petugas4', 'password4', 'Pramudita Dita'),
('P005', 'petugas5', 'password5', 'Takeshi Giant'),
('P006', 'petugas6', 'password6', 'Shizuka'),
('P007', 'petugas7', 'password7', 'Suneo Bara'),
('P008', 'petugas8', 'password8', 'Muh Komarudin'),
('P009', 'petugas9', 'password9', 'Anaya Syta'),
('P010', 'petugas10', 'password10', 'Doni Rohmat');


INSERT INTO peminjaman (kode_peminjaman, id_anggota, id_petugas, tanggal_pinjam, tanggal_kembali, kode_buku)
VALUES
('PM001', 'A001', 'P001', '2024-03-01', '2024-03-15', 'B001'),
('PM002', 'A001', 'P002', '2024-03-02', '2024-03-16', 'B002'),
('PM003', 'A001', 'P003', '2024-03-03', '2024-03-17', 'B003'),
('PM004', 'A001', 'P004', '2024-03-04', '2024-03-18', 'B004'),
('PM005', 'A001', 'P005', '2024-03-05', '2024-03-19', 'B005'),
('PM006', 'A001', 'P006', '2024-03-06', '2024-03-20', 'B006'),
('PM007', 'A002', 'P007', '2024-03-07', '2024-03-21', 'B007'),
('PM008', 'A002', 'P008', '2024-03-08', '2024-03-22', 'B008'),
('PM009', 'A002', 'P009', '2024-03-09', '2024-03-23', 'B009'),
('PM010', 'A002', 'P010', '2024-03-10', '2024-03-24', 'B010'),
('PM011', 'A003', 'P007', '2024-03-01', '2024-03-21', 'B007'),
('PM012', 'A003', 'P008', '2024-03-12', '2024-03-22', 'B008'),
('PM013', 'A003', 'P009', '2024-03-13', '2024-03-23', 'B009'),
('PM014', 'A003', 'P010', '2024-03-14', '2024-03-24', 'B010'),
('PM015', 'A003', 'P007', '2024-03-15', '2024-03-21', 'B007'),
('PM016', 'A003', 'P008', '2024-03-16', '2024-03-22', 'B008'),
('PM017', 'A003', 'P009', '2024-03-17', '2024-03-23', 'B009'),
('PM018', 'A006', 'P010', '2024-03-18', '2024-03-24', 'B010');


INSERT INTO buku (kode_buku, judul_buku, pengarang_buku, penerbit_buku, tahun_buku, jumlah_buku, status_buku, klasifikasi_buku)
VALUES 
('B001', 'Daun yang jatu', 'Boy Candra', 'Penerbit 1', '2020', '10', 'Tersedia', 'Klasifikasi 1'),
('B002', 'Aku kamu dan dia', 'Daundi', 'Penerbit 2', '2021', '15', 'Tersedia', 'Klasifikasi 2'),
('B003', 'Rumahku', 'Setyo Mulyo', 'Penerbit 3', '2019', '20', 'Tersedia', 'Klasifikasi 3'),
('B004', 'Agamaku yang indah', 'AraChan', 'Penerbit 4', '2018', '25', 'Tersedia', 'Klasifikasi 4'),
('B005', 'Tasbih kosong', 'Momoyo', 'Penerbit 5', '2017', '30', 'Tersedia', 'Klasifikasi 5'),
('B006', 'Dimana saja?', 'Dinda', 'Penerbit 6', '2016', '35', 'Tersedia', 'Klasifikasi 6'),
('B007', 'Hujan', 'Reinokus', 'Penerbit 7', '2015', '40', 'Tersedia', 'Klasifikasi 7'),
('B008', 'Gerimis', 'Komarudin', 'Penerbit 8', '2014', '45', 'Tersedia', 'Klasifikasi 8'),
('B009', 'Pembohong', 'Akbar Knzo', 'Penerbit 9', '2013', '50', 'Tersedia', 'Klasifikasi 9'),
('B010', 'Cinta yang hilang', 'Loliy', 'Penerbit 10', '2012', '55', 'Tersedia', 'Klasifikasi 10');


INSERT INTO pengembalian (kode_kembali, id_anggota, kode_buku, id_petugas, tgl_pinjam, tgl_kembali, denda)
VALUES
('P001', 'A001', 'B001', 'P001', '2024-03-01', '2024-03-15', '10000'),
('P002', 'A002', 'B002', 'P002', '2024-03-02', '2024-03-16', '5000'),
('P003', 'A003', 'B003', 'P003', '2024-03-03', '2024-03-17', '0'),
('P004', 'A004', 'B004', 'P004', '2024-03-04', '2024-03-18', '10000'),
('P005', 'A005', 'B005', 'P005', '2024-03-05', '2024-03-19', '0'),
('P006', 'A006', 'B006', 'P006', '2024-03-06', '2024-03-20', '10000'),
('P007', 'A007', 'B007', 'P007', '2024-03-07', '2024-03-21', '5000'),
('P008', 'A008', 'B008', 'P008', '2024-03-08', '2024-03-22', '10000'),
('P009', 'A009', 'B009', 'P009', '2024-03-09', '2024-03-23', '15000'),
('P010', 'A010', 'B010', 'P010', '2024-03-10', '2024-03-24', '5000');

INSERT INTO anggota (id_anggota, nama_anggota, angkatan_anggota, tempat_lahir_anggota, tanggal_lahir_anggota, no_telp, jenis_kelamin, status_pinjam)
VALUES 
('A001', 'Faizal akbar', '2020', 'Tempat Lahir 1', '2000-01-01', '123456789', 'Laki-laki', 'Aktif'),
('A002', 'Arum Raa', '2021', 'Tempat Lahir 2', '2001-02-02', '123456789', 'Perempuan', 'Aktif'),
('A003', 'jungkook', '2022', 'Tempat Lahir 3', '2002-03-03', '123456789', 'Laki-laki', 'Tidak Aktif'),
('A004', 'Adelia', '2023', 'Tempat Lahir 4', '2003-04-04', '123456789', 'Perempuan', 'Aktif'),
('A005', 'Anggota lima', '2024', 'Tempat Lahir 5', '2004-05-05', '123456789', 'Laki-laki', 'Aktif'),
('A006', 'Anggota enam', '2025', 'Tempat Lahir 6', '2005-06-06', '123456789', 'Perempuan', 'Aktif'),
('A007', 'Anggota tujuh', '2026', 'Tempat Lahir 7', '2006-07-07', '123456789', 'Laki-laki', 'Aktif'),
('A008', 'Anggota delapan', '2027', 'Tempat Lahir 8', '2007-08-08', '123456789', 'Perempuan', 'Tidak Aktif'),
('A009', 'Anggota sembilan', '2028', 'Tempat Lahir 9', '2008-09-09', '123456789', 'Laki-laki', 'Aktif'),
('A010', 'Anggota sepuluh', '2029', 'Tempat Lahir 10', '2009-10-10', '123456789', 'Perempuan', 'Aktif');


CREATE VIEW peminjam_lebih5 AS
SELECT a.id_anggota, a.nama_anggota, COUNT(p.kode_peminjaman) AS jumlah_peminjaman
FROM anggota a
JOIN peminjaman p ON a.id_anggota = p.id_anggota
GROUP BY a.id_anggota
HAVING COUNT(p.kode_peminjaman) > 5;

SELECT * FROM peminjam_lebih5;

CREATE VIEW petugas_transaksi AS
SELECT pt.id_petugas, pt.nama, COUNT(*) AS jumlah_transaksi
FROM (
    SELECT id_petugas AS id_petugas
    FROM peminjaman
    UNION ALL
    SELECT id_petugas AS id_petugas
    FROM pengembalian
) AS transaksi
JOIN petugas pt ON transaksi.id_petugas = pt.id_petugas
GROUP BY pt.id_petugas, pt.nama;

SELECT * FROM petugas_transaksi;

CREATE VIEW petugas_terbanyak AS
SELECT id_petugas, nama, jumlah_transaksi
FROM petugas_transaksi
WHERE jumlah_transaksi = (SELECT MAX(jumlah_transaksi) FROM petugas_transaksi);

SELECT * FROM petugas_terbanyak;

CREATE VIEW pinjam_paling_banyak AS
SELECT b.kode_buku, b.judul_buku, COUNT(p.kode_peminjaman) AS jumlah_peminjaman
FROM buku b
JOIN peminjaman p ON b.kode_buku = p.kode_buku
GROUP BY b.kode_buku, b.judul_buku
ORDER BY COUNT(p.kode_peminjaman) DESC
LIMIT 1;

SELECT * FROM pinjam_paling_banyak;