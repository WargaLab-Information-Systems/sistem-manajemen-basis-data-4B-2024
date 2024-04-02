CREATE DATABASE tokobuku;

USE tokobuku;

CREATE TABLE petugas (
    id_petugas INT PRIMARY KEY,
    username VARCHAR(50),
    PASSWORD VARCHAR(50),
    nama VARCHAR(100)
);

INSERT INTO petugas (id_petugas, username, PASSWORD, nama)
VALUES
(1, 'sitiramadani', 'password1', 'Siti'),
(2, 'furqonabdillah', 'password2', 'Furqon'),
(3, 'rahmawati', 'password3', 'Rahma'),
(4, 'andiindra', 'password4', 'Andi'),
(5, 'dewirahayu', 'password5', 'Dewi'),
(6, 'ahmadfauzi', 'password6', 'Ahmad'),
(7, 'rinasari', 'password7', 'Rina'),
(8, 'yudirachman', 'password8', 'Yudi'),
(9, 'sarimulyani', 'password9', 'Sari'),
(10, 'budipermana', 'password10', 'Budi');

--delete FROM petugas;
SELECT * FROM petugas;


CREATE TABLE peminjam (
    kode_peminjam INT PRIMARY KEY,
    id_anggota INT,
    id_petugas INT,
    tanggal_pinjam DATE,
    tanggal_kembali DATE,
    kode_buku VARCHAR(10)
);

INSERT INTO peminjam (kode_peminjam, id_anggota, id_petugas, tanggal_pinjam, tanggal_kembali, kode_buku)
VALUES
(1, 3, 1, '2024-03-21', '2024-03-31', 'BK012'),
(2, 3, 2, '2024-03-22', '2024-04-01', 'BK012'),
(3, 3, 3, '2024-03-23', '2024-04-02', 'BK012'),
(4, 3, 4, '2024-03-24', '2024-04-03', 'BK012'),
(5, 3, 5, '2024-03-25', '2024-04-04', 'BK012'),
(6, 4, 1, '2024-03-26', '2024-04-05', 'BK013'),
(7, 4, 2, '2024-03-27', '2024-04-06', 'BK013'),
(8, 4, 3, '2024-03-28', '2024-04-07', 'BK013'),
(9, 4, 4, '2024-03-29', '2024-04-08', 'BK013'),
(10, 4, 5, '2024-03-30', '2024-04-09', 'BK013');


DELETE FROM peminjam;
SELECT id_petugas, COUNT(*) AS jumlah_peminjaman
FROM peminjam
GROUP BY id_petugas
ORDER BY jumlah_peminjaman DESC
LIMIT 1;

CREATE TABLE buku (
    kode_buku VARCHAR(10) PRIMARY KEY,
    judul_buku VARCHAR(255),
    pengarang_buku VARCHAR(100),
    penerbit_buku VARCHAR(100),
    tahun_buku INT,
    jumlah_buku INT,
    status_buku VARCHAR(20),
    klasifikasi_buku VARCHAR(50)
);

INSERT INTO buku (kode_buku, judul_buku, pengarang_buku, penerbit_buku, tahun_buku, jumlah_buku, status_buku, klasifikasi_buku)
VALUES
('BK011', 'Laskar Pelangi', 'Andrea Hirata', 'Bentang Pustaka', 2005, 10, 'Available', 'Fiksi'),
('BK012', 'Ayat-Ayat Cinta', 'Habiburrahman El-Shirazy', 'Republika', 2004, 8, 'Available', 'Fiksi'),
('BK013', 'Negeri 5 Menara', 'Ahmad Fuadi', 'Gramedia Pustaka Utama', 2009, 7, 'Available', 'Fiksi'),
('BK014', 'Sang Pemimpi', 'Andrea Hirata', 'Bentang Pustaka', 2006, 6, 'Available', 'Fiksi'),
('BK015', 'Ronggeng Dukuh Paruk', 'Ahmad Tohari', 'Gramedia Pustaka Utama', 1982, 5, 'Available', 'Fiksi'),
('BK016', 'Bumi Manusia', 'Pramoedya Ananta Toer', 'Hasta Mitra', 1980, 10, 'Available', 'Fiksi'),
('BK017', 'Perahu Kertas', 'Dee Lestari', 'Bentang Pustaka', 2009, 8, 'Available', 'Fiksi'),
('BK018', 'Kambing Jantan: Sebuah Catatan Harian Pelajar Bodoh', 'Raditya Dika', 'Gagas Media', 2005, 7, 'Available', 'Non-Fiksi'),
('BK019', 'Sang Alkemis', 'Paulo Coelho', 'Penerbit Buku Kompas', 1988, 6, 'Available', 'Fiksi'),
('BK020', 'Pulang', 'Tere Liye', 'Gramedia Pustaka Utama', 2015, 5, 'Available', 'Fiksi');

SELECT * FROM buku;

CREATE TABLE pengembalian (
    kode_kembali INT PRIMARY KEY,
    id_anggota INT,
    kode_buku VARCHAR(10),
    id_petugas INT,
    tanggal_pinjam DATE,
    tanggal_kembali DATE,
    denda DECIMAL(10, 2) 
);

INSERT INTO pengembalian (kode_kembali, id_anggota, kode_buku, id_petugas, tanggal_pinjam, tanggal_kembali, denda)
VALUES
(1, 1, 'BK021', 1, '2024-03-01', '2024-03-10', 0.00),
(2, 2, 'BK022', 2, '2024-03-02', '2024-03-12', 0.00),
(3, 4, 'BK023', 1, '2024-03-03', '2024-03-13', 0.00),
(4, 4, 'BK024', 1, '2024-03-04', '2024-03-14', 0.00),
(5, 5, 'BK025', 5, '2024-03-05', '2024-03-15', 0.00),
(6, 6, 'BK026', 6, '2024-03-06', '2024-03-16', 0.00),
(7, 6, 'BK027', 3, '2024-03-07', '2024-03-21', 10000.00), 
(8, 6, 'BK028', 9, '2024-03-08', '2024-03-18', 0.00),
(9, 9, 'BK029', 9, '2024-03-09', '2024-03-19', 0.00),
(0, 10, 'BK030', 10, '2024-03-10', '2024-03-20', 0.00);

SELECT * FROM pengembalian;
DELETE FROM pengembalian;

CREATE TABLE anggota (
    id_anggota INT PRIMARY KEY,
    nama_anggota VARCHAR(100),
    angkatan_anggota INT,
    tanggal_lahir_anggota DATE,
    tempat_lahir_anggota VARCHAR(100),
    no_telp VARCHAR(20),
    jenis_kelamin VARCHAR(10),
    status_pinjam VARCHAR(20)
);

INSERT INTO anggota (id_anggota, nama_anggota, angkatan_anggota, tanggal_lahir_anggota, tempat_lahir_anggota, no_telp, jenis_kelamin, status_pinjam)
VALUES
(1, 'Ani', 2023, '2005-05-15', 'Jakarta', '08123456789', 'Perempuan', 'Aktif'),
(2, 'Budi', 2022, '2004-08-20', 'Bandung', '087654321', 'Laki-laki', 'Aktif'),
(3, 'Citra', 2023, '2005-01-10', 'Surabaya', '0811112222', 'Perempuan', 'Aktif'),
(4, 'Dedi', 2022, '2004-10-30', 'Yogyakarta', '0812345678', 'Laki-laki', 'Aktif'),
(5, 'Eka', 2023, '2005-03-25', 'Malang', '08567890123', 'Perempuan', 'Aktif'),
(6, 'Fandi', 2022, '2004-12-12', 'Semarang', '081234567', 'Laki-laki', 'Aktif'),
(7, 'Gita', 2023, '2005-07-18', 'Medan', '081234567', 'Perempuan', 'Aktif'),
(8, 'Hadi', 2022, '2004-11-05', 'Makassar', '081234567', 'Laki-laki', 'Aktif'),
(9, 'Ina', 2023, '2005-09-08', 'Palembang', '081234567', 'Perempuan', 'Aktif'),
(10, 'Joko', 2022, '2004-06-03', 'Padang', '081234567', 'Laki-laki', 'Aktif');

SELECT * FROM anggota;

-- SOAL PRAKTIKUM
-- nomor 1
CREATE VIEW Anggota_Lebih_Lima_Buku AS
SELECT id_anggota, COUNT(*) AS jumlah_peminjaman
FROM peminjam
GROUP BY id_anggota
HAVING COUNT(*) > 5;
SELECT * FROM Anggota_Lebih_Lima_Buku;

-- soal nomor 2
CREATE VIEW petugas_peminjam_pengembalian AS
SELECT pt.id_petugas, pt.nama, 
       COUNT(DISTINCT p.kode_peminjam) AS Jumlah_Peminjaman, 
       COUNT(DISTINCT pk.kode_kembali) AS Jumlah_Pengembalian, 
       SUM(CASE WHEN p.kode_peminjam IS NOT NULL THEN 1 ELSE 0 END) AS Jumlah_Buku_Dipinjam
FROM petugas pt
LEFT JOIN peminjam p ON pt.id_petugas = p.id_petugas
LEFT JOIN pengembalian pk ON pt.id_petugas = pk.id_petugas
GROUP BY pt.id_petugas, pt.nama;
SELECT * FROM petugas_peminjam_pengembalian;

-- soal nomor 3
CREATE VIEW Petugas_Transaksi_Terbanyak AS
SELECT pt.id_petugas, pt.nama, 
       COUNT(DISTINCT p.kode_peminjam) AS Jumlah_Peminjaman, 
       COUNT(DISTINCT pk.kode_kembali) AS Jumlah_Pengembalian, 
       SUM(CASE WHEN p.kode_peminjam IS NOT NULL THEN 1 ELSE 0 END) AS Jumlah_Buku_Dipinjam
FROM petugas pt
LEFT JOIN peminjam p ON pt.id_petugas = p.id_petugas
LEFT JOIN pengembalian pk ON pt.id_petugas = pk.id_petugas
GROUP BY pt.id_petugas, pt.nama
ORDER BY Jumlah_Peminjaman DESC
SELECT * FROM Petugas_Transaksi_Terbanyak;

-- soal nomor 4
CREATE VIEW Buku_Terpinjam_Paling_Banyak AS
SELECT b.kode_buku, b.judul_buku, 
       COUNT(p.kode_peminjam) AS Jumlah_Peminjaman
FROM buku b
JOIN peminjam p ON b.kode_buku = p.kode_buku
GROUP BY b.kode_buku, b.judul_buku
ORDER BY Jumlah_Peminjaman DESC
LIMIT 1;
SELECT * FROM Buku_Terpinjam_Paling_Banyak;
