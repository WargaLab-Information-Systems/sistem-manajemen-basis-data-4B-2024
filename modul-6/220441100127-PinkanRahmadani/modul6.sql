CREATE DATABASE prpstkn;
USE prpstkn;
DROP DATABASE prpstkn
CREATE TABLE petugas( id_petugas VARCHAR (10), 
username VARCHAR (15), 
pasword VARCHAR (15), 
nama VARCHAR (25), 
PRIMARY KEY (id_petugas));

CREATE TABLE anggota (id_anggota VARCHAR (10), 
nama_anggota VARCHAR (20),
angkatan_anggota VARCHAR (6),
tempat_lahir VARCHAR (20),
tanggal_lahir DATE,
no_telp INT (12),
jenis_kelamin VARCHAR (15),
status_pinjam VARCHAR (15),
PRIMARY KEY (id_anggota));

CREATE TABLE buku(kode_buku VARCHAR (10),
judul_buku VARCHAR (25),
pengarang_buku VARCHAR (30),
penerbit_buku VARCHAR (30),
tahun_buku VARCHAR (5),
jumlah_buku VARCHAR (5),
status_buku VARCHAR (10),
klasifikasi_buku VARCHAR (20),
PRIMARY KEY (kode_buku));

CREATE TABLE peminjaman (kode_peminjaman VARCHAR (20),
id_anggota VARCHAR (10),
id_petugas VARCHAR (10),
tanggal_pinjam DATE, 
tanggal_kembali DATE,
kode_buku VARCHAR (10),
PRIMARY KEY (kode_peminjaman), 
FOREIGN KEY(id_petugas) REFERENCES petugas (id_petugas),
FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota),
FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku));

CREATE TABLE pengembalian (kode_kembali VARCHAR (10),
id_anggota VARCHAR (10),
kode_buku VARCHAR (10),
id_petugas VARCHAR (10),
tanggal_pinjam DATE, 
tanggal_kembali DATE,
denda VARCHAR (15),
PRIMARY KEY (kode_kembali),
FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas),
FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota),
FOREIGN KEY (kode_buku) REFERENCES buku (kode_buku));

INSERT INTO petugas
VALUES ('PTGS1', 'Petugas1', 'Login', '	Zana'),
('PTGS2', 'Petugas2', 'Login', 'Wine'),
('PTGS3', 'Petugas3', 'Login', 'Darra'),
('PTGS4', 'Petugas4', 'Login', 'Zain'),
('PTGS5', 'Petugas5', 'Login', 'Nana');


INSERT INTO anggota
VALUES ('8020','Zam','2022','Kalimantan','2003-10-02','088235878128','laki-laki','tidak pinjam'),
('8021','Qella','2021','Serang','2002-09-07','088267894356','Perempuan','pinjam'),
('8022','Zirra','2021','Bandung','2002-09-12','089245678790','Perempuan','pinjam'),
('8023','Zayn','2022','Jakarta','2003-12-25','085845673219','laki-laki','pinjam'),
('8024','Naomi','2022','Bandung','2003-10-20','088290879234','Perempuan','pinjam'),
('8025','Putin','2022','Surabaya','2003-02-02','089267898754','laki-laki','tidak pinjam'),
('8026','Arthur','2022','Surabaya','2003-10-25','088235874512','laki-laki','tidak pinjam'),
('8027','Cilla','2022','Bandung','2003-07-12','085376858765','Perempuan','pinjam'),
('8028','Yasmin','2021','Jogja','2002-03-08','085676768989','Perempuan','pinjam'),
('8029 ','Diego','2021','Surabaya','2002-01-15','089834251237 ','laki-laki','tidak pinjam');

INSERT INTO buku 
VALUES ( 'BK20', 'Promise', 'Dwitasari', 'Loveable', '2016','35', 'Baru', 'Novel'),
( 'BK21', 'Negeri & Menara', 'Ahmad Fuedi', 'PT.Gramedia Pustaka Utama', '1999', '25','Baru', 'Novel'),
( 'BK22', 'Pantai dan Kehidupannya', 'Edy Karsono', 'PT.INDAHJAYA Adipratama', '2003','10', 'Baru', 'Novel'),
( 'BK23', 'Koala Kumal', 'Raditya Dika', 'Gagas Media ', '2015','45', 'Baru', 'Novel'),
( 'BK24', 'Motivasi Bob Sadino', 'Ayu Utami', 'Best Media', '2018','20', 'Baru', 'Novel'),
( 'BK25', 'Sang Mimpi', 'Andrea Hirata', 'Bintang Pustaka', '2019','30', 'Baru', 'Novel'),
( 'BK26', 'Dear Nathan', 'Erisca Febrianti', 'Best Media', '2019','45', 'Baru', 'Novel'),
( 'BK27', 'Sepatu Dahlan', 'Khrisna Pabichara ', 'Noura Book', '1995','35', 'Baru', 'Novel'),
( 'BK28', 'Cinta Brontosaurus', 'Raditya Dika', 'Andi Publisher', '1998','30', 'Baru', 'Novel'),
( 'BK29', 'Laskar Pelangi', 'Andrea Hirata', 'Bintang Pustaka', '1999','20', 'Baru', 'Novel');

INSERT INTO peminjaman 
VALUES ( 'PJ001', '8020' , 'PTGS1', '2024-03-18', '2024-03-25','BK20'),
( 'PJ002', '8028' , 'PTGS2', '2024-03-18', '2024-03-24','BK21'),
( 'PJ003', '8028' , 'PTGS3', '2024-03-19', '2024-03-22','BK22'),
( 'PJ004', '8028' , 'PTGS4', '2024-03-20', '2024-03-27','BK23'),
( 'PJ005', '8028' , 'PTGS5', '2024-03-20', '2024-03-27','BK23'),
( 'PJ006', '8028' , 'PTGS5', '2024-03-20', '2024-03-28','BK23'),
( 'PJ007', '8028' , 'PTGS5', '2024-03-20', '2024-03-29','BK23'),
( 'PJ008', '8028' , 'PTGS5', '2024-03-21', '2024-03-29','BK23'),
( 'PJ009', '8028' , 'PTGS5', '2024-03-21', '2024-03-29','BK23'),
( 'PJ010', '8027' , 'PTGS5', '2024-03-22', '2024-03-30','BK29'),
( 'PJ011', '8027' , 'PTGS5', '2024-03-23', '2024-03-31','BK29');

INSERT INTO pengembalian
VALUES ('KB01', '8020' , 'BK20', 'PTGS1', '2024-03-18', '2024-03-25','1000'),
('KB02', '8022' , 'BK21', 'PTGS1', '2024-03-18', '2024-03-24','1000'),
('KB03', '8028' , 'BK22', 'PTGS3', '2024-03-19', '2024-03-22','500'),
('KB04', '8028' , 'BK23', 'PTGS2', '2024-03-20', '2024-03-27','500'),
('KB05', '8028' , 'BK24', 'PTGS4', '2024-03-20', '2024-03-27','0'),
('KB06', '8028' , 'BK23', 'PTGS1', '2024-03-20', '2024-03-28','0'),
('KB07', '8028' , 'BK23', 'PTGS1', '2024-03-20', '2024-03-29','1000'),
('KB08', '8028' , 'BK23', 'PTGS1', '2024-03-21', '2024-03-29','500'),
('KB09', '8028' , 'BK23', 'PTGS1', '2024-03-21', '2024-03-29','1000'),
('KB10', '8028' , 'BK29', 'PTGS1', '2024-03-22', '2024-03-30','500');


-- no 1 Buat Stored Procedure Variabel untuk menampilkan Biodata--
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

CALL biodatadiri ("Maria debora","220441100127","Jakarta","2003-10-25","Perempuan","20","Masak","088235878128");       


-- n0 2 stored procedure untuk menentukan keterangan peringatan --
DELIMITER $$

CREATE PROCEDURE peringatan()
BEGIN
    SELECT 
        kode_kembali,
        id_anggota,
        tanggal_pinjam,
        tanggal_kembali,
        DATEDIFF(tanggal_kembali, tanggal_pinjam) AS lama_pinjam,
        CASE 
            WHEN DATEDIFF(tanggal_kembali, tanggal_pinjam) <= 2 THEN 'Silahkan Pergunakan buku'
            WHEN DATEDIFF(tanggal_kembali, tanggal_pinjam) BETWEEN 3 AND 5 THEN 'Ingat!!, Waktu Pinjam Segera Habis'
            WHEN DATEDIFF(tanggal_kembali, tanggal_pinjam) >= 6 THEN 'WARNING!!, Denda Menanti Anda'
        END AS statusnya
    FROM pengembalian
    ORDER BY lama_pinjam ASC;
END $$

DELIMITER ;

 CALL peringatan();
 
 
 -- no 3 memeriksa jumlah denda --
DELIMITER //

CREATE PROCEDURE denda (
    IN idanggota VARCHAR(10)
)
BEGIN
    DECLARE jumlah_denda VARCHAR(50);

    IF ((SELECT SUM(denda) FROM pengembalian WHERE id_anggota = idanggota) IS NOT NULL) THEN
        SET jumlah_denda = (SELECT SUM(denda) FROM pengembalian WHERE id_anggota = idanggota);
    ELSE 
        SET jumlah_denda = 'Anda tidak memiliki tanggungan/denda';
    END IF;
    
    SELECT jumlah_denda;
END //

DELIMITER ;

  CALL denda('8028');
  
  
  -- no 4 stored procedure looping untuk mencetak data peminjaman 1-10 --
  
DELIMITER //

CREATE PROCEDURE cetak_pinjam_baru (IN bil INT (10))
BEGIN
    DECLARE i INT ;
    SET i = 1;
    WHILE i <= bil DO 
        SELECT * FROM peminjaman;
        SET i = i + 1;
    END WHILE;

END //
DELIMITER ;

  CALL cetak_pinjam_baru(10); 
         
         
 -- no 5 hapus anggota jenis kelamin laki-laki --

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




















DROP DATABASE prpstkn;


         

         
 