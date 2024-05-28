USE db_perpustakaan

-- soal no 1

DELIMITER //
CREATE PROCEDURE biodata(
	IN vrnama VARCHAR(50), 
	IN vrnim VARCHAR(20),
	IN vralamat VARCHAR(50), 
	IN vrtgl_lahir DATE,
	IN vrjenis_kelamin VARCHAR(10), 
	IN vrumur INT,
	IN vrhobi VARCHAR(50), 
	IN vrno_telp VARCHAR(15)
)
BEGIN
	DECLARE nama VARCHAR(50);
	DECLARE nim VARCHAR(20);
	DECLARE alamat VARCHAR(50);
	DECLARE tgl_lahir DATE;
	DECLARE jenis_kelamin VARCHAR(10);
	DECLARE umur INT;
	DECLARE hobi VARCHAR(50);
	DECLARE no_telp VARCHAR(15);
	
	SET nama = vrnama;
	SET nim = vrnim;
	SET alamat = vralamat;
	SET tgl_lahir = vrtgl_lahir;
	SET jenis_kelamin = vrjenis_kelamin;
	SET umur = TIMESTAMPDIFF(YEAR, vrtgl_lahir, CURDATE());
	SET hobi = vrhobi;
	SET no_telp = vrno_telp;
	
	SELECT 
		nama AS Nama_Mahasiswa, 
		nim AS Nim, 
		alamat AS Alamat, 
		tgl_lahir AS Tgl_lahir,
		jenis_kelamin AS Gender, 
		umur AS Usia, 
		hobi AS Hobi, 
		no_telp AS No_Telp;
END //
DELIMITER ;

CALL biodata ("Aprilia Zim","220441100031","Serang","2005-04-22","Perempuan","19","Lari","083865212199");
DROP PROCEDURE biodata

-- soal no 2
DELIMITER //
CREATE PROCEDURE peringatan()
BEGIN
    SELECT 
        id_kembali,
        id_anggota,
        tgl_pinjam,
        tgl_kembali,
        DATEDIFF(tgl_kembali, tgl_pinjam) AS lama_pinjam,
        CASE 
            WHEN DATEDIFF(tgl_kembali, tgl_pinjam) <= 2 THEN 'Silahkan Pergunakan buku'
            WHEN DATEDIFF(tgl_kembali, tgl_pinjam) BETWEEN 3 AND 5 THEN 'Ingat!!, Waktu Pinjam Segera Habis'
            WHEN DATEDIFF(tgl_kembali, tgl_pinjam) >= 6 THEN 'WARNING!!, Denda Menanti Anda'
        END AS statusnya
    FROM pengembalian
    ORDER BY lama_pinjam ASC;
END //
DELIMITER ;

DROP PROCEDURE peringatan
CALL peringatan();
 
 SELECT * FROM pengembalian
INSERT INTO pengembalian (id_kembali, id_anggota, id_petugas, id_buku, tgl_pinjam,
tgl_kembali, denda) VALUES (5560, 3340, 2230, 1120, '2024-01-01', '2024-01-05', 0);


-- soal no 3

DELIMITER //
CREATE PROCEDURE denda (
    IN idanggota VARCHAR(10)
)
BEGIN
    DECLARE jumlah_denda VARCHAR(50);
    DECLARE total_denda INT(120);

    SELECT SUM(denda) INTO total_denda
    FROM pengembalian
    WHERE id_anggota = idanggota;

    IF total_denda IS NOT NULL AND total_denda != 0 THEN
        SET jumlah_denda = total_denda;
    ELSE
        SET jumlah_denda = 'Anda tidak memiliki tanggungan/denda';
    END IF;

    SELECT jumlah_denda;
END //
DELIMITER ;

CALL denda('3330');
SELECT * FROM pengembalian

-- soal no 4 

DELIMITER //
CREATE PROCEDURE cetakpeminjaman(IN cetak INT)
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= cetak DO
        SELECT * FROM peminjaman LIMIT cetak;
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;

CALL cetakpeminjaman(5);
SELECT * FROM peminjaman


-- soal no 5

DELIMITER //
CREATE PROCEDURE hapuskan(IN gender VARCHAR(20))
BEGIN
    IF gender = 'Laki-laki' THEN
        DELETE FROM anggotaa WHERE jenis_kelamin ='Laki-laki' AND status_pinjam !='Pinjam';
    END IF;
END //
DELIMITER ;

CALL hapuskan ('Laki-laki')
SELECT * FROM anggotaa;
DROP PROCEDURE hapuskan