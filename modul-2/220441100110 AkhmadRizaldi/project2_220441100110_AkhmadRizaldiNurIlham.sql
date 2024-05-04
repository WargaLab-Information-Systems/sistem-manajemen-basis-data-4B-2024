CREATE DATABASE Praktikum_smbd2;
USE Praktikum_smbd2;

CREATE TABLE buku (
Kode_Buku CHAR (10) PRIMARY KEY ,
Judul_Buku CHAR (10) NOT NULL ,
Pengarang_Buku CHAR (30) NOT NULL ,
Penerbit_Buku CHAR (30) NOT NULL ,
Tahun_Buku CHAR (10) NOT NULL ,
Jumlah_Buku CHAR (5) NOT NULL ,
Status_Buku CHAR (10) NOT NULL ,
Klasifikasi_Buku CHAR (20) NOT NULL
);
INSERT INTO buku (Kode_Buku, Judul_Buku, Pengarang_Buku, Penerbit_Buku, Tahun_Buku, Jumlah_Buku, Status_Buku, Klasifikasi_Buku) 
VALUES 
('B001', 'Harry Potter', 'J.K. Rowling', 'Bloomsbury', '1997', '100', 'Available', 'Fantasy'),
('B002', 'To Kill a Mockingbird', 'Harper Lee', 'J.B. Lippincott & Co.', '1960', '75', 'Available', 'Fiction'),
('B003', 'The Great Gatsby', 'F. Scott Fitzgerald', 'Charles Scribner''s Sons', '1925', '50', 'Available', 'Classic'),
('B004', '1984', 'George Orwell', 'Secker & Warburg', '1949', '80', 'Available', 'Dystopian'),
('B005', 'Pride and Prejudice', 'Jane Austen', 'T. Egerton, Whitehall', '1813', '60', 'Available', 'Romance'),
('B006', 'The Catcher in the Rye', 'J.D. Salinger', 'Little, Brown and Company', '1951', '70', 'Available', 'Fiction'),
('B007', 'The Lord of the Rings', 'J.R.R. Tolkien', 'George Allen & Unwin', '1954', '90', 'Available', 'Fantasy'),
('B008', 'The Hobbit', 'J.R.R. Tolkien', 'George Allen & Unwin', '1937', '65', 'Available', 'Fantasy'),
('B009', 'Moby-Dick', 'Herman Melville', 'Richard Bentley', '1851', '55', 'Available', 'Classic'),
('B010', 'The Hunger Games', 'Suzanne Collins', 'Scholastic Corporation', '2008', '85', 'Available', 'Dystopian');
SELECT*FROM buku ;

CREATE TABLE Petugas (
Id_Petugas CHAR (10) PRIMARY KEY ,
username CHAR (15) NOT NULL ,
Pasword CHAR (15) NOT NULL ,
Nama CHAR (10) NOT NULL
);
INSERT INTO Petugas (Id_Petugas, username, Pasword, Nama) VALUES
('P001', 'paijo', 'password123', 'John Doe'),
('P002', 'paimin', 'abc123', 'Jane Smith'),
('P003', 'paina', 'pass456', 'Mike Jones'),
('P004', 'paidi', 'emily_pass', 'Emily Brown'),
('P005', 'nitro', 'captain', 'Chris Evans'),
('P006', 'nimbar', 'sara123', 'Sara Parker'),
('P007', 'nipa', 'davidpass', 'David Wilson'),
('P008', 'buamar', 'lisa321', 'Lisa Jackson'),
('P009', 'buasim', 'kevinpass', 'Kevin Lee'),
('P010', 'buatik', 'amanda_pass', 'Amanda Taylor');
SELECT*FROM Petugas;

CREATE TABLE peminjaman (
Kode_Peminjaman CHAR (10) PRIMARY KEY,
Id_Anggota CHAR (10) NOT NULL ,
Id_Petugas CHAR (10) NOT NULL ,
Tanggal_Pinjam DATE NOT NULL ,
Tanggal_Kembali DATE NOT NULL ,
Kode_Buku CHAR (10) NOT NULL
);
INSERT INTO peminjaman (Kode_Peminjaman, Id_Anggota, Id_Petugas, Tanggal_Pinjam, Tanggal_Kembali, Kode_Buku) VALUES
('P001', 'A001', 'P001', '2024-03-01', '2024-03-15', 'B001'),
('P0021', 'A002', 'P002', '2024-03-02', '2024-03-16', 'B002'),
('P003', 'A003', 'P003', '2024-03-03', '2024-03-17', 'B003'),
('P004', 'A004', 'P004', '2024-03-04', '2024-03-18', 'B004'),
('P005', 'A005', 'P005', '2024-03-05', '2024-03-19', 'B005'),
('P006', 'A006', 'P006', '2024-03-06', '2024-03-20', 'B006'),
('P007', 'A007', 'P007', '2024-03-07', '2024-03-21', 'B007'),
('P008', 'A008', 'P008', '2024-03-08', '2024-03-22', 'B008'),
('P009', 'A009', 'P009', '2024-03-09', '2024-03-23', 'B009'),
('P010', 'A010', 'P010', '2024-03-10', '2024-03-24', 'B010');
INSERT INTO peminjaman (Kode_Peminjaman, Id_Anggota, Id_Petugas, Tanggal_Pinjam, Tanggal_Kembali, Kode_Buku) VALUES
('P0021', 'A002', 'P002', '2024-03-02', '2024-03-16', 'B002');
SELECT *FROM peminjaman ;


CREATE TABLE Pengembalian (
Kode_Kembali CHAR (10) PRIMARY KEY ,
Id_anggota CHAR (10) NOT NULL ,
Kode_Buku CHAR (10) NOT NULL ,
Id_Petugas CHAR (10) NOT NULL ,
Tanggal_Pinjam DATE NOT NULL ,
Tanggal_Kembali DATE NOT NULL ,
Denda CHAR (15) NOT NULL
);
INSERT INTO Pengembalian (Kode_Kembali, Id_anggota, Kode_Buku, Id_Petugas, Tanggal_Pinjam, Tanggal_Kembali, Denda) VALUES
('K001', 'A001', 'B001', 'P001', '2024-03-01', '2024-03-08', '0'),
('K002', 'A002', 'B002', 'P002', '2024-03-02', '2024-03-09', '0'),
('K003', 'A003', 'B003', 'P003', '2024-03-03', '2024-03-10', '0'),
('K004', 'A004', 'B004', 'P004', '2024-03-04', '2024-03-11', '0'),
('K005', 'A005', 'B005', 'P005', '2024-03-05', '2024-03-12', '0'),
('K006', 'A006', 'B006', 'P006', '2024-03-06', '2024-03-13', '0'),
('K007', 'A007', 'B007', 'P007', '2024-03-07', '2024-03-14', '0'),
('K008', 'A008', 'B008', 'P008', '2024-03-08', '2024-03-15', '0'),
('K009', 'A009', 'B009', 'P009', '2024-03-09', '2024-03-16', '0'),
('K010', 'A010', 'B010', 'P010', '2024-03-10', '2024-03-17', '0');
SELECT*FROM Pengembalian ;

CREATE TABLE Anggota (
Id_Anggota CHAR (10) PRIMARY KEY ,
Nama_Anggota CHAR (20) NOT NULL ,
Angkatan_Anggota CHAR (6) NOT NULL ,
Tempat_Tanggal_Lahir CHAR (20) NOT NULL ,
Tanggal_Lahir_Anggta DATE NOT NULL ,
No_Tlp INT (12) NOT NULL ,
Jenis_Kelamin CHAR (15) NOT NULL ,
Status_Pinjam CHAR (15) NOT NULL
);
INSERT INTO Anggota (Id_Anggota, Nama_Anggota, Angkatan_Anggota, Tempat_Tanggal_Lahir, Tanggal_Lahir_Anggta, No_Tlp, Jenis_Kelamin, Status_Pinjam) 
VALUES 
('A001', 'John Doe', '2020', 'Jakarta, 1995-05-15', '1995-05-15', 123456789012, 'Laki-laki', 'Tidak Meminjam'),
('A002', 'Jane Smith', '2019', 'Surabaya, 1998-10-20', '1998-10-20', 234567890123, 'Perempuan', 'Meminjam'),
('A003', 'David Johnson', '2021', 'Bandung, 1997-02-28', '1997-02-28', 345678901234, 'Laki-laki', 'Meminjam'),
('A004', 'Emily Brown', '2018', 'Medan, 1996-09-10', '1996-09-10', 456789012345, 'Perempuan', 'Tidak Meminjam'),
('A005', 'Michael Wilson', '2020', 'Yogyakarta, 1999-12-25', '1999-12-25', 567890123456, 'Laki-laki', 'Meminjam'),
('A006', 'Amanda Lee', '2019', 'Semarang, 1994-03-08', '1994-03-08', 678901234567, 'Perempuan', 'Tidak Meminjam'),
('A007', 'Christopher Garcia', '2021', 'Palembang, 1993-07-30', '1993-07-30', 789012345678, 'Laki-laki', 'Meminjam'),
('A008', 'Jessica Martinez', '2018', 'Makassar, 1995-11-12', '1995-11-12', 890123456789, 'Perempuan', 'Tidak Meminjam'),
('A009', 'Daniel Rodriguez', '2022', 'Denpasar, 1998-04-05', '1998-04-05', 901234567890, 'Laki-laki', 'Meminjam'),
('A010', 'Sarah Kim', '2017', 'Bandar Lampung, 1997-08-18', '1997-08-18', 123456789012, 'Perempuan', 'Tidak Meminjam');
SELECT * FROM Anggota ;

--SOAL 1 --
--Definisikan vieww untuk mendapatkan dataa anggota yang hanya meminjam buku 
lebih dari 5 buku!--
CREATE VIEW Anggota_Lebih_5_Buku AS
SELECT p.Id_Anggota, a.Nama_Anggota, COUNT(*) AS Jumlah_Peminjaman
FROM peminjaman p
JOIN Anggota a ON p.Id_Anggota = a.Id_Anggota
GROUP BY p.Id_Anggota, a.Nama_Anggota
HAVING COUNT(*) >5;

SELECT * FROM Anggota_Lebih_5_Buku;

--SOAL 2 --
--Definisikan vieww petugas yang melakukan transaksi (peminjaman/pengembalian) 
beserta jumlah buku yang terpinjam ketika petugas tersebut bertugas!  --
CREATE VIEW Transaksi_Petugas AS
SELECT 
    p.Id_Petugas,
    pt.Nama AS Nama_Petugas,
    COUNT(DISTINCT p.Kode_Buku) AS Jumlah_Buku_Terpinjam
FROM 
    (SELECT Id_Petugas, Kode_Buku FROM peminjaman
     UNION ALL
     SELECT Id_Petugas, Kode_Buku FROM Pengembalian) AS p
JOIN Petugas pt ON p.Id_Petugas = pt.Id_Petugas
GROUP BY p.Id_Petugas, pt.Nama;

SELECT * FROM Transaksi_Petugas;

--SOAL 3--
--Definisikan viewW dari tugas praktikum nomor 2 hanya petugas yang melayani 
transaksi terbanyak!--
CREATE VIEW Petugas_Teratas AS
SELECT 
    p.Id_Petugas,
    pt.Nama AS Nama_Petugas,
    COUNT(*) AS Jumlah_Transaksi
FROM 
    (SELECT Id_Petugas FROM peminjaman
     UNION ALL
     SELECT Id_Petugas FROM Pengembalian) AS p
JOIN Petugas pt ON p.Id_Petugas = pt.Id_Petugas
GROUP BY p.Id_Petugas, pt.Nama
ORDER BY Jumlah_Transaksi DESC
LIMIT 1;

SELECT * FROM Petugas_Teratas;

--Soal 4--
--Definisikasn vieww buku yang terpinjam paling banyak! --
CREATE VIEW Buku_Terpinjam AS
SELECT 
    p.Kode_Buku,
    b.Judul_Buku,
    b.Pengarang_Buku,
    b.Penerbit_Buku,
    b.Tahun_Buku,
    b.Jumlah_Buku,
    b.Status_Buku,
    b.Klasifikasi_Buku,
    COUNT(*) AS Jumlah_Peminjaman
FROM 
    peminjaman p
JOIN buku b ON p.Kode_Buku = b.Kode_Buku
GROUP BY p.Kode_Buku, b.Judul_Buku, b.Pengarang_Buku, b.Penerbit_Buku, b.Tahun_Buku, b.Jumlah_Buku, b.Status_Buku, b.Klasifikasi_Buku
ORDER BY Jumlah_Peminjaman DESC
LIMIT 1;
SELECT*FROM Buku_Terpinjam;
SELECT*FROM peminjaman;
	




