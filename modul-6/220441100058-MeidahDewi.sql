CREATE DATABASE perpustakaan2;

USE perpustakaan2;

CREATE TABLE petugas (
id_petugas VARCHAR (10) PRIMARY KEY,
username VARCHAR (15),
pasword VARCHAR (15),
nama VARCHAR (25));

CREATE TABLE anggota (
id_anggota VARCHAR (10) PRIMARY KEY,
nama_anggota VARCHAR (20),
angkatan_anggota VARCHAR (6),
tempat_lahir_anggota VARCHAR (20),
tanggal_lahir_anggota DATE,
no_telp INT (12),
jenis_kelamin VARCHAR (15),
status_pinjam VARCHAR (15));

CREATE TABLE buku (
kode_buku VARCHAR (10) PRIMARY KEY,
judul_buku VARCHAR (25),
pengarang_buku VARCHAR (30),
penerbit_buku VARCHAR (30),
tahun_buku VARCHAR (10),
jumlah_buku VARCHAR (10),
status_buku VARCHAR (10),
klasifikasi_buku VARCHAR (20));

CREATE TABLE peminjaman (
kode_peminjaman VARCHAR (10) PRIMARY KEY,
id_anggota VARCHAR (10),
id_petugas VARCHAR (10),
tanggal_pinjam DATE,
tanggal_kembali DATE,
kode_buku VARCHAR (15), 
FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas),
FOREIGN KEY(id_anggota) REFERENCES anggota(id_anggota),
FOREIGN KEY(kode_buku) REFERENCES buku(kode_buku)); 

CREATE TABLE pengembalian (
kode_kembali VARCHAR (10) PRIMARY KEY,
id_anggota VARCHAR (10),
kode_buku VARCHAR (10),
id_petugas VARCHAR (10),
tanggal_pinjam DATE,
tanggal_kembali DATE,
denda VARCHAR (15),
FOREIGN KEY(id_petugas) REFERENCES petugas(id_petugas),
FOREIGN KEY(id_anggota) REFERENCES anggota(id_anggota),
FOREIGN KEY(kode_buku) REFERENCES buku(kode_buku));

INSERT INTO petugas VALUES
('1000', 'petugas1', '0001', 'rafa'),
('2000', 'petugas2', '0002', 'farhan'),
('3000', 'petugas3', '0003', 'ryan'),
('4000', 'petugas4', '0004', 'tina'),
('5000', 'petugas5', '0005', 'bunga');

INSERT INTO anggota VALUES
('100', 'Rina', '2019', 'Tuban', '2000-10-12', '081276384723', 'Perempuan', 'pinjam'),
('101', 'Nathan', '2019', 'Jombang', '2000-11-20', '085647287345', 'Laki-Laki', 'pinjam'),
('102', 'Wulan', '2019', 'Kediri', '2002-03-28', '085273845176', 'Perempuan', 'tidak pinjam'),
('103', 'Mulyadi', '2020', 'Pasuruan', '2001-04-12', '081278365827', 'Laki-Laki', 'tidak pinjam'),
('104', 'Siti', '2019', 'Batu', '2003-07-12', '085467837292', 'Perempuan', 'pinjam'),
('105', 'Azizah', '2018', 'Surabaya', '2002-12-12', '085143785437', 'Perempuan', 'pinjam'),
('106', 'Nadia', '2021', 'Mojokerto', '2004-03-12', '082198456785', 'Perempuan', 'tidak pinjam'),
('107', 'Lili', '2019', 'Malang', '2000-01-01', '085475821384', 'Perempuan', 'tidak pinjam'),
('108', 'Rere', '2020', 'Bojonegoro', '2003-04-27', '085837193847', 'Perempuan', 'pinjam'),
('110', 'Roni', '2022', 'Sidoarjo', '2002-06-20', '085123847543', 'Laki-Laki', 'tidak pinjam');

INSERT INTO buku VALUES
('B1', 'Cantik Itu Luka', 'Andrea Hirata', 'Bentang Pustaka', '2006', '40', 'Baru', 'Baik'),
('B2', 'Cinta Di Dalam Gelas', 'Habiburrahman El Shirazy', 'Republika', '2004', '20', 'Baru', 'Baik'),
('B3', 'Keberangkatan', 'Dee Lestari', 'Bentang Pustaka', '2008', '45', 'Baru', 'Baik'),
('B4', 'Laut Bercerita', 'Andrea Hirata', 'Bentang Pustaka', '2005', '30', 'Baru', 'Baik'),
('B5', 'The Notebook', 'Pramoedya Ananta Toer', 'Hasta Mitra', '1980', '35', 'Baru', 'Baik'),
('B6', 'Bumi Manusia', 'Hamka', 'Balai Pustaka', '1938', '25', 'Baru', 'Baik'),
('B7', 'Kambing Jantan', 'Tere Liye', 'Gramedia Pustaka Utama', '2015', '50', 'Baru', 'Baik'),
('B8', 'Manusia Kamar', 'Ahmad Tohari', 'Gramedia Pustaka Utama', '1999', '10', 'Baru', 'Baik'),
('B9', 'Wingit', 'Ahmad Fuadi', 'Gramedia Pustaka Utama', '2009', '15', 'Baru', 'Baik'),
('B10', 'Cinta Brontosaurus', 'Raditya Dika', 'Andi Publisher', '1998', '5', 'Baru', 'Baik');


 INSERT INTO peminjaman VALUES 
 ('P01', '101', '1000', '2024-03-10', '2024-03-20', 'B5'),
 ('P02', '108', '2000', '2024-03-01', '2024-03-19', 'B2'),
 ('P03', '100', '3000', '2024-03-10', '2024-03-20', 'B5'),
 ('P04', '108', '3000', '2024-03-16', '2024-03-27', 'B10'),
 ('P05', '101', '3000', '2024-03-10', '2024-03-20', 'B1'),
 ('PO6', '105', '3000', '2024-03-10', '2024-03-20', 'B4'),
 ('P07', '104', '3000', '2024-03-10', '2024-03-20', 'B1'),
 ('P08', '108', '3000', '2024-03-10', '2024-03-20', 'B5'),
 ('P09', '108', '4000', '2024-03-08', '2024-03-17', 'B3'),
 ('P10', '108', '5000', '2024-03-12', '2024-03-22', 'B7');
 
 INSERT INTO pengembalian VALUES
 ('K01', '108', 'B5', '1000', '2024-03-10', '2024-03-20', '10000'),
 ('K02', '108', 'B5', '2000', '2024-03-01', '2024-03-19', '0'),
 ('K03', '108', 'B5', '3000', '2024-03-10', '2024-03-20', '0'),
 ('K04', '108', 'B10', '3000', '2024-03-16', '2024-03-27', '0'),
 ('K05', '108', 'B5', '3000', '2024-03-10', '2024-03-20', '0'),
 ('KO6', '108', 'B4', '3000', '2024-03-10', '2024-03-20', '20000'),
 ('K07', '108', 'B5', '3000', '2024-03-10', '2024-03-20', '15000'),
 ('K08', '108', 'B5', '3000', '2024-03-10', '2024-03-20', '0'),
 ('K09', '109', 'B3', '4000', '2024-03-08', '2024-03-17', '10000'),
 ('K10', '105', 'B7', '5000', '2024-03-12', '2024-03-22', '10000');
 
-- no.1 
DELIMITER //
CREATE PROCEDURE biodatadiri (
    IN pnama VARCHAR (50), 
    IN pnrp VARCHAR (20),
    IN palamat VARCHAR (50), 
    IN ptgl_lahir DATE,
    IN pjenis_kelamin VARCHAR(10), 
    IN pumur INT (5),
    IN phobi VARCHAR (50), 
    IN pno_telp VARCHAR(15)
)
BEGIN
    DECLARE nama VARCHAR (50);
    DECLARE nrp VARCHAR(20);
    DECLARE alamat VARCHAR (50);
    DECLARE tgl_lahir DATE;
    DECLARE jenis_kelamin VARCHAR(10);
    DECLARE umur INT (5);
    DECLARE hobi VARCHAR (50);
    DECLARE no_telp VARCHAR(15);
    
    SET nama = pnama;
    SET nrp = pnrp;
    SET alamat = palamat;
    SET tgl_lahir = ptgl_lahir;
    SET jenis_kelamin = pjenis_kelamin;
    SET umur = TIMESTAMPDIFF(YEAR, ptgl_lahir, CURDATE());
    SET hobi = phobi;
    SET no_telp = pno_telp;
    
    SELECT 
        nama AS Nama_Mahasiswa, 
        nrp AS NIM, 
        alamat AS Alamat, 
        tgl_lahir AS Tgl_lahir,
        jenis_kelamin AS Gender, 
        umur AS Usia, 
        hobi AS Hobi, 
        no_telp AS No_Tlp;
END //
DELIMITER ;

CALL biodatadiri ("Risma","220441100058","Sumenep","2003-10-25","Perempuan","20","Bernyanyi","088235878128");


## no 2
DELIMITER//
CREATE PROCEDURE peringatan()
BEGIN
     SELECT kode_kembali,id_anggota,tanggal_pinjam, tanggal_kembali, DATEDIFF(tanggal_kembali,tanggal_pinjam) AS lama_pinjam,
     CASE WHEN DATEDIFF(tanggal_kembali, tanggal_pinjam) <= 2 THEN 'Silahkan Pergunakan Buku'
     WHEN DATEDIFF(tanggal_kembali, tanggal_pinjam) BETWEEN 3 AND 5 THEN 'Ingat!!, Waktu Pinjam Segara Habis'
     WHEN DATEDIFF(tanggal_kembali, tanggal_pinjam) >= 6 THEN 'WARNING!!, Denda Menanti  Anda' END AS "Statusnya"
     FROM pengembalian ORDER BY lama_pinjam ASC;
END//
DELIMITER;
CALL peringatan();

## no 3
DELIMITER//
CREATE PROCEDURE denda ( 
	IN idanggota VARCHAR(10))
BEGIN 
DECLARE jumlah_denda VARCHAR (50);
	IF ((SELECT SUM(denda) FROM pengembalian WHERE id_anggota = idanggota) !=0) THEN 
		SET jumlah_denda = (SELECT SUM(denda) FROM pengembalian WHERE id_anggota=idanggota);
	ELSE 
		SET jumlah_denda = 'Anda tidak memiliki tanggungan/denda';
	END IF;
		SELECT jumlah_denda;
END//
DELIMITER;
CALL denda('109');

## no 4 
DELIMITER//
CREATE PROCEDURE cetak_pinjam (IN bil INT (10))
BEGIN
	DECLARE i INT;
	SET i = 1;
	WHILE i<= bil DO
		SELECT * FROM peminjaman LIMIT bil;
		SET i = i + 1;	
	END WHILE;
END//
DELIMITER;
CALL cetak_pinjam(10);

-- no.5
DELIMITER //
CREATE PROCEDURE hapusjeniskelamin (
    IN jenis_kel VARCHAR(20)
)
BEGIN 
    IF jenis_kel = 'Laki-Laki' THEN 

        DELETE FROM peminjaman 
        WHERE id_anggota IN (
            SELECT id_anggota FROM anggota 
            WHERE jenis_kelamin = 'Laki-Laki' AND status_pinjam != 'pinjam'
        );

        DELETE FROM pengembalian 
        WHERE id_anggota IN (
            SELECT id_anggota FROM anggota 
            WHERE jenis_kelamin = 'Laki-Laki' AND status_pinjam != 'pinjam'
        );
        DELETE FROM anggota
        WHERE jenis_kelamin = 'Laki-Laki' AND status_pinjam != 'pinjam';
    END IF;
END //
DELIMITER ;

CALL hapusjeniskelamin('Laki-Laki');
SELECT*FROM anggota;
