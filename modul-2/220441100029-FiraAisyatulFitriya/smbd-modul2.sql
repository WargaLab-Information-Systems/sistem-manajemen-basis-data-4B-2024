CREATE DATABASE db_perpustakaan;

USE db_perpustakaan;

CREATE TABLE petugas (
idPetugas VARCHAR (10) NOT NULL,
Username VARCHAR (15) NOT NULL,
Pw VARCHAR (15) NOT NULL,
Nama VARCHAR (25) NOT NULL,
PRIMARY KEY (idPetugas)	 
)

SELECT * FROM petugas

INSERT INTO petugas (idpetugas, Username, Pw, nama)
VALUES 
('111', 'Aisyatul', '4555', 'Aisya'),
('222', 'Fitriya', '3321', 'fitri'),
('333', 'Regina', '8891', 'Gina'),
('444', 'Aprilia', '6672', 'April'),
('555', 'Aditya', '4434', 'Adit'),
('666', 'Rahmadani', '1177', 'Rahma'),
('777', 'Nurindah', '2233', 'Indah'),
('888', 'Ananda', '7762', 'Nanda'),
('999', 'Firzana', '7765', 'Zana'),
('981', 'Sofia', '2331', 'Fia');


CREATE TABLE buku (
Kode_Buku VARCHAR (10) NOT NULL,
judul_Buku VARCHAR (25) NOT NULL,
Pengarang_Buku VARCHAR (30) NOT NULL,
Penerbit_Buku VARCHAR (30) NOT NULL,
Tahun_Buku VARCHAR (10) NOT NULL,
Jumlah_Buku VARCHAR (5) NOT NULL,
Status_Buku VARCHAR (10) NOT NULL,
Klasifikasi_Buku VARCHAR (20) NOT NULL,
PRIMARY KEY (Kode_Buku)
)


SELECT * FROM buku

INSERT INTO buku (Kode_Buku, Judul_Buku, Pengarang_Buku, Penerbit_Buku, Tahun_Buku, Jumlah_Buku, Status_Buku, Klasifikasi_Buku)
VALUES
('1111', 'The Catcher in the Rye', 'JD Salinger', 'Little', '1951','10', 'Bagus', 'Novel Fiksi'),
('2222', 'To Kill a Mockingbird', 'Harper Lee', 'JB Lippincot', '1960','15', 'Bagus', 'Novel Fiksi'),
('3333', '1984', 'George Orwell', 'Secker', '1949','5', 'Kurang Bagus', 'Novel fiksi Ilmiah'),
('4444', 'Pride and Prejudice', 'Jane Austen', 'T Egerton', '1813','10', 'Bagus', 'Novel Klasik dan Sastra Romatis'),
('5555', 'The Great Gatsby', 'F Scott Fitzgerald', 'Charles Scribners Sons', '1925','20', 'Bagus', 'Novel Klasik dan Sastra Amerika'),
('6666', 'Harry Potter and the Sorcerers Stone', 'JK Rowling', 'Bloomsbury Publishing ', '1997','5', 'Kurang Bagus', 'Novel Fantasi'),
('7777', 'The Hobbit', 'JJRR Tolkien', 'George Allen', '1937','10', 'Bagus', 'Novel Fantasi'),
('8888', 'The Hunger Games', 'Suzanne Collins', 'Scholastic Corporation', '2008','25', 'Bagus', 'Novel Fiksi Ilmiah'),
('9999', 'The Da Vinci Code', 'Dan Brown', 'Doubleday', '2003','5', 'Kurang Bagus', 'Novel Thriller Misteri'),
('1982', 'The Lord of the Rings', 'JRR Tolkien', 'George Allen', '1955','20', 'Bagus', 'Novel Fantasi');


CREATE TABLE anggota (
idAnggota VARCHAR (10) NOT NULL,
Nama_Anggota VARCHAR (20) NOT NULL,
Angkatan_Anggota VARCHAR (6) NOT NULL,
Tempat_Lahir_Anggota VARCHAR (20) NOT NULL,
Tgl_Lahir_Anggota DATE,
No_Telp INT (12) NOT NULL,
Jenis_kelamin VARCHAR (15) NOT NULL,
Status_Pinjam VARCHAR (15) NOT NULL,
PRIMARY KEY (idAnggota)
)

SELECT * FROM anggota

INSERT INTO anggota (idAnggota, Nama_Anggota, Angkatan_Anggota, Tempat_Lahir_Anggota, Tgl_Lahir_Anggota, No_Telp, Jenis_Kelamin, Status_Pinjam)
VALUES 
('1990', 'Fera', '2000', 'Surabaya', '2001-03-12', '089123', 'PR', 'Pinjam'),
('1991', 'Fara', '2001', 'Lamongan', '2004-11-13', '098761', 'PR', 'Pinjam'),
('1992', 'Aldi', '2001', 'Bangkalan', '2002-06-22', '081234', 'LK', 'Pinjam'),
('1993', 'Radit', '2003', 'Gresik', '2004-09-19', '087675', 'LK', 'Pinjam'),
('1994', 'Dimas', '2005', 'Sumenep', '2005-07-30', '081760', 'LK', 'Pinjam'),
('1995', 'Yusuf', '2003', 'Madiun', '2004-12-12', '088761', 'LK', 'Pinjam'),
('1996', 'Anna', '2004', 'Pasuruan', '2006-09-29', '087708', 'PR', 'Pinjam'),
('1997', 'Lidia', '2001', 'Pamekasan', '2001-05-22', '087222', 'PR', 'Pinjam'),
('1998', 'Yuyun', '2003', 'Sidoarjo', '2003-10-26', '083343', 'PR', 'Pinjam'),
('1999', 'Daffa', '2000', 'Jakarta', '2004-10-23', '082113', 'LK', 'Pinjam');





CREATE TABLE peminjaman (
Kode_Peminjaman VARCHAR (10) NOT NULL,
idAnggota VARCHAR (10) NOT NULL,
idPetugas VARCHAR (10) NOT NULL,
Tgl_Pinjam DATE,
Tgl_Kembali DATE,
Kode_Buku VARCHAR (10) NOT NULL,
PRIMARY KEY (Kode_Peminjaman),
FOREIGN KEY (idPetugas) REFERENCES petugas (idPetugas),
FOREIGN KEY (Kode_Buku) REFERENCES buku (Kode_Buku),
FOREIGN KEY (idAnggota) REFERENCES anggota (idAnggota)
)

DROP TABLE peminjaman
DROP TABLE peminjaman

SELECT * FROM peminjaman

INSERT INTO peminjaman (Kode_Peminjaman, idAnggota, idPetugas, Tgl_Pinjam, Tgl_Kembali, Kode_Buku)
VALUES
('1323', '1990', '111', '2001-11-21', '2001-11-25', '1111'),
('2232', '1991', '222', '2002-10-29', '2002-11-04', '2222'),
('4555', '1991', '333', '2000-12-05', '2000-12-09', '2222'),
('5522', '1991', '444', '2003-11-01', '2003-11-05', '2222'),
('2211', '1991', '555', '2004-02-22', '2004-02-26', '2222'),
('3321', '1991', '666', '2005-01-05', '2005-01-10', '2222'),
('2132', '1991', '777', '2006-03-01', '2006-03-05', '2222'),
('9981', '1991', '888', '2007-09-09', '2007-09-13', '8888'),
('9972', '1998', '999', '2008-04-10', '2008-04-14', '9999'),
('8891', '1999', '981', '2009-12-21', '2009-12-25', '1982');
UPDATE peminjaman
SET idPetugas = '777'
WHERE Kode_Peminjaman = '8891'

CREATE TABLE pengembalian (
Kode_Kembali VARCHAR (10) NOT NULL,
idAnggota VARCHAR (10) NOT NULL,
Kode_Buku VARCHAR (10) NOT NULL,
idPetugas VARCHAR (10) NOT NULL,
Tgl_Pinjam DATE,
Tgl_Kembali DATE,
Denda VARCHAR (15) NOT NULL,
PRIMARY KEY (Kode_Kembali),
FOREIGN KEY (idPetugas) REFERENCES petugas (idPetugas),
FOREIGN KEY (Kode_Buku) REFERENCES buku (Kode_Buku),
FOREIGN KEY (idAnggota) REFERENCES anggota (idAnggota)
)

DROP TABLE pengembalian

SELECT * FROM pengembalian

INSERT INTO pengembalian (Kode_Kembali, idAnggota, Kode_Buku, idPetugas, Tgl_Pinjam, Tgl_Kembali, Denda)
VALUES
('1212', '1990', '1111', '111', '2001-11-21', '2001-11-25', '150000'),
('2121', '1991', '2222', '222', '2002-10-29', '2002-11-04', '100000'),
('1313', '1991', '2222', '333', '2000-12-05', '2000-12-09', '120000'),
('3131', '1991', '2222', '444', '2003-11-01', '2003-11-05', '200000'),
('1414', '1991', '2222', '555', '2004-02-22', '2004-02-26', '140000'),
('4141', '1991', '2222', '666', '2005-01-05', '2005-01-10', '160000'),
('1515', '1991', '2222', '777', '2006-03-01', '2006-03-05', '180000'),
('5151', '1991', '8888', '888', '2007-09-09', '2007-09-13', '250000'),
('1616', '1998', '9999', '999', '2008-04-10', '2008-04-14', '170000'),
('6161', '1999', '1982', '981', '2009-12-21', '2009-12-25', '270000');


NO 1

CREATE VIEW view_anggota_meminjam_lebih_dari_lima AS 
SELECT ag.idAnggota, a.Nama_Anggota FROM peminjaman ag JOIN anggota a ON ag.idAnggota = a.idAnggota;
SELECT *, COUNT(*) FROM view_anggota GROUP BY Nama_Anggota HAVING COUNT(*) >5;

SELECT * FROM view_anggota_meminjam_lebih_dari_lima

NO 2

-- petugas dialiaskan ke ptg gabung ke peminjaman dialiaskan ke pmj on dilihat jika ptg.id petugas nilainya sama dengan tabelnya 
maka = dengan pmj.id petugas maka nilainya keluar dan masuk ke GROUP BY yaitu pengelompokkan sesuai dengan idpetugas --

CREATE VIEW view_petugas_transaksi AS SELECT
ptg.idPetugas, ptg.Nama, pmj.Tgl_Pinjam, COUNT(*) AS Jumlah_Transaksi FROM 
petugas ptg JOIN peminjaman pmj ON ptg.idPetugas = pmj.idPetugas GROUP BY idPetugas;

SELECT * FROM view_petugas_transaksi GROUP BY idPetugas HAVING COUNT(*); 



NO 3

CREATE VIEW petugas_transaksi AS SELECT a.idPetugas, a.Nama, MAX(Jumlah_Transaksi) FROM view_petugas_transaksi a, peminjaman p
WHERE a.idPetugas = p.idPetugas AND Jumlah_Transaksi >= ALL (SELECT Jumlah_Transaksi FROM view_petugas_transaksi)
GROUP BY a.idPetugas;


NO 4

CREATE VIEW buku_terpinjam_paling_banyak AS
SELECT p.Kode_Buku, b.Judul_Buku, b.Pengarang_Buku, b.Penerbit_Buku, b.Tahun_Buku, COUNT(p.Kode_Buku) AS Jumlah_Peminjaman
FROM peminjaman p
JOIN buku b ON p.Kode_Buku = b.Kode_Buku
GROUP BY p.Kode_Buku, b.Judul_Buku, b.Pengarang_Buku, b.Penerbit_Buku, b.Tahun_Buku
ORDER BY Jumlah_Peminjaman DESC
LIMIT 1;

SELECT * FROM buku_terpinjam_paling_banyak
SELECT * FROM view_petugas_transaksi
SELECT * FROM petugas_transaksi
SELECT * FROM buku_terpinjam_paling_banyak


