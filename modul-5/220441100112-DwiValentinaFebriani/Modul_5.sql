USE tugasdua;

CREATE TABLE `anggota` (
  `IdAnggota` VARCHAR(10) NOT NULL,
  `Nama_Anggota` VARCHAR(20) DEFAULT NULL,
  `Angkatan_Anggota` VARCHAR(6) DEFAULT NULL,
  `Tempat_Lahir_Anggota` VARCHAR(20) DEFAULT NULL,
  `Tanggal_Lahir_Anggota` DATE DEFAULT NULL,
  `No_Telp` INT(12) DEFAULT NULL,
  `Jenis_Kelamin` VARCHAR(15) DEFAULT NULL,
  `Status_Pinjam` VARCHAR(15) DEFAULT NULL,
  PRIMARY KEY (`IdAnggota`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT  INTO `anggota`(`IdAnggota`,`Nama_Anggota`,`Angkatan_Anggota`,`Tempat_Lahir_Anggota`,`Tanggal_Lahir_Anggota`,`No_Telp`,`Jenis_Kelamin`,`Status_Pinjam`) VALUES 
('A001','Andi','2020','Jakarta','2000-01-01',2147483647,'Laki-laki','Tidak'),
('A002','Budi','2021','Surabaya','2001-02-02',2147483647,'Laki-laki','Tidak'),
('A003','Cici','2020','Bandung','2000-03-03',2147483647,'Perempuan','Ya'),
('A004','Dini','2021','Yogyakarta','2001-04-04',2147483647,'Perempuan','Ya'),
('A005','Eva','2020','Semarang','2000-05-05',2147483647,'Perempuan','Ya');

CREATE TABLE `buku` (
  `Kode_Buku` VARCHAR(10) NOT NULL,
  `Judul_Buku` VARCHAR(25) DEFAULT NULL,
  `Pengarang_Buku` VARCHAR(30) DEFAULT NULL,
  `Penerbit_Buku` VARCHAR(30) DEFAULT NULL,
  `Tahun_Buku` VARCHAR(10) DEFAULT NULL,
  `Jumlah_Buku` VARCHAR(5) DEFAULT NULL,
  `Status_Buku` VARCHAR(10) DEFAULT NULL,
  `Klasifikasi_Buku` VARCHAR(20) DEFAULT NULL,
  PRIMARY KEY (`Kode_Buku`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `peminjaman` (
  `Kode_Peminjaman` VARCHAR(10) NOT NULL,
  `IdAnggota` VARCHAR(10) DEFAULT NULL,
  `IdPetugas` VARCHAR(10) DEFAULT NULL,
  `Tanggal_Pinjam` DATE DEFAULT NULL,
  `Tanggal_Kembali` DATE DEFAULT NULL,
  `Kode_Buku` VARCHAR(10) DEFAULT NULL,
  PRIMARY KEY (`Kode_Peminjaman`),
  KEY `fk_peminjaman_anggota` (`IdAnggota`),
  KEY `fk_peminjaman_buku` (`Kode_Buku`),
  KEY `fk_peminjaman_petugas` (`IdPetugas`),
  CONSTRAINT `fk_peminjaman_anggota` FOREIGN KEY (`IdAnggota`) REFERENCES `anggota` (`IdAnggota`),
  CONSTRAINT `fk_peminjaman_buku` FOREIGN KEY (`Kode_Buku`) REFERENCES `buku` (`Kode_Buku`),
  CONSTRAINT `fk_peminjaman_petugas` FOREIGN KEY (`IdPetugas`) REFERENCES `petugas` (`IdPetugas`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `pengembalian` (
  `Kode_Kembali` VARCHAR(10) NOT NULL,
  `IdAnggota` VARCHAR(10) DEFAULT NULL,
  `Kode_Buku` VARCHAR(10) DEFAULT NULL,
  `IdPetugas` VARCHAR(10) DEFAULT NULL,
  `Tgl_Pinjam` DATE DEFAULT NULL,
  `Tgl_Kembali` DATE DEFAULT NULL,
  `Denda` VARCHAR(15) DEFAULT NULL,
  PRIMARY KEY (`Kode_Kembali`),
  KEY `fk_pengembalian_buku` (`Kode_Buku`),
  KEY `fk_pengembalian_anggota` (`IdAnggota`),
  KEY `fk_pengembalian_petugas` (`IdPetugas`),
  CONSTRAINT `fk_pengembalian_anggota` FOREIGN KEY (`IdAnggota`) REFERENCES `anggota` (`IdAnggota`),
  CONSTRAINT `fk_pengembalian_buku` FOREIGN KEY (`Kode_Buku`) REFERENCES `buku` (`Kode_Buku`),
  CONSTRAINT `fk_pengembalian_petugas` FOREIGN KEY (`IdPetugas`) REFERENCES `petugas` (`IdPetugas`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `petugas` (
  `IdPetugas` VARCHAR(10) NOT NULL,
  `Username` VARCHAR(15) DEFAULT NULL,
  `Password` VARCHAR(15) DEFAULT NULL,
  `Nama` VARCHAR(25) DEFAULT NULL,
  PRIMARY KEY (`IdPetugas`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- NO 1. Buatkanlah procedure dan lihatkan hasilnya untuk mengetahui umur buku kalau di lihat dari tahun penerbitan buku

DELIMITER //
CREATE PROCEDURE HitungUmurBuku(
    IN KodeBukuInput VARCHAR(10),
    OUT UmurBuku INT
)
BEGIN
    DECLARE TahunPenerbit INT;
    
    -- Mengambil tahun penerbitan buku
    SELECT Tahun_Buku INTO TahunPenerbit
    FROM buku
    WHERE Kode_Buku = KodeBukuInput;
    
    -- Menghitung umur buku
    SET UmurBuku = YEAR(CURRENT_DATE()) - TahunPenerbit;
    
END // 
DELIMITER ;

CALL HitungUmurBuku('B001', @UmurBuku);
SELECT @UmurBuku AS 'Umur_Buku_dalam_Tahun';

SELECT * FROM buku


-- no 1 buatkanlah procedure untuk menghitung sudah berapa lama atau hari salah anggota tersebut meminjam buku jika diambilkan dari awal tanggal pinjam. 

DELIMITER //
CREATE PROCEDURE Lama_Peminjaman (
	IN kode_peminjaman VARCHAR(10)
)
BEGIN
    SELECT p.Kode_Peminjaman, a.Nama_Anggota, b.Judul_Buku, DATEDIFF(p.Tanggal_Kembali, p.Tanggal_Pinjam) AS Lama_Meminjam_dalam_hari
    FROM peminjaman p
    JOIN anggota a ON p.IdAnggota = a.IdAnggota
    JOIN buku b ON p.Kode_Buku = b.Kode_Buku
    WHERE p.Kode_Peminjaman = kode_peminjaman;
END //
DELIMITER ;

CALL Lama_Peminjaman('PJ003');

SELECT * FROM peminjaman;


-- no2. Buatkan procedure untuk mendelete daftar buku yang tahun pembuatannya di bawah tahun 2000, 
-- tetapi jika penerbitnya dari AndhiPublisher maka tidak dapat di delete. 

DELIMITER//
CREATE PROCEDURE Delete_buku ()
BEGIN
    DELETE FROM buku
    WHERE Tahun_Buku < 2000 AND Penerbit_Buku != 'AndhiPublisher';
END//
DELIMITER;

CALL Delete_buku();

SELECT * FROM buku;

INSERT INTO `buku` (
  `Kode_Buku`,
  `Judul_Buku`,
  `Pengarang_Buku`,
  `Penerbit_Buku`,
  `Tahun_Buku`,
  `Jumlah_Buku`,
  `Status_Buku`,
  `Klasifikasi_Buku`
) VALUES
('B010', ' move ', 'Pengarang Delapan', 'Maysa', '1999', '10', 'Tersedia', 'fiksi');



-- no.3 Buatkanlah procedure untuk membuat perubahan data pada tabel buku, jika ada transaksi peminjaman pada tabel peminjaman 
-- berdasarkan kode buku tertentu maka jumlah buku berkurang. Sedangkan jika ada 
-- pengembalian buku pada tabel pengembalian buku dengan kode buku tertentu maka jumlah buku pada tabel buku akan bertambah. 

-- SOAL NO 3  jika ada transaksi peminjaman berdasarkan kode buku dan jumlah bukunya berkurang

DELIMITER //
CREATE PROCEDURE peminjaman_buku(
	IN kodebuku_pinjam VARCHAR (10), 
	IN jumlah VARCHAR (5)
)
BEGIN
	UPDATE buku 
	SET jumlah_buku = jumlah_buku - jumlah 
	WHERE kode_buku = kodebuku_pinjam;
END //
DELIMITER;

CALL peminjaman_buku('B002', '2');

SELECT * FROM buku

-- SOAL NO 3 jika ada pengembalian buku dengan kode buku tertentu maka jumlah bukunya akan bertambah

DELIMITER //
CREATE PROCEDURE kembalian_buku(
	IN kodebuku_pinjam VARCHAR (10), 
	IN jumlah VARCHAR (5)
)
BEGIN
	UPDATE buku 
	SET jumlah_buku = jumlah_buku + jumlah 
	WHERE kode_buku = kodebuku_pinjam;
END //
DELIMITER;

CALL kembalian_buku('B002','1');


SELECT * FROM buku


-- no.4 Meneruskan pada point ke 3, buatkanlah procedure untuk mengetahui berapa jumlah buku yang dipinjam anggota tertentu
-- jika ada transaksi pengembalian atau peminjaman buku pada tabel peminjaman, tabel buku dan tabel pengembalian.

DELIMITER //
CREATE PROCEDURE GetJumlahBukuDipinjam (
	IN anggota_id VARCHAR(10), 
	OUT jumlah_pinjam INT
)
BEGIN
    DECLARE jumlah_peminjaman INT;
    DECLARE jumlah_pengembalian INT;
    
    -- Hitung jumlah buku yang dipinjam oleh anggota
    SELECT COUNT(*) INTO jumlah_peminjaman
    FROM peminjaman
    WHERE IdAnggota = anggota_id;
    
    -- Hitung jumlah buku yang dikembalikan oleh anggota
    SELECT COUNT(*) INTO jumlah_pengembalian
    FROM pengembalian
    WHERE IdAnggota = anggota_id;
    
    -- Hitung jumlah buku yang masih dipinjam (belum dikembalikan)
    SET jumlah_pinjam = jumlah_peminjaman - jumlah_pengembalian;
    
END //
DELIMITER ;

CALL GetJumlahBukuDipinjam('A003', @jumlah_pinjam);
SELECT @jumlah_pinjam AS 'Jumlah Buku Dipinjam';

SELECT * FROM anggota
SELECT * FROM peminjaman
SELECT * FROM pengembalian



-- no.5 Buatkanlah procedure untuk menghapus procedure yang sudah dibuat.

DROP PROCEDURE Delete_buku 
DROP PROCEDURE UpdateJumlahBuku
DROP PROCEDURE HitungJumlahBukuDipinjam
DROP PROCEDURE peminjaman_buku
DROP PROCEDURE kembalian_buku





