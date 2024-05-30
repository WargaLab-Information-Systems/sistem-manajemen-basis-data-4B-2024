CREATE DATABASE modul7;

USE modul7

CREATE TABLE mobil (
  id_mobil VARCHAR(100) NOT NULL,
  platno VARCHAR(100) DEFAULT NULL,
  merk VARCHAR(100) DEFAULT NULL,
  jenis VARCHAR(100) DEFAULT NULL,
  harga_sewa_perhari INT(100) DEFAULT NULL,
  PRIMARY KEY (id_mobil)
)

CREATE TABLE pelanggan (
  id_pelanggan VARCHAR(100) NOT NULL,
  nama VARCHAR(100) DEFAULT NULL,
  alamat VARCHAR(100) DEFAULT NULL,
  nik INT(11) DEFAULT NULL,
  no_telepon INT(11) DEFAULT NULL,
  jenis_kelamin VARCHAR(100) DEFAULT NULL,
  PRIMARY KEY (id_pelanggan)
)

CREATE TABLE peminjaman (
  id_peminjaman VARCHAR(100) NOT NULL,
  id_mobil VARCHAR(100) DEFAULT NULL,
  id_pelanggan VARCHAR(100) DEFAULT NULL,
  tgl_pinjam DATE DEFAULT NULL,
  tgl_rencana_kembali DATE DEFAULT NULL,
  total_hari INT(11) DEFAULT NULL,
  total_bayar INT(11) DEFAULT NULL,
  tgl_kembali DATE DEFAULT NULL,
  denda INT(11) DEFAULT NULL,
  PRIMARY KEY (id_peminjaman),
  KEY id_mobil (id_mobil),
  KEY id_pelanggan (id_pelanggan),
  CONSTRAINT id_mobil FOREIGN KEY (id_mobil) REFERENCES mobil (id_mobil),
  CONSTRAINT id_pelanggan FOREIGN KEY (id_pelanggan) REFERENCES pelanggan (id_pelanggan)
)


INSERT INTO mobil (id_mobil, platno, merk, jenis, harga_sewa_perhari) VALUES
('M001','L0000MA','INOVA','KIJANG',300000),
('M002','AB1234','Toyota','Sedan',150000),
('M003', 'B9101EF', 'Suzuki', 'Hatchback', 450000),
('M004', 'B1213GH', 'Daihatsu', 'Minibus', 550000),
('M005', 'B1415IJ', 'Mitsubishi', 'Truck', 700000),
('M006', 'B1617KL', 'Nissan', 'Sedan', 520000),
('M007', 'B1819MN', 'Mazda', 'Coupe', 750000),
('M008', 'B2021OP', 'BMW', 'SUV', 1000000),
('M009', 'B2223QR', 'Mercedes', 'Sedan', 900000),
('M010', 'B2425ST', 'Hyundai', 'Hatchback', 470000);

INSERT INTO pelanggan (id_pelanggan, nama, alamat, nik, no_telepon, jenis_kelamin) VALUES
('P001','ARUM','PASURUAN',35012345,812345,'PEREMPUAN'),
('P002', 'Budi', 'Jl. Sudirman No. 2', 2345678901234567, 81234567891, 'Laki-laki'),
('P003', 'Citra', 'Jl. Gatot Subroto No. 3', 3456789012345678, 81234567892, 'Perempuan'),
('P004', 'Dewi', 'Jl. Thamrin No. 4', 4567890123456789, 81234567893, 'Perempuan'),
('P005', 'Eka', 'Jl. Kuningan No. 5', 5678901234567890, 81234567894, 'Laki-laki'),
('P006', 'Fani', 'Jl. Setiabudi No. 6', 6789012345678901, 81234567895, 'Perempuan'),
('P007', 'Gita', 'Jl. Kebon Sirih No. 7', 7890123456789012, 81234567896, 'Perempuan'),
('P008', 'Hendra', 'Jl. Tanah Abang No. 8', 8901234567890123, 81234567897, 'Laki-laki'),
('P009', 'Indra', 'Jl. Senayan No. 9', 9012345678901234, 81234567898, 'Laki-laki'),
('P010', 'Joko', 'Jl. Kalibata No. 10', 1234567890123457, 81234567899, 'Laki-laki');

INSERT INTO peminjaman (id_peminjaman, id_mobil, id_pelanggan, tgl_pinjam, tgl_rencana_kembali, total_hari, total_bayar, tgl_kembali, denda) VALUES
('PJ011', 'M001', 'P001', '2024-05-01', '2024-05-03', 2, 1000000, NULL, NULL);
('PJ002', 'M002', 'P002', '2024-05-02', '2024-05-04', 2, 1200000, NULL, NULL),
('PJ003', 'M003', 'P003', '2024-05-03', '2024-05-05', 2, 900000, NULL, NULL),
('PJ004', 'M004', 'P004', '2024-05-04', '2024-05-06', 2, 1100000, NULL, NULL),
('PJ005', 'M005', 'P005', '2024-05-05', '2024-05-07', 2, 1400000, NULL, NULL),
('PJ006', 'M006', 'P006', '2024-05-06', '2024-05-08', 2, 1040000, NULL, NULL),
('PJ007', 'M007', 'P007', '2024-05-07', '2024-05-09', 2, 1500000, NULL, NULL),
('PJ008', 'M008', 'P008', '2024-05-08', '2024-05-10', 2, 2000000, NULL, NULL),
('PJ009', 'M009', 'P009', '2024-05-09', '2024-05-11', 2, 1800000, NULL, NULL),
('PJ010', 'M010', 'P010', '2024-05-10', '2024-05-12', 2, 940000, NULL, NULL);


-- soal no 1
DELIMITER //
CREATE TRIGGER cek_tanggal_rencana_kembali
BEFORE INSERT ON peminjaman
FOR EACH ROW
BEGIN
	IF NEW.tgl_rencana_kembali < NEW.tgl_pinjam THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'error: tanggal rencana kembali tidak boleh lebih awal dari tanggal pinjam';
	END IF;
END//
DELIMITER ;

INSERT INTO peminjaman (
    id_peminjaman, 
    id_mobil, 
    id_pelanggan, 
    tgl_pinjam, 
    tgl_rencana_kembali, 
    total_hari, 
    total_bayar, 
    tgl_kembali, 
    denda
) VALUES ('PJ001', 'MOO2', 'P002', '2024-05-24', '2024-05-25',  5, 1500000, '2024-05-23', 1000000);
    
-- soal no 2

DELIMITER //
CREATE TRIGGER update_peminjaman
AFTER INSERT ON peminjaman
FOR EACH ROW
BEGIN
    DECLARE new_total_hari INT;
    DECLARE new_total_bayar INT;
    DECLARE new_tgl_kembali DATE;
    DECLARE new_denda INT;
    
    SET new_total_hari = NEW.total_hari;
    SET new_total_bayar = NEW.total_bayar;
    SET new_tgl_kembali = NEW.tgl_kembali;
    SET new_denda = NEW.denda;
    
    UPDATE peminjaman
    SET total_hari = new_total_hari, 
        total_bayar = new_total_bayar, 
        tgl_kembali = new_tgl_kembali, 
        denda = new_denda
    WHERE id_peminjaman = NEW.id_peminjaman;
END//
DELIMITER ;

INSERT INTO peminjaman (id_peminjaman, id_mobil, id_pelanggan, tgl_pinjam, tgl_rencana_kembali, total_hari, total_bayar, tgl_kembali, denda) 
VALUES ('PJ0', 'M004', 'P004', '2024-05-04', '2024-05-06', 2, 1100000, '2024-05-07', 200000)
ON DUPLICATE KEY UPDATE
    id_mobil = VALUES(id_mobil),
    id_pelanggan = VALUES(id_pelanggan),
    tgl_pinjam = VALUES(tgl_pinjam),
    tgl_rencana_kembali = VALUES(tgl_rencana_kembali),
    total_hari = VALUES(total_hari),
    total_bayar = VALUES(total_bayar),
    tgl_kembali = VALUES(tgl_kembali),
    denda = VALUES(denda); -- perbaiki

-- soal no 3 
DELIMITER //
CREATE TRIGGER cek_panjang_nik
BEFORE INSERT ON pelanggan
FOR EACH ROW
BEGIN
    IF CHAR_LENGTH(new.nik) <> 16 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'error: panjang nik harus 16';
    END IF;
END//
DELIMITER ;

INSERT INTO pelanggan (
	    id_pelanggan, 
	    nama, 
	    alamat, 
	    nik, 
	    no_telepon, 
	    jenis_kelamin
)VALUES  ('P003', 'arum', 'pasuruan', '1123323208320430', 123456789, 'Perempuan');


-- soal no 4 

DELIMITER //
CREATE TRIGGER cek_awalan_platno
BEFORE INSERT ON mobil
FOR EACH ROW
BEGIN
    IF NOT (new.platno REGEXP '^[A-Za-z]{1,2}[0-9]{1,4}$') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'error: plat no harus dimulai dengan 1 atau 2 huruf diikuti oleh 1 sampai 4 angka';
    END IF;
END//
DELIMITER ;
 

INSERT INTO mobil (
		   id_mobil, 
		   platno, 
		   merk, 
		   jenis, 
		   harga_sewa_perhari
)VALUES ('M013', 'AB1234', 'Toyota', 'Sedan', 150000);