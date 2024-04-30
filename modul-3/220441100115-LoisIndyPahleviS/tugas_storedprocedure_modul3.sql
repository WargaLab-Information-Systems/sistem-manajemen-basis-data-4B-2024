USE dbperpustakaan;

SELECT * FROM petugas;

SELECT * FROM buku;

SELECT * FROM anggota;

SELECT * FROM peminjaman;

SELECT * FROM pengembalian;

-- 1. Buatlah sebuah prosedur dengan menggunakan parameter IN default
DELIMITER //
CREATE PROCEDURE GetBukuByKlasifikasi(IN klasifikasi VARCHAR(20))
BEGIN
    SELECT Kode_Buku, Judul_Buku, Pengarang_Buku, Penerbit_Buku, Tahun_Buku, Jumlah_Buku, Status_Buku, Klasifikasi_Buku
    FROM buku
    WHERE Klasifikasi_Buku = klasifikasi;
END //
DELIMITER ;
CALL GetBukuByKlasifikasi('Novel');


-- 2. Definisikan stored procedure untuk mengetahui data pada salah satu table dengan berdasarkan pada salah satu atribut/field
DELIMITER //
CREATE PROCEDURE GetAnggotaByAngkatan(IN angkatan VARCHAR(6))
BEGIN
    SELECT IdAnggota, Nama_Anggota, Angkatan_Anggota, Tempat_Lahir_Anggota, Tanggal_Lahir_Anggota, No_Telp, Jenis_Kelamin, Status_Pinjam
    FROM anggota
    WHERE Angkatan_Anggota = angkatan;
END //
DELIMITER ;
CALL GetAnggotaByAngkatan('2018');


-- 3. Definisikan stored procedure untuk mengetahui data pada salah satu table dengan berdasarkan pada dua atribut/field
DELIMITER //
CREATE PROCEDURE GetPeminjamanByIdAnggotaDanKodeBuku(
    IN id_anggota VARCHAR(10),
    IN kode_buku VARCHAR(10)
)
BEGIN
    SELECT Kode_Peminjaman, IdAnggota, IdPetugas, Tanggal_Pinjam, Tanggal_Kembali, Kode_Buku
    FROM peminjaman
    WHERE IdAnggota = id_anggota AND Kode_Buku = kode_buku;
END //
DELIMITER ;
CALL GetPeminjamanByIdAnggotaDanKodeBuku('A101', 'B101');


-- 4. Definisikan stored procedure untuk mengetahui data pada salah satu table dengan berdasarkan pada tiga atribut/field
DELIMITER //
CREATE PROCEDURE GetPengembalianByIdAnggotaKodeBukuDenda(
    IN id_anggota VARCHAR(10),
    IN kode_buku VARCHAR(10),
    IN denda VARCHAR(15)
)
BEGIN
    SELECT Kode_Kembali, IdAnggota, Kode_Buku, IdPetugas, Tgl_Pinjam, Tgl_Kembali, Denda
    FROM pengembalian
    WHERE IdAnggota = id_anggota AND Kode_Buku = kode_buku AND Denda = denda;
END //
DELIMITER ;
CALL GetPengembalianByIdAnggotaKodeBukuDenda('A101', 'B101', 'Tidak');


-- 5. Definisikan stored procedure untuk memasukkan data pada salah satu table
DELIMITER //
CREATE PROCEDURE InsertPetugas(
    IN id_petugas VARCHAR(10),
    IN username VARCHAR(15),
    IN PASSWORD VARCHAR(15),
    IN nama VARCHAR(25)
)
BEGIN
    INSERT INTO petugas (IdPetugas, Username, PASSWORD, Nama)
    VALUES (id_petugas, username, PASSWORD, nama);
END //
DELIMITER ;
CALL InsertPetugas('P107', 'petugas107', 'pass20107', 'Rina Sulistiawati');
SELECT * FROM petugas;


-- 6. Definisikan stored procedure untuk mengetahui data pada salah satu table menggunakan parameter OUT
DELIMITER //
CREATE PROCEDURE GetJumlahBuku(
    OUT jumlah_buku INT
)
BEGIN
    SELECT COUNT(*) INTO jumlah_buku
    FROM buku;
END //
DELIMITER ;
SET @jumlah = 0;
CALL GetJumlahBuku(@jumlah);
SELECT @jumlah;


-- 7. Definisikan stored procedure untuk mengetahui data pada salah satu table menggunakan parameter INOUT
DELIMITER // 
CREATE PROCEDURE GetJumlahAnggotaByStatus(
    IN sp VARCHAR(15),
    OUT jml INT
)
BEGIN
    SELECT COUNT(*) INTO jml
    FROM anggota
    WHERE Status_Pinjam=sp;
END //
DELIMITER ;
CALL GetJumlahAnggotaByStatus("Meminjam",@jml);
SELECT @jml;
