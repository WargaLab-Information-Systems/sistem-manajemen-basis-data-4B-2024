CREATE TABLE anggota (
  IdAnggota VARCHAR(10) PRIMARY KEY,
  Nama_Anggota VARCHAR(20),
  Angkatan_Anggota VARCHAR(6),
  Tempat_Lahir_Anggota VARCHAR(20),
  Tanggal_Lahir_Anggota DATE,
  No_Telp INT(12),
  Jenis_Kelamin VARCHAR(15),
  Status_Pinjam VARCHAR(15)
);

CREATE TABLE petugas (
  IdPetugas VARCHAR(10) PRIMARY KEY,
  Username VARCHAR(15) ,
  PASSWORD VARCHAR(15) ,
  Nama VARCHAR(25)
);

CREATE TABLE buku (
  kode_buku VARCHAR(10) PRIMARY KEY,
  judul_buku TEXT,
  pengarang_buku VARCHAR(30),
  penerbit_buku VARCHAR(30),
  tahun_buku VARCHAR(10) ,
  jumlah_buku VARCHAR(5) ,
  klasifikasi_buku VARCHAR(20) 
);


CREATE TABLE peminjaman (
  kode_peminjaman VARCHAR(10) PRIMARY KEY,
  IdAnggota VARCHAR(10),
  IdPetugas VARCHAR(10),
  Tanggal_Pinjam DATE,
  Tanggal_Kembali DATE,
  Kode_Buku VARCHAR(10),
  FOREIGN KEY (IdAnggota) REFERENCES anggota(IdAnggota),
  FOREIGN KEY (IdPetugas) REFERENCES petugas(IdPetugas),
  FOREIGN KEY (Kode_Buku) REFERENCES buku(kode_buku)
);

CREATE TABLE pengembalian (
  Kode_Kembali VARCHAR(10) PRIMARY KEY,
  IdAnggota VARCHAR(10),
  Kode_Buku VARCHAR(10),
  idPetugas VARCHAR(10),
  Tgl_Kembali DATE,
  tgl_pinjam DATE,
  Denda VARCHAR(15),
  FOREIGN KEY (Kode_Peminjaman) REFERENCES peminjaman(kode_peminjaman),
  FOREIGN KEY (IdAnggota) REFERENCES anggota(IdAnggota),
  FOREIGN KEY (idPetugas) REFERENCES petugas(IdPetugas)
);


-- Mengisi tabel anggota dengan 10 data
INSERT INTO anggota (IdAnggota, Nama_Anggota, Angkatan_Anggota, Tempat_Lahir_Anggota, Tanggal_Lahir_Anggota, No_Telp, Jenis_Kelamin, Status_Pinjam)
VALUES 
('A001', 'John Doe', '2018', 'Jakarta', '1995-05-15', 1234567, 'Laki-laki', 'Tidak Meminjam'),
('A002', 'Jane Smith', '2019', 'Bandung', '1998-10-20', 098765, 'Perempuan', 'Meminjam'),
('A003', 'Michael Johnson', '2020', 'Surabaya', '1997-08-25', 11223, 'Laki-laki', 'Meminjam'),
('A004', 'Emily White', '2021', 'Yogyakarta', '1999-04-12', 22334, 'Perempuan', 'Tidak Meminjam'),
('A005', 'David Brown', '2019', 'Semarang', '1998-01-30', 334455, 'Laki-laki', 'Tidak Meminjam'),
('A006', 'Sarah Johnson', '2020', 'Malang', '1997-07-08', 445566, 'Perempuan', 'Meminjam'),
('A007', 'Daniel Lee', '2018', 'Surakarta', '1996-03-22', 556677, 'Laki-laki', 'Tidak Meminjam'),
('A008', 'Jessica Wang', '2021', 'Medan', '1999-11-18', 66778, 'Perempuan', 'Meminjam'),
('A009', 'Chris Evans', '2020', 'Denpasar', '1997-09-03', 778899, 'Laki-laki', 'Tidak Meminjam'),
('A010', 'Amanda Johnson', '2018', 'Pontianak', '1995-12-28', 88990, 'Perempuan', 'Meminjam');

-- Mengisi tabel buku dengan 10 data
INSERT INTO buku (kode_buku, judul_buku, pengarang_buku, penerbit_buku, tahun_buku, jumlah_buku, klasifikasi_buku)
VALUES 
('B001', 'Harry Potter and the Philosopher\'s Stone', 'J.K. Rowling', 'Bloomsbury', '1997', '10', 'Fiksi Fantasi'),
('B002', 'To Kill a Mockingbird', 'Harper Lee', 'J. B. Lippincott & Co.', '1960', '5', 'Fiksi Klasik'),
('B003', 'The Great Gatsby', 'F. Scott Fitzgerald', 'Charles Scribner\'s Sons', '1925', '8', 'Fiksi Klasik'),
('B004', '1984', 'George Orwell', 'Secker & Warburg', '1949', '12', 'Fiksi Ilmiah'),
('B005', 'The Catcher in the Rye', 'J.D. Salinger', 'Little, Brown and Company', '1951', '7', 'Fiksi Klasik'),
('B006', 'Pride and Prejudice', 'Jane Austen', 'T. Egerton, Whitehall', '1813', '6', 'Fiksi Klasik'),
('B007', 'The Hobbit', 'J.R.R. Tolkien', 'George Allen & Unwin', '1937', '9', 'Fiksi Fantasi'),
('B008', 'The Lord of the Rings', 'J.R.R. Tolkien', 'Allen & Unwin', '1954', '11', 'Fiksi Fantasi'),
('B009', 'Brave New World', 'Aldous Huxley', 'Chatto & Windus', '1932', '4', 'Fiksi Ilmiah'),
('B010', 'The Da Vinci Code', 'Dan Brown', 'Doubleday', '2003', '15', 'Fiksi Misteri');

-- Mengisi tabel petugas dengan 10 data
INSERT INTO petugas (IdPetugas, Username, PASSWORD, Nama)
VALUES 
('P001', 'admin', 'admin123', 'Admin 1'),
('P002', 'staff', 'staff456', 'Staff 1'),
('P003', 'librarian', 'librarian789', 'Librarian 1');


-- Mengisi tabel peminjaman dengan 10 data
INSERT INTO peminjaman (kode_peminjaman, IdAnggota, IdPetugas, Tanggal_Pinjam, Tanggal_Kembali, Kode_Buku)
VALUES 
('PJM001', 'A001', 'P001', '2024-03-01', '2024-03-08', 'B001'),
('PJM002', 'A002', 'P001', '2024-03-05', '2024-03-12', 'B002'),
('PJM003', 'A003', 'P002', '2024-03-10', '2024-03-17', 'B003'),
('PJM004', 'A004', 'P002', '2024-03-15', '2024-03-22', 'B004'),
('PJM005', 'A005', 'P002', '2024-03-20', '2024-03-27', 'B005'),
('PJM006', 'A006', 'P002', '2024-03-25', '2024-04-01', 'B006'),
('PJM007', 'A007', 'P003', '2024-03-30', '2024-04-06', 'B007'),
('PJM008', 'A008', 'P003', '2024-04-04', '2024-04-11', 'B008'),
('PJM009', 'A009', 'P003', '2024-04-09', '2024-04-16', 'B009'),
('PJM010', 'A010', 'P001', '2024-04-14', '2024-04-21', 'B010');

INSERT INTO peminjaman (kode_peminjaman, IdAnggota, IdPetugas, Tanggal_Pinjam, Tanggal_Kembali, Kode_Buku)
VALUES 
('PJM011', 'A001', 'P001', '2024-03-01', '2024-03-08', 'B001'),
('PJM012', 'A001', 'P001', '2024-03-05', '2024-03-12', 'B005'),
('PJM013', 'A001', 'P002', '2024-03-10', '2024-03-17', 'B005'),
('PJM014', 'A001', 'P002', '2024-03-15', '2024-03-22', 'B005'),
('PJM015', 'A001', 'P002', '2024-03-20', '2024-03-27', 'B005'),
('PJM016', 'A001', 'P002', '2024-03-25', '2024-04-01', 'B005'),
('PJM017', 'A001', 'P003', '2024-03-30', '2024-04-06', 'B001'),
('PJM018', 'A002', 'P003', '2024-04-04', '2024-04-11', 'B001'),
('PJM019', 'A002', 'P003', '2024-04-09', '2024-04-16', 'B002'),
('PJM020', 'A002', 'P001', '2024-04-14', '2024-04-21', 'B002');

-- Mengisi tabel pengembalian dengan 10 data
INSERT INTO pengembalian (Kode_Kembali, IdAnggota, Kode_Buku, idPetugas, Tgl_Kembali, tgl_pinjam, Denda)
VALUES 
('KMB001', 'A001', 'B001', 'P001', '2024-03-08', '2024-03-01', '0'),
('KMB002', 'A002', 'B002', 'P001', '2024-03-12', '2024-03-05', '0'),
('KMB003', 'A003', 'B003', 'P001', '2024-03-17', '2024-03-10', '0'),
('KMB004', 'A004', 'B004', 'P002', '2024-03-22', '2024-03-15', '0'),
('KMB005', 'A005', 'B005', 'P002', '2024-03-27', '2024-03-20', '0'),
('KMB006', 'A006', 'B006', 'P002', '2024-04-01', '2024-03-25', '0'),
('KMB007', 'A007', 'B007', 'P003', '2024-04-06', '2024-03-30', '0'),
('KMB008', 'A008', 'B008', 'P003', '2024-04-11', '2024-04-04', '0'),
('KMB009', 'A009', 'B009', 'P003', '2024-04-16', '2024-04-09', '0'),
('KMB010', 'A010', 'B010', 'P003', '2024-04-21', '2024-04-14', '0');

-- tugas
-- soal nomer 1
DELIMITER //

CREATE PROCEDURE GetAnggotaLebihDari5Buku()
BEGIN
    SELECT a.IdAnggota, a.Nama_Anggota, COUNT(p.kode_peminjaman) AS Jumlah_Peminjaman
    FROM anggota a
    JOIN peminjaman p ON a.IdAnggota = p.IdAnggota
    GROUP BY a.IdAnggota
    HAVING COUNT(p.kode_peminjaman) > 5;
END //

DELIMITER ;

CALL GetAnggotaLebihDari5Buku();

-- soal nomer 2
DELIMITER //

CREATE PROCEDURE GetBukuByJudul(IN judul VARCHAR(25))
BEGIN
    SELECT * FROM buku WHERE judul_buku = judul;
END //

DELIMITER ;

CALL GetBukuByJudul('The Great Gatsby');

-- soal nomer 3
DELIMITER //

CREATE PROCEDURE GetBukuByJudulDanPengarang( IN judul VARCHAR(25), IN pengarang VARCHAR(30))
BEGIN
    SELECT * FROM buku WHERE judul_buku = judul AND pengarang_buku = pengarang;
END //

DELIMITER ;

CALL GetBukuByJudulDanPengarang('1984','George Orwell');

-- soal nomer 4
DELIMITER //

CREATE PROCEDURE GetBukuByJudulPengarangDanPenerbit(IN judul VARCHAR(25),IN pengarang VARCHAR(30),IN penerbit VARCHAR(30))
BEGIN
    SELECT *
    FROM buku
    WHERE judul_buku = judul AND pengarang_buku = pengarang AND penerbit_buku = penerbit;
END //

DELIMITER ;

CALL GetBukuByJudulPengarangDanPenerbit('1984','George Orwell','Secker & Warburg');

-- soal nomer 5
DELIMITER //

CREATE PROCEDURE InsertPetugas( IN id_petugas VARCHAR(10), IN username VARCHAR(15), IN PASSWORD VARCHAR(15), IN nama VARCHAR(25))
BEGIN
    INSERT INTO petugas (IdPetugas, Username, PASSWORD, Nama) VALUES (id_petugas, username, PASSWORD, nama);
END //

DELIMITER ;

CALL InsertPetugas('P004', 'adam', 'adam123', 'Sualaiman Adam');

-- soal nomer 6
DELIMITER //
CREATE PROCEDURE Bukupinjam(
    OUT buku_banyak INT
)
BEGIN
    SELECT COUNT(*) AS total_buku INTO buku_banyak
    FROM buku;
END //
DELIMITER ;

CALL Bukupinjam(@buku_banyak);
SELECT @buku_banyak;

-- nomer 7
DELIMITER //

CREATE PROCEDURE GetPengembalian(
    IN kode_kembali1 VARCHAR(10),
    OUT kode_peminjaman1 VARCHAR(10),
    OUT tgl_kembali1 DATE,
    OUT denda1 VARCHAR(15)
)
BEGIN
    SELECT Kode_kembali, Tgl_Kembali, Denda
    INTO kode_peminjaman1, tgl_kembali1, denda1
    FROM pengembalian
    WHERE Kode_Kembali = kode_kembali1;
END //

DELIMITER ;

CALL GetPengembalian('KMB001', @kode_peminjaman1, @tgl_kembali1, @denda1);
SELECT @kode_peminjaman1, @tgl_kembali1, @denda1;










