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
('P1', 'petugas1', '111', 'ahmad'),
('P2', 'petugas2', '222', 'seila'),
('P3', 'petugas3', '333', 'barizi'),
('P4', 'petugas4', '444', 'neza'),
('P5', 'petugas5', '555', 'naila');


INSERT INTO anggota VALUES
('1010', 'Firda', '2018', 'Lamongan', '2000-10-12', '081276384723', 'Perempuan', 'Pinjam'),
('1011', 'Fajar', '2019', 'Jombang', '2000-11-20', '085647287345', 'Laki-laki', 'Pinjam'),
('1012', 'Hamdani', '2019', 'Malang', '2002-03-28', '085273845176', 'Laki-laki', 'Tidak Pinjam'),
('1013', 'Aulia', '2018', 'Pasuruan', '2001-04-12', '081278365827', 'Perempuan', 'Pinjam'),
('1014', 'Krisna', '2019', 'Batu', '2003-07-12', '085467837292', 'Laki-laki', 'Tidak Pinjam'),
('1015', 'Azizah', '2018', 'Surabaya', '2002-12-12', '085143785437', 'Perempuan', 'Pinjam'),
('1016', 'Ninda', '2019', 'Mojokerto', '2004-03-12', '082198456785', 'Perempuan', 'Pinjam'),
('1017', 'Linda', '2019', 'Kediri', '2000-01-01', '085475821384', 'Perempuan', 'Tidak Pinjam'),
('1018', 'Rendy', '2019', 'Bojonegoro', '2003-04-27', '085837193847', 'Laki-laki', 'Tidak Pinjam'),
('1019', 'Adit', '2018', 'Sidoarjo', '2002-06-20', '085123847543', 'Laki-laki', 'Tidak Pinjam');




INSERT INTO buku VALUES
('BK11', 'Sang Pemimpi', 'Andrea Hirata', 'Bentang Pustaka', '2006', '40', 'Baru', 'Baik'),
('BK12', 'Ayat-Ayat Cinta', 'Habiburrahman El Shirazy', 'Republika', '2004', '20', 'Baru', 'Baik'),
('BK13', 'Perahu Kertas', 'Dee Lestari', 'Bentang Pustaka', '2008', '45', 'Baru', 'Baik'),
('BK14', 'Laskar Pelangi', 'Andrea Hirata', 'Bentang Pustaka', '2005', '30', 'Baru', 'Baik'),
('BK15', 'Bumi Manusia', 'Pramoedya Ananta Toer', 'Hasta Mitra', '1980', '35', 'Baru', 'Baik'),
('BK16', 'Tenggelamnya Kapal van der Wijck', 'Hamka', 'Balai Pustaka', '1938', '25', 'Baru', 'Baik'),
('BK17', 'Matahari', 'Tere Liye', 'Gramedia Pustaka Utama', '2015', '50', 'Baru', 'Baik'),
('BK18', 'Sang Pencerah', 'Ahmad Tohari', 'Gramedia Pustaka Utama', '1999', '10', 'Baru', 'Baik'),
('BK19', 'Negeri 5 Menara', 'Ahmad Fuadi', 'Gramedia Pustaka Utama', '2009', '15', 'Baru', 'Baik'),
('BK20', 'Rindu', 'Tere Liye', 'Gramedia Pustaka Utama', '2006', '55', 'Baru', 'Baik');
 

 INSERT INTO peminjaman VALUES 
 ('PJ01', '1018', 'P1', '2024-03-10', '2024-03-20', 'BK15'),
 ('PJ02', '1018', 'P2', '2024-03-01', '2024-03-19', 'BK15'),
 ('PJ03', '1018', 'P3', '2024-03-10', '2024-03-20', 'BK15'),
 ('PJ04', '1018', 'P3', '2024-03-16', '2024-03-27', 'BK20'),
 ('PJ05', '1018', 'P3', '2024-03-10', '2024-03-20', 'BK15'),
 ('PJO6', '1018', 'P3', '2024-03-10', '2024-03-20', 'BK14'),
 ('PJ07', '1018', 'P3', '2024-03-10', '2024-03-20', 'BK15'),
 ('PJ08', '1018', 'P3', '2024-03-10', '2024-03-20', 'BK15'),
 ('PJ09', '1019', 'P4', '2024-03-08', '2024-03-17', 'BK13'),
 ('PJ10', '1015', 'P5', '2024-03-12', '2024-03-22', 'BK17');
 

 INSERT INTO pengembalian VALUES
 ('KB01', '1018', 'BK15', 'P1', '2024-03-10', '2024-03-20', '1000'),
 ('KB02', '1018', 'BK15', 'P2', '2024-03-01', '2024-03-19', '5000'),
 ('KB03', '1018', 'BK15', 'P3', '2024-03-10', '2024-03-20', '2000'),
 ('KB04', '1018', 'BK20', 'P3', '2024-03-16', '2024-03-27', '1000'),
 ('KB05', '1011', 'BK15', 'P3', '2024-03-10', '2024-03-20', '0'),
 ('KBO6', '1018', 'BK14', 'P3', '2024-03-10', '2024-03-20', '4500'),
 ('KB07', '1018', 'BK15', 'P3', '2024-03-10', '2024-03-20', '4000'),
 ('KB08', '1013', 'BK15', 'P3', '2024-03-10', '2024-03-20', '6000'),
 ('KB09', '1019', 'BK13', 'P4', '2024-03-08', '2024-03-17', '7000'),
 ('KB10', '1015', 'BK17', 'P5', '2024-03-12', '2024-03-22', '2000');
 
 DROP DATABASE perpustakaan2
 
 #no 1
DELIMITER //

CREATE PROCEDURE biodatadiri (
    IN vnama VARCHAR (50), 
    IN vnrp VARCHAR (20),
    IN valamat VARCHAR (50), 
    IN vtgl_lahir DATE,
    IN vjenis_kelamin VARCHAR(10), 
    IN vumur INT (5),
    IN vhobi VARCHAR (50), 
    IN vno_telp VARCHAR(15)
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
    
    SET nama = vnama;
    SET nrp = vnrp;
    SET alamat = valamat;
    SET tgl_lahir = vtgl_lahir;
    SET jenis_kelamin = vjenis_kelamin;
    SET umur = TIMESTAMPDIFF(YEAR, vtgl_lahir, CURDATE());
    SET hobi = vhobi;
    SET no_telp = vno_telp;
    
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

CALL biodatadiri ("Seila Ardiana","220441100061","Malang","2004-07-12","Perempuan"," ","Menyanyi","081233347957");

## no 2
DELIMITER//
CREATE PROCEDURE peringatan()
BEGIN
     SELECT kode_kembali,id_anggota,tanggal_pinjam,tanggal_kembali,DATEDIFF(tanggal_kembali,tanggal_pinjam) AS lama_pinjam,
     CASE 
     WHEN DATEDIFF(tanggal_kembali, tanggal_pinjam) <= 2 THEN 'Silahkan Pergunakan Buku'
     WHEN DATEDIFF(tanggal_kembali, tanggal_pinjam) BETWEEN 3 AND 5 THEN 'Ingat!!, Waktu Pinjam Segara Habis'
     WHEN DATEDIFF(tanggal_kembali, tanggal_pinjam) >= 6 THEN 'WARNING!!, Denda Menanti  Anda' END AS Statusnya
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
CALL denda('1015');

## no 4 
DELIMITER //
CREATE PROCEDURE cetakpeminjaman(IN cetak INT)
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= cetak DO
        SELECT * FROM peminjaman LIMIT cetak;
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;

CALL cetakpeminjaman(10);
SELECT * FROM peminjaman


## no 5		
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
	
