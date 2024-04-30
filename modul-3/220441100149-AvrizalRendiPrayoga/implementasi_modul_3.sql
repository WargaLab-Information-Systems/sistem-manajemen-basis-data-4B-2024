-- 1 --
DELIMITER //
CREATE PROCEDURE getNamaAnggota (IN tgl_lahir DATE)
BEGIN
	SELECT * FROM anggota WHERE Tanggal_Lahir_Anggota = tgl_lahir;
END //
DELIMITER;

CALL getNamaAnggota('2000-01-01');


-- 2 --
DELIMITER //
CREATE PROCEDURE getAnggotaMeminjam (IN id_anggota VARCHAR(10))
BEGIN
	SELECT * FROM peminjaman
	WHERE IdAnggota = id_anggota;
END //
DELIMITER;

CALL getAnggotaMeminjam('A005');


-- 3 --
DELIMITER //
CREATE PROCEDURE getPetugasPengembalian (
IN tgl_kembali DATE, 
IN id_petugas VARCHAR(10)
	)
BEGIN
	SELECT p.IdPetugas, p.Nama, pj.Tanggal_Kembali
	FROM petugas p
	JOIN peminjaman pj
	ON p.IdPetugas = pj.IdPetugas
	WHERE p.IdPetugas = id_petugas AND pj.Tanggal_Kembali = tgl_kembali;
END //
DELIMITER;

CALL getPetugasPengembalian('2024-05-10', 'P002');



-- 4 --
DELIMITER //
CREATE PROCEDURE getBuku (
IN penerbit VARCHAR(30), 
IN tahun VARCHAR(10), 
IN stat VARCHAR(10)
	)
	BEGIN
		SELECT * FROM buku
		WHERE Penerbit_Buku = penerbit
		AND Tahun_Buku = tahun
		AND Status_Buku = stat;
	END //
DELIMITER;

CALL getBuku('Penerbit A', '2020', 'Tersedia');


-- 5 --
DELIMITER //
CREATE PROCEDURE insertToPetugas(
IN id_petugas VARCHAR(10),
IN username VARCHAR (15),
IN pass VARCHAR(15),
IN nama VARCHAR (25)
	)
	BEGIN
		INSERT INTO petugas VALUES (id_petugas, username, pass, nama);
	END //
DELIMITER;

CALL insertToPetugas('P007', 'petugas7', 'password7', 'Petugas Tujuh');


-- 6 --
DELIMITER //
CREATE PROCEDURE getTotalBuku (OUT total_buku INT)
	BEGIN
		SELECT COUNT(Kode_Buku) INTO total_buku FROM buku;
	END //
DELIMITER;

CALL getTotalBuku(@total_buku);
SELECT @total_buku;


-- 7 --
DELIMITER //
CREATE PROCEDURE getTotalBukuTersedia(
	OUT total_buku_tersedia INT,
	IN stat VARCHAR(10)
)
BEGIN
    SELECT COUNT(*) INTO total_buku_tersedia
    FROM buku
    WHERE Status_Buku = stat;
END //
DELIMITER ;

CALL getTotalBukuTersedia(@total_buku_tersedia, 'Tersedia');
SELECT @total_buku_tersedia AS Total_Buku_Tersedia;



DELIMITER //
CREATE PROCEDURE tambah_peminjaman (
	IN kode_peminjaman VARCHAR(10),
	IN id_anggota VARCHAR (10),
	IN id_petugas VARCHAR(10),
	IN tanggal_pinjam DATE,
	IN tanggal_kembali DATE,
	IN kode_buku VARCHAR(10)
)
	BEGIN
		INSERT INTO peminjaman VALUES (kode_peminjaman, id_anggota, id_petugas, tanggal_pinjam, tanggal_kembali, kode_buku);
		UPDATE anggota SET Status_Pinjam = 'Ya' WHERE IdAnggota = id_anggota;
	END //
DELIMITER;

CALL tambah_peminjaman('PJ017', 'A002', 'P001', '2024-04-30', '2024-05-05', 'B002');
