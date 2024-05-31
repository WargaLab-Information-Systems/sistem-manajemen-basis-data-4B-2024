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

-- soal nomer satu
DELIMITER $$
-- Membuat prosedur tersimpan dengan nama Umur_Buku
CREATE PROCEDURE Umur_Buku(
    IN kode_buku_param VARCHAR(10)  -- Parameter input untuk kode buku
)
BEGIN
    -- Deklarasi variabel lokal
    DECLARE tahun_penerbit INT;  -- Variabel untuk menyimpan tahun penerbitan buku
    DECLARE umur_buku INT;       -- Variabel untuk menyimpan umur buku yang dihitung

    -- Mengambil tahun penerbitan buku dari tabel 'buku' berdasarkan 'kode_buku_param'
    SELECT tahun_buku INTO tahun_penerbit 
    FROM buku 
    WHERE kode_buku = kode_buku_param;
    
    -- Menghitung umur buku dengan mengurangkan tahun penerbitan dari tahun saat ini
    SET umur_buku = YEAR(CURDATE()) - tahun_penerbit;
    
    -- Menampilkan hasil perhitungan umur buku sebagai pesan yang mudah dibaca
    SELECT CONCAT('Umur buku dengan kode ', kode_buku_param, 
                  ' adalah ', umur_buku, ' tahun.') AS Umur_Buku;
END$$
DELIMITER ;
CALL Umur_Buku('B001');

-- revisi
-- soal nomer 2
DELIMITER $$
-- Membuat prosedur tersimpan dengan nama Delete_Buku_Tertentu
CREATE PROCEDURE Delete_Buku_Tertentu3()
BEGIN
    -- Menghapus buku dari tabel 'buku' yang tahun penerbitannya sebelum 2000 dan penerbitnya bukan 'AndhiPublisher'
    DELETE FROM buku 
    WHERE tahun_buku < '2000' AND penerbit_buku != 'AndhiPublisher';
END$$
DELIMITER ;
CALL Delete_Buku_Tertentu3()

-- soal nomer 3
DELIMITER $$
-- Membuat prosedur tersimpan dengan nama Update_Jumlah_Buku
CREATE PROCEDURE Update_Jumlah_Buku(
    IN kode_buku_param VARCHAR(10),  -- Parameter input untuk kode buku
    IN transaksi_param VARCHAR(10),  -- Parameter input untuk jenis transaksi ('peminjaman' atau 'pengembalian')
    IN jumlah_param INT              -- Parameter input untuk jumlah buku yang dipinjam atau dikembalikan
)
BEGIN
    -- Memeriksa jenis transaksi
    IF transaksi_param = 'peminjaman' THEN
        -- Mengurangi jumlah buku di tabel 'buku' sesuai dengan 'kode_buku_param' dan 'jumlah_param'
        UPDATE buku 
        SET jumlah_buku = jumlah_buku - jumlah_param 
        WHERE kode_buku = kode_buku_param;
    ELSEIF transaksi_param = 'pengembalian' THEN
        -- Menambah jumlah buku di tabel 'buku' sesuai dengan 'kode_buku_param' dan 'jumlah_param'
        UPDATE buku 
        SET jumlah_buku = jumlah_buku + jumlah_param 
        WHERE kode_buku = kode_buku_param;
    END IF;
END$$
DELIMITER ;
CALL Update_Jumlah_Buku('B001', 'peminjaman', 1);


-- soal nomer 4
DELIMITER $$
-- Membuat prosedur tersimpan dengan nama Jumlah_Buku_Dipinjam
CREATE PROCEDURE Jumlah_Buku_Dipinjam1(
    IN IdAnggota_param VARCHAR(10)  -- Parameter input untuk ID anggota
)
BEGIN
    -- Menampilkan jumlah buku yang dipinjam dan dikembalikan oleh anggota berdasarkan 'IdAnggota_param'
    SELECT 
        a.Nama_Anggota,
        COUNT(DISTINCT p.kode_peminjaman) AS Jumlah_Buku_Dipinjam,
        COUNT(DISTINCT k.Kode_Kembali) AS Jumlah_Buku_Dikembalikan
    FROM 
        anggota a
        LEFT JOIN peminjaman p ON a.IdAnggota = p.IdAnggota
        LEFT JOIN pengembalian k ON a.IdAnggota = k.IdAnggota
    WHERE 
        a.IdAnggota = IdAnggota_param
    GROUP BY 
        a.Nama_Anggota;
END$$
DELIMITER ;
CALL Jumlah_Buku_Dipinjam1('A001');

-- soal nomer 5
DELIMITER $$
-- Membuat prosedur tersimpan dengan nama Delete_Stored_Procedures
CREATE PROCEDURE Delete_Stored_Procedures()
BEGIN
    -- Menghapus prosedur tersimpan 'GetPengembalian' jika ada
    DROP PROCEDURE IF EXISTS GetPengembalian;
END$$
DELIMITER ;
CALL Delete_Stored_Procedures();