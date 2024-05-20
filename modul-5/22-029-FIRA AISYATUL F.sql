modul 5

USE db_perpustakaan
-- SOAL NO 1 (menghitung berapa lama anggota tersebut meminjam buku) -

DELIMITER //
CREATE PROCEDURE lama_pinjam()
BEGIN
    SELECT idAnggota, Tgl_Pinjam, Tgl_Kembali, DATEDIFF(tanggal_kembali, tanggal_pinjam) AS lama_peminjaman
    FROM peminjaman;
END //
DELIMITER ;

CALL lama_pinjam()

-- SOAL NO 2 (mendelete daftar buku  di bawah tahun 2000, penerbitnya AndhiPublisher tidak dapat di delete) --

DELIMITER //
CREATE PROCEDURE hapus_data_buku()
BEGIN 
     DELETE FROM buku WHERE tahun_buku < 2000
     AND penerbit_buku != 'Andi Publisher';
END //
DELIMITER //

CALL hapus_data_buku();
SELECT * FROM buku
INSERT  INTO buku(kode_buku,judul_buku,pengarang_buku,penerbit_buku,tahun_buku,jumlah_buku,status_buku,klasifikasi_buku) VALUES 

('bk-06','To Kill a Mockingbird','Harper Lee','J. B. Lippincott & Co.','1960','3','baik','Fiksi, Sastra Klasik'),


-- SOAL NO 3A  jika ada transaksi peminjaman berdasarkan kode buku dan umlah buku berkurang --

DELIMITER //
CREATE PROCEDURE peminjaman_buku(IN kodebuku_pinjam VARCHAR (10), IN jumlah VARCHAR (5))
BEGIN
UPDATE buku SET jumlah_buku = jumlah_buku - jumlah WHERE kode_buku = kodebuku_pinjam;
END //
DELIMITER //

CALL peminjaman_buku('8888', '8');
SELECT * FROM buku



-- SOAL NO 3B jika ada pengembalian buku dengan kode buku tertentu maka jumlah buku pada akan bertambah. --

DELIMITER //
CREATE PROCEDURE kembalian_buku(IN kodebuku_pinjam VARCHAR (10), IN jumlah VARCHAR (5))
BEGIN
UPDATE buku SET jumlah_buku = jumlah_buku + jumlah WHERE kode_buku = kodebuku_pinjam;
END //
DELIMITER //

CALL kembalian_buku('8888','3');

-- SOAL NO 4 mengetahui berapa jumlah buku yang dipinjam anggota--

DELIMITER //
CREATE PROCEDURE jumlah_peminjaman( IN id_anggota VARCHAR (10))
BEGIN
SELECT p.id_anggota, a.nama_anggota, COUNT(p.id_anggota)
AS jumlahbuku_dipinjam
FROM peminjaman p, anggota a
WHERE a.id_anggota = p.id_anggota AND p.id_anggota = id_anggota;
END //
DELIMITER //

CALL jumlah_peminjaman('1990');
SELECT * FROM peminjaman

-- SOAL NO 5 --
DROP PROCEDURE peminjaman_buku;

DROP DATABASE perrpustakaan;