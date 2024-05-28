CREATE DATABASE rental1_mobil;

USE rental1_mobil;

DROP DATABASE rental1_mobil

CREATE TABLE mobil(
	id_mobil VARCHAR(10),
	platno VARCHAR(10),
	merk VARCHAR(20),
	jenis VARCHAR(15),
	harga_sewa_perhari INT(11),
	PRIMARY KEY (id_mobil));
	
CREATE TABLE pelanggan(
	id_pelanggan VARCHAR (10),
	nama VARCHAR(30),
	alamat VARCHAR(50),
	nik CHAR(16),
	no_telp CHAR(12),
	jenis_kelamin VARCHAR (15),
	PRIMARY KEY (id_pelanggan));
	
CREATE TABLE peminjaman(
	id_pinjam VARCHAR(11),
	id_mobil VARCHAR(10),
	id_pelanggan VARCHAR(10),
	tgl_pinjam DATE,
	tgl_rencana_kembali DATE,
	total_hari INT(11),
	total_bayar INT(11),
	tgl_kembali DATE,
	denda INT (11),
	PRIMARY KEY (id_pinjam),
	FOREIGN KEY (id_mobil) REFERENCES mobil (id_mobil),
	FOREIGN KEY (id_pelanggan) REFERENCES pelanggan (id_pelanggan));


INSERT INTO mobil VALUES
('M01', 'B 2345 AG', 'BMW E36', 'sport', 800000),
('M02', 'AB 853 ABC', 'Honda Brio', 'hatchback', 400000),
('M03', 'M 1500 AD', 'Honda Jazz', 'hatchback', 500000),
('M04', 'W 8338 BA', 'Honda Civic', 'sport', 1000000),
('M05', 'M 7387 AC', 'Kijang Innova', 'sport', 850000);

INSERT INTO pelanggan VALUES
('P01', 'Bacthiar', 'Surabaya', '273617361471', '089137131237', 'Laki-laki'),
('P02', 'Jeff', 'Bandung', '279113911364', '087839137118', 'Laki-laki'),
('P03', 'Kezya', 'Malang', '354274684369', '089261821813', 'Perempuan'),
('P04', 'Aish', 'Jakarta', '201013902776', '085731073163', 'Perempuan'),
('P05', 'lucky', 'Malang', '203917391739', '083137370985', 'Laki-laki');

INSERT INTO peminjaman VALUES
('PJ01', 'M01', 'P01', '2024-05-26', '2024-05-28', 2, 1600000, '2024-05-29', 800000),
('PJ02', 'M02', 'P02', '2024-05-23', '2024-05-30', 7, 2800000, '2024-05-30', 0),
('PJ03', 'M03', 'P03', '2024-07-25', '2024-07-28', 3, 1000000, '2024-07-29', 500000),
('PJ04', 'M04', 'P04', '2024-07-25', '2024-05-28', 3, 3000000, '2024-07-30', 2000000),
('PJ05', 'M05', 'P05', '2024-08-29', '2024-08-30', 1, 850000, '2024-08-30', 0);



 NO 1 -- Pastikan tgl_rencana_kembali tidak lebih awal dari tgl_pinjam --
 
DELIMITER //
CREATE TRIGGER cek_tanggal 
BEFORE INSERT ON peminjaman
FOR EACH ROW
	BEGIN
		IF (new.tgl_pinjam > new.tgl_rencana_kembali) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT='Tanggal rencana kembali lebih awal dari tanggal pinjam !';
		END IF;
	END //
DELIMITER ;

-- tgl_rencana_kembali > tgl_pinjam
INSERT INTO peminjaman VALUE("PJ06", "M03", "P01", "2024-08-22","2024-08-21", 2, 1000000,"2024-08-28",0);
-- tgl_rencana_kembali < tgl_pinjam
INSERT INTO peminjaman VALUE("PJ06", "M02","P02","2024-08-20","2024-08-21",2,800000,"2024-08-28",1600000);

SELECT * FROM peminjaman


 NO 2 --  Ketika mobil dikembalikan, tgl_kembali di isi, juga menghitung total_bayar dan denda(jika ada)--


DELIMITER //

CREATE TRIGGER trg_update_peminjaman_on_return
BEFORE UPDATE ON peminjaman
FOR EACH ROW
BEGIN
    DECLARE total_days INT;
    DECLARE daily_rent DECIMAL(10, 2);
    DECLARE overdue_days INT;
    DECLARE daily_fine DECIMAL(10, 2);
    -- biaya sewa harian --
    -- keterlambatan hari --
   
    IF NEW.TGL_KEMBALI <> OLD.TGL_KEMBALI  OR new.tgl_kembali IS NOT NULL THEN
        -- Menghitung total hari sewa
        SET total_days = DATEDIFF(NEW.TGL_KEMBALI, NEW.TGL_PINJAM);
        SET NEW.TOTAL_HARI = total_days;
        
        -- Mendapatkan harga sewa per hari
        SELECT HARGA_SEWA_PERHARI INTO daily_rent FROM mobil WHERE id_mobil = NEW.ID_MOBIL;
        
        -- Menghitung total bayar
        SET NEW.TOTAL_BAYAR = total_days * daily_rent;
        
        -- Menghitung denda jika ada
        IF 1=1 THEN
            SET overdue_days = DATEDIFF(NEW.TGL_KEMBALI, NEW.TGL_RENCANA_KEMBALI);
            SET daily_fine = 0.1 * daily_rent; -- Denda 10% dari harga sewa per hari
            SET NEW.DENDA = overdue_days * daily_fine;
       
        ELSE
            SET NEW.DENDA = 0;
        END IF;
    END IF;
END//

DELIMITER ;
UPDATE peminjaman 
SET tgl_kembali = '2024-05-31' 
WHERE id_pinjam = 'PJ02';

SELECT * FROM peminjaman

NO 3 -- Ketika insert data ke tabel pelanggan, pastikan panjang NIK sesuai dengan aturan yang berlaku --

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
INSERT INTO pelanggan (id_pelanggan, nama, alamat, nik, no_telp, jenis_kelamin) VALUES
("P06", "Arthur", "Jambi", "1826", "086313138938","Laki-laki");

-- menambahkan ketika nik 10 karakter
INSERT INTO pelanggan (id_pelanggan, nama, alamat, nik, no_telp, jenis_kelamin) VALUES
("P07", "Meone", "Bali", "2204400110", "086313193731","Perempuan");

SELECT * FROM pelanggan

NO 4 -- Ketika insert data ke tabel mobil, pastikan di kolom platno, 1/2 karakter awal harus huruf --

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

INSERT INTO mobil VALUE("M07","345","BMW E36", "sport", 800000);
INSERT INTO mobil VALUE("M06","AB 1 M", "Mobilio", "hatchback", 400000);

SELECT * FROM mobil

DROP DATABASE rental_mobil

