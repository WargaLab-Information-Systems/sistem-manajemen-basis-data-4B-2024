USE perpustakaan;

DELIMITER//
CREATE PROCEDURE perpus(IN username VARCHAR (15))
BEGIN
	SELECT * FROM petugas
	WHERE nama = username;
END//
DELIMITER;

CALL perpus('andini');

DELIMITER//
CREATE PROCEDURE getJenisKelamin(IN jns_klmn VARCHAR (15))
BEGIN
	SELECT * FROM anggota
	WHERE jenis_kelamin = jns_klmn;
END//
DELIMITER

CALL getJenisKelamin ('laki-laki');

DELIMITER//
CREATE PROCEDURE getJenisKelamin1(IN jns_klmn VARCHAR (15),
IN angkt VARCHAR (6))
BEGIN
	SELECT * FROM anggota
	WHERE jenis_kelamin = jns_klmn 
	AND angkatan_anggota = angkt;
END//
DELIMITER

CALL getJenisKelamin1 ('perempuan','2022');

4.
DELIMITER//
CREATE PROCEDURE getJenisKelamin2 (IN jns_klmn VARCHAR (15),
IN angkt VARCHAR (6), IN status_ VARCHAR (15))
BEGIN
	SELECT * FROM anggota 
	WHERE jenis_kelamin = jns_klmn 
	AND angkatan_anggota = angkt
	AND status_pinjam = status_;
END//
DELIMITER;

CALL getJenisKelamin2 ('perempuan','2022','meminjam');

DELIMITER//
CREATE PROCEDURE tambah_data_petugas(
IN idPetugas VARCHAR (10),
IN username VARCHAR (15),
IN pass VARCHAR (15),
IN nama VARCHAR (25))
BEGIN 
	INSERT INTO petugas
	VALUES (idPetugas,username,pass,nama);
END//
DELIMITER

CALL tambah_data_petugas('112','ayu','5678','ayuning');
SELECT * FROM petugas

DELIMITER//
CREATE PROCEDURE getOutBuku(OUT jumlah_buku INT (5))
BEGIN
	SELECT COUNT(kode_buku)INTO jumlah_buku FROM buku;
END//
DELIMITER;

CALL getOutBuku(@jumlah_buku);
SELECT @jumlah_buku;

7.
DELIMITER//
CREATE PROCEDURE CountPenerbitBuku(IN PenerbitBuku VARCHAR (15),OUT jumlah_buku INT (5))
BEGIN 
	SELECT COUNT(kode_buku) INTO jumlah_buku FROM buku
	WHERE PenerbitBuku = penerbit_buku;
END//
DELIMITER;

CALL CountPenerbitBuku('Bloomsbury',@jumlah_buku);
SELECT @jumlah_buku;

 
 
 