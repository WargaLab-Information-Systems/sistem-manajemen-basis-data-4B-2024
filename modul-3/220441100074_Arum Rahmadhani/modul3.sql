USE perpustakaan;

1. DELIMITER //
CREATE PROCEDURE tampilAnggota()
BEGIN 
	SELECT * FROM anggota;
END //
DELIMITER;

CALL tampilAnggota;

2. DELIMITER //
CREATE PROCEDURE lihatPBuku(IN pengarang CHAR (30))
BEGIN 
	SELECT * FROM buku
	WHERE pengarang_buku = pengarang;
END //
DELIMITER;

CALL lihatPBuku('AraChan');

3. DELIMITER //
CREATE PROCEDURE lihat_peminjaman(IN kode_anggota CHAR (10), IN tgl_pinjam DATE)
BEGIN
	SELECT * FROM peminjaman
	WHERE id_anggota = kode_anggota AND tanggal_pinjam = tgl_pinjam;
END //
DELIMITER;

CALL lihat_peminjaman('A002','2024-03-07');

4. DELIMITER //
CREATE PROCEDURE lihat_pengembalian(IN kode_angg CHAR (10), IN id_buku CHAR (10), IN penalti CHAR (15))
BEGIN
	SELECT * FROM pengembalian 
	WHERE id_anggota = kode_angg AND kode_buku = id_buku AND denda = penalti;
END //
DELIMITER;

CALL lihat_pengembalian('A007','B007','5000');

5. DELIMITER //
CREATE PROCEDURE tambah_petugas(
IN id_petugas CHAR (10), 
IN username CHAR (15),
IN PASSWORD CHAR (15),
IN nama CHAR (25))
BEGIN
	INSERT INTO petugas
	VALUES(id_petugas, username, PASSWORD, nama);
END //
DELIMITER;
 
CALL tambah_petugas('P011','petugas11','password11','Arman maulana');

6. DELIMITER //
CREATE PROCEDURE lihat_jmlhBuku(OUT jml_buku CHAR (5))
BEGIN
	SELECT COUNT(jumlah_buku)
	INTO jml_buku FROM buku;
END //
DELIMITER;

CALL lihat_jmlhBuku(@jml_buku);
SELECT @jml_buku;

7. DELIMITER //
CREATE PROCEDURE CountPeminjam(
    IN tgl_pinjam DATE,
    IN tgl_kembali DATE,
    OUT jumlah_peminjam INT
)
BEGIN
    SELECT COUNT(DISTINCT id_anggota)
    INTO jumlah_peminjam
    FROM peminjaman
    WHERE tanggal_pinjam BETWEEN tgl_pinjam AND tgl_kembali;
END //
DELIMITER ;

CALL CountPeminjam('2024-03-01', '2024-03-07', @jumlah_peminjam);
SELECT @jumlah_peminjam AS jumlah_peminjam;