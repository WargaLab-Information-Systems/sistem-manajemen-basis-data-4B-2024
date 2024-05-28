USE db_perpustakaan

-- soal 1 (mengetahui umur buku jika di lihat dari tahun penerbitan buku) 

DELIMITER //
CREATE PROCEDURE umur_buku()
BEGIN
     SELECT id_buku, judul_buku, tahun_buku AS tahun_terbit, YEAR(CURDATE())-tahun_buku AS usia_buku
     FROM buku;
END //
DELIMITER ;

CALL umur_buku();

-- soal 2 

CALL hapus_data_buku();
DROP PROCEDURE hapus_data_buku

DELIMITER //
CREATE PROCEDURE hapus_data_buku()
BEGIN 
     DELETE FROM bukku WHERE tahun_buku < 2000
     AND penerbit_buku != 'Andi Publisher';
END //
DELIMITER //

CALL hapus_data_buku();

SELECT * FROM bukku

-- soal no 3

DELIMITER //
CREATE PROCEDURE peminjaman_buku(IN id_bukku VARCHAR (10), IN jumlah VARCHAR (5))
BEGIN
UPDATE buku SET jumlah_buku = jumlah_buku - jumlah WHERE id_buku = id_bukku;
END //
DELIMITER //

CALL peminjaman_buku('1110', '5');
SELECT * FROM buku

-- soal 4

DELIMITER //
CREATE PROCEDURE jumlah_peminjaman( IN id_anggota VARCHAR (10))
BEGIN
SELECT p.id_anggota, a.nama_anggota, COUNT(p.id_anggota)
AS jumlahbuku_dipinjam
FROM peminjaman p, anggota a
WHERE a.id_anggota = p.id_anggota AND p.id_anggota = id_anggota;
END //
DELIMITER //

CALL jumlah_peminjaman('3339');

-- SOAL NO 5 --
DROP PROCEDURE peminjaman_buku;

DROP DATABASE perrpustakaan;