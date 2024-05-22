USE tugasdua;

-- nomor 1

-- buat terlebih dahulu kolom baru (alamat, hobi)
ALTER TABLE `anggota`
ADD COLUMN `Alamat` VARCHAR(100) DEFAULT NULL,
ADD COLUMN `Hobi` VARCHAR(50) DEFAULT NULL;

-- isi data untuk kolom baru
UPDATE `anggota` SET `Alamat` = 'Jalan Merdeka 1', `Hobi` = 'Membaca' WHERE `IdAnggota` = 'A0011';
UPDATE `anggota` SET `Alamat` = 'Jalan Pemuda 2', `Hobi` = 'Bersepeda' WHERE `IdAnggota` = 'A0022';
UPDATE `anggota` SET `Alamat` = 'Jalan Kartini 3', `Hobi` = 'Menulis' WHERE `IdAnggota` = 'A003';
UPDATE `anggota` SET `Alamat` = 'Jalan Diponegoro 4', `Hobi` = 'Memasak' WHERE `IdAnggota` = 'A004';
UPDATE `anggota` SET `Alamat` = 'Jalan Sudirman 5', `Hobi` = 'Fotografi' WHERE `IdAnggota` = 'A005';
UPDATE `anggota` SET `Alamat` = 'Jalan Sudirman 6', `Hobi` = 'olahraga' WHERE `IdAnggota` = 'A006';


-- buat stored procedurenya
DELIMITER //

CREATE PROCEDURE `sp_biodata_anggota` ()
BEGIN
    SELECT 
        `IdAnggota` AS `NIM`,
        `Nama_Anggota` AS `Nama`,
        `Alamat`,
        `No_Telp` AS `No_Telepon`,
        `Jenis_Kelamin`,
        `Hobi`,
        YEAR(CURDATE()) - YEAR(`Tanggal_Lahir_Anggota`) - 
        (DATE_FORMAT(CURDATE(), '%m%d') < DATE_FORMAT(`Tanggal_Lahir_Anggota`, '%m%d')) AS `Umur`
    FROM 
        `anggota`;
END //

DELIMITER ;
SELECT * FROM anggota
CALL `sp_biodata_anggota`;



-- nomor dua

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



-- nomor tiga

-- menambahkan tabel denda
ALTER TABLE `pengembalian`
ADD COLUMN `Status_Denda` ENUM('Belum Dibayar', 'Sudah Dibayar') DEFAULT 'Belum Dibayar';

-- menambahkan data untuk kolom denda
UPDATE `pengembalian` SET `Denda` = '5000', `Status_Denda` = 'Belum Dibayar' WHERE `Kode_Kembali` = 'PK001';
UPDATE `pengembalian` SET `Denda` = '10000', `Status_Denda` = 'Belum Dibayar' WHERE `Kode_Kembali` = 'PK002';
UPDATE `pengembalian` SET `Denda` = '0', `Status_Denda` = 'Sudah Dibayar' WHERE `Kode_Kembali` = 'PK003';

-- membuat stored procedure
DELIMITER //

CREATE PROCEDURE `sp_periksa_denda` (IN `p_IdAnggota` VARCHAR(10))
BEGIN
    DECLARE `totalDenda` INT;

    -- Menghitung total denda yang belum dibayarkan
    SELECT SUM(`Denda`) INTO `totalDenda`
    FROM `pengembalian`
    WHERE `IdAnggota` = `p_IdAnggota` AND `Status_Denda` = 'Belum Dibayar';

    -- Jika ada denda yang belum dibayarkan
    IF `totalDenda` > 0 THEN
        SELECT 
            `pengembalian`.`Kode_Kembali`,
            `pengembalian`.`IdAnggota`,
            `anggota`.`Nama_Anggota`,
            `pengembalian`.`Kode_Buku`,
            `buku`.`Judul_Buku`,
            `pengembalian`.`Tgl_Pinjam`,
            `pengembalian`.`Tgl_Kembali`,
            `pengembalian`.`Denda`,
            `pengembalian`.`Status_Denda`
        FROM 
            `pengembalian`
        JOIN 
            `anggota` ON `pengembalian`.`IdAnggota` = `anggota`.`IdAnggota`
        JOIN 
            `buku` ON `pengembalian`.`Kode_Buku` = `buku`.`Kode_Buku`
        WHERE 
            `pengembalian`.`IdAnggota` = `p_IdAnggota` AND `pengembalian`.`Status_Denda` = 'Belum Dibayar';
    ELSE
        -- Jika tidak ada denda yang belum dibayarkan
        SELECT CONCAT(`anggota`.`Nama_Anggota`, ' tidak memiliki denda') AS `Pesan`
        FROM `anggota`
        WHERE `IdAnggota` = `p_IdAnggota`;
    END IF;
END //

DELIMITER ;

-- contoh penggunaan sp untuk mahasiswa yang memiliki denda
CALL `sp_periksa_denda`('A003');
-- contoh penggunaan sp untuk mahasiswa yang tidak memiliki denda
CALL `sp_periksa_denda`('A004');



-- nomor empat
SELECT * FROM peminjaman
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



-- nomor lima 
DELIMITER //

CREATE PROCEDURE hapus(IN jns_kelamin VARCHAR(20))
BEGIN
    IF jns_kelamin = 'Laki-laki' THEN
        DELETE FROM anggota WHERE jenis_kelamin = 'Laki-laki' AND Status_Pinjam != 'pinjam';
    END IF;
END //

DELIMITER ;

SELECT * FROM anggota;
CALL hapus ('Laki-laki');
DROP PROCEDURE hapus
SELECT * FROM anggota;