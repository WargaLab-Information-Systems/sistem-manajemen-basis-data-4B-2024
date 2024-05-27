USE m7_rental_mobil


NO 1
DELIMITER //
CREATE TRIGGER cek_tanggal BEFORE INSERT ON m7_peminjaman
FOR EACH ROW
	BEGIN
		IF (new.tgl_pinjam > new.tgl_rencana_kembali) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT='Tanggal rencana kembali lebih awal dari tanggal pinjam !';
		END IF;
	END //
DELIMITER ;

-- tgl_rencana_kembali > tgl_pinjam
INSERT INTO m7_peminjaman VALUE("PJ06", "M03", "P01", "2021-08-22","2021-08-21", 2, 1000000,"2021-08-28",0);


DROP TRIGGER cek_tanggal

NO 2
DELIMITER //

CREATE TRIGGER trg_update_peminjaman_on_return
BEFORE UPDATE ON m7_PEMINJAMAN
FOR EACH ROW
BEGIN
    DECLARE total_days INT;
    DECLARE daily_rent DECIMAL(10, 2);
    DECLARE overdue_days INT;
    DECLARE daily_fine DECIMAL(10, 2);
    
   
    IF NEW.TGL_KEMBALI <> OLD.TGL_KEMBALI  OR new.tgl_kembali IS NOT NULL THEN
        -- Menghitung total hari sewa
        SET total_days = DATEDIFF(NEW.TGL_KEMBALI, NEW.TGL_PINJAM);
        SET NEW.TOTAL_HARI = total_days;
        
        -- Mendapatkan harga sewa per hari
        SELECT HARGA_SEWA_PERHARI INTO daily_rent FROM m7_MOBIL WHERE ID_MOBIL = NEW.ID_MOBIL;
        
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
/

-- Update untuk mengisi TGL_KEMBALI dan memicu trigger
UPDATE m7_PEMINJAMAN
SET tgl_kembali =  '2022-07-29'
WHERE id_pinjam = 'PJ04'
-- Gantilah ID dengan ID yang sesuai dari hasil insert sebelumnya

SELECT * FROM m7_peminjaman





3.
DELIMITER //
CREATE TRIGGER m7_validate_nik BEFORE INSERT ON m7_pelanggan FOR EACH ROW
BEGIN
	IF (new.nik NOT REGEXP '(0-9)') OR (LENGTH(new.nik)<>15)
		THEN SIGNAL SQLSTATE "45000"
		SET MESSAGE_TEXT="Panjang NIK harus sesuai dengan aturan!";
	END IF;
END //
DELIMITER ;

DROP TRIGGER validasi_nik
SELECT * FROM m7_pelanggan

INSERT INTO m7_pelanggan (id_pelanggan, nama, alamat, nik, no_telp, jenis_kelamin) 
VALUE ("P08", "Mahmud", "Surabaya" , 1234567891023456, 085749755462, "Laki-laki");


4.
DELIMITER//
CREATE TRIGGER validasi_platno
BEFORE INSERT ON m7_mobil
FOR EACH ROW
BEGIN
	IF (new.platno NOT REGEXP '[a-zA-Z]') THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '1/2 karakter awal plat nomor harus huruf!!';
	END IF;
END//
DELIMITER;

INSERT INTO m7_mobil (id_mobil, platno, merk, jenis, harga_sewa_perhari) VALUES
("M06","AE 345","BMW E36", "sport", 800000)


SELECT*FROM Mobil