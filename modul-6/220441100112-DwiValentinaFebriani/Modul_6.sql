

-- no 1.Buatlah Stored Procedure Variabel untuk menampilkan Biodata masing-masing dengan isi : Nim, Nama Mahasiswa, Alamat, No Telpon, 
-- Jenis Kelamin dan Hobi serta tambahkan umur sekarang. kemudian tampilkan hasilnya.

ALTER TABLE anggota
ADD COLUMN Alamat VARCHAR(100) DEFAULT NULL,
ADD COLUMN Hobi VARCHAR(50) DEFAULT NULL;

UPDATE anggota SET Alamat = 'Jl. Telang Timur', Hobi = 'Melukis' WHERE IdAnggota = A005;

DELIMITER //
CREATE PROCEDURE BiodataAnggota()
BEGIN
    DECLARE tahunSekarang INT;
    DECLARE tahunLahir INT;
    DECLARE umurAnggota INT;

    -- Ambil tahun saat ini
    SET tahunSekarang = YEAR(CURDATE());

    -- Ambil data anggota dan hitung umur mereka
    SELECT 
        IdAnggota,
        Nama_Anggota,
        Alamat,
        No_Telp,
        Jenis_Kelamin,
        Hobi,
        TIMESTAMPDIFF(YEAR, Tanggal_Lahir_Anggota, CURDATE()) AS Umur
    FROM anggota;
END //
DELIMITER ;

CALL BiodataAnggota();


-- no 2. Buatlah Stored procedure untuk menentukan keterangan pengingat pengembalian buku, dengan ketentuan jika tanggal pinjam <= 2 hari “Silahkan Pergunakan Buku dengan baik” 
-- jika tanggal pinjam antara 3 – 5 hari “Ingat!, Waktu pinjam antara 3 – 5 hari, “Ingat, Waktu Pinjam Segera Habis”.

DELIMITER //
CREATE PROCEDURE peringatan()
BEGIN
    SELECT 
        Kode_Kembali,
        IdAnggota,
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

DROP PROCEDURE peringatan
CALL peringatan();

SELECT * FROM pengembalian


-- 3. Buatlah Stored Procedure untuk memeriksa jumlah denda yang dimiliki mahasiswa! 
-- Jika mahasiswa mendapat denda maka akan membayar atau tidak memiliki tanggungan atau denda.

SELECT * FROM pengembalian

DELIMITER//
CREATE PROCEDURE total_denda (
	IN id_anggota VARCHAR (10)
)
BEGIN
	DECLARE jumlah_denda DECIMAL (10,2);
	
	IF ((SELECT SUM(DENDA)FROM pengembalian WHERE IdAnggota = id_anggota ) IS NOT NULL) THEN
		SET jumlah_denda = (SELECT SUM(DENDA)FROM pengembalian WHERE IdAnggota = id_anggota);
	ELSE 
		SET jumlah_denda = 'Anda tidak mendapatkan denda';
	END IF;
	
	
	SELECT jumlah_denda;
END //
DELIMITER;

CALL total_denda('A001');


-- 4. Buatlah Stored Procedure Looping untuk mencetak data peminjaman 1 sampai dengan 10

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

CALL cetakpeminjaman(10)

SELECT * FROM peminjaman

-- no.5 Hapuslah anggota dengan jenis kelamin Laki-laki dari basis data PERPUSTAKAAN. Akan tetapi jika anggota tersebut 
-- mempunyai status pinjam tidak nol, maka anggota tidak boleh dihapus dari basis data!

DELIMITER //
CREATE PROCEDURE hapus (
	IN jk VARCHAR (20)
)
BEGIN
	IF jk = 'Laki-laki' THEN DELETE FROM anggota WHERE Jenis_Kelamin = 'Laki-laki' 
	AND Status_Pinjam = '0';
	END IF;
END //
DELIMITER;

CALL hapus ('Laki-laki');

SELECT * FROM anggota;

DROP PROCEDURE hapus



