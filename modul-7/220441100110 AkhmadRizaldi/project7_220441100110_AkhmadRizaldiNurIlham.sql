CREATE DATABASE RentalMobil;

USE RentalMobil;

-- NOMOR 1

-- Trigger untuk memastikan tgl_rencana_kembali tidak lebih awal dari tgl_pinjam
DELIMITER//
CREATE TRIGGER trg_check_tgl_rencana_kembali
BEFORE INSERT ON PEMINJAMAN
FOR EACH ROW
BEGIN
    IF NEW.TGL_RENCANA_KEMBALI < NEW.TGL_PINJAM THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Tanggal rencana kembali tidak boleh lebih awal dari tanggal pinjam';
    END IF;
END//
DELIMITER;

-- Insert yang akan gagal karena tgl_rencana_kembali lebih awal dari tgl_pinjam
INSERT INTO PEMINJAMAN (ID_MOBIL, ID_PELANGGAN, TGL_PINJAM, TGL_RENCANA_KEMBALI)
VALUES (1, 1, '2024-05-05', '2024-05-01');
INSERT INTO PEMINJAMAN (ID_MOBIL, ID_PELANGGAN, TGL_PINJAM, TGL_RENCANA_KEMBALI)
VALUES (1, 1, '2024-05-01', '2024-05-05')

-- NOMOR 2

-- Trigger untuk menghitung total_bayar dan denda saat mobil dikembalikan
DELIMITER //

CREATE TRIGGER trg_update_peminjaman_on_return
BEFORE UPDATE ON PEMINJAMAN
FOR EACH ROW
BEGIN
    DECLARE total_days INT;
    DECLARE daily_rent DECIMAL(10, 2);
    DECLARE overdue_days INT;
    DECLARE daily_fine DECIMAL(10, 2);
    
    -- Pastikan bahwa ini adalah pembaruan pertama pada kolom TGL_KEMBALI
    IF NEW.TGL_KEMBALI IS NOT NULL AND OLD.TGL_KEMBALI IS not NULL THEN
        -- Menghitung total hari sewa
        SET total_days = DATEDIFF(NEW.TGL_KEMBALI, NEW.TGL_PINJAM);
        SET NEW.TOTAL_HARI = total_days;
        
        -- Mendapatkan harga sewa per hari
        SELECT HARGA_SEWA_PERHARI INTO daily_rent FROM MOBIL WHERE ID_MOBIL = NEW.ID_MOBIL;
        
        -- Menghitung total bayar
        SET NEW.TOTAL_BAYAR = total_days * daily_rent;
        
        -- Menghitung denda jika ada
        IF NEW.TGL_KEMBALI > NEW.TGL_RENCANA_KEMBALI THEN
            SET overdue_days = DATEDIFF(NEW.TGL_KEMBALI, NEW.TGL_RENCANA_KEMBALI);
            SET daily_fine = 0.1 * daily_rent; -- Denda 10% dari harga sewa per hari
            SET NEW.DENDA = overdue_days * daily_fine;
        ELSE
            SET NEW.DENDA = 0;
        END IF;
    END IF;
END//

DELIMITER ;
----------------------------
DELIMITER //

CREATE TRIGGER trg_update_peminjaman_on_returnn
BEFORE UPDATE ON PEMINJAMAN
FOR EACH ROW
BEGIN
    DECLARE total_days INT;
    DECLARE daily_rent DECIMAL(10, 2);
    DECLARE overdue_days INT;
    DECLARE daily_fine DECIMAL(10, 2);
    
    -- Pastikan bahwa ini adalah pembaruan pertama pada kolom TGL_KEMBALI
    IF NEW.TGL_KEMBALI IS NOT NULL AND OLD.TGL_KEMBALI IS NOT NULL THEN
        -- Menghitung total hari sewa
        SET total_days = DATEDIFF(NEW.TGL_KEMBALI, NEW.TGL_PINJAM);
        SET NEW.TOTAL_HARI = total_days;
        
        -- Mendapatkan harga sewa per hari
        SELECT HARGA_SEWA_PERHARI INTO daily_rent FROM MOBIL WHERE ID_MOBIL = NEW.ID_MOBIL;
        
        -- Menghitung total bayar
        SET NEW.TOTAL_BAYAR = total_days * daily_rent;
        
        -- Menghitung denda jika ada
        IF NEW.TGL_KEMBALI > NEW.TGL_RENCANA_KEMBALI THEN
            SET overdue_days = DATEDIFF(NEW.TGL_KEMBALI, NEW.TGL_RENCANA_KEMBALI);
            SET daily_fine = 0.1 * daily_rent; -- Denda 10% dari harga sewa per hari
            SET NEW.DENDA = overdue_days * daily_fine;
        ELSE
            SET NEW.DENDA = 0;
        END IF;
    END IF;
END//

DELIMITER ;

INSERT INTO PEMINJAMAN (ID_MOBIL, ID_PELANGGAN, TGL_PINJAM, TGL_RENCANA_KEMBALI, )
VALUES (2, 2, '2024-05-10', '2024-05-20');

UPDATE PEMINJAMAN
SET TGL_KEMBALI = '2024-05-20'
WHERE ID = 4; 


-- Insert data valid ke tabel PEMINJAMAN tanpa mengisi TGL_KEMBALI
INSERT INTO PEMINJAMAN (ID_MOBIL, ID_PELANGGAN, TGL_PINJAM, TGL_RENCANA_KEMBALI, )
VALUES (2, 2, '2024-05-10', '2024-05-15');

INSERT INTO PEMINJAMAN (ID, ID_MOBIL, ID_PELANGGAN, TGL_PINJAM, TGL_RENCANA_KEMBALI, )
VALUES (2, 2, 2, '2024-05-10', '2024-05-15');

-- Update untuk mengisi TGL_KEMBALI dan memicu trigger
UPDATE PEMINJAMAN
SET TGL_KEMBALI = '2024-0-15'
WHERE ID = 8; 
----------------------

------------------------
UPDATE PEMINJAMAN
SET TGL_KEMBALI = '2024-0-15'
WHERE ID = 5; 
SELECT * FROM PEMINJAMAN

 
select * from PEMINJAMAN

-------------------------------------------------



-- NOMOR 3
-- Trigger untuk memastikan panjang NIK adalah 16 karakter
DELIMITER //
CREATE TRIGGER sebelum_insert_pelanggann
BEFORE INSERT ON PELANGGAN
FOR EACH ROW
BEGIN
    IF LENGTH(NEW.NIK) != 16 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Panjang NIK harus 16 karakter';
    END IF;
END//
DELIMITER ;

-- Contoh data yang tidak valid (akan menghasilkan error)
INSERT INTO PELANGGAN (NAMA, ALAMAT, NIK, NO_TELEPON, JENIS_KELAMIN) VALUES
('Invalid NIK', 'Jl. Invalid No.4', '12345678912345658', '08123456780', 'L');


-- NOMOR 4
-- Trigger untuk memastikan dua karakter awal pada kolom PLATNO adalah huruf
DELIMITER//
CREATE TRIGGER trg_check_platno_format
BEFORE INSERT ON MOBIL
FOR EACH ROW
BEGIN
    IF LEFT(NEW.PLATNO, 2) NOT REGEXP '^[A-Za-z]{2}' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Dua karakter awal pada kolom PLATNO harus huruf';
    END IF;
END//
DELIMITER;

-- Insert yang akan gagal karena dua karakter awal PLATNO bukan huruf
INSERT INTO MOBIL (PLATNO, MERK, JENIS, HARGA_SEWA_PERHARI)
VALUES ('BB24AB', 'BMW', 'Coupe', 600000);
-----------------------------------------------------------------------------
DELIMITER //
CREATE TRIGGER sebelum_insert_mobil
BEFORE INSERT ON MOBIL
FOR EACH ROW
BEGIN
    -- Memeriksa karakter pertama dan kedua
    IF LEFT(NEW.PLATNO, 1) NOT REGEXP '[A-Za-z]' OR LEFT(NEW.PLATNO, 2) NOT REGEXP '[A-Za-z]' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Karakter pertama dan kedua pada kolom PLATNO harus berupa huruf';
    END IF;
END//
DELIMITER ;
INSERT INTO MOBIL (PLATNO, MERK, JENIS, HARGA_SEWA_PERHARI) VALUES
('B1234CD', 'Toyota', 'SUV', 500000),
('AB5678EF', 'Honda', 'Sedan', 400000);

INSERT INTO MOBIL (PLATNO, MERK, JENIS, HARGA_SEWA_PERHARI) VALUES
('1234CD', 'Suzuki', 'Hatchback', 300000);

INSERT INTO MOBIL (PLATNO, MERK, JENIS, HARGA_SEWA_PERHARI) VALUES
('1B234CD', 'Nissan', 'MPV', 450000);

----DATA valid
INSERT INTO MOBIL (PLATNO, MERK, JENIS, HARGA_SEWA_PERHARI) VALUES
('AB1234CD', 'Toyota', 'SUV', 500000),
('CD5678EF', 'Honda', 'Sedan', 400000);

SELECT * FROM MOBIL;
-- Tabel Mobil
CREATE TABLE MOBIL (
    ID_MOBIL INT AUTO_INCREMENT PRIMARY KEY,
    PLATNO VARCHAR(10) NOT NULL,
    MERK VARCHAR(50) NOT NULL,
    JENIS VARCHAR(50) NOT NULL,
    HARGA_SEWA_PERHARI DECIMAL(10, 2) NOT NULL
);

-- Tabel Pelanggan
CREATE TABLE PELANGGAN (
    ID_PELANGGAN INT AUTO_INCREMENT PRIMARY KEY,
    NAMA VARCHAR(100) NOT NULL,
    ALAMAT VARCHAR(200) NOT NULL,
    NIK VARCHAR(16) NOT NULL,
    NO_TELEPON VARCHAR(15) NOT NULL,
    JENIS_KELAMIN CHAR(1) NOT NULL
);

-- Tabel Peminjaman
CREATE TABLE PEMINJAMAN (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ID_MOBIL INT NOT NULL,
    ID_PELANGGAN INT NOT NULL,
    TGL_PINJAM DATE NOT NULL,
    TGL_RENCANA_KEMBALI DATE NOT NULL,
    TGL_KEMBALI DATE,
    TOTAL_HARI INT,
    TOTAL_BAYAR DECIMAL(10, 2),
    DENDA DECIMAL(10, 2),
    FOREIGN KEY (ID_MOBIL) REFERENCES MOBIL(ID_MOBIL),
    FOREIGN KEY (ID_PELANGGAN) REFERENCES PELANGGAN(ID_PELANGGAN)
);

INSERT INTO MOBIL (PLATNO, MERK, JENIS, HARGA_SEWA_PERHARI) VALUES
('B1234CD', 'Toyota', 'SUV', 500000),
('B5678EF', 'Honda', 'Sedan', 400000),
('B9101GH', 'Suzuki', 'Hatchback', 300000);

INSERT INTO PELANGGAN (NAMA, ALAMAT, NIK, NO_TELEPON, JENIS_KELAMIN) VALUES
('John Doe', 'Jl. Merdeka No.1', '1234567890123456', '08123456789', 'L'),
('Jane Doe', 'Jl. Sudirman No.2', '2345678901234567', '08987654321', 'P'),
('Alex Smith', 'Jl. Thamrin No.3', '3456789012345678', '08765432109', 'L');

INSERT INTO PEMINJAMAN (ID_MOBIL, ID_PELANGGAN, TGL_PINJAM, TGL_RENCANA_KEMBALI) VALUES
(1, 1, '2024-05-01', '2024-05-05'),
(2, 2, '2024-05-02', '2024-05-06'),
(3, 3, '2024-05-03', '2024-05-07');

--