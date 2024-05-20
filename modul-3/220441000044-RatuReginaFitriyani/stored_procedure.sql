USE db_perpus

SELECT * FROM anggota WHERE tempat_lahir='Bangkalan'

--Nomer 1
DELIMITER //
CREATE PROCEDURE getdata(IN tmp_lahir VARCHAR(10))
BEGIN
	SELECT * FROM anggota WHERE tempat_lahir = tmp_lahir;
END //
DELIMITER //

CALL getdata('Bangkalan');

--Nomer 2
DELIMITER //
CREATE PROCEDURE get_nama(IN nama VARCHAR(20))
BEGIN
	SELECT * FROM anggota WHERE nama_anggota = nama;
END //
DELIMITER//

CALL get_nama('Renata');

--Nomer 3
DELIMITER //
CREATE PROCEDURE get_data2att(IN tmpt_lahir VARCHAR (30), IN angkatan VARCHAR (10))
BEGIN
	SELECT * FROM anggota WHERE tempat_lahir = tmpt_lahir AND angkatan_anggota = angkatan;
END //
DELIMITER;

CALL get_data2att("Bangkalan","2021");

-Nomer 4
DELIMITER //
CREATE PROCEDURE get_data3att(IN tahun VARCHAR (25), IN pengarang VARCHAR (30), IN klasifikasi VARCHAR (30))
BEGIN
	SELECT * FROM buku WHERE tahun_buku = tahun AND pengarang_buku = pengarang AND klasifikasi_buku = klasifikasi;
END //
DELIMITER;

SELECT * FROM buku;

CALL get_data3att("2012", "Donny Dhirgantoro", "Mountain");

-- Nomer 5---
DELIMITER //
CREATE PROCEDURE tambah(IN idpetugas VARCHAR(10), IN username_petugas VARCHAR(15), IN pw_petugas VARCHAR(15), IN nama_petugas VARCHAR(30))
BEGIN
	INSERT INTO petugas (id_petugas, username, PASSWORD, nama) VALUES (idpetugas, username_petugas, pw_petugas, nama_petugas);
END //
DELIMITER ;

CALL tambah("p7", "admin07", "111222333", "Lia");
CALL tambah ("p8", "admin08", "111222333444", "Aria");
SELECT * FROM petugas;

-- Nomer 6
DELIMITER //
CREATE PROCEDURE judul(OUT jumlah INT)
BEGIN
	SELECT COUNT(judul_buku) INTO jumlah FROM buku;
END //
DELIMITER ;

SELECT * FROM buku

CALL judul(@jumlah);
SELECT @jumlah;

-- Nomer 7
DELIMITER //
CREATE PROCEDURE countjenis_kelamin(
	IN gender VARCHAR (15),
	OUT total INT (3))
	BEGIN
		SELECT COUNT(id_anggota)
		INTO total
		FROM anggota
		WHERE gender = jenis_kelamin;
END //
DELIMITER ;
CALL countjenis_kelamin('laki-laki',@total);
SELECT@total;

SELECT * FROM anggota
DROP PROCEDURE tambah;