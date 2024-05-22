1. -- Buatlah Stored Procedure Variabel untuk menampilkan Biodata
DELIMITER //
CREATE PROCEDURE biodata(
IN nim CHAR(10),
IN nama_mhs CHAR(20),
IN alamat CHAR(25),
IN no_tlpn CHAR(15),
IN jenis_kelamin CHAR(15),
IN hobi CHAR(15),
IN tahun_lahir INT
)
BEGIN
	DECLARE umur INT;
	SET umur = YEAR(CURRENT_DATE())- tahun_lahir;
	
	SELECT nim, nama_mhs, alamat, no_tlpn, jenis_kelamin, hobi, umur;
END//
DELIMITER; 

CALL biodata('1234567890', 'Arum Rahmadhani', 'Pasuruan', '081234567890', 'Perempuan', 'Memasak', 2004);

2. -- Buatlah Stored Procedure pengingat pengembalian buku
DELIMITER //
CREATE PROCEDURE Pengingat_KemBuku(IN kode_peminjaman CHAR(10))
BEGIN 
    DECLARE Tanggal_pinjam DATE;
    DECLARE keterangan CHAR(80);

    SELECT tanggal_pinjam INTO Tanggal_pinjam
    FROM peminjaman
    WHERE kode_peminjaman = kode_peminjaman
    LIMIT 1;

    IF (DATEDIFF(CURRENT_DATE(), Tanggal_pinjam) <= 2) THEN
        SET keterangan = 'Silahkan Pergunakan Buku Dengan Baik!';
    ELSEIF (DATEDIFF(CURRENT_DATE(), Tanggal_pinjam) BETWEEN 3 AND 5) THEN
        SET keterangan = 'Ingat!, Waktu Pinjam Segera Habis';
    ELSE 
        SET keterangan = 'Warning! Denda Menanti Anda';
    END IF;  
    
    SELECT keterangan AS Peringatan;
END//
DELIMITER ;

CALL Pengingat_KemBuku('PM004');

3. -- Buatlah Stored Procedure untuk memeriksa jumlah denda yang dimiliki mahasiswa!
DELIMITER//
CREATE PROCEDURE Lihat_Denda(IN IdAnggota CHAR(10))
BEGIN 
	DECLARE total_denda INT DEFAULT 0;
	
	SELECT SUM(CASE WHEN denda = 'Tidak' THEN 0 ELSE denda END) INTO total_denda
	FROM pengembalian
	WHERE id_anggota = IdAnggota;
	
	IF total_denda > 0 THEN
		 SELECT 'Anda memiliki denda sebesar' AS pesan, total_denda AS jumlah_denda;
		 SELECT * FROM pengembalian WHERE id_anggota = IdAnggota AND denda <> 'Tidak';
	ELSE 
		SELECT 'Anda Tidak memiliki tanggungan denda.' AS pesan;
	END IF;
END//
DELIMITER ;

CALL Lihat_Denda('A001');

4. -- Buatlah Stored procedure Looping untuk mencetak data peminjaman 1 - 10
DELIMITER //
CREATE PROCEDURE CetakData_Pinjam(IN data_pinjam INT)
BEGIN 
	DECLARE i INT(10);
	DECLARE kode CHAR(10);
	SET i = 1;
	WHILE i <= data_pinjam DO
	SET kode = CONCAT ("PM00", i);
	SELECT * FROM peminjaman WHERE kode_peminjaman = kode;
	SET i = i + 1;
	END WHILE;
END//
DELIMITER;

CALL CetakData_Pinjam(10);

5. -- Hapuslah anggota dengan jenis kelamin Laki-laki dari basisdata PERPUSTAKAAN.
DELIMITER//
CREATE PROCEDURE hapus_Anggota()
BEGIN 
	 DELETE FROM anggota WHERE jenis_kelamin = 'Laki-laki'
	 AND id_anggota NOT IN(SELECT id_anggota FROM pengembalian);
END//
DELIMITER;

CALL hapus_Anggota();