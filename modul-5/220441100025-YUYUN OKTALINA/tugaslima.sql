-- satu
USE tugasdua;

DELIMITER //
CREATE PROCEDURE lama_pinjam()
BEGIN
-- menmapilkan berapa lamma peminjaman buku
    SELECT IdAnggota, Tanggal_Pinjam, Tanggal_Kembali, DATEDIFF(tanggal_kembali, tanggal_pinjam) AS lama_peminjaman
    FROM peminjaman;
END //
DELIMITER ;

CALL lama_pinjam()

DROP PROCEDURE lama_pinjam

-- Nomor Dua

USE tugasdua;

SELECT * FROM buku

-- tambahkan data buku (karena tidak ada AndhiPublisher dalam data buku)
INSERT INTO `buku`(`Kode_Buku`,`Judul_Buku`,`Pengarang_Buku`,`Penerbit_Buku`,`Tahun_Buku`,`Jumlah_Buku`,`Status_Buku`,`Klasifikasi_Buku`) 
VALUES 
('B008','Book3','Author3','AnotherPublisher','1995','10','Tersedia','Klasifikasi3');


-- buat prosedurnya
DELIMITER //

CREATE PROCEDURE DeleteBukuLama()
BEGIN 
-- menghapus buku dengan tahun dibawah 2000 kecuali penerbit andhipublisher
    DELETE FROM buku 
    WHERE Tahun_Buku < 2000
    AND Penerbit_Buku != 'AndhiPublisher';
END //

DELIMITER ;



CALL DeleteBukuLama();
SELECT * FROM buku

-- Nomor Tiga

SELECT* FROM buku
-- SOAL NO 3A  jika ada transaksi peminjaman berdasarkan kode buku dan umlah buku berkurang --

DELIMITER //
CREATE PROCEDURE peminjaman_buku(IN kodebuku_pinjam VARCHAR (10), IN jumlahbuku_pinjam VARCHAR (5))
BEGIN
UPDATE buku SET jumlah_buku = jumlah_buku - jumlahbuku_pinjam WHERE kode_buku = kodebuku_pinjam;
END //
DELIMITER //

CALL peminjaman_buku('B003', '6');
SELECT * FROM buku



-- SOAL NO 3B jika ada pengembalian buku dengan kode buku tertentu maka jumlah buku pada akan bertambah. --

DELIMITER //
CREATE PROCEDURE kembalian_buku(IN kodebuku_pinjam VARCHAR (10), IN jumlahbuku_pinjam VARCHAR (5))
BEGIN
UPDATE buku SET jumlah_buku = jumlah_buku + jumlahbuku_pinjam WHERE kode_buku = kodebuku_pinjam;
END //
DELIMITER //

CALL kembalian_buku('B003','10');
SELECT * FROM buku


-- Nomor Empat

SELECT * FROM peminjaman

DELIMITER //

CREATE PROCEDURE HitungBukuDipinjam(IN id_anggota VARCHAR(10), OUT buku_dipinjam INT)
BEGIN
    -- Variabel untuk menyimpan jumlah buku yang dipinjam dari peminjaman
    DECLARE dipinjam_dari_peminjaman INT DEFAULT 0;
    DECLARE dipinjam_dari_pengembalian INT DEFAULT 0;

    -- Menghitung jumlah buku yang dipinjam dari transaksi peminjaman
    SELECT COUNT(*) INTO dipinjam_dari_peminjaman FROM peminjaman WHERE IdAnggota = id_anggota;

    -- Menghitung jumlah buku yang dikembalikan dari transaksi pengembalian
    SELECT COUNT(*) INTO dipinjam_dari_pengembalian FROM pengembalian WHERE IdAnggota = id_anggota;

    -- Menyimpan jumlah total buku yang dipinjam
    SET buku_dipinjam = dipinjam_dari_peminjaman - dipinjam_dari_pengembalian;
END//





CALL HitungBukuDipinjam('A003', @buku_dipinjam);
SELECT @buku_dipinjam AS 'Jumlah_Buku_Dipinjam';
SELECT * FROM peminjaman




-- nomor 5 --
DROP PROCEDURE lama_pinjam
DROP PROCEDURE DeleteBukuLama
DROP PROCEDURE peminjaman_buku
DROP PROCEDURE kembalian_buku
DROP PROCEDURE HitungBukuDipinjam
