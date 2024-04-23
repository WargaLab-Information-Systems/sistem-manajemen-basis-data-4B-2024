USE perpustakaan;

//soal no.1
DELIMITER// 
CREATE PROCEDURE petugas(IN id VARCHAR(10))
BEGIN
     SELECT*FROM petugas
     WHERE id = IdPetugas;
END//
DELIMITER;

CALL petugas('1111');

//soal no.2
DELIMITER //
CREATE PROCEDURE cari_anggota_berdasarkan_nama(
    IN p_namaAnggota VARCHAR(20)
)
BEGIN 
    SELECT * FROM anggota WHERE namaAnggota = p_namaAnggota;
END //
DELIMITER ;

CALL cari_anggota_berdasarkan_nama('Meidah Dewi')

//soal no.3
DELIMITER //
CREATE PROCEDURE cari_anggota_berdasarkan_nama_dan_angkatan(
    IN p_namaAnggota VARCHAR(20),
    IN p_angkatanAnggota VARCHAR(6)
)
BEGIN
    SELECT * FROM anggota 
    WHERE namaAnggota = p_namaAnggota AND angkatanAnggota = p_angkatanAnggota;
END //
DELIMITER ;

CALL cari_anggota_berdasarkan_nama_dan_angkatan('Salma Anisa', '2022')

//soal no.4
DELIMITER //
CREATE PROCEDURE cari_anggota_berdasarkan_kriteria(
    IN p_namaAnggota VARCHAR(20),
    IN p_angkatanAnggota VARCHAR(6),
    IN p_JenisKelamin VARCHAR(15)
)
BEGIN
    SELECT * FROM anggota 
    WHERE namaAnggota = p_namaAnggota 
    AND angkatanAnggota = p_angkatanAnggota 
    AND JenisKelamin = p_JenisKelamin;
END //
DELIMITER ;
CALL cari_anggota_berdasarkan_kriteria('Ahmad Nizam', '2021', 'Laki-Laki')

//soal no.5
DELIMITER //
CREATE PROCEDURE tambah_data_anggota(
    IN p_IdAnggota VARCHAR(10), 
    IN p_NamaAnggota VARCHAR(20),
    IN p_AngkatanAnggota VARCHAR(6),
    IN p_TempatLahirAnggota VARCHAR(20),
    IN p_TanggalLahirAnggota DATE,
    IN p_NoTelp INT(15),
    IN p_JenisKelamin VARCHAR(15),
    IN p_statusPinjam VARCHAR(15)
)
BEGIN
    INSERT INTO anggota (IdAnggota, NamaAnggota, AngkatanAnggota, TempatLahirAnggota, TanggalLahirAnggota, NoTelp, JenisKelamin, StatusPinjam)
    VALUES (p_IdAnggota, p_NamaAnggota, p_AngkatanAnggota, p_TempatLahirAnggota, p_TanggalLahirAnggota, p_NoTelp, p_JenisKelamin, p_StatusPinjam);
END //
DELIMITER ;

CALL tambah_data_anggota ('3006', 'Feby', '2023', 'Sidoarjo', '2005-05-05', '085787612345', 'Perempuan', 'Pinjam')
CALL tambah_data_anggota('3007', 'Risma', '2023', 'Mojokerto', '2005-10-10', '098765432134', 'Perempuan', 'Pinjam')
SELECT * FROM anggota;

//soal no.6
DELIMITER //
CREATE PROCEDURE hitung_total_petugas(
    OUT total_petugas INT
)
BEGIN
    SELECT COUNT(*) INTO total_petugas FROM petugas;
END //
DELIMITER ;

CALL hitung_total_petugas(@total_petugas)
SELECT @total_petugas

//soal no.7
DELIMITER //
CREATE PROCEDURE hitung_total_anggota(
    INOUT p_total_anggota INT
)
BEGIN
    SELECT COUNT(*) INTO p_total_anggota FROM anggota;
END //
DELIMITER ;
 
CALL hitung_total_anggota(@p_total_anggota);
SELECT @p_total_anggota