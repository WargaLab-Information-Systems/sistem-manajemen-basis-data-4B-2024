USE rental_mobil

NO 1
DELIMITER //
CREATE TRIGGER cek_tanggal BEFORE INSERT ON peminjaman
FOR EACH ROW
	BEGIN
		IF (new.tgl_pinjam > new.tgl_rencana_kembali) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT='Tanggal rencana kembali lebih awal dari tanggal pinjam !';
		END IF;
	END //
DELIMITER ;
SELECT * FROM peminjaman

-- tgl_rencana_kembali > tgl_pinjam
INSERT INTO peminjaman VALUE("PM71", "MB77", "PW17", "2021-08-22","2021-08-21", 2, 1000000,"2021-08-28",0);



DROP TRIGGER cek_tanggal


NO 2
DROP TRIGGER rental_mobil.trg_update_peminjaman_on_return
DROP TRIGGER trg_update_peminjaman_on_return
DROP TRIGGER trg_update_peminjaman_on_return

DELIMITER //

CREATE TRIGGER trg_update_peminjaman_on_return
BEFORE UPDATE ON PEMINJAMAN
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
        SELECT HARGA_SEWA_PERHARI INTO daily_rent FROM mobil WHERE ID_MOBIL = NEW.ID_MOBIL;
        
        -- Menghitung total bayar
        SET NEW.TOTAL_BAYAR = total_days * daily_rent; -- toral hari dikali harga sewa perharinya
        
        -- Menghitung denda jika ada
        IF NEW.TGL_KEMBALI > OLD.TGL_RENCANA_KEMBALI THEN
            SET overdue_days = DATEDIFF(NEW.TGL_KEMBALI, NEW.TGL_RENCANA_KEMBALI);
            SET daily_fine = 0.1 * daily_rent; -- Denda 10% dari harga sewa per hari
            SET NEW.DENDA = overdue_days * daily_fine;

            
        ELSE
            SET NEW.DENDA = 0;
        END IF;
    END IF;
END//

DELIMITER ;

-- Insert data valid ke tabel PEMINJAMAN tanpa mengisi TGL_KEMBALI
INSERT INTO PEMINJAMAN (ID_MOBIL, ID_PELANGGAN, TGL_PINJAM, TGL_RENCANA_KEMBALI)
VALUES (2, 2, '2024-05-10', '2024-05-15');

-- Update untuk mengisi TGL_KEMBALI dan memicu trigger
UPDATE peminjaman
SET tgl_kembali = '2022-08-20'
WHERE id_pinjam = 'PM61';
 -- Gantilah ID dengan ID yang sesuai dari hasil insert sebelumnya

SELECT * FROM peminjaman;
CALL update_peminjaman();


SELECT * FROM peminjaman

DELETE FROM update_peminjaman WHERE id_pinjam = 'PJ02';



3.
DELIMITER //
CREATE TRIGGER validate_nik BEFORE INSERT ON pelanggan FOR EACH ROW
BEGIN
	IF (new.nik NOT REGEXP '(0-9)') OR (LENGTH(new.nik)<>15)
		THEN SIGNAL SQLSTATE "45000"
		SET MESSAGE_TEXT="Panjang NIK harus sesuai dengan aturan!";
	END IF;
END //
DELIMITER ;

DROP TRIGGER validasi_nik
SELECT * FROM pelanggan

INSERT INTO pelanggan (id_pelanggan, nama, alamat, nik, no_telephone, jenis_kelamin) 
VALUE ("PP11", "angga", "Bandung" , 1243562, 08766512121, "LK");


4.
DELIMITER//
CREATE TRIGGER validasi_platno
BEFORE INSERT ON mobil
FOR EACH ROW
BEGIN
	IF (new.plat_nomer NOT REGEXP '[a-zA-Z]') THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '1/2 karakter awal plat nomor harus huruf!!';
	END IF;
END//
DELIMITER;

INSERT INTO mobil (id_mobil, plat_nomer, merek, jenis_mobil, harga_sewa_perhari) VALUES
('MB77', 'AB 991', 'New Xpander', 'MPV', 500000);

SELECT*FROM Mobil