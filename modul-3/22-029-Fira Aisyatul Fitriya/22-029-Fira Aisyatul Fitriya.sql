USE db_perpustakaan 

--nomer 1
DELIMITER //
CREATE PROCEDURE getdata(IN tmp_lahir VARCHAR(10))
BEGIN
	SELECT * FROM anggota WHERE Tempat_Lahir_Anggota = tmp_lahir;
END //
DELIMITER //

CALL getdata('Pamekasan');


--Nomer 2
DELIMITER //
CREATE PROCEDURE get_nama(IN nama VARCHAR(20))
BEGIN
	SELECT * FROM anggota WHERE nama_anggota = nama;
END //
DELIMITER//

CALL get_nama('Lidia');

--Nomer 3
DELIMITER //
CREATE PROCEDURE ambil2data (IN anggota_nama VARCHAR (30), IN tgl_lahir VARCHAR (10))
BEGIN
	SELECT * FROM anggota WHERE Nama_Anggota =  anggota_nama AND Tgl_Lahir_Anggota = tgl_lahir ;
END //
DELIMITER;

CALL ambil2data("Fara","2004-11-13");

SELECT * FROM anggota

-Nomer 4
DELIMITER //
CREATE PROCEDURE ambil3data(IN akt_anggota VARCHAR (25), IN jenis_kl VARCHAR (30), IN s_pinjam VARCHAR (30))
BEGIN
	SELECT * FROM anggota WHERE Angkatan_Anggota = akt_anggota AND Jenis_Kelamin = jenis_kl AND Status_Pinjam = s_pinjam;
END //
DELIMITER;

CALL ambil3data("2001", "PR", "Pinjam ");


-- Nomer 5
SELECT * FROM buku

DELIMITER //
CREATE PROCEDURE plus(IN buku_kode VARCHAR(10), IN buku_judul VARCHAR(15), IN buku_pengarang VARCHAR(15), IN buku_penerbit VARCHAR(30), IN buku_tahun VARCHAR(10),
buku_jumlah VARCHAR (5), buku_status VARCHAR (10), buku_klasifikasi VARCHAR (20))
BEGIN
	INSERT INTO buku (Kode_Buku, Judul_Buku, Pengarang_Buku, Penerbit_Buku, Tahun_Buku, Jumlah_Buku, Status_Buku, Klasifikasi_Buku) 
	VALUES (buku_kode, buku_judul, buku_pengarang, buku_penerbit, buku_tahun, buku_jumlah, buku_status, buku_klasifikasi);
END //
DELIMITER ;

CALL plus("2020", "Kancil Yang Cerdik", "Alexa", "Gramedia", "2012", "2", "Bagus", "Dongeng");
CALL plus("2022", "Pelangi", "Diana", "Gramedia", "2024", "3", "Bagus", "Novel");
SELECT * FROM buku;

-- Nomer 6
DELIMITER //
CREATE PROCEDURE pengarang(OUT jumlah INT)
BEGIN
	SELECT COUNT(pengarang_buku) INTO jumlah FROM buku;
END //
DELIMITER ;

CALL pengarang(@jumlah);
SELECT @jumlah;

-- Nomer 7

DELIMITER //
CREATE PROCEDURE jumlah_jenis_kelamin(
	IN gender VARCHAR (15),
	OUT total INT (3))
	BEGIN
		SELECT COUNT(idAnggota)
		INTO total
		FROM anggota
		WHERE gender = jenis_kelamin;
END //
DELIMITER ;

CALL jumlah_jenis_kelamin('PR',@total);
SELECT@total;

DROP PROCEDURE tambah;

