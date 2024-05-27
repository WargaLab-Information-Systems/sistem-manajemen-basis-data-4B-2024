USE db_perpustakaan

==NO 1==
DELIMITER //

CREATE PROCEDURE biodata(
	IN vbnama VARCHAR(50), 
	IN vbnim VARCHAR(20),
	IN vbalamat VARCHAR(50), 
	IN vbtgl_lahir DATE,
	IN vbjenis_kelamin VARCHAR(10), 
	IN vbumur INT,
	IN vbhobi VARCHAR(50), 
	IN vbno_telp VARCHAR(15)
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
	
	SET nama = vbnama;
	SET nim = vbnim;
	SET alamat = vbalamat;
	SET tgl_lahir = vbtgl_lahir;
	SET jenis_kelamin = vbjenis_kelamin;
	SET umur = TIMESTAMPDIFF(YEAR, vbtgl_lahir, CURDATE());
	SET hobi = vbhobi;
	SET no_telp = vbno_telp;
	
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
CALL biodata ("aditya gilang","220441100029","surabaya","2005-10-13","LK","","olahraga","08977766612");

NO 2
DELIMITER //

CREATE PROCEDURE pengingat_pinjam()
BEGIN
    SELECT 
        kode_kembali,
        id_anggota,
        tanggal_pinjam,
        DATEDIFF(tanggal_kembali, tanggal_pinjam) AS lama_pinjam,
        CASE
            WHEN DATEDIFF(tanggal_kembali, tanggal_pinjam) <= 2 THEN 'Silahkan Pergunakan Buku dengan baik'
            WHEN DATEDIFF(tanggal_kembali, tanggal_pinjam) BETWEEN 3 AND 5 THEN 'Ingat!, Waktu pinjam segera habis'
            WHEN DATEDIFF(tanggal_kembali, tanggal_pinjam) >= 6 THEN 'Warning!!!, Denda Menanti Anda'
        END AS statusnya
    FROM 
        pengembalian 
    ORDER BY 
        lama_pinjam ASC;
END //

DELIMITER ;
CALL pengingat_pinjam;

SELECT * FROM buku
UPDATE

NO 3
DROP PROCEDURE denda
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
CALL denda('a4');


NO 4 

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

CALL cetakpeminjaman(10);
DROP PROCEDURE cetakpeminjaman
SELECT * FROM peminjaman


NO 5
DELIMITER //

CREATE PROCEDURE hapus(IN jns_kelamin VARCHAR(20))
BEGIN
    IF jns_kelamin = 'LK' THEN
        DELETE FROM anggota WHERE jenis_kelamin = 'LK' AND status_pinjam != 'pinjam';
    END IF;
END //

DELIMITER ;

CALL hapus ('LK')
SELECT * FROM anggota;
DROP PROCEDURE hapus