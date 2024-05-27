CREATE DATABASE perpustakaan;

USE perpus;
CREATE TABLE Petugas ( 
IdPetugas INT PRIMARY KEY, 
Username VARCHAR(50), 
PASSWORD VARCHAR(50), 
Nama VARCHAR(50)
);

CREATE TABLE Buku (
Kode_buku INT PRIMARY KEY, 
Judul_Buku VARCHAR(100), 
Pengarang_Buku VARCHAR(50),
Penerbit_buku VARCHAR(50), 
Tahun_buku INT,
Jumlah_Buku INT, 
Status_Buku VARCHAR(20),
Klasifikasi_Buku VARCHAR(50)
);


CREATE TABLE Anggota ( 
IdAnggota INT PRIMARY KEY,
Nama_Anggota VARCHAR(50), 
Angkatan_Anggota VARCHAR(10),
Tempat_Lahir_Anggota VARCHAR(50),
Tanggal_lahir_Anggota DATE,
No_Telp VARCHAR(15),
Jenis_Kelamin VARCHAR(10), 
Status_Pinjam VARCHAR(20)
);

CREATE TABLE Peminjaman (
Kode_peminjaman INT PRIMARY KEY,
Tgl_Pinjam DATE,
Tgl_Kembali DATE, 
IdAnggota INT,
Kode_buku INT, 
IdPetugas INT,
FOREIGN KEY (IdAnggota) REFERENCES Anggota(IdAnggota),
FOREIGN KEY (Kode_buku) REFERENCES Buku(Kode_buku), 
FOREIGN KEY (IdPetugas) REFERENCES Petugas(IdPetugas)
);

CREATE TABLE Pengembalian (
Kode_Kembali INT PRIMARY KEY,
Tgl_Pinjam DATE,
Tgl_Kembali DATE,
Denda INT, 
IdAnggota INT, 
Kode_buku INT, 
IdPetugas INT,
FOREIGN KEY (IdAnggota) REFERENCES Anggota(IdAnggota), 
FOREIGN KEY (Kode_buku) REFERENCES Buku(Kode_buku), 
FOREIGN KEY (IdPetugas) REFERENCES Petugas(IdPetugas)
);

-- Tabel Petugas

INSERT INTO Petugas (IdPetugas, Username, PASSWORD, Nama) VALUES
(1, 'admin', 'admin123', 'Admin Satu'),
(2, 'petugas', 'petugas123', 'Petugas Satu'), 
(3, 'user', 'user123', 'User Satu'),
(4, 'staff', 'staff123', 'Staff Satu'),
(5, 'pegawai', 'pegawai123', 'Pegawai Satu'),
(6, 'supervisor', 'supervisor123', 'Supervisor Satu'), (7, 'manager', 'manager123', 'Manager Satu'),
(8, 'administrator', 'administrator123', 'Administrator Satu'), 
(9, 'operator', 'operator123', 'Operator Satu'),
(10, 'helper', 'helper123', 'Helper Satu')

-- Tabel Buku

INSERT INTO Buku (Kode_buku, Judul_Buku, Pengarang_Buku, Penerbit_buku, Tahun_buku, Jumlah_Buku, Status_Buku, Klasifikasi_Buku) VALUES
(1, 'Harry Potter and the Philosopher''s Stone', 'J.K. Rowling', 'Bloomsbury', 1997, 10, 'Tersedia', 'Fiksi'),
(2, 'The Hobbit', 'J.R.R. Tolkien', 'George Allen & Unwin', 1937, 5, 'Tersedia', 'Fiksi'),
(3, 'To Kill a Mockingbird', 'Harper Lee', 'J. B. Lippincott & Co.', 1960, 7, 'Dipinjam', 'Fiksi'),
(4, 'The Catcher in the Rye', 'J.D. Salinger', 'Little, Brown and Company', 1951, 3, 'Tersedia', 'Fiksi'),
(5, 'Pride and Prejudice', 'Jane Austen', 'T. Egerton, Whitehall', 1813, 8, 'Tersedia', 'Fiksi'),
(6, '1984', 'George Orwell', 'Secker and Warburg', 1949, 2, 'Dipinjam', 'Fiksi'), (7, 'Animal Farm', 'George Orwell', 'Secker and Warburg', 1945, 1, 'Tersedia', 'Fiksi'),
(8, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Charles Scribner''s Sons', 1925, 6, 'Tersedia', 'Fiksi'),
(9, 'One Hundred Years of Solitude', 'Gabriel Garcia Marquez', 'Editorial Sudamericana', 1967, 4, 'Dipinjam', 'Fiksi'),
(10, 'The Lord of the Rings', 'J.R.R. Tolkien', 'Allen & Unwin', 1954, 9, 'Tersedia', 'Fiksi');

INSERT INTO Peminjaman (Kode_Peminjaman, Tgl_Pinjam, Tgl_Kembali, Kode_buku, IdAnggota, IdPetugas)
VALUES
(19,'2023-03-28', '2023-04-07', 10, 110, 10)
(18,'2023-03-28', '2023-04-07', 10, 110, 10)
(16,'2023-03-28', '2023-04-07', 10, 110, 10)
(15,'2023-03-28', '2023-04-07', 10, 110, 10)
(14,'2023-03-28', '2023-04-07', 10, 110, 10)
(13,'2023-03-28', '2023-04-07', 10, 110, 10)
(12,'2023-03-28', '2023-04-07', 10, 110, 10)



(1, '2023-03-15', '2023-03-25', 1, 101, 1)
(2, '2023-03-17', '2023-03-27', 2, 102, 2)
(3, '2023-03-19', '2023-03-29', 3, 103, 3)
(4, '2023-03-21', '2023-03-31', 4, 104, 4)
(5, '2023-03-23', '2023-04-02', 5, 105, 5)
(6, '2023-03-24', '2023-04-03', 6, 106, 6)
(7, '2023-03-25', '2023-04-04', 7, 107, 7)
(8, '2023-03-26', '2023-04-05', 8, 108, 8)
(9, '2023-03-27', '2023-04-06', 9, 109, 9)
(10,'2023-03-28', '2023-04-07', 10, 110,10)





INSERT INTO Pengembalian (Kode_Kembali, Tgl_Pinjam, Tgl_Kembali, Denda, IdAnggota, Kode_buku, IdPetugas)
VALUES

(1, '2023-03-15', '2023-03-25', 0, 102, 1, 1)
(2, '2023-03-17', '2023-03-27', 0, 102, 2, 2)
(3, '2023-03-19', '2023-03-29', 0, 103, 3, 3)
(4, '2023-03-21', '2023-03-31', 0, 104, 4, 4)
(5, '2023-03-23', '2023-04-02', 0, 105, 5, 5)
(6, '2023-03-24', '2023-04-03', 0, 106, 6, 6)
(7, '2023-03-25', '2023-04-04', 0, 107, 7, 7)
(8, '2023-03-26', '2023-04-05', 0, 108, 8, 8)
(9, '2023-03-27', '2023-04-06', 0, 109, 9, 9)
(10, '2023-03-28', '2023-04-17', 0, 110, 10,10);


INSERT INTO Anggota (IdAnggota, Nama_Anggota, Angkatan_Anggota, Tempat_Lahir_Anggota, Tanggal_lahir_Anggota, No_Telp, Jenis_Kelamin, Status_Pinjam)
VALUES

(101, 'Ahmad', '2020', 'Jakarta', '1998-01-01', '08123456789', 'Laki-Laki', '
Meminjam'),
(102, 'Budi', '2021', 'Bandung', '1999-02-02', '08234567890', 'Laki-Laki',
'Meminjam'),
(103, 'Citra', '2022', 'Surabaya', '2000-03-03', '08345678901', 'Perempuan',
'Meminjam'),
(104, 'Dewi', '2020', 'Medan', '1998-04-04', '08456789012', 'Perempuan',
'Meminjam'),
(105, 'Eka', '2021', 'Makassar', '1999-05-05', '08567890123', 'Perempuan',
'Meminjam'),
(106, 'Fahmi', '2022', 'Yogyakarta', '2000-06-06', '08678901234', 'Laki-Laki','Meminjam'),
(107,'Dirja','2023','surabaya','1999-07-05','081775028803','Laki-Laki','Meminjam'),
(108, 'Ilham','2020','sumenep','2001-14-05','085330288419','Laki-Laki','Meminjam'),
(109,'Tyas','2021','mojokerto','2005-03-02','085900348847','Laki-Laki','Meminjam'),
(110,'Wilda','2021','sumenep','2002-23-10','085987234510','Pereempuan','Meminjam')

SELECT * FROM Anggota



SELECT * FROM perpustakaan.anggota;

SELECT * FROM perpustakaan.buku;

SELECT * FROM perpustakaan.peminjaman;

SELECT * FROM perpustakaan.pengembalian;

SELECT * FROM perpustakaan.petugas;

DROP VIEW pinjaman_terbanyak;
CREATE VIEW pinjaman_terbanyak AS SELECT
peminjaman.IdAnggota,
anggota.nama_anggota,
anggota.angkatan_anggota,
anggota.jenis_kelamin,
COUNT(peminjaman.IdAnggota) AS banyak_pinjaman
FROM anggota INNER JOIN peminjaman ON peminjaman.IdAnggota = anggota.IdAnggota GROUP BY Idanggota HAVING
    COUNT(*) > 5;

SELECT*FROM pinjaman_terbanyak;


DROP VIEW transaksi_petugas;
CREATE VIEW transaksi_petugas AS SELECT
peminjaman.Idpetugas,
petugas.Username,
petugas.Password,
petugas.Nama,
COUNT(peminjaman.Idpetugas) AS jumlah_transaksi_pinjam
FROM petugas INNER JOIN peminjaman ON petugas.IdPetugas = peminjaman.Idpetugas
GROUP BY Idpetugas;

SELECT * FROM transaksi_petugas;


CREATE VIEW transaksi_petugas_terbanyak AS 
SELECT
    peminjaman.Idpetugas,
    petugas.Username,
    petugas.Password,
    petugas.Nama,
    COUNT(peminjaman.Idpetugas) AS jumlah_transaksi_pinjam
FROM
    petugas
INNER JOIN
    peminjaman ON petugas.IdPetugas = peminjaman.Idpetugas
GROUP BY
    Idpetugas
ORDER BY
    jumlah_transaksi_pinjam DESC
LIMIT 1;

SELECT * FROM transaksi_petugas_terbanyak;


INSERT INTO Peminjaman (Kode_Peminjaman, Tgl_Pinjam, Tgl_Kembali, Kode_buku, IdAnggota, IdPetugas)
VALUES (11, '2023-03-18', '2023-03-25', 1, 110, 1);

DROP VIEW buku_terbanyak;
CREATE VIEW buku_terbanyak AS 
SELECT
    peminjaman.Kode_buku,
    buku.Judul_Buku,
    COUNT(peminjaman.Kode_buku) AS jumlah_buku_terbanyak
FROM
    buku
INNER JOIN
    peminjaman ON buku.Kode_buku = peminjaman.Kode_buku
GROUP BY
    Kode_buku
ORDER BY
    jumlah_buku_terbanyak DESC
LIMIT 1;

SELECT * FROM buku_terbanyak;


