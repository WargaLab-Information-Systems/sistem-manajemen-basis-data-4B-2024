USE tokobuku;

-- nomor 1
DELIMITER//
CREATE PROCEDURE tokbuk(IN username VARCHAR (15))
BEGIN
	SELECT * FROM petugas
	WHERE nama = username;
END//
DELIMITER;
CALL tokbuk('Budi');

-- nomor 2
DELIMITER//
CREATE PROCEDURE getJK(IN jk VARCHAR (15))
BEGIN
	SELECT * FROM anggota
	WHERE jenis_kelamin = jk;
END//
DELIMITER
CALL getJK ('Perempuan');

-- nomor 3
DELIMITER//
CREATE PROCEDURE getJKL(IN jkl VARCHAR (15),
IN angkatan VARCHAR (6))
BEGIN
	SELECT * FROM anggota
	WHERE jenis_kelamin = jkl
	AND angkatan_anggota = angkatan;
END//
DELIMITER
CALL getJKL ('Laki-laki','2022');

-- nomor 4
DELIMITER//
CREATE PROCEDURE getJKLM (IN jklm VARCHAR (15),
IN angkatan VARCHAR (6), IN stspjm VARCHAR (15))
BEGIN
	SELECT * FROM anggota 
	WHERE jenis_kelamin = jklm 
	AND angkatan_anggota = angkatan
	AND status_pinjam = stspjm;
END//
DELIMITER;
CALL getJKLM ('Perempuan','2023','Aktif');

-- nomor 5
DELIMITER //
CREATE PROCEDURE tambahin_data_buku(
    IN kode_buku VARCHAR(10),
    IN judul_buku VARCHAR(255),
    IN pengarang_buku VARCHAR(100),
    IN penerbit_buku VARCHAR(100),
    IN tahun_buku INT,
    IN jumlah_buku INT,
    IN status_buku VARCHAR(20),
    IN klasifikasi_buku VARCHAR(50)
)
BEGIN
    INSERT INTO buku
    VALUES (kode_buku, judul_buku, pengarang_buku, penerbit_buku, tahun_buku, jumlah_buku, status_buku, klasifikasi_buku);
END //
DELIMITER ;
CALL tambah_data_buku('BK034', 'Bawang Merah Bawang Putih', 'J.R.R. Tolkien', 'Allen & Unwin', 1954, 50, 'Available', 'Fantasy');
SELECT * FROM buku;

-- nomor 6
DELIMITER//
CREATE PROCEDURE getOutBuku(OUT jumlah_buku INT (5))
BEGIN
	SELECT COUNT(kode_buku)INTO jumlah_buku FROM buku;
END//
DELIMITER;
CALL getOutBuku(@jumlah_buku);
SELECT @jumlah_buku;

-- nomor 7
DELIMITER //
CREATE PROCEDURE getTotalBukuTersedia(
    OUT total_buku_tersedia INT,
    IN stat VARCHAR(10)
)
BEGIN
    SELECT COUNT(*) INTO total_buku_tersedia
    FROM buku
    WHERE Status_Buku = 'Available'; 
END //
DELIMITER ;
CALL getTotalBukuTersedia(@total_buku_tersedia, 'Available');
SELECT @total_buku_tersedia;




