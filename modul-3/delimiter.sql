USE perpustkn;


--Nomer 1
DELIMITER //
CREATE PROCEDURE getJKanggota(IN jeniskelamin VARCHAR(15))
BEGIN
	SELECT * FROM anggota WHERE jenis_kelamin = jeniskelamin;
END //
DELIMITER //

CALL getJKanggota ('Perempuan');

--Nomer 2
DELIMITER //
CREATE PROCEDURE getKodeBuku(IN kodebuku VARCHAR(10))
BEGIN
	SELECT * FROM peminjaman WHERE kode_buku = kodebuku;
END //
DELIMITER//

CALL getKodeBuku('BK23');

--Nomer 3 
DELIMITER //
CREATE PROCEDURE getJudulPengarang(
        IN judul VARCHAR (25),
        IN pengarang VARCHAR (30))
BEGIN
	SELECT * FROM buku WHERE judul_buku = judul 
	AND pengarang_buku = pengarang;
END //
DELIMITER;

CALL getJudulPengarang("Laskar Pelangi","Andrea Hirata");

-Nomer 4
DELIMITER //
CREATE PROCEDURE getNamaAngktnLahir(
        IN nama VARCHAR (20), 
        IN angkatan VARCHAR (6),
        IN tmptlahir VARCHAR (20))
BEGIN
	SELECT * FROM anggota WHERE nama_anggota = nama
	AND angkatan_anggota = angkatan 
	AND tempat_lahir = tmptlahir;
END //
DELIMITER;

CALL getNamaAngktnlahir("Arthur ", "2022", "Surabaya");

-- Nomer 5
DELIMITER //
CREATE PROCEDURE getTambahAnggota(
        IN id_anggota VARCHAR(10),
        IN nama_anggota VARCHAR(20),
        IN angkatan_anggota VARCHAR(6), 
        IN tempat_lahir VARCHAR(20),
        IN tanggal_lahir DATE,
        IN no_telp INT (12),
        IN jenis_kelamin VARCHAR (15),
        IN status_pinjam VARCHAR (15))
BEGIN
	INSERT INTO anggota 
	VALUES (id_anggota, nama_anggota, angkatan_anggota, tempat_lahir, tanggal_lahir, no_telp, jenis_kelamin, status_pinjam);
END //
DELIMITER ;

CALL getTambahAnggota('8031','Raini','2021','Bali','2002-03-05','088356894445','Perempuan','pinjam');
SELECT * FROM anggota;

-- Nomer 6 
DELIMITER //
CREATE PROCEDURE getJumlahBuku(OUT jumlahBuku  INT(3))
BEGIN
	SELECT COUNT(jumlah_buku) INTO jumlahBuku FROM buku;
END //
DELIMITER ;

CALL getJumlahBuku(@jumlahBuku);
SELECT @jumlahBuku;

-- Nomer 7
DELIMITER //
CREATE PROCEDURE getBuku(
	IN KodeBuku VARCHAR (10),
	OUT KodeBukuOUT VARCHAR (10),
	OUT JudulBukuOUT VARCHAR (25), 
	OUT PengarangBukuOUT VARCHAR (20))
	
	BEGIN
		SELECT kode_buku,judul_buku,pengarang_buku INTO KodeBukuOUT,JudulBukuOUT,PengarangBukuOUT
		FROM buku WHERE kode_buku = KodeBuku;
	
END //
DELIMITER ;
CALL getBuku('BK23', @KodeBukuOUT, @JudulBukuOUT, @PengarangBukuOUT);
SELECT @KodeBukuOUT, @JudulBukuOUT, @PengarangBukuOUT;



