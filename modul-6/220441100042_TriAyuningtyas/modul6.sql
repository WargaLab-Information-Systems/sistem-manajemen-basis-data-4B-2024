USE perpustakaan

1. 
DELIMITER //
CREATE PROCEDURE Tampilkan_DataMhs(
	IN nim INT(20),
	IN namaMhs VARCHAR(30),
	IN tglLahir DATE,
	IN alamat VARCHAR(20),
	IN noTlp VARCHAR(20),
	IN jeniskelamin VARCHAR(1),
	IN hobi VARCHAR(20),
	IN umur INT(2)
)
BEGIN 
	DECLARE vNim INT(20);
	DECLARE vNamaMhs VARCHAR(30);
	DECLARE vTglLahir DATE;
	DECLARE vAlamat VARCHAR(20);
	DECLARE vNoTlp VARCHAR(20);
	DECLARE vJenisKelamin VARCHAR(1);
	DECLARE vHobi VARCHAR(20);
	DECLARE vUmur INT(2);
	
	SET vNim = nim;
	SET vNamaMhs = namaMhs;
	SET vTglLahir = tglLahir;
	SET vAlamat = alamat;
	SET vNoTlp = noTlp;
	SET vJenisKelamin = jeniskelamin;
	SET vHobi = hobi;
	SET vUmur = TIMESTAMPDIFF(YEAR, vTglLahir, CURDATE());
	
	SELECT vNim AS NIM, 
		vNamaMhs AS NAMA,
		vTglLahir AS TANGGAL_LAHIR,
		vAlamat AS ALAMAT,
		vNoTlp AS NO_TELP,
		vJenisKelamin AS JENIS_KELAMIN,
		vHobi AS HOBI,
		vUmur AS UMUR;
	
END//
DELIMITER ; 

CALL Tampilkan_DataMhs(220441100042, "Tri Ayuningtyas", "2004-07-10", "Mojokerto", "085648114746", "P", "Membaca", 19);
CALL Tampilkan_DataMhs(220441100041, "Ayunda Lolikasari", "2004-07-10", "Pasuruan", "085648114748", "P", "Melukis", 19);


2.
DELIMITER//
CREATE PROCEDURE pengingat_pinjam()
BEGIN 
	SELECT kode_peminjaman, idAnggota, kode_buku, tanggal_pinjam, tanggal_kembali, CONCAT(DATEDIFF(tanggal_kembali, tanggal_pinjam), 'hari') AS "waktu_pinjam",
	    CASE 
		WHEN DATEDIFF(tanggal_kembali, tanggal_pinjam) <= 2 THEN "silahkan pergunakan buku dengan baik"
		WHEN DATEDIFF(tanggal_kembali, tanggal_pinjam) BETWEEN 3 AND 5 THEN "ingat! waktu pinjam segera habis"
		WHEN DATEDIFF(tanggal_kembali, tanggal_pinjam) >= 6 THEN "warning! denda menanti anda"
	    END AS keterangan
	FROM peminjaman 
	ORDER BY tanggal_pinjam ASC;
END//
DELIMITER;

CALL pengingat_pinjam();

DROP PROCEDURE pengingat_pinjam

3.
DELIMITER//
CREATE PROCEDURE cekdenda (
    IN idAnggota VARCHAR(50)
)
BEGIN
    DECLARE keterangan VARCHAR(100);
    DECLARE jumlah_denda DECIMAL(10, 2);
    
    SET jumlah_denda = 0;

    SELECT COALESCE(SUM(denda), 0) INTO jumlah_denda 
    FROM pengembalian 
    WHERE idAnggota;

    IF jumlah_denda = 0 THEN
        SET keterangan = 'anda tidak memiliki denda';
    ELSEIF jumlah_denda > 0 THEN
        SET keterangan = 'anda memiliki denda';
    END IF;

    SELECT idAnggota AS id_anggota, jumlah_denda, keterangan;
END//
DELIMITER;

CALL cekdenda(105);

DROP PROCEDURE cekdenda

4.
DELIMITER//
CREATE PROCEDURE cetakpeminjaman(IN cetak INT(5))
BEGIN
	DECLARE i INT(5);
	SET i = 1;
	WHILE i <= cetak DO 
		SELECT * FROM peminjaman LIMIT cetak;
		SET i = i + 1;
	END WHILE; 
END//
DELIMITER ;

CALL cetakpeminjaman(10)
DROP PROCEDURE cetakpeminjaman

5.
DELIMITER//
CREATE PROCEDURE hapusjeniskelamin (
    IN jenis_kelamin VARCHAR(20)
)
BEGIN 
    IF jenis_kelamin = 'Laki-laki' THEN 
        DELETE FROM peminjaman 
        WHERE idAnggota IN (
            SELECT idAnggota FROM anggota 
            WHERE jenis_kelamin = 'Laki-laki' AND status_pinjam != 'meminjam');

        DELETE FROM pengembalian 
        WHERE idAnggota IN (
            SELECT idAnggota FROM anggota 
            WHERE jenis_kelamin = 'Laki-laki' AND status_pinjam != 'meminjam');
        DELETE FROM anggota
        WHERE jenis_kelamin = 'Laki-laki' AND status_pinjam != 'meminjam';
    END IF;
END//
DELIMITER ;

CALL hapusjeniskelamin('Laki-laki');
SELECT*FROM anggota;

DROP PROCEDURE hapusjeniskelamin