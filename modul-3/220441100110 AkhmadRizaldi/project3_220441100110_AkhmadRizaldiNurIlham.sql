CREATE DATABASE praktikum_smbd3 ;
USE praktikum_smbd3 ;

SELECT buku._Kode_Buku, 
Petugas.Id_Petugas FROM buku INNER JOIN Petugas ON buku.Kode_Buku = Id_Petugas.Kode_buku

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
('P002', 'A002', 'P002', '2024-03-02', '2024-03-16', 'B002'),
('P003', 'A003', 'P003', '2024-03-03', '2024-03-17', 'B003'),
('P004', 'A004', 'P004', '2024-03-04', '2024-03-18', 'B004'),
('P005', 'A005', 'P005', '2024-03-05', '2024-03-19', 'B005'),
('P006', 'A006', 'P006', '2024-03-06', '2024-03-20', 'B006'),
('P007', 'A007', 'P007', '2024-03-07', '2024-03-21', 'B007'),
('P008', 'A008', 'P008', '2024-03-08', '2024-03-22', 'B008'),
('P009', 'A009', 'P009', '2024-03-09', '2024-03-23', 'B009'),
('P010', 'A010', 'P010', '2024-03-10', '2024-03-24', 'B010');
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
--Buatlah sebuah prosedur dengan menggunakan parameter IN default--
`praktikum_smbd2``praktikum_smbd3`
DELIMITER//
CREATE PROCEDURE perpus(IN username VARCHAR (15))
BEGIN
	SELECT * FROM petugas
	WHERE Nama = username;
END//
DELIMITER;

CALL perpus('paijo');

delimiter//
create procedure perpusss (in pw char (15))
begin
	select *from petugas
	where  Pasword = pw;
end//
delimiter;

call perpusss ('abc123');




--SOAL 2--
--Definisikan stored procedure untuk mengetahui data pada salah satu table dengan
berdasarkan pada salah satu atribut/field--

DELIMITER //
CREATE PROCEDURE ShowBooksByTitle(IN bookTitle VARCHAR(255))
BEGIN
    SELECT * FROM buku WHERE Judul_Buku = bookTitle;
END//

DELIMITER ;
CALL ShowBooksByTitle('Harry Pott');

DELIMITER //
CREATE PROCEDURE ShowBooksByTitle1(IN bookTitle CHAR(10))
BEGIN
    SELECT * FROM buku WHERE Judul_Buku = bookTitle;
END//

select * from buku 
DELIMITER ;
CALL ShowBooksByTitle('Harry Potter');

--SOAL 3--
--Definisikan stored procedure untuk mengetahui data pada salah satu table dengan
berdasarkan pada dua atribut/field.--

DELIMITER //

CREATE PROCEDURE ShowBooksByAuthorAndYear(IN authorName VARCHAR(30), IN publicationYear CHAR(10))
BEGIN
    SELECT * FROM buku WHERE Pengarang_Buku = authorName AND Tahun_Buku = publicationYear;
END//

DELIMITER ;
CALL ShowBooksByAuthorAndYear('J.R.R. Tolkien', '1937');

--SOAL 4--
--Definisikan stored procedure untuk mengetahui data pada salah satu table dengan
berdasarkan pada tiga atribut/field--

DELIMITER //
CREATE PROCEDURE ShowBooksByAuthorPublisherAndYear(IN authorName VARCHAR(30), IN publisherName VARCHAR(30), IN publicationYear CHAR(10))
BEGIN
    SELECT * FROM buku WHERE Pengarang_Buku = authorName AND Penerbit_Buku = publisherName AND Tahun_Buku = publicationYear;
END//

DELIMITER ;
CALL ShowBooksByAuthorPublisherAndYear('J.K. Rowling', 'Bloomsbury', '1997');

--SOAL 5--
--Definisikan stored procedure untuk memasukkan data pada salah satu table--

DELIMITER //

CREATE PROCEDURE InsertBook(
    IN kodeBuku CHAR(10),
    IN judulBuku CHAR(10),
    IN pengarangBuku CHAR(30),
    IN penerbitBuku CHAR(30),
    IN tahunBuku CHAR(10),
    IN jumlahBuku CHAR(5),
    IN statusBuku CHAR(10),
    IN klasifikasiBuku CHAR(20)
)
BEGIN
    INSERT INTO buku (Kode_Buku, Judul_Buku, Pengarang_Buku, Penerbit_Buku, Tahun_Buku, Jumlah_Buku, Status_Buku, Klasifikasi_Buku) 
    VALUES (kodeBuku, judulBuku, pengarangBuku, penerbitBuku, tahunBuku, jumlahBuku, statusBuku, klasifikasiBuku);
END//

DELIMITER ;
CALL InsertBook('B010', 'The Hunger Games', 'Suzanne Collins', 'Scholastic Corporation', '2008', '85', 'Available', 'Dystopian');


DELIMITER//
CREATE PROCEDURE tambah_data_petugas(
IN Id_Petugas VARCHAR (10),
IN username VARCHAR (15),
IN Pasword VARCHAR (15),
IN Nama VARCHAR (10))
BEGIN 
	INSERT INTO petugas
	VALUES (Id_Petugas,username,Pasword,Nama);
END//
DELIMITER

CALL tambah_data_petugas('111','ai','5555','aina saraswati');
SELECT * FROM petugas;

--SOAL 6--
--Definisikan stored procedure untuk mengetahui data pada salah satu table
menggunakan parameter OUT--

DELIMITER //

CREATE PROCEDURE GetBookInfo(
    IN kodeBuku CHAR(10),
    OUT judulBuku CHAR(10),
    OUT pengarangBuku CHAR(30),
    OUT penerbitBuku CHAR(30),
    OUT tahunBuku CHAR(10),
    OUT jumlahBuku CHAR(5),
    OUT statusBuku CHAR(10),
    OUT klasifikasiBuku CHAR(20)
)
BEGIN
    SELECT 
        Judul_Buku,
        Pengarang_Buku,
        Penerbit_Buku,
        Tahun_Buku,
        Jumlah_Buku,
        Status_Buku,
        Klasifikasi_Buku
    INTO
        judulBuku,
        pengarangBuku,
        penerbitBuku,
        tahunBuku,
        jumlahBuku,
        statusBuku,
        klasifikasiBuku
    FROM buku
    WHERE Kode_Buku = kodeBuku;
END//

DELIMITER ;
CALL GetBookInfo('B001', @judul, @pengarang, @penerbit, @tahun, @jumlah, @status, @klasifikasi);
SELECT @judul, @pengarang, @penerbit, @tahun, @jumlah, @status, @klasifikasi;




--SOAL 7--
--Definisikan stored procedure untuk mengetahui data pada salah satu table
menggunakan parameter INOUT--

DELIMITER //

CREATE PROCEDURE GetBookInfo(
    INOUT kodeBuku CHAR(10),
    OUT judulBuku CHAR(10),
    OUT pengarangBuku CHAR(30),
    OUT penerbitBuku CHAR(30),
    OUT tahunBuku CHAR(10),
    OUT jumlahBuku CHAR(5),
    OUT statusBuku CHAR(10),
    OUT klasifikasiBuku CHAR(20)
)
BEGIN
    SELECT 
        Judul_Buku,
        Pengarang_Buku,
        Penerbit_Buku,
        Tahun_Buku,
        Jumlah_Buku,
        Status_Buku,
        Klasifikasi_Buku
    INTO
        judulBuku,
        pengarangBuku,
        penerbitBuku,
        tahunBuku,
        jumlahBuku,
        statusBuku,
        klasifikasiBuku
    FROM buku
    WHERE Kode_Buku = kodeBuku;
END//

DELIMITER ;
SET @kode := 'B001';
CALL GetBookInfo(@kode, @judul, @pengarang, @penerbit, @tahun, @jumlah, @status, @klasifikasi);
SELECT @judul, @pengarang, @penerbit, @tahun, @jumlah, @status, @klasifikasi;


SELECT COUNT(buku.Kode_Buku) AS Total_Buku_Dipinjam
FROM buku
INNER JOIN peminjaman ON buku.Kode_Buku = peminjaman.Kode_Buku;

DELIMITER //

CREATE PROCEDURE Total_Buku_Dipinjam()
BEGIN
    SELECT COUNT(buku.Kode_Buku) AS Total_Buku_Dipinjam
    FROM buku
    INNER JOIN peminjaman ON buku.Kode_Buku = peminjaman.Kode_Buku;
END //

DELIMITER ;
CALL Total_Buku_Dipinjam();


nomor 6
DELIMITER//
CREATE PROCEDURE getOutBuku(OUT jumlah_buku INT (5))
BEGIN
	SELECT count(kode_buku)INTO jumlah_buku FROM buku;
END//
DELIMITER;

CALL getOutBuku(@jumlah_buku);
SELECT @jumlah_buku;


DELIMITER//
CREATE PROCEDURE getOutBukuu(OUT jumlah_buku INT (5))
BEGIN
	SELECT sum(Jumlah_Buku)INTO jumlah_buku FROM buku;
END//
DELIMITER;

CALL getOutBukuu(@jumlah_buku);
SELECT @jumlah_buku;
select * from buku;

DELIMITER//
CREATE PROCEDURE getOutBukuuu2(OUT jumlah_buku INT (11))
BEGIN
	SELECT (IFNULL(Jumlah_Buku, 0)) INTO jumlah_buku FROM buku;
END//
DELIMITER;

SET @total := 0;
CALL getOutBukuuu1(@total);
SELECT @total AS jumlah_buku;
SELECT * FROM buku;


nomor 7 
DELIMITER//
CREATE PROCEDURE CountPenerbitBuku(IN PenerbitBuku VARCHAR (15),OUT jumlah_buku INT (5))
BEGIN 
	SELECT COUNT(kode_buku) INTO jumlah_buku FROM buku
	WHERE PenerbitBuku = penerbit_buku;
END//
DELIMITER;

CALL CountPenerbitBuku('Bloomsbury',@jumlah_buku);
SELECT @jumlah_buku;

ALTER TABLE buku MODIFY COLUMN Jumlah_Buku int (11);
DESC buku;


DELIMITER //

CREATE PROCEDURE Peminjaman1()
BEGIN
    SELECT peminjaman.Kode_Peminjaman, peminjaman.Id_Anggota, peminjaman.Id_Petugas, peminjaman.Tanggal_Pinjam, peminjaman.Tanggal_Kembali, peminjaman.Kode_Buku
    FROM peminjaman
    INSERT INTO peminjaman (Kode_Peminjaman, Id_Anggota, Id_Petugas, Tanggal_Pinjam, Tanggal_Kembali, Kode_Buku) VALUES
    ('P001', 'A001', 'P001', '2024-03-01', '2024-03-15', 'B001') 
    INNER JOIN buku ON peminjaman.Kode_Buku = buku.Kode_Buku;
END //

CREATE PROCEDURE Peminjaman2()
BEGIN
    SELECT peminjaman.Kode_Peminjaman, peminjaman.Id_Anggota, peminjaman.Id_Petugas, peminjaman.Tanggal_Pinjam, peminjaman.Tanggal_Kembali, peminjaman.Kode_Buku
    FROM peminjaman
    INSERT INTO peminjaman (Kode_Peminjaman, Id_Anggota, Id_Petugas, Tanggal_Pinjam, Tanggal_Kembali, Kode_Buku) VALUES
('P002', 'A002', 'P002', '2024-03-02', '2024-03-16', 'B002')
    LEFT JOIN buku ON peminjaman.Kode_Buku = buku.Kode_Buku;
END //

CREATE PROCEDURE Peminjaman3()
BEGIN
    SELECT peminjaman.Kode_Peminjaman, peminjaman.Id_Anggota, peminjaman.Id_Petugas, peminjaman.Tanggal_Pinjam, peminjaman.Tanggal_Kembali, peminjaman.Kode_Buku
    FROM peminjaman
    INSERT INTO peminjaman (Kode_Peminjaman, Id_Anggota, Id_Petugas, Tanggal_Pinjam, Tanggal_Kembali, Kode_Buku) VALUES
    ('P003', 'A003', 'P003', '2024-03-03', '2024-03-17', 'B003')
    RIGHT JOIN buku ON peminjaman.Kode_Buku = buku.Kode_Buku;
END //

DELIMITER ;

CALL Peminjaman1();
CALL Peminjaman2();
CALL Peminjaman3();

UPDATE Anggota
SET Status_Pinjam = 'Meminjam'
WHERE Status_Pinjam = 'Tidak Meminjam';

select*from Anggota


DELIMITER //
CREATE PROCEDURE Peminjaman01()
BEGIN
    SELECT peminjaman.Kode_Peminjaman, peminjaman.Id_Anggota, peminjaman.Id_Petugas, peminjaman.Tanggal_Pinjam, peminjaman.Tanggal_Kembali, peminjaman.Kode_Buku
    FROM peminjaman
    INNER JOIN buku ON peminjaman.Kode_Buku = buku.Kode_Buku;
END //
DELIMITER ;
call Peminjaman01;

DELIMITER //
CREATE PROCEDURE Peminjaman02()
BEGIN
    SELECT peminjaman.Kode_Peminjaman, peminjaman.Id_Anggota, peminjaman.Id_Petugas, peminjaman.Tanggal_Pinjam, peminjaman.Tanggal_Kembali, peminjaman.Kode_Buku
    FROM peminjaman
    LEFT JOIN buku ON peminjaman.Kode_Buku = buku.Kode_Buku;
END //
DELIMITER ;
call Peminjaman02;

DELIMITER //
CREATE PROCEDURE Peminjaman03()
BEGIN
    SELECT peminjaman.Kode_Peminjaman, peminjaman.Id_Anggota, peminjaman.Id_Petugas, peminjaman.Tanggal_Pinjam, peminjaman.Tanggal_Kembali, peminjaman.Kode_Buku
    FROM peminjaman
    RIGHT JOIN buku ON peminjaman.Kode_Buku = buku.Kode_Buku;
END //
DELIMITER ;
call Peminjaman03;

















	
	


