USE db_perpustakaan

==NO 1== 
DELIMITER //

CREATE PROCEDURE biodata(
	IN variablenama VARCHAR(50), 
	IN variablenim VARCHAR(20),
	IN variablealamat VARCHAR(50), 
	IN variabletgl_lahir DATE,
	IN variablejenis_kelamin VARCHAR(10), 
	IN variableumur INT,
	IN variablehobi VARCHAR(50), 
	IN variableno_telp VARCHAR(15)
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
	
	SET nama = variablenama;
	SET nim = variablenim;
	SET alamat = variablealamat;
	SET tgl_lahir = variabletgl_lahir;
	SET jenis_kelamin = variablejenis_kelamin;
	SET umur = TIMESTAMPDIFF(YEAR, variabletgl_lahir, CURDATE());
	SET hobi = variablehobi;
	SET no_telp = variableno_telp;
	
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
DROP PROCEDURE peringatan
DELIMITER //

CREATE PROCEDURE peringatan()
BEGIN
    SELECT 
        kode_kembali,
        idAnggota,
        Tgl_Pinjam,
        Tgl_Kembali,
        DATEDIFF(Tgl_Kembali, Tgl_Pinjam) AS lama_pinjam,
        CASE 
            WHEN DATEDIFF(Tgl_Kembali, Tgl_Pinjam) <= 2 THEN 'Silahkan Pergunakan buku'
            WHEN DATEDIFF(Tgl_Kembali, Tgl_Pinjam) BETWEEN 3 AND 5 THEN 'Ingat!!, Waktu Pinjam Segera Habis'
            WHEN DATEDIFF(Tgl_Kembali, Tgl_Pinjam) >= 6 THEN 'WARNING!!, Denda Menanti Anda'
        END AS statusnya
    FROM pengembalian
    ORDER BY lama_pinjam ASC;
END //

DELIMITER ;

 CALL peringatan();

CALL pengingat_dl_pinjam;
SELECT * FROM peminjaman

SELECT * FROM buku
UPDATE

NO 3
DROP PROCEDURE denda
DELIMITER //

CREATE PROCEDURE didenda (
    IN idanggota VARCHAR(10)
)
BEGIN
    DECLARE jumlah_denda VARCHAR(50);
    DECLARE total_denda INT;

    SELECT SUM(denda) INTO total_denda
    FROM pengembalian
    WHERE idAnggota = idanggota;

    IF total_denda IS NOT NULL AND total_denda != 0 THEN
        SET jumlah_denda = CAST(total_denda AS CHAR);
    ELSE
        SET jumlah_denda = 'Anda tidak memiliki tanggungan/denda';
    END IF;

    SELECT jumlah_denda AS hasil_denda;
END //

DELIMITER ;

CALL didenda('a4');


NO 4 
select * from peminjaman
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
DROP PROCEDURE cetakpeminjaman
SELECT * FROM peminjaman
SELECT * FROM anggota



NO 5
INSERT INTO anggota(idAnggota,Nama_Anggota,Angkatan_Anggota,Tempat_Lahir_Anggota,Tgl_Lahir_Anggota,No_Telp,Jenis_Kelamin,Status_pinjam) VALUES 

('BK55','gilang','2019','sampang','2004-02-02',0832324,'LK','tidak pinjam'),
('BK88','adit','2024','jakarta','2002-04-21',9273274,'LK','tidak pinjam');



DELIMITER //

CREATE PROCEDURE hapus(IN jns_kelamin VARCHAR(15))
BEGIN
    IF jns_kelamin = 'LK' THEN
        DELETE FROM anggota WHERE jenis_kelamin = 'LK' AND status_pinjam != 'pinjam';
    END IF;
END //

DELIMITER ;

CALL hapus('LK')
SELECT * FROM anggota;
DROP PROCEDURE hapus