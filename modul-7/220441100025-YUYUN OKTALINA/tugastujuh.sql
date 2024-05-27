CREATE DATABASE rental_mobil;
DROP DATABASE rental_mobil;

USE rental_mobil;

CREATE TABLE mobil(
	id_mobil INT AUTO_INCREMENT PRIMARY KEY,
	platno VARCHAR(15) NOT NULL,
	merk VARCHAR(20)NOT NULL,
	jenis VARCHAR(15)NOT NULL,
	harga_sewa_perhari DECIMAL(10,2) NOT NULL
);

CREATE TABLE pelanggan(
	id_pelanggan INT AUTO_INCREMENT PRIMARY KEY,
	nama VARCHAR(25) NOT NULL,
	alamat VARCHAR(10) NOT NULL,
	nik VARCHAR (20),
	no_telp VARCHAR (15) NOT NULL,
	jenis_kelamin VARCHAR(10) NOT NULL
);

CREATE TABLE peminjaman(
	id_peminjaman INT AUTO_INCREMENT PRIMARY KEY,
	id_mobil INT NOT NULL,
	id_pelanggan INT NOT NULL,
	tgl_pinjam DATE NOT NULL,
	tgl_rencana_kembali DATE NOT NULL,
	total_hari INT ,
	total_bayar DECIMAL(10, 2),
	tgl_kembali DATE,
	denda DECIMAL(10, 2),
	FOREIGN KEY (id_mobil) REFERENCES mobil(id_mobil),
	FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan)
);

DROP DATABASE rental_mobil

INSERT INTO mobil ( platno, merk, jenis, harga_sewa_perhari) VALUES
('M 2323 AD', 'Suzuki', 'Suzuki Presso', '45000'),
('S 4567 LC', 'Honda', 'Brio', '50000'),
('B 1206 KL', 'Daihatsu', 'Ayla', '55000'),
('W 6767 CY', 'Toyota', 'Toyota Carolla', '60000'),
('M 3345 SU', 'Mitsubishi', 'Xpander', '70000');

SELECT * FROM mobil

INSERT INTO pelanggan (nama, alamat, nik, no_telp, jenis_kelamin) VALUES
( 'Nyla', 'Malang', '7658725466', '082654783274', 'Perempuan'),
( 'Mira', 'Bandung', '6573847589', '081756482938', 'Perempuan'),
( 'Zayn', 'Surabaya', '3344486753', '085473827561', 'Laki-laki'),
( 'Leo', 'Jakarta', '8887553746', '082738172657', 'Laki-laki'),
('Jax', 'Bali', '4456743821', '085762187564', 'Laki-laki');
SELECT * FROM pelanggan

INSERT INTO peminjaman (id_mobil, id_pelanggan,tgl_pinjam, tgl_rencana_kembali ) VALUES

(1,1 , '2024-05-05', '2024-05-10' ),
(2, 2,  '2024-05-06', '2024-05-15' ),
(3, 3, '2024-05-07', '2024-05-09'),
(4, 4,  '2024-05-08', '2024-05-10'),
(5, 5, '2024-05-09', '2024-05-14');
SELECT * FROM peminjaman
DROP TABLE peminjaman



SELECT * FROM mobil
SELECT * FROM pelanggan 
SELECT * FROM peminjaman

-- No 1 --
DELIMITER//
CREATE TRIGGER cek_tanggal 
BEFORE INSERT ON peminjaman
FOR EACH ROW
	BEGIN
		IF(new.tgl_pinjam > new.tgl_rencana_kembali) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT='Tanggal rencana kembali lebih awal dari tanggal pinjam !!';
		END IF;
	END//
DELIMITER;

-- tgl_rencana_kembali > awal dari tgl_pinjam
INSERT INTO peminjaman (id_mobil, id_pelanggan,tgl_pinjam, tgl_rencana_kembali ) VALUE(1,1 , '2024-05-05', '2024-05-06' );



-- 2
-- Trigger untuk menghitung total_bayar dan denda saat mobil dikembalikan
DELIMITER //

CREATE TRIGGER update_pengembalian
BEFORE UPDATE ON peminjaman
FOR EACH ROW
BEGIN
    DECLARE total_days INT;
    DECLARE sewa_perhari DECIMAL(10, 2);
    DECLARE keterlambatan INT;
    DECLARE denda_perhari DECIMAL(10, 2);
    
    -- Pastikan bahwa ini adalah pembaruan pertama pada kolom TGL_KEMBALI
    IF new.tgl_kembali <>  old.tgl_kembali OR new.tgl_kembali IS NOT  NULL THEN
        -- Menghitung total hari sewa
        SET total_days = DATEDIFF(new.tgl_kembali, new.tgl_pinjam);
        SET new.total_hari = total_days;
        
        -- Mendapatkan harga sewa per hari
        SELECT harga_sewa_perhari INTO sewa_perhari FROM mobil WHERE id_mobil = new.id_mobil;
        
        -- Menghitung total bayar
        SET new.total_bayar = total_days * sewa_perhari;
        
        -- Menghitung denda jika ada
        IF new.tgl_kembali > new.tgl_rencana_kembali THEN
            SET keterlambatan = DATEDIFF(new.tgl_kembali, new.tgl_rencana_kembali);
            SET denda_perhari = 0.1 * sewa_perhari; -- Denda 10% dari harga sewa per hari
            SET new.denda = keterlambatan * denda_perhari;
        ELSE
            SET new.denda= 0;
        END IF;
    END IF;
END//

DELIMITER ;

-- Insert data valid ke tabel PEMINJAMAN tanpa mengisi TGL_KEMBALI
INSERT INTO peminjaman (id_mobil, id_pelanggan, tgl_pinjam, tgl_rencana_kembali)
VALUES (1, 1, '2024-05-05', '2024-05-10');

-- Update untuk mengisi TGL_KEMBALI dan memicu trigger
UPDATE peminjaman
SET tgl_kembali = '2024-05-10'
WHERE id_peminjaman = 1; -- Gantilah ID dengan ID yang sesuai dari hasil insert sebelumnya
DROP TRIGGER update_pengembalian
SELECT * FROM peminjaman

-- no 3
DELIMITER//
CREATE TRIGGER trg_check_nik_length
BEFORE INSERT ON pelanggan
FOR EACH ROW
BEGIN
    IF LENGTH(new.nik) != 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Panjang NIK harus 10 karakter';
    END IF;
END//
DELIMITER;

-- Insert yang akan gagal karena panjang NIK tidak 10 karakter
INSERT INTO pelanggan (nama, alamat, nik, no_telp, jenis_kelamin) VALUES
( 'fahmi', 'Lamongan', '4567890312', '082586783290', 'Laki-laki');

DROP TRIGGER trg_check_nik_length


-- N0 4
DELIMITER//
CREATE TRIGGER validasi_platno 
BEFORE INSERT ON mobil
FOR EACH ROW
	BEGIN
		IF(new.platno NOT REGEXP '[a-zA-Z]') THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = "1/2 karakter awal plat nomor harus huruf !";
		END IF;
	END//
DELIMITER;


INSERT INTO mobil ( platno, merk, jenis, harga_sewa_perhari) VALUE
('22345', 'Lamborgini', 'EXTRA', 90000);
INSERT INTO mobil ( platno, merk, jenis, harga_sewa_perhari) VALUE ('JK 4644 SSN', 'Nissan', 'Nissan Promax', 45000);