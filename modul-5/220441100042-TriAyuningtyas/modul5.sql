USE perpustakaan

1.
DELIMITER//
CREATE PROCEDURE cek_buku(IN tahun_buku VARCHAR(10))
BEGIN
  SELECT kode_buku,(buku.tahun_buku) AS tahun_buku, YEAR(CURDATE()) - (buku.tahun_buku) AS lama_buku
  FROM buku;
END//
DELIMITER ;  

DROP PROCEDURE cek_buku
CALL cek_buku('');

SELECT * FROM buku

2.
DELIMITER //
CREATE PROCEDURE Delete_Buku()
BEGIN
    -- Menghapus baris dari tabel peminjaman yang merujuk pada buku yang akan dihapus
    DELETE FROM peminjaman WHERE kode_buku IN (
        SELECT kode_buku FROM buku WHERE tahun_buku < 2000 AND penerbit_buku != 'AndhiPublisher');

    -- Menghapus baris-baris yang memenuhi kondisi dari tabel buku
    DELETE FROM buku WHERE tahun_buku < 2000 AND penerbit_buku != 'AndhiPublisher';
END //
DELIMITER;

DROP PROCEDURE Delete_Buku
CALL Delete_Buku();
SELECT * FROM buku

SET FOREIGN_KEY_CHECKS = 0

3. peminjaman (berkurang)

DELIMITER //
CREATE PROCEDURE peminjaman_buku(IN kodebuku_pinjam VARCHAR (10), IN jumlah VARCHAR (5))
BEGIN
UPDATE buku SET jumlah_buku = jumlah_buku - jumlah WHERE kode_buku = kodebuku_pinjam;
END //
DELIMITER //

CALL peminjaman_buku('11', '2');

3. pengembalian (bertambah)

DELIMITER //
CREATE PROCEDURE kembalian_buku(IN kodebuku_pinjam VARCHAR (10), IN jumlah VARCHAR (5))
BEGIN
UPDATE buku SET jumlah_buku = jumlah_buku + jumlah WHERE kode_buku = kodebuku_pinjam;
END //
DELIMITER //

CALL kembalian_buku('11','5');
SELECT * FROM buku

4.
DELIMITER //
CREATE PROCEDURE jumlah_peminjaman(IN id_anggota VARCHAR(10))
BEGIN
    SELECT id_anggota, COUNT(id_anggota) AS jumlahbuku_dipinjam
    FROM peminjaman
    WHERE id_anggota = id_anggota
    GROUP BY id_anggota;
END //
DELIMITER ;

CALL jumlah_peminjaman('102');
SELECT * FROM peminjaman

5.
DROP PROCEDURE cek_buku;
DROP PROCEDURE Delete_Buku;
DROP PROCEDURE peminjaman_buku;
DROP PROCEDURE kembalian_buku;
DROP PROCEDURE jumlah_peminjaman;






