USE db_perpustakaan

-- done 1
DELIMITER //
CREATE PROCEDURE soalSatu
(IN angkatan VARCHAR(10))
BEGIN
	SELECT * FROM anggota WHERE angkatan_anggota = angkatan;
END //
DELIMITER //

CALL soalSatu('2020');

-- done 2
DELIMITER //
CREATE PROCEDURE soalDua
(IN judul VARCHAR(20))
BEGIN
	SELECT * FROM buku WHERE judul_buku = judul;
END //
DELIMITER//

CALL soalDua('Bumi Manusia');

-- done 3
DELIMITER //
CREATE PROCEDURE soalTiga
(IN pengarang VARCHAR (100), IN penerbit VARCHAR (100))
BEGIN
	SELECT * FROM buku WHERE pengarang_buku = pengarang AND penerbit_buku = penerbit;
END //
DELIMITER;

CALL soalTiga('Tere Liye', 'Gramedia Pustaka Utama');

-- done 4
DELIMITER //
CREATE PROCEDURE soalEmpat
(IN tahun VARCHAR (25), IN pengarang VARCHAR (30), IN klasifikasi VARCHAR (30))
BEGIN
	SELECT * FROM buku WHERE tahun_buku = tahun AND pengarang_buku = pengarang AND klasifikasi_buku = klasifikasi;
END //
DELIMITER;

CALL soalEmpat("2006", "Andrea Hirata", "Fiksi");

-- Nomer 5
DELIMITER //
CREATE PROCEDURE soallimo
(IN id_anggota VARCHAR (30), IN nama VARCHAR (100), IN angkatan VARCHAR(100), IN tempat_lahir VARCHAR (100), IN tanggal_lahir_anggota DATE,
IN telep VARCHAR (100), IN gender VARCHAR (100), IN pinjam_status VARCHAR (100))
BEGIN
	INSERT INTO anggota (id_anggota, nama_anggota, angkatan_anggota, tempat_lahir_anggota, tanggal_lahir_anggota, no_telp,
	jenis_kelamin, status_pinjam) 
	VALUES (id_anggota, nama, angkatan ,tempat_lahir, tanggal_lahir_anggota, telep, gender, pinjam_status);
	END //
DELIMITER ;

DROP PROCEDURE soallimo
CALL soallimo('3340',"Aprilia maulida", "2022", "Tangerang", "2005-04-22","0838652199" ,"Perempuan","aktif" );
CALL soallimo('3341',"maulida aprilia", "2021", "Jakarta", "2005-04-21","0838652111" ,"Perempuan","tidak aktif" );

SELECT * FROM anggota;

-- done 6
DELIMITER //
CREATE PROCEDURE judul(OUT jumlah INT)
BEGIN
	SELECT COUNT(judul_buku) INTO jumlah FROM buku;
END //
DELIMITER ;

CALL judul(@jumlah);
SELECT @jumlah;

-- Soal 7
DELIMITER //
CREATE PROCEDURE status_anggota(
	IN statuss VARCHAR (15),
	OUT total INT (3))
	BEGIN
		SELECT COUNT(id_anggota)
		INTO total
		FROM anggota
		WHERE statuss = status_pinjam;
END //
DELIMITER ;

CALL status_anggota('Aktif',@total);
SELECT@total;

DROP PROCEDURE status_anggota;