USE perpustakaan;


## NO 1
DELIMITER// 
CREATE PROCEDURE anggota(IN id VARCHAR(100))
BEGIN
     SELECT*FROM anggota
     WHERE id = id_anggota;
END//
DELIMITER;

CALL anggota('1015');


##NO 2
DELIMITER//
CREATE PROCEDURE peminjaman(IN idpeminjaman VARCHAR(100))
BEGIN
     SELECT*FROM peminjaman
     WHERE idpeminjaman = kode_peminjaman;
END//
DELIMITER;

CALL peminjaman('PJ04');

##NO 3
DELIMITER//
CREATE PROCEDURE jdlPengarang(IN judul VARCHAR(25), IN pengarang VARCHAR(30))
BEGIN
     SELECT*FROM buku
     WHERE judul_buku = judul AND pengarang_buku = pengarang;
END//
DELIMITER;

CALL jdlPengarang('Matahari', 'Tere Liye');


##NO 4
DELIMITER//
CREATE PROCEDURE book(IN Penerbit VARCHAR(100), IN Tahun VARCHAR(100), IN Statuss VARCHAR(100))
BEGIN
     SELECT * FROM buku
     WHERE Penerbit = penerbit_buku AND Tahun = tahun_buku AND Statuss = status_buku;
END//
DELIMITER;

CALL book('Republika', '2004', 'Baru');


##NO 5
DELIMITER//
CREATE PROCEDURE tambahAnggota (
	IN id_anggota VARCHAR (10),
	IN nama_anggota VARCHAR (20),
	IN angkatan_anggota VARCHAR (6),
	IN tempat_lahir_anggota VARCHAR (20),
	IN tanggal_lahir_anggota DATE,
	IN no_telp INT (12),
	IN jenis_kelamin VARCHAR (15),
	IN status_pinjam VARCHAR (15))
	BEGIN 
		INSERT INTO anggota VALUES(id_anggota, nama_anggota, angkatan_anggota, tempat_lahir_anggota,
		 tanggal_lahir_anggota, no_telp, jenis_kelamin, status_pinjam);
	END//
DELIMITER;

CALL tambahAnggota('1020', 'Lina', '2019', 'Tuban', '2003-03-04', '08123336547', 'perempuan', 'pinjam');
CALL tambahAnggota('1021', 'Lia', '2020', 'Cirebon', '2004-07-12', '081375492834', 'perempuan', 'pinjam');
SELECT*FROM anggota;		

## NO 6
DELIMITER//
CREATE PROCEDURE getJumlahBuku(OUT jumlahBuku INT (3))
	BEGIN 
		SELECT COUNT(jumlah_buku) INTO jumlahBuku FROM buku;
	END//
DELIMITER//

CALL getJumlahBuku(@jumlahBuku);
SELECT @jumlahBuku;

## NO 7
DELIMITER //
CREATE PROCEDURE hitung_total_petugas(
    INOUT p_total_petugas INT
)
BEGIN
    SELECT COUNT(*) INTO p_total_petugas FROM petugas;
END //
DELIMITER ;

CALL hitung_total_petugas(@p_total_petugas);
SELECT @p_total_petugas