USE tugasdua;

-- nomor satu

DELIMITER //
CREATE PROCEDURE ShowAnggotaByTempatLahir(IN tempatLahir VARCHAR(20))
BEGIN
    SELECT * FROM anggota WHERE Tempat_Lahir_Anggota = tempatLahir;
END //

DELIMITER ;

CALL ShowAnggotaByTempatLahir('Jakarta');

DROP PROCEDURE ShowAnggotaByTempatLahir;

-- nomor dua
USE tugasdua;

DELIMITER //

CREATE PROCEDURE ShowAnggotaById(IN anggotaId VARCHAR(10))
BEGIN
    SELECT * FROM anggota WHERE IdAnggota = anggotaId;
END //

DELIMITER ;

CALL ShowAnggotaById('A003');

DROP PROCEDURE ShowAnggotaById;

-- nomor tiga
USE tugasdua;

DELIMITER //

CREATE PROCEDURE ShowPeminjamanByIdAndKodeBuku(IN anggotaId VARCHAR(10), IN kodeBuku VARCHAR(10))
BEGIN
    SELECT * FROM peminjaman WHERE IdAnggota = anggotaId AND Kode_Buku = kodeBuku;
END //

DELIMITER ;

CALL ShowPeminjamanByIdAndKodeBuku('A003', 'B001');
 DROP PROCEDURE ShowPeminjamanByIdAndKodeBuku;

-- nomor empat
USE tugasdua;

DELIMITER //

CREATE PROCEDURE ShowPengembalianByIds(IN anggotaId VARCHAR(10), IN kodeBuku VARCHAR(10), IN petugasId VARCHAR(10))
BEGIN
    SELECT * FROM pengembalian WHERE IdAnggota = anggotaId AND Kode_Buku = kodeBuku AND IdPetugas = petugasId;
END //

DELIMITER ;

CALL ShowPengembalianByIds('A003', 'B001', 'P001');

DROP PROCEDURE ShowPengembalianByIds;

-- nomor lima

USE tugasdua;
SELECT * FROM anggota;

DELIMITER //

CREATE PROCEDURE InsertAnggota(
    IN anggotaId VARCHAR(10),
    IN namaAnggota VARCHAR(20),
    IN angkatanAnggota VARCHAR(6),
    IN tempatLahirAnggota VARCHAR(20),
    IN tanggalLahirAnggota DATE,
    IN noTelp INT(12),
    IN jenisKelamin VARCHAR(15),
    IN statusPinjam VARCHAR(15)
)
BEGIN
    INSERT INTO anggota (
        IdAnggota,
        Nama_Anggota,
        Angkatan_Anggota,
        Tempat_Lahir_Anggota,
        Tanggal_Lahir_Anggota,
        No_Telp,
        Jenis_Kelamin,
        Status_Pinjam
    ) VALUES (
        anggotaId,
        namaAnggota,
        angkatanAnggota,
        tempatLahirAnggota,
        tanggalLahirAnggota,
        noTelp,
        jenisKelamin,
        statusPinjam
    );
END //

DELIMITER ;

CALL InsertAnggota('A008', 'Fahmi', '2022', 'lamongan', '2001-06-18', 887658718, 'Laki-laki', 'Ya');

SELECT * FROM anggota;

DROP PROCEDURE InsertAnggota;
-- nomor enam
USE tugasdua;

DELIMITER //

CREATE PROCEDURE CountAnggota(OUT totalAnggota INT)
BEGIN
    SELECT COUNT(*) INTO totalAnggota FROM anggota;
END //

DELIMITER ;

CALL CountAnggota(@total);
SELECT @total AS TotalAnggota;

DROP PROCEDURE CountAnggota;
-- nomer tujuh
USE tugasdua;
SELECT * FROM anggota ;

DELIMITER //
CREATE PROCEDURE jumlah_jenis_kelamin(IN gender VARCHAR (15),OUT total INT (3))
BEGIN
SELECT COUNT(idAnggota)INTO total
FROM anggota WHERE gender = jenis_kelamin;
END //
DELIMITER ;

CALL jumlah_jenis_kelamin('Perempuan',@total);
SELECT@total;


DROP PROCEDURE  jumlah_jenis_kelamin ;