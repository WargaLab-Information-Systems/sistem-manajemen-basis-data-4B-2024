CREATE DATABASE coba;
USE coba;

CREATE TABLE mahasiswa1 (
    nim INT(11) PRIMARY KEY,
    nama VARCHAR(50) NOT NULL,
    alamat VARCHAR(50),
    phone VARCHAR(15),
    keterangan VARCHAR(15)
);
INSERT INTO mahasiswa1 (nim, nama, alamat, phone, keterangan) VALUES
(101, 'John Doe', 'Jalan ABC No. 123', '1234567890', 'Aktif'),
(102, 'Jane Smith', 'Jalan XYZ No. 456', '0987654321', 'Lulus'),
(103, 'Michael Johnson', 'Jalan PQR No. 789', '1112223333', 'Aktif'),
(104, 'Emily Davis', 'Jalan LMN No. 012', '4445556666', 'Tidak Aktif'),
(105, 'David Wilson', 'Jalan RST No. 345', '7778889999', 'Aktif');

SELECT*FROM mahasiswa1;

ALTER TABLE mahasiswa1 MODIFY COLUMN nim CHAR (11);
DESC mahasiswa1;

ALTER TABLE mahasiswa1 CHANGE COLUMN phone telepon VARCHAR (20);
DESC mahasiswa1;

ALTER TABLE mahasiswa1 DROP keterangan;
SELECT*FROM mahasiswa1;

ALTER TABLE mahasiswa1 RENAME student;
SELECT*FROM student;

ALTER TABLE student ADD CONSTRAINT PRIMARY KEY (nim);
DESC student;
DELIMITER //
	CREATE PROCEDURE Peminjaman01()
	BEGIN
	    SELECT peminjaman.Kode_Peminjaman, peminjaman.Id_Anggota, peminjaman.Id_Petugas, peminjaman.Tanggal_Pinjam, peminjaman.Tanggal_Kembali, peminjaman.Kode_Buku
	    FROM peminjaman
	    INNER JOIN buku ON peminjaman.Kode_Buku = buku.Kode_Buku;
	END //
	DELIMITER ;
	CALL Peminjaman01;

	DELIMITER //
	CREATE PROCEDURE Peminjaman02()
	BEGIN
	    SELECT peminjaman.Kode_Peminjaman, peminjaman.Id_Anggota, peminjaman.Id_Petugas, peminjaman.Tanggal_Pinjam, peminjaman.Tanggal_Kembali, peminjaman.Kode_Buku
	    FROM peminjaman
	    LEFT JOIN buku ON peminjaman.Kode_Buku = buku.Kode_Buku;
	END //
	DELIMITER ;
	CALL Peminjaman02;

	DELIMITER //
	CREATE PROCEDURE Peminjaman03()
	BEGIN
	    SELECT peminjaman.Kode_Peminjaman, peminjaman.Id_Anggota, peminjaman.Id_Petugas, peminjaman.Tanggal_Pinjam, peminjaman.Tanggal_Kembali, peminjaman.Kode_Buku
	    FROM peminjaman
	    RIGHT JOIN buku ON peminjaman.Kode_Buku = buku.Kode_Buku;
	END //
	DELIMITER ;
	CALL Peminjaman03;






