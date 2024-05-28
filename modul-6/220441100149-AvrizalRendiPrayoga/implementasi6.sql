-- 1
DELIMITER //
CREATE PROCEDURE biodataKu (
	IN nim_inp VARCHAR (20)
)
BEGIN 
	DECLARE umur INT;
	
	SELECT TIMESTAMPDIFF(YEAR, tanggal_lahir, CURDATE()) 
	INTO umur 
	FROM mahasiswa 
	WHERE nim = nim_inp;
	
	SELECT *, umur 
	FROM mahasiswa 
	WHERE nim = nim_inp;
END //
DELIMITER;
	
CALL biodataKu('220441100149');

-- 2
DELIMITER //
CREATE PROCEDURE cekStatusPeminjaman (
	IN kode_pinjam VARCHAR (10)
)
BEGIN
	DECLARE msg VARCHAR(50);
	DECLARE durasi_pinjam INT;
	
	SELECT TIMESTAMPDIFF(DAY, Tanggal_Pinjam, CURDATE()) 
	INTO durasi_pinjam 
	FROM peminjaman 
	WHERE Kode_Peminjaman = kode_pinjam;
	
	SET msg = 
		CASE
			WHEN durasi_pinjam <=2 THEN "Silahkan pergunakan buku dengan baik"
			WHEN durasi_pinjam >=3 AND durasi_pinjam <=5 THEN "Ingat!, Waktu pinjam segera habis"
			ELSE "Warning!!!, Denda menanti anda!"
		END;
	
	SELECT Kode_Peminjaman, IdAnggota, Tanggal_Pinjam, msg AS pesan
	FROM peminjaman 
	WHERE Kode_Peminjaman = kode_pinjam;
END //
DELIMITER;

CALL cekStatusPeminjaman('PJ018');

-- 3
DELIMITER //
CREATE PROCEDURE cekDendaAnggota (
	IN id_anggota VARCHAR (10)
)
BEGIN	
	DECLARE tot_denda DECIMAL;
	
	SELECT SUM(denda)
	INTO tot_denda
	FROM pengembalian
	WHERE IdAnggota = id_anggota;

	SELECT id_anggota, tot_denda, 
	CASE
		WHEN tot_denda = 0 THEN 'Anggota tersebut tidak ada denda'
		ELSE CONCAT('Terdapat denda: Rp. ', tot_denda)
	END AS pesan;
END //
DELIMITER;

CALL cekDendaAnggota('A003')

-- 4
DELIMITER//
CREATE PROCEDURE  tampilDataPeminjaman(
IN total_data INT
)
BEGIN
	DECLARE i INT(11);
	
	SET i = 1;
	
	WHILE i <= total_data DO
		SELECT * 
		FROM peminjaman
		WHERE Kode_Peminjaman = CONCAT('PJ', LPAD(i , 3, '0'));
		SET i = i+1;
	END WHILE;
END//
DELIMITER;

CALL tampilDataPeminjaman(10);

-- 5
DELIMITER//
CREATE PROCEDURE hapusAnggota()
BEGIN
	DELETE FROM anggota WHERE Jenis_Kelamin = 'Laki-laki' AND Status_Pinjam != 'Ya';
END//
DELIMITER;

CALL hapusAnggota;