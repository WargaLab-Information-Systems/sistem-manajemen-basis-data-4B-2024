-- 1
DELIMITER //
CREATE PROCEDURE SP_cekUmurBuku() 
BEGIN
	SELECT Kode_Buku, Judul_Buku, YEAR(CURDATE()) - Tahun_Buku AS umur_buku FROM buku;
END//
DELIMITER;

CALL SP_cekUmurBuku;

-- 2
DELIMITER //
CREATE PROCEDURE SP_deleteBookUnder2000() 
BEGIN
	SET FOREIGN_KEY_CHECKS=0;
	DELETE FROM buku WHERE Tahun_Buku < '2000' AND Penerbit_Buku != 'AndhiPublisher';
	SET FOREIGN_KEY_CHECKS=1;
END//
DELIMITER;

CALL SP_deleteBookUnder2000;

INSERT INTO buku VALUES 
('B003', 'Programing', 'Saipul', 'Penerbit C', '1998', '11', 'Tersedia', 'Teknologi'),
('B006', 'Programing', 'Saipul', 'Penerbit C', '1996', '11', 'Tersedia', 'Teknologi');

-- 3
DELIMITER //
CREATE PROCEDURE SP_pinjamBuku (
	IN kode_peminjaman VARCHAR(10),
	IN id_anggota VARCHAR (10),
	IN id_petugas VARCHAR(10),
	IN tanggal_pinjam DATE,
	IN tanggal_kembali DATE,
	IN kode_buku VARCHAR(10)
)
	BEGIN
		DECLARE total_buku INT;
		
		SELECT Jumlah_Buku INTO total_buku FROM buku WHERE Kode_Buku = kode_buku LIMIT 1;
		
		INSERT INTO peminjaman VALUES (kode_peminjaman, id_anggota, id_petugas, tanggal_pinjam, tanggal_kembali, kode_buku);
		UPDATE buku SET Jumlah_Buku = total_buku - 1 WHERE Kode_Buku = kode_buku LIMIT 1;
	END //
DELIMITER;

CALL SP_pinjamBuku('PJ018', 'A002', 'P001', '2024-05-13', '2024-05-20', 'B001');

DELIMITER //
CREATE PROCEDURE SP_mengembalikanBuku (
	IN kode_pengembalian VARCHAR(10),
	IN id_anggota VARCHAR (10),
	IN id_petugas VARCHAR(10),
	IN tanggal_pinjam DATE,
	IN tanggal_kembali DATE,
	IN kode_buku VARCHAR(10),
	IN denda VARCHAR (15)
)
	BEGIN
		DECLARE total_buku INT;
		
		SELECT Jumlah_Buku INTO total_buku FROM buku WHERE Kode_Buku = kode_buku LIMIT 1;
		
		INSERT INTO pengembalian VALUES (kode_pengembalian, id_anggota, kode_buku, id_petugas, tanggal_pinjam, tanggal_kembali, denda);
		UPDATE buku SET Jumlah_Buku = total_buku + 1 WHERE Kode_Buku = kode_buku LIMIT 1;
	END //
DELIMITER;

CALL SP_mengembalikanBuku('PK013', 'A002', 'P001', '2024-05-10', '2024-05-13', 'B001', '0');

-- 4
DELIMITER //
CREATE PROCEDURE SP_jumlahBukuDipinjam( IN id_anggota VARCHAR (10))
BEGIN
	SELECT a.IdAnggota, a.Nama_Anggota, COUNT(p.IdAnggota) AS jumlah_buku_dipinjam
	FROM anggota a 
	JOIN peminjaman p
	ON a.IdAnggota = p.IdAnggota
	WHERE p.IdAnggota = id_anggota
	GROUP BY p.IdAnggota;
END //
DELIMITER //

CALL SP_jumlahBukuDipinjam('A003');

-- 5
DELIMITER //
CREATE PROCEDURE SP_dropAllProcedure()
BEGIN
	DROP PROCEDURE SP_cekUmurBuku;
	DROP PROCEDURE SP_deleteBookUnder2000;
	DROP PROCEDURE SP_pinjamBuku;
	DROP PROCEDURE SP_mengembalikanBuku;
	DROP PROCEDURE SP_jumlahBukuDipinjam;
END //
DELIMITER //