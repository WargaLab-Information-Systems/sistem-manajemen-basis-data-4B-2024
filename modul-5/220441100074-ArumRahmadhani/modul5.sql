USE perpustakaan2

1. --  Buatkanlah procedure dan lihatkan hasilnya untuk mengetahui umur buku
DELIMITER //
CREATE PROCEDURE LihatUmur_Buku(IN kode_buku CHAR(10))
BEGIN 
	DECLARE tahun_terbit INT;
	DECLARE umur_buku INT;
	
	SELECT tahun_buku INTO tahun_terbit FROM buku WHERE kode_buku = kode_buku LIMIT 1;
	
	SET umur_buku = YEAR(CURDATE()) - tahun_terbit;
	
	SELECT CONCAT('Umur buku untuk kode buku ', kode_buku, ' adalah ', umur_buku) AS Informasi_Lama_Pinjam;
END//
DELIMITER ;

CALL LihatUmur_Buku('B001');

-- membuat lama pinjam--
DELIMITER //
CREATE PROCEDURE LihatLama_Buku(IN kode_peminjaman CHAR(10))
BEGIN
	DECLARE tgl_peminjaman DATE;
	DECLARE lama_pinjam INT;
	
	SELECT tanggal_pinjam INTO tgl_peminjaman FROM peminjaman WHERE kode_peminjaman = kode_peminjaman LIMIT 1;
	
	SET lama_pinjam = DATEDIFF(CURDATE(), tgl_peminjaman);
	
	SELECT lama_pinjam;
	
	SELECT CONCAT('Lama peminjaman untuk kode peminjaman ', kode_peminjaman, ' adalah ', lama_pinjam, ' hari') AS Informasi_Lama_Pinjam;
END//
DELIMITER ;

CALL LihatLama_Buku('PM005');

2. -- Buatkan procedure untuk mendelete daftar buku yang tahun pembuatannya di bawah  tahun 2000
DELIMITER //
CREATE PROCEDURE HapusBuku_Kurangdri2000()
BEGIN
	DELETE FROM buku
	WHERE tahun_buku < 2000
	AND penerbit_buku != 'AndhiPublisher';
END//
DELIMITER ;

CALL HapusBuku_Kurangdri2000;

3. -- membuat perubahan data pada tabel buku
DELIMITER //
CREATE PROCEDURE Update_Jumlah_Buku(IN kode_buku CHAR(10))
BEGIN 
	DECLARE total_pinjam INT;
	DECLARE total_kembali INT;
	
	SELECT COUNT(kode_peminjaman) INTO total_pinjam FROM peminjaman WHERE kode_buku = kode_buku;
	SELECT COUNT(kode_kembali) INTO total_kembali FROM pengembalian WHERE kode_buku = kode_buku;
	
	UPDATE buku SET jumlah_buku = jumlah_buku - total_pinjam + total_kembali WHERE kode_buku = kode_buku;
	
	SELECT CONCAT('Jumlah buku dengan kode ', kode_buku, ' telah diperbarui!') AS Perubahan;
END//
DELIMITER ;

CALL Update_Jumlah_Buku('B007');

4. -- procedure untuk mengetahui berapa jumlah buku yang dipinjam
DELIMITER//
CREATE PROCEDURE LihatJmlbuku_Dipinjam(IN id_anggota CHAR(10))
BEGIN 
	DECLARE total_pinjam INT;
	DECLARE total_kembali INT;
	
	SELECT COUNT(*) INTO total_pinjam FROM peminjaman WHERE id_anggota = id_anggota;
	SELECT COUNT(*) INTO total_kembali FROM pengembalian WHERE id_anggota = id_anggota;
	
	SELECT CONCAT('Anggota dengan id ', id_anggota, ' meminjam buku sebanyak = ', total_pinjam - total_kembali) AS Cek_Peminjaman;
END //
DELIMITER;

CALL LihatJmlbuku_Dipinjam('A003');


5. -- menghapus stored procedure yang telah dibuat
DROP PROCEDURE LihatJmlbuku_Dipinjam;