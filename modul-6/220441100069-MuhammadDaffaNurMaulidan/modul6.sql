CREATE TABLE anggota (
  IdAnggota VARCHAR(10) PRIMARY KEY,
  Nama_Anggota VARCHAR(20),
  Angkatan_Anggota VARCHAR(6),
  Tempat_Lahir_Anggota VARCHAR(20),
  Tanggal_Lahir_Anggota DATE,
  No_Telp INT(12),
  Jenis_Kelamin VARCHAR(15),
  Status_Pinjam VARCHAR(15)
);

CREATE TABLE petugas (
  IdPetugas VARCHAR(10) PRIMARY KEY,
  Username VARCHAR(15) ,
  PASSWORD VARCHAR(15) ,
  Nama VARCHAR(25)
);

CREATE TABLE buku (
  kode_buku VARCHAR(10) PRIMARY KEY,
  judul_buku TEXT,
  pengarang_buku VARCHAR(30),
  penerbit_buku VARCHAR(30),
  tahun_buku VARCHAR(10) ,
  jumlah_buku VARCHAR(5) ,
  klasifikasi_buku VARCHAR(20) 
);


CREATE TABLE peminjaman (
  kode_peminjaman VARCHAR(10) PRIMARY KEY,
  IdAnggota VARCHAR(10),
  IdPetugas VARCHAR(10),
  Tanggal_Pinjam DATE,
  Tanggal_Kembali DATE,
  Kode_Buku VARCHAR(10),
  FOREIGN KEY (IdAnggota) REFERENCES anggota(IdAnggota),
  FOREIGN KEY (IdPetugas) REFERENCES petugas(IdPetugas),
  FOREIGN KEY (Kode_Buku) REFERENCES buku(kode_buku)
);

CREATE TABLE pengembalian (
  Kode_Kembali VARCHAR(10) PRIMARY KEY,
  IdAnggota VARCHAR(10),
  Kode_Buku VARCHAR(10),
  idPetugas VARCHAR(10),
  Tgl_Kembali DATE,
  tgl_pinjam DATE,
  Denda VARCHAR(15),
  FOREIGN KEY (Kode_Peminjaman) REFERENCES peminjaman(kode_peminjaman),
  FOREIGN KEY (IdAnggota) REFERENCES anggota(IdAnggota),
  FOREIGN KEY (idPetugas) REFERENCES petugas(IdPetugas)
);


-- Mengisi tabel anggota dengan 10 data
INSERT INTO anggota (IdAnggota, Nama_Anggota, Angkatan_Anggota, Tempat_Lahir_Anggota, Tanggal_Lahir_Anggota, No_Telp, Jenis_Kelamin, Status_Pinjam)
VALUES 
('A001', 'John Doe', '2018', 'Jakarta', '1995-05-15', 1234567, 'Laki-laki', 'Tidak Meminjam'),
('A002', 'Jane Smith', '2019', 'Bandung', '1998-10-20', 098765, 'Perempuan', 'Meminjam'),
('A003', 'Michael Johnson', '2020', 'Surabaya', '1997-08-25', 11223, 'Laki-laki', 'Meminjam'),
('A004', 'Emily White', '2021', 'Yogyakarta', '1999-04-12', 22334, 'Perempuan', 'Tidak Meminjam'),
('A005', 'David Brown', '2019', 'Semarang', '1998-01-30', 334455, 'Laki-laki', 'Tidak Meminjam'),
('A006', 'Sarah Johnson', '2020', 'Malang', '1997-07-08', 445566, 'Perempuan', 'Meminjam'),
('A007', 'Daniel Lee', '2018', 'Surakarta', '1996-03-22', 556677, 'Laki-laki', 'Tidak Meminjam'),
('A008', 'Jessica Wang', '2021', 'Medan', '1999-11-18', 66778, 'Perempuan', 'Meminjam'),
('A009', 'Chris Evans', '2020', 'Denpasar', '1997-09-03', 778899, 'Laki-laki', 'Tidak Meminjam'),
('A010', 'Amanda Johnson', '2018', 'Pontianak', '1995-12-28', 88990, 'Perempuan', 'Meminjam');

-- Mengisi tabel buku dengan 10 data
INSERT INTO buku (kode_buku, judul_buku, pengarang_buku, penerbit_buku, tahun_buku, jumlah_buku, klasifikasi_buku)
VALUES 
('B001', 'Harry Potter and the Philosopher\'s Stone', 'J.K. Rowling', 'Bloomsbury', '1997', '10', 'Fiksi Fantasi'),
('B002', 'To Kill a Mockingbird', 'Harper Lee', 'J. B. Lippincott & Co.', '1960', '5', 'Fiksi Klasik'),
('B003', 'The Great Gatsby', 'F. Scott Fitzgerald', 'Charles Scribner\'s Sons', '1925', '8', 'Fiksi Klasik'),
('B004', '1984', 'George Orwell', 'Secker & Warburg', '1949', '12', 'Fiksi Ilmiah'),
('B005', 'The Catcher in the Rye', 'J.D. Salinger', 'Little, Brown and Company', '1951', '7', 'Fiksi Klasik'),
('B006', 'Pride and Prejudice', 'Jane Austen', 'T. Egerton, Whitehall', '1813', '6', 'Fiksi Klasik'),
('B007', 'The Hobbit', 'J.R.R. Tolkien', 'George Allen & Unwin', '1937', '9', 'Fiksi Fantasi'),
('B008', 'The Lord of the Rings', 'J.R.R. Tolkien', 'Allen & Unwin', '1954', '11', 'Fiksi Fantasi'),
('B009', 'Brave New World', 'Aldous Huxley', 'Chatto & Windus', '1932', '4', 'Fiksi Ilmiah'),
('B010', 'The Da Vinci Code', 'Dan Brown', 'Doubleday', '2003', '15', 'Fiksi Misteri');

-- Mengisi tabel petugas dengan 10 data
INSERT INTO petugas (IdPetugas, Username, PASSWORD, Nama)
VALUES 
('P001', 'admin', 'admin123', 'Admin 1'),
('P002', 'staff', 'staff456', 'Staff 1'),
('P003', 'librarian', 'librarian789', 'Librarian 1');


-- Mengisi tabel peminjaman dengan 10 data
INSERT INTO peminjaman (kode_peminjaman, IdAnggota, IdPetugas, Tanggal_Pinjam, Tanggal_Kembali, Kode_Buku)
VALUES 
('PJM001', 'A001', 'P001', '2024-03-01', '2024-03-08', 'B001'),
('PJM002', 'A002', 'P001', '2024-03-05', '2024-03-12', 'B002'),
('PJM003', 'A003', 'P002', '2024-03-10', '2024-03-17', 'B003'),
('PJM004', 'A004', 'P002', '2024-03-15', '2024-03-22', 'B004'),
('PJM005', 'A005', 'P002', '2024-03-20', '2024-03-27', 'B005'),
('PJM006', 'A006', 'P002', '2024-03-25', '2024-04-01', 'B006'),
('PJM007', 'A007', 'P003', '2024-03-30', '2024-04-06', 'B007'),
('PJM008', 'A008', 'P003', '2024-04-04', '2024-04-11', 'B008'),
('PJM009', 'A009', 'P003', '2024-04-09', '2024-04-16', 'B009'),
('PJM010', 'A010', 'P001', '2024-04-14', '2024-04-21', 'B010');

INSERT INTO peminjaman (kode_peminjaman, IdAnggota, IdPetugas, Tanggal_Pinjam, Tanggal_Kembali, Kode_Buku)
VALUES 
('PJM011', 'A001', 'P001', '2024-03-01', '2024-03-08', 'B001'),
('PJM012', 'A001', 'P001', '2024-03-05', '2024-03-12', 'B005'),
('PJM013', 'A001', 'P002', '2024-03-10', '2024-03-17', 'B005'),
('PJM014', 'A001', 'P002', '2024-03-15', '2024-03-22', 'B005'),
('PJM015', 'A001', 'P002', '2024-03-20', '2024-03-27', 'B005'),
('PJM016', 'A001', 'P002', '2024-03-25', '2024-04-01', 'B005'),
('PJM017', 'A001', 'P003', '2024-03-30', '2024-04-06', 'B001'),
('PJM018', 'A002', 'P003', '2024-04-04', '2024-04-11', 'B001'),
('PJM019', 'A002', 'P003', '2024-04-09', '2024-04-16', 'B002'),
('PJM020', 'A002', 'P001', '2024-04-14', '2024-04-21', 'B002');

-- Mengisi tabel pengembalian dengan 10 data
INSERT INTO pengembalian (Kode_Kembali, IdAnggota, Kode_Buku, idPetugas, Tgl_Kembali, tgl_pinjam, Denda)
VALUES 
('KMB001', 'A001', 'B001', 'P001', '2024-03-08', '2024-03-01', '0'),
('KMB002', 'A002', 'B002', 'P001', '2024-03-12', '2024-03-05', '0'),
('KMB003', 'A003', 'B003', 'P001', '2024-03-17', '2024-03-10', '0'),
('KMB004', 'A004', 'B004', 'P002', '2024-03-22', '2024-03-15', '0'),
('KMB005', 'A005', 'B005', 'P002', '2024-03-27', '2024-03-20', '0'),
('KMB006', 'A006', 'B006', 'P002', '2024-04-01', '2024-03-25', '0'),
('KMB007', 'A007', 'B007', 'P003', '2024-04-06', '2024-03-30', '0'),
('KMB008', 'A008', 'B008', 'P003', '2024-04-11', '2024-04-04', '0'),
('KMB009', 'A009', 'B009', 'P003', '2024-04-16', '2024-04-09', '0'),
('KMB010', 'A010', 'B010', 'P003', '2024-04-21', '2024-04-14', '0');

-- soal nomer 1
DELIMITER //
-- Membuat prosedur tersimpan dengan nama GetBiodata
CREATE PROCEDURE GetBiodata(
    IN inputNim VARCHAR(10)  -- Parameter input untuk NIM anggota
)
BEGIN
    DECLARE tahunSekarang INT;  -- Variabel untuk menyimpan tahun sekarang
    DECLARE tahunLahir INT;     -- Variabel untuk menyimpan tahun lahir anggota
    DECLARE umur INT;           -- Variabel untuk menyimpan umur anggota

    -- Menghitung tahun sekarang
    SET tahunSekarang = YEAR(CURDATE());

    -- Mendapatkan tahun lahir dari tanggal lahir anggota
    SELECT YEAR(Tanggal_Lahir_Anggota) INTO tahunLahir
    FROM anggota
    WHERE IdAnggota = inputNim;

    -- Menghitung umur anggota
    SET umur = tahunSekarang - tahunLahir;

    -- Menampilkan biodata anggota
    SELECT IdAnggota AS Nim, Nama_Anggota AS Nama, Tempat_Lahir_Anggota AS Alamat, 
           No_Telp AS 'No Telepon', Jenis_Kelamin AS 'Jenis Kelamin', 
           'Beberapa Hobi' AS Hobi, umur AS Umur
    FROM anggota
    WHERE IdAnggota = inputNim;
END //
DELIMITER ;

CALL GetBiodata('A001');

-- soal nomer 2
DELIMITER //
-- Membuat prosedur tersimpan dengan nama PengingatPengembalian
CREATE PROCEDURE PengingatPengembalian()
BEGIN
    -- Menampilkan pengingat pengembalian berdasarkan tanggal pinjam
    SELECT 
        a.Nama_Anggota, 
        b.judul_buku, 
        p.Tanggal_Pinjam, 
        p.Tanggal_Kembali,
        -- Bagian CASE untuk memberikan pesan pengingat berdasarkan tanggal pinjam
        CASE 
            WHEN DATEDIFF(CURDATE(), p.Tanggal_Pinjam) <= 2 THEN 
                'Silahkan Pergunakan Buku dengan baik'  -- Jika selisih hari antara tanggal sekarang dan tanggal pinjam <= 2 hari
            WHEN DATEDIFF(CURDATE(), p.Tanggal_Pinjam) BETWEEN 3 AND 5 THEN 
                'Ingat!, Waktu Pinjam segera habis'    -- Jika selisih hari antara tanggal sekarang dan tanggal pinjam antara 3 dan 5 hari
            WHEN DATEDIFF(CURDATE(), p.Tanggal_Pinjam) >= 6 THEN 
                'Warning!!!, Denda Menanti Anda'       -- Jika selisih hari antara tanggal sekarang dan tanggal pinjam >= 6 hari
        END AS Pengingat
    FROM peminjaman p
    JOIN anggota a ON p.IdAnggota = a.IdAnggota
    JOIN buku b ON p.Kode_Buku = b.kode_buku;
END //
DELIMITER ;
CALL PengingatPengembalian();

-- soal nomer 3 
DELIMITER //
CREATE PROCEDURE CekDendaMahasiswa3(
    IN p_IdAnggota VARCHAR(10)  -- Parameter input untuk ID anggota
)
BEGIN
    DECLARE dendaCount INT;  -- Variabel untuk menyimpan jumlah denda
    DECLARE totalDenda DECIMAL(10, 2) DEFAULT 0;  -- Variabel untuk menyimpan total jumlah denda
    DECLARE namaAnggota VARCHAR(20);  -- Variabel untuk menyimpan nama anggota

    -- Mendapatkan nama anggota berdasarkan IdAnggota
    SELECT Nama_Anggota INTO namaAnggota
    FROM anggota
    WHERE IdAnggota = p_IdAnggota;

    -- Menghitung jumlah denda yang dimiliki anggota
    SELECT COUNT(*) INTO dendaCount
    FROM pengembalian
    WHERE IdAnggota = p_IdAnggota AND Denda IS NOT NULL AND Denda != '0';

    -- Memeriksa apakah anggota memiliki denda
    IF dendaCount > 0 THEN
        -- Menjumlahkan total denda yang dimiliki anggota
        SELECT SUM(CAST(Denda AS DECIMAL(10, 2))) INTO totalDenda
        FROM pengembalian
        WHERE IdAnggota = p_IdAnggota AND Denda IS NOT NULL AND Denda != '0';
        
        -- Menampilkan total denda yang dimiliki anggota
        SELECT CONCAT('Total denda yang dimiliki oleh ', namaAnggota, ' (IdAnggota: ', p_IdAnggota, ') adalah ', totalDenda) AS Message;
    ELSE
        -- Menampilkan pesan bahwa anggota tidak memiliki denda
        SELECT CONCAT('Anggota dengan Nama ',  namaAnggota, ' tidak memiliki tanggungan atau denda.') AS Message;
    END IF;
END //
DELIMITER ;
CALL CekDendaMahasiswa3('A010');

-- soal nomer 4
DELIMITER //
-- Membuat prosedur tersimpan dengan nama PrintLoanData
CREATE PROCEDURE PrintLoanData()
BEGIN
    DECLARE i INT DEFAULT 1;  -- Variabel untuk perulangan
    -- Melakukan perulangan untuk menampilkan data peminjaman
    WHILE i <= 10 DO
        -- Menampilkan 10 baris pertama dari tabel 'peminjaman'
        SELECT *
        FROM peminjaman 
        LIMIT 10;
        
        -- Meningkatkan nilai 'i' sebanyak 1
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;
CALL PrintLoanData();

DELIMITER ;
-- nomer 5 sudah fix
DELIMITER $$
-- Membuat prosedur tersimpan untuk menghapus anggota laki-laki dengan Status_Pinjam = '0'
CREATE PROCEDURE HapusAnggotaLakiLaki()
BEGIN
    -- Deklarasi variabel untuk menandai akhir dari cursor
    DECLARE selesai INT DEFAULT 0;
    -- Deklarasi variabel untuk menyimpan IdAnggota yang diambil dari cursor
    DECLARE anggota_id VARCHAR(10);
    -- Deklarasi cursor untuk memilih anggota laki-laki dengan Status_Pinjam = 'tidak meminjam'
    DECLARE anggota_cursor CURSOR FOR 
        SELECT IdAnggota FROM anggota WHERE Jenis_Kelamin = 'Laki-laki' AND Status_Pinjam = 'tidak meminjam';
    -- Deklarasi handler untuk mengatur variabel selesai ketika tidak ada baris lagi
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET selesai = 1;
    -- Membuka cursor untuk mulai mengambil baris
    OPEN anggota_cursor;
    -- Memulai loop untuk mengambil dan memproses setiap baris
    baca_loop: LOOP
        -- Mengambil baris berikutnya ke dalam anggota_id
        FETCH anggota_cursor INTO anggota_id;

        -- Jika tidak ada baris lagi, keluar dari loop
        IF selesai THEN
            LEAVE baca_loop;
        END IF;

        -- Menghapus anggota dengan IdAnggota yang diambil
        DELETE FROM anggota WHERE IdAnggota = anggota_id;
    END LOOP;

    -- Menutup cursor setelah semua baris diproses
    CLOSE anggota_cursor;
END$$
DELIMITER ;

CALL HapusAnggotaLakiLaki();

