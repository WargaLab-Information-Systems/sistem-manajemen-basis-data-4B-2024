USE mobil


-- soal 1
-- Pastikan tgl_rencana_kembali tidak lebih awal dari tgl_pinjam
DELIMITER //
CREATE TRIGGER tanggal_tidak_lebih BEFORE INSERT ON peminjaman
FOR EACH ROW
	BEGIN
	IF (new.tgl_pinjam > new.tgl_rencana_kembali) THEN
		SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT='Tanggal rencana kembali lebih awal dari tanggal pinjam !';
	END IF;
	END //
DELIMITER ;

INSERT INTO peminjaman VALUE('PJ08', 'M01', 'P01', '2021-05-22', '2021-05-21', 2, 1900000, '2021-05-29', 1000000)

SELECT * FROM peminjaman

-- soal NO 2
-- Ketika mobil dikembalikan, tgl_kembali di isi, juga menghitung total_bayar dan denda (jika ada)



-- soal 3
-- Ketika insert data ke tabel pelanggan, pastikan panjang NIK sesuai dengan aturan yang berlaku

DELIMITER //
CREATE TRIGGER validasi_nik BEFORE INSERT ON pelanggan 
FOR EACH ROW
BEGIN
	IF (new.nik NOT REGEXP '^[0-9]+$') OR (LENGTH(new.nik) != 12)
		THEN SIGNAL SQLSTATE "45000"
		SET MESSAGE_TEXT="Pastikan panjang NIK sesuai dengan aturan yang berlaku!";
	END IF;
END //
DELIMITER ;
DROP TRIGGER validasi_nik
INSERT INTO pelanggan (id_pelanggan, nama, alamat, nik, no_telp, jenis_kelamin) 
VALUES ('P06', 'Ayumi', 'Jakarta', '1234567890', '083865212199', 'Perempuan');
INSERT INTO pelanggan (id_pelanggan, nama, alamat, nik, no_telp, jenis_kelamin) 
VALUES ('P07', 'Sekara', 'Jakarta', '123456789012', '083865212199', 'Perempuan');

SELECT * FROM pelanggan

-- soal 4
-- Ketika insert data ke tabel mobil, pastikan di kolom plat_no, 1/2 karakter awal harus huruf

DELIMITER//
CREATE TRIGGER validasi_plat
BEFORE INSERT ON mobil
FOR EACH ROW
BEGIN
	IF (new.plat_no NOT REGEXP '[a-zA-Z]') THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Pastikan 1/2 karakter awal plat nomor adalah huruf!';
	END IF;
END//
DELIMITER;

INSERT INTO mobil (id_mobil, plat_no, merk, jenis, harga_sewa_perhari) VALUES
('M09', '7387 ', 'Mazda 5', 'sedan', 950000);

SELECT*FROM mobil


-- no 2
DELIMITER //

CREATE TRIGGER trg_update_peminjaman_on_return
BEFORE UPDATE ON peminjaman
FOR EACH ROW
BEGIN
    DECLARE total_days INT;
    DECLARE daily_rent DECIMAL(10, 2);
    DECLARE overdue_days INT;
    DECLARE daily_fine DECIMAL(10, 2);
    
   
    IF NEW.tgl_kembali <> OLD.tgl_kembali  OR new.tgl_kembali IS NOT NULL THEN
        -- Menghitung total hari sewa
        SET total_days = DATEDIFF(NEW.tgl_kembali, NEW.tgl_pinjam);
        SET NEW.total_hari = total_days;
        
        -- Mendapatkan harga sewa per hari
        SELECT harga_sewa_perhari INTO daily_rent FROM mobil WHERE id_mobil = NEW.id_mobil;
        
        -- Menghitung total bayar
        SET NEW.total_bayar = total_days * daily_rent;
        
        -- Menghitung denda jika ada
        IF new.tgl_kembali > new.tgl_rencana_kembali THEN
       

		SET overdue_days = DATEDIFF(NEW.tgl_kembali, NEW.tgl_rencana_kembali);
            SET daily_fine = 0.1 * daily_rent; -- Denda 10% dari harga sewa per hari
            SET NEW.denda = overdue_days * daily_fine;

            
        ELSE
            SET NEW.denda = 0;
        END IF;
    END IF;
END//

DELIMITER ;
SELECT * FROM peminjaman
UPDATE peminjaman
SET tgl_kembali = '2022-05-31'
WHERE id_pinjam = 'PJ02'

DROP TRIGGER trg_update_peminjaman_on_return

UPDATE peminjaman
SET tgl_kembali = NULL
