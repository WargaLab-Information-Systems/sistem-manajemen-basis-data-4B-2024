praktikum 5//
1//
DELIMITER //

CREATE PROCEDURE HitungUmurBukuu(
    IN KodeBukuInput VARCHAR(10),
    OUT UmurBuku INT
)
BEGIN
    DECLARE TahunPenerbit INT;
    -- Mengambil tahun penerbitan buku
    SELECT CAST(tahun_buku AS SIGNED) INTO TahunPenerbit
    FROM buku
    WHERE kode_buku = KodeBukuInput;
    
    -- Memastikan tahun penerbit tidak NULL
    IF TahunPenerbit IS NOT NULL THEN
        -- Menghitung umur buku
        SET UmurBuku = YEAR(CURRENT_DATE()) - TahunPenerbit;
    ELSE
        -- Mengatur nilai default jika tahun penerbit tidak ditemukan
        SET UmurBuku = NULL;
    END IF;
END //

DELIMITER ;

CALL HitungUmurBukuu('B003', @UmurBuku);
SELECT @UmurBuku AS 'Umur_Buku_dalam_Tahun';



-- Memeriksa data di tabel buku
SELECT * FROM buku;

2//
DELIMITER //
CREATE PROCEDURE DeleteBukuLama()
BEGIN
    DELETE FROM peminjaman WHERE Kode_Buku IN (SELECT Kode_Buku FROM buku WHERE Tahun_Buku  < 2000 AND Penerbit_Buku != 'AndhiPublisher');
        DELETE FROM buku WHERE Tahun_Buku < 2000 AND Penerbit_Buku != 'AndhiPublisher';
    END//
DELIMITER ;
CALL DeleteBukuLama();
SELECT * FROM buku

3//
DELIMITER //
CREATE PROCEDURE UpdateJumlahBuku(IN kodebuku VARCHAR(100), IN Jenis_Transaksi VARCHAR(10))
BEGIN
-- jika transaksi termasuk peminjaman maka jml buku dikurangi 1--
    IF Jenis_Transaksi = 'peminjaman' THEN
        UPDATE buku SET Jumlah_Buku = Jumlah_Buku - 1 WHERE Kode_Buku = kodebuku;
-- jika transaksi termasuk pengembalian maka jml buku ditambah 1--
    ELSEIF Jenis_Transaksi = 'pengembalian' THEN
        UPDATE buku SET Jumlah_Buku = Jumlah_Buku + 1 WHERE Kode_Buku = kodebuku;
    END IF;
END//
DELIMITER ;
CALL UpdateJumlahBuku('B102', 'peminjaman');
CALL UpdateJumlahBuku('B001', 'peminjaman');
CALL UpdateJumlahBuku('B004', 'peminjaman');
CALL UpdateJumlahBuku('B003', 'peminjaman');
CALL UpdateJumlahBuku('B004', 'pengembalian');
CALL UpdateJumlahBuku('B003', 'pengembalian');
SELECT * FROM buku
SELECT * FROM peminjaman

4//
DELIMITER //

CREATE PROCEDURE JumlahBukuDipinjammm(
    IN anggota_id VARCHAR(250), 
    OUT JumlahBukuPinjam INT
)
BEGIN
    DECLARE jumlahPeminjaman INT;
    DECLARE jumlahPengembalian INT;
    
    -- Menghitung jumlah peminjaman
    SELECT COUNT(*) INTO jumlahPeminjaman 
    FROM peminjaman 
    WHERE id_anggota = anggota_id;
    
    -- Menghitung jumlah pengembalian
    SELECT COUNT(*) INTO jumlahPengembalian 
    FROM pengembalian 
    WHERE id_anggota = anggota_id; 
    
    -- Menghitung jumlah buku yang masih dipinjam
    SET JumlahBukuPinjam = jumlahPeminjaman - jumlahPengembalian;
END //

DELIMITER ;
-------------------------------------------------

CALL JumlahBukuDipinjammm('A001', @Jumlah_Buku_Pinjam);
SELECT @Jumlah_Buku_Pinjam AS 'Jumlah Buku Dipinjam';

-- Memanggil prosedur untuk anggota 
CALL JumlahBukuDipinjammm('A001', @Jumlah_Buku_Pinjam);
SELECT @Jumlah_Buku_Pinjam AS 'Jumlah Buku Dipinjam';

CALL JumlahBukuDipinjammm('A004', @Jumlah_Buku_Pinjam);
SELECT @Jumlah_Buku_Pinjam AS 'Jumlah Buku Dipinjam';

CALL JumlahBukuDipinjammm('A001', @Jumlah_Buku_Pinjam);
SELECT @Jumlah_Buku_Pinjam AS 'Jumlah Buku Dipinjam';


-- Memeriksa data di tabel peminjaman
SELECT * FROM peminjaman;

-- Memeriksa data di tabel pengembalian
SELECT * FROM pengembalian;

SELECT * FROM buku

5//
DROP PROCEDURE HitungUmurBuku
DROP PROCEDURE DeleteBukuLama
DROP PROCEDURE UpdateJumlahBuku
DROP PROCEDURE JumlahBukuDipinjam

CREATE DATABASE praktikum5;
USE praktikum5

CREATE TABLE buku (
kode_buku VARCHAR (10) PRIMARY KEY,
judul_buku VARCHAR (25) NOT NULL ,
pengarang_buku VARCHAR (30) NOT NULL,
penrbit_buku VARCHAR (30) NOT NULL,
tahun_buku VARCHAR (10) NOT NULL ,
jumlah_buku VARCHAR (5) NOT NULL ,
status_buku VARCHAR (10) NOT NULL,
klasifikasi_buku VARCHAR (20) NOT NULL
);

INSERT INTO buku (kode_buku, judul_buku, pengarang_buku, penrbit_buku, tahun_buku, jumlah_buku, status_buku, klasifikasi_buku) VALUES
('B001', 'The Hobbit', 'J.R.R. Tolkien', 'Allen & Unwin', '1937', '50', 'Available', 'Fantasy'),
('B002', 'Pride and Prejudice', 'Jane Austen', 'T. Egerton, Whitehall', '1813', '40', 'Available', 'Classic'),
('B003', 'The Hunger Games', 'Suzanne Collins', 'Scholastic Corporation', '2008', '65', 'Available', 'Dystopian'),
('B004', 'The Da Vinci Code', 'Dan Brown', 'Doubleday', '2003', '55', 'Available', 'Thriller'),
('B005', 'The Alchemist', 'Paulo Coelho', 'HarperCollins', '1988', '70', 'Available', 'Philosophical Fiction');
SELECT * FROM buku ;

CREATE TABLE petugas (
    id_petugas VARCHAR(10) PRIMARY KEY,
    username VARCHAR(15) NOT NULL,
    paswordd VARCHAR(15) NOT NULL,
    nama VARCHAR(25) NOT NULL
);

INSERT INTO petugas (id_petugas, username, paswordd, nama) VALUES
('P001', 'john_doe', 'password123', 'John Doe'),
('P002', 'jane_smith', 'qwerty', 'Jane Smith'),
('P003', 'admin', 'admin123', 'Administrator'),
('P004', 'petugas1', '123456', 'Petugas Satu'),
('P005', 'petugas2', 'password', 'Petugas Dua');


CREATE TABLE anggota (
id_anggota VARCHAR (10) PRIMARY KEY ,
nama_anggota VARCHAR (20) NOT NULL,
angkatan_anggota VARCHAR (6) NOT NULL,
tempat_lahir_anggota VARCHAR (20) NOT NULL,
tanggal_lahir_anggota DATE NOT NULL,
no_telp INT (12) NOT NULL,
jenis_kelamin VARCHAR (15) NOT NULL,
status_pinjam VARCHAR (15) NOT NULL
);
INSERT INTO anggota (id_anggota, nama_anggota, angkatan_anggota, tempat_lahir_anggota, tanggal_lahir_anggota, no_telp, jenis_kelamin, status_pinjam) VALUES
('A001', 'Andi', '2020', 'Jakarta', '2000-05-15', 1234567890, 'Laki-laki', 'Tidak meminjam'),
('A002', 'Budi', '2019', 'Surabaya', '1999-10-20', 9876543210, 'Laki-laki', 'Tidak meminjam'),
('A005', 'Eka', '2022', 'Semarang', '2002-12-05', 3698521470, 'Laki-laki', 'Tidak meminjam');


CREATE TABLE peminjaman (
kode_peminjaman VARCHAR (10) PRIMARY KEY ,
id_anggota VARCHAR (10) NOT NULL ,
id_petugas VARCHAR (10) NOT NULL ,
tanggal_pinjam DATE NOT NULL ,
tanggal_kembali DATE NOT NULL ,
kode_buku VARCHAR (10) NOT NULL
);
INSERT INTO peminjaman (kode_peminjaman, id_anggota, id_petugas, tanggal_pinjam, tanggal_kembali, kode_buku) VALUES
('P001', 'A001', 'P0001', '2022-05-01', '2022-05-08', 'B001'),
('P002', 'A002', 'P002', '2022-05-02', '2022-05-09', 'B002'),
('P003', 'A003', 'P003', '2022-05-03', '2022-05-10', 'B003'),
('P004', 'A004', 'P004', '2022-05-04', '2022-05-11', 'B004'),
('P005', 'A005', 'P005', '2022-05-05', '2022-05-12', 'B005'),
('P006', 'A001', 'P0021', '2022-05-01', '2022-05-08', 'B001'),
('P007', 'A002', 'P002', '2022-05-02', '2022-05-09', 'B002'),
('P008', 'A003', 'P003', '2022-05-03', '2022-05-10', 'B003'),
('P009', 'A004', 'P004', '2022-05-04', '2022-05-11', 'B004'),
('P0010', 'A005', 'P005', '2022-05-05', '2022-05-12', 'B005'),
('P011', 'A005', 'P005', '2022-05-05', '2022-05-12', 'B005');


CREATE TABLE pengembalian (
kode_kembali VARCHAR (10) PRIMARY KEY ,
id_anggota VARCHAR (10) NOT NULL ,
kode_buku VARCHAR (10) NOT NULL ,
id_petugas VARCHAR (10) NOT NULL ,
tanggal_pinjam DATE NOT NULL ,
tanggal_kembali DATE NOT NULL ,
denda VARCHAR (15) NOT NULL
);
INSERT INTO pengembalian (kode_kembali, id_anggota, kode_buku, id_petugas, tanggal_pinjam, tanggal_kembali, denda) VALUES
('K001', 'A001', 'B001', 'P001', '2022-05-01', '2022-05-08', '0'),
('K002', 'A002', 'B002', 'P002', '2022-05-02', '2022-05-09', '0'),
('K003', 'A003', 'B003', 'P003', '2022-05-03', '2022-05-10', '0'),
('K004', 'A004', 'B004', 'P004', '2022-05-04', '2022-05-11', '0'),
('K005', 'A005', 'B005', 'P005', '2022-05-05', '2022-05-12', '0');
