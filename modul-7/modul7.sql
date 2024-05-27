CREATE DATABASE rental_mobil

USE rental_mobil

CREATE TABLE Mobil(
    id_mobil INT AUTO_INCREMENT PRIMARY KEY,
    platno VARCHAR(10) NOT NULL,
    merek VARCHAR(20) NOT NULL,
    jenis VARCHAR(20) NOT NULL,
    harga_sewa_perhari DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Peminjaman(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_mobil INT,
    id_pelanggan INT,
    tgl_pinjam DATE NOT NULL,
    tgl_rencana_kembali DATE NOT NULL,
    total_hari INT,
    total_bayar DECIMAL(10, 2),
    tgl_kembali DATE,
    denda DECIMAL(10, 2),
    FOREIGN KEY (id_mobil) REFERENCES Mobil(id_mobil),
    FOREIGN KEY (id_pelanggan) REFERENCES Pelanggan(id_pelanggan)
);

DROP TABLE Peminjaman

CREATE TABLE Pelanggan(
    id_pelanggan INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(25),
    alamat VARCHAR(25),
    nik INT,
    no_telepon INT,
    jenis_kelamin VARCHAR(15)
);

INSERT INTO Mobil (platno, merek, jenis, harga_sewa_perhari) VALUES
('AG 1120 WP', 'Toyota', 'Calya', 100000),
('W 2345 PW', 'Daihatsu', 'Gran-Max', 200000),
('M 8976 AS', 'Honda', 'Honda-Jass',300000);

SELECT*FROM Mobil

INSERT INTO Peminjaman (id_mobil, id_pelanggan, tgl_pinjam, tgl_rencana_kembali,total_hari,total_bayar,tgl_kembali,denda) VALUES
(1, 1, '2024-05-26', '2024-05-27', 1, 500000,'2024-05-27',0),
(2, 2, '2024-05-19', '2024-05-21', 2, 1200000,'2024-05-22',100000),
(3, 3, '2024-05-23','2024-05-24', 1,750000,'2024-05-24',0);

INSERT INTO Peminjaman (id_mobil, id_pelanggan, tgl_pinjam, tgl_rencana_kembali, total_hari, total_bayar, tgl_kembali, denda) VALUES 
(4, 4, '2024-05-26','2024-05-27', NULL, NULL, NULL, NULL),
(5, 5, '2024-05-19','2024-05-21', NULL, NULL, NULL, NULL),
(6, 6, '2024-05-23','2024-05-24', NULL, NULL, NULL, NULL);

INSERT INTO Peminjaman (id_mobil, id_pelanggan, tgl_pinjam, tgl_rencana_kembali, total_hari, total_bayar, tgl_kembali, denda) VALUES 
(7, 7, '2024-04-20','2024-05-21', NULL, NULL, NULL, NULL),
(5, 5, '2024-04-12','2024-05-15', NULL, NULL, NULL, NULL),
(6, 6, '2024-04-21','2024-05-22', NULL, NULL, NULL, NULL);


INSERT INTO Pelanggan (nama, alamat, nik, no_telepon, jenis_kelamin) VALUES
('Atika', 'Mojokerto', 45675678, 085647484811,'Perempuan'),
('Imam', 'Bangkalan', 12340987, 085648114746, 'Laki-Laki'),
('Natasya', 'Surabaya', 56781234 ,085634413421, 'Perempuan');

SELECT*FROM Mobil
SELECT*FROM Peminjaman
SELECT*FROM Pelanggan

1. 
DELIMITER//
CREATE TRIGGER cek_tgl 
BEFORE INSERT ON Peminjaman
FOR EACH ROW
BEGIN
	IF (new.tgl_pinjam > new.tgl_rencana_kembali) THEN
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'Tanggal rencana kembali lebih awal dari tanggal pinjam !!';
	END IF;
END//
DELIMITER;

INSERT INTO Peminjaman (id_mobil, id_pelanggan, tgl_pinjam, tgl_rencana_kembali,total_hari,total_bayar,tgl_kembali,denda) VALUES
(1, 1, '2024-05-26', '2024-05-25', 1, 500000,'2024-05-27',0);

INSERT INTO Peminjaman (id_mobil, id_pelanggan, tgl_pinjam, tgl_rencana_kembali,total_hari,total_bayar,tgl_kembali,denda) VALUES
(1, 1, '2024-05-30', '2024-05-31', 1, 500000,'2024-05-31',0);

SELECT*FROM Peminjaman

2.
DELIMITER //
CREATE TRIGGER dikembalikan
BEFORE UPDATE ON PEMINJAMAN
FOR EACH ROW
BEGIN
    DECLARE total_hari INT;
    DECLARE sewa_perhari DECIMAL(10, 2);
    DECLARE overdue_days INT;
    DECLARE denda_perhari DECIMAL(10, 2);
    
	-- Pastikan bahwa ini adalah pembaruan pertama pada kolom TGL_KEMBALI
	IF NEW.TGL_KEMBALI <> OLD.TGL_KEMBALI OR new.tgl_kembali IS NOT NULL THEN
        -- Menghitung total hari sewa
        SET total_hari = DATEDIFF(NEW.TGL_KEMBALI, NEW.TGL_PINJAM);
        SET NEW.TOTAL_HARI = total_hari;
        
        -- Mendapatkan harga sewa per hari
        SELECT HARGA_SEWA_PERHARI INTO sewa_perhari FROM MOBIL WHERE ID_MOBIL = NEW.ID_MOBIL;
        
        -- Menghitung total bayar
        SET NEW.TOTAL_BAYAR = total_hari * sewa_perhari;
        
        -- Menghitung denda jika ada
        IF NEW.TGL_KEMBALI > NEW.TGL_RENCANA_KEMBALI THEN
            SET overdue_days = DATEDIFF(NEW.TGL_KEMBALI, NEW.TGL_RENCANA_KEMBALI);
            SET sewa_perhari = 0.1 * sewa_perhari; -- Denda 10% dari harga sewa per hari
            SET NEW.DENDA = overdue_days * sewa_perhari;
        ELSE
            SET NEW.DENDA = 0;
        END IF;
    END IF;
END//
DELIMITER ;

DROP TRIGGER dikembalikan
-- Update untuk mengisi TGL_KEMBALI dan memicu trigger
UPDATE PEMINJAMAN
SET TGL_KEMBALI = '2024-05-22'
WHERE ID = 6;

SELECT * FROM peminjaman;

3.
DELIMITER//
CREATE TRIGGER cek_nik
BEFORE INSERT ON Pelanggan
FOR EACH ROW
BEGIN
	IF (new.nik REGEXP '[a-zA-Z]') OR (new.nik NOT REGEXP '[0-9]') OR
	(LENGTH(new.nik)< 10) THEN 
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Panjang NIK harus sesuai dengan aturan!';
	END  IF;
END//
DELIMITER;

INSERT INTO Pelanggan (nama, alamat, nik, no_telepon, jenis_kelamin) VALUES
('Farah', 'Sampang', 12345678, 085647484811,'Perempuan');

DROP TRIGGER cek_nik

4.
DELIMITER//
CREATE TRIGGER validasi_platno
BEFORE INSERT ON mobil
FOR EACH ROW
BEGIN
	IF (new.platno NOT REGEXP '[a-zA-Z]') THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '1/2 karakter awal plat nomor harus huruf!!';
	END IF;
END//
DELIMITER;

INSERT INTO Mobil (platno, merek, jenis, harga_sewa_perhari) VALUES
('12345', 'Toyota', 'Pajero', 500000);

INSERT INTO Mobil (platno, merek, jenis, harga_sewa_perhari) VALUES
('AB345', 'Toyota', 'Pajero', 500000);

SELECT*FROM Mobil