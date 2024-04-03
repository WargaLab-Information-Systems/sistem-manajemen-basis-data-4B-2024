CREATE DATABASE perpustakaan
USE perpustakaan;


CREATE TABLE buku (
    Kode_Buku VARCHAR(100) NOT NULL PRIMARY KEY DEFAULT 'Tidak Teridentifikasi',
    Judul_Buku VARCHAR(250) NOT NULL DEFAULT 'Tidak Teridentifikasi',
    Pengarang_Buku VARCHAR(300) NOT NULL DEFAULT 'Tidak Teridentifikasi',
    Penerbit_Buku VARCHAR(300) NOT NULL DEFAULT 'Tidak Teridentifikasi',
    Tahun_Buku VARCHAR(100) NOT NULL DEFAULT 'Tidak Teridentifikasi',
    Jumlah_Buku VARCHAR(50) NOT NULL DEFAULT 'Tidak Teridentifikasi',
    Status_Buku VARCHAR(100) NOT NULL DEFAULT 'Tidak Teridentifikasi',
    Klasifikasi_Buku VARCHAR(200) NOT NULL DEFAULT 'Tidak Teridentifikasi'
);


CREATE TABLE petugas (
    IdPetugas VARCHAR(200) NOT NULL PRIMARY KEY,
    Username VARCHAR(200) NOT NULL,
    `Password` VARCHAR(100) NOT NULL,
    Nama VARCHAR(250) NOT NULL
);


CREATE TABLE anggota (
    IdAnggota VARCHAR(250) NOT NULL PRIMARY KEY,
    Nama_Anggota VARCHAR(250) NOT NULL,
    Angkatan_Anggota VARCHAR(250) NOT NULL,
    Tempat_Lahir_Anggota VARCHAR(250) NOT NULL,
    Tanggal_Lahir_Anggota DATE,
    No_Telp INT NOT NULL,
    Jenis_Kelamin VARCHAR(100) NOT NULL,
    Status_Pinjam VARCHAR(150) NOT NULL
);


ALTER TABLE anggota MODIFY COLUMN No_Telp VARCHAR(100);


CREATE TABLE pengembalian (
    Kode_Kembali VARCHAR(100) NOT NULL PRIMARY KEY,
    IdAnggota VARCHAR(250) NOT NULL,
    Kode_Buku VARCHAR(100) NOT NULL,
    IdPetugas VARCHAR(100) NOT NULL,
    Tgl_Pinjam DATE,
    Tgl_Kembali DATE,
    Denda VARCHAR(150) NOT NULL
);


CREATE TABLE peminjaman (
    Kode_Peminjaman VARCHAR(100) NOT NULL PRIMARY KEY,
    IdAnggota VARCHAR(250) NOT NULL,
    IdPetugas VARCHAR(100) NOT NULL,
    Tanggal_Pinjam DATE,
    Tanggal_Kembali DATE,
    Kode_Buku VARCHAR(100) NOT NULL
);



INSERT INTO buku (Kode_Buku, Judul_Buku, Pengarang_Buku, Penerbit_Buku, Tahun_Buku, Jumlah_Buku, Status_Buku, Klasifikasi_Buku) VALUES 
('1', 'Kimi no namaewa?', 'Mashashi Kishimoto', 'Gramedia', '2019', '40', 'Tersedia', 'Fiksi Happy End'),
('2', 'Zutto futari', 'Kana Hashimoto', 'Japanesu', '2015', '30', 'Tersedia', 'Fiksi Anime'),
('3', 'Shigatsu wa kimi no uso', 'Akira', 'Gramedia Japanesu', '2010', '50', 'Tersedia', 'Sad Ending'),
('4', 'Happier', 'Osas', 'Pustaka Raya', '2017', '65', 'Tidak Tersedia', 'Biografi'),
('5', 'Reckless', 'NIgaa', 'Gramedia Pustaka Utama', '2019', '45', 'Tersedia', 'Sejarah CInta'),
('6', 'Seandainya x Perih', 'The janson', 'Library', '2024', '35', 'Tersedia', 'Fantasi Sad'),
('7', 'Dischanted', 'hoirul anwar', 'Balai Kota', '2022', '25', 'Tersedia', 'Love'),
('8', 'Kenanglah aku', 'Mat Ganjar', 'Gramedity', '2021', '60', 'Tidak Tersedia', 'Gamon kek e'),
('9', 'Andaikan Kau datang Kembali', 'Steven Udin', 'Milor Media Utama', '2022', '45', 'Tersedia', 'gamon pisan ini mah'),
('10', 'Cinderella', 'Arep Simanjuntak', 'Gramedia Inter', '2017', '60', 'Tersedia', 'Rill boloo'),
('11', 'Payung Teduh', 'Virgoun ygy', 'Gramedia Pustaka Utama', '2016', '35', 'Tersedia', 'Balmond'),
('12', 'Line Without a hook', 'bemwich', 'Takemehome', '2020', '80', 'Tidak Tersedia', 'Insecure'),
('13', 'Seandainya Kamu Merasakan', 'Sarep Sontoloyo', 'Gramedity', '2024', '50', 'Tersedia', 'Biar adil'),
('14', 'Al-Hijrotu', 'Koii', 'Komputindo', '2022', '40', 'Tersedia', 'Hijrah bolo');


SELECT * FROM buku;


INSERT INTO anggota (IdAnggota, Nama_Anggota, Angkatan_Anggota, Tempat_Lahir_Anggota, Tanggal_Lahir_Anggota, No_Telp, Jenis_Kelamin, Status_Pinjam) VALUES 
('IDA001', 'Solihin Berkah', '2021', 'Bangkalan', '2001-08-09', '08959089851', 'L', 'Aktif'),
('IDA002', 'Asep Sirotulmustakim', '2020', 'Sukabumi', '1990-02-21', '0812367890', 'L', 'Aktif'),
('IDA003', 'Ali Kaliper', '2021', 'Yogyakarta', '2002-06-02', '08765432098', 'L', 'Aktif'),
('IDA004', 'Ucup Baba', '2022', 'Bandung', '1998-11-16', '08234567901', 'L', 'Aktif'),
('IDA005', 'Junaedi Spakbor', '2022', 'Surabaya', '1991-08-07', '08901245678', 'L', 'Aktif'),
('IDA006', 'Kunti Bogel', '2023', 'Magelang', '2004-12-31', '08123567890', 'P', 'Aktif'),
('IDA007', 'Muhammad Ali', '2021', 'Jakarta', '2002-05-22', '08987654310', 'L', 'Aktif'),
('IDA008', 'Ganjarudin', '2022', 'Tegal', '1978-09-23', '08567890124', 'L', 'Aktif'),
('IDA009', 'Must a nice', '2021', 'Jakarta', '1980-03-14', '08234567801', 'L', 'Aktif'),
('IDA010', 'Opek Racing team', '2023', 'Surabaya', '2001-04-15', '08123467890', 'L', 'Aktif'),
('IDA011', 'Anissa Ricindy', '2022', 'Bandung', '1998-02-10', '08765432108', 'P', 'Aktif'),
('IDA012', 'Wulandari', '2023', 'Surabaya', '2001-10-01', '08234567801', 'P', 'Aktif'),
('IDA013', 'Masita Dwi', '2021', 'Malang', '2002-09-12', '08901234578', 'P', 'Aktif'),
('IDA014', 'Saiful Energen', '2022', 'Semarang', '1999-12-25', '08123457890', 'L', 'Aktif'),
('IDA015', 'Selamet riyadi', '2021', 'Suramadu', '1979-07-03', '08567890124', 'L', 'Aktif');


SELECT * FROM anggota;


INSERT INTO petugas (IdPetugas, Username, `Password`, Nama) VALUES
('IDP001', 'userIDP001', 'asulama123', 'Bambang Yudoyono'),
('IDP002', 'userIDP002', 'password123', 'Agus Konsol Game'),
('IDP003', 'userIDP003', 'qwerty123', 'Rahmat Tuhan'),
('IDP004', 'userIDP004', 'iloveyou', 'Diva Kholisin'),
('IDP005', 'userIDP005', 'Pwaja', 'Lindawati'),
('IDP006', 'userIDP006', 'welcome123', 'Agus Sucipto'),
('IDP007', 'userIDP007', 'letmein123', 'Rina agustina'),
('IDP008', 'userIDP008', 'admin123', 'Ayu Ashari'),
('IDP009', 'userIDP009', 'passwordasal', 'Udin Petot'),
('IDP010', 'userIDP010', '123456789', 'Liswanto'),
('IDP011', 'userIDP011', 'abc123', 'Miladunikka'),
('IDP012', 'userIDP012', 'akibaraha', 'Budi Woodpecker'),
('IDP013', 'userIDP013', 'letsgo123', 'Ruditabuti'),
('IDP014', 'userIDP014', 'test1234', 'Sintia Putri rahayu'),
('IDP015', 'userIDP015', 'letitgo', 'Agustina');


SELECT * FROM petugas;


INSERT INTO peminjaman (Kode_Peminjaman, IdAnggota, IdPetugas, Tanggal_Pinjam, Tanggal_Kembali, Kode_Buku) VALUES
('KPJ001', 'IDA004', 'IDP015', '2024-03-17', '2024-03-21', 'BL001'),
('KPJ002', 'IDA008', 'IDP013', '2024-02-12', '2024-02-15', 'BL002'),
('KPJ003', 'IDA012', 'IDP009', '2024-05-03', '2024-05-05', 'BL003'),
('KPJ004', 'IDA003', 'IDP001', '2024-04-07', '2024-04-10', 'BL001'),
('KPJ005', 'IDA015', 'IDP002', '2024-01-20', '2024-01-22', 'BL004'),
('KPJ006', 'IDA011', 'IDP004', '2024-06-14', '2024-06-16', 'BL002'),
('KPJ007', 'IDA007', 'IDP012', '2024-08-29', '2024-08-31', 'BL005'),
('KPJ008', 'IDA009', 'IDP005', '2024-07-10', '2024-07-14', 'BL003'),
('KPJ009', 'IDA014', 'IDP008', '2024-05-01', '2024-05-05', 'BL004'),
('KPJ010', 'IDA001', 'IDP003', '2024-04-18', '2024-04-21', 'BL001'),
('KPJ011', 'IDA013', 'IDP014', '2024-09-05', '2024-09-07', 'BL005'),
('KPJ012', 'IDA002', 'IDP006', '2024-02-20', '2024-02-24', 'BL001'),
('KPJ013', 'IDA006', 'IDP015', '2024-07-25', '2024-07-27', 'BL002'),
('KPJ014', 'IDA010', 'IDP011', '2024-03-15', '2024-03-19', 'BL003'),
('KPJ015', 'IDA005', 'IDP007', '2024-05-09', '2024-05-12', 'BL001'),
('KPJ016', 'IDA008', 'IDP010', '2024-08-01', '2024-08-05', 'BL004'),
('KPJ017', 'IDA015', 'IDP013', '2024-09-10', '2024-09-14', 'BL005'),
('KPJ018', 'IDA003', 'IDP001', '2024-11-07', '2024-11-10', 'BL001'),
('KPJ019', 'IDA011', 'IDP004', '2024-10-18', '2024-10-20', 'BL002'),
('KPJ020', 'IDA014', 'IDP002', '2024-12-24', '2024-12-27', 'BL004'),
('KPJ021', 'IDA014', 'IDP010', '2024-08-01', '2024-08-05', 'BL004'),
('KPJ022', 'IDA014', 'IDP013', '2024-09-10', '2024-09-14', 'BL005'),
('KPJ023', 'IDA014', 'IDP001', '2024-11-07', '2024-11-10', 'BL001'),
('KPJ024', 'IDA014', 'IDP004', '2024-10-18', '2024-10-20', 'BL002'),
('KPJ025', 'IDA014', 'IDP002', '2024-12-24', '2024-12-27', 'BL004');


SELECT * FROM peminjaman;


INSERT INTO pengembalian (Kode_Kembali, IdAnggota, Kode_Buku, IdPetugas, Tgl_Pinjam, Tgl_Kembali, Denda) VALUES
('IDK001', 'IDA004', 'BL001', 'IDP015', '2024-03-17', '2024-03-21', 'Tidak Kena Denda'),
('IDK002', 'IDA001', 'BL003', 'IDP008', '2024-03-25', '2024-03-27', 'Tidak Kena Denda'),
('IDK003', 'IDA002', 'BL002', 'IDP010', '2024-03-28', '2024-03-30', 'Denda Rp. 10000'),
('IDK004', 'IDA003', 'BL005', 'IDP011', '2024-03-20', '2024-03-22', 'Tidak Kena Denda'),
('IDK005', 'IDA004', 'BL001', 'IDP015', '2024-03-17', '2024-03-21', 'Denda Rp. 50000'),
('IDK006', 'IDA005', 'BL004', 'IDP012', '2024-03-19', '2024-03-21', 'Tidak Kena Denda'),
('IDK007', 'IDA006', 'BL003', 'IDP012', '2024-03-23', '2024-03-24', 'Denda Rp. 15000'),
('IDK008', 'IDA007', 'BL002', 'IDP014', '2024-03-22', '2024-03-23', 'Tidak Kena Denda'),
('IDK009', 'IDA008', 'BL005', 'IDP011', '2024-03-18', '2024-03-20', 'Denda Rp. 20000'),
('IDK010', 'IDA009', 'BL001', 'IDP014', '2024-03-21', '2024-03-25', 'Tidak Kena Denda'),
('IDK011', 'IDA010', 'BL004', 'IDP009', '2024-03-29', '2024-03-30', 'Denda Rp. 5000'),
('IDK012', 'IDA011', 'BL003', 'IDP002', '2024-03-18', '2024-03-19', 'Tidak Kena Denda'),
('IDK013', 'IDA012', 'BL002', 'IDP008', '2024-03-24', '2024-03-26', 'Denda Rp. 25000'),
('IDK014', 'IDA013', 'BL005', 'IDP007', '2024-03-26', '2024-03-29', 'Tidak Kena Denda'),
('IDK015', 'IDA014', 'BL001', 'IDP006', '2024-03-20', '2024-03-22', 'Denda Rp. 10000'),
('IDK016', 'IDA015', 'BL004', 'IDP005', '2024-03-27', '2024-03-28', 'Tidak Kena Denda'),
('IDK017', 'IDA014', 'BL003', 'IDP004', '2024-03-22', '2024-03-24', 'Denda Rp. 30000'),
('IDK018', 'IDA001', 'BL002', 'IDP003', '2024-03-18', '2024-03-19', 'Tidak Kena Denda'),
('IDK019', 'IDA009', 'BL005', 'IDP002', '2024-03-23', '2024-03-26', 'Denda Rp. 15000'),
('IDK020', 'IDA010', 'BL001', 'IDP009', '2024-03-29', '2024-03-31', 'Tidak Kena Denda');


SELECT * FROM pengembalian;


## 1
CREATE VIEW NO1 AS
SELECT a.Nama_Anggota, COUNT(p.Kode_Buku) AS `Jumlah Buku Dipinjam`
FROM anggota a JOIN peminjaman p ON a.IdAnggota = p.IdAnggota
GROUP BY a.IdAnggota HAVING COUNT(p.Kode_Buku) > 5;

SELECT * FROM NO1;


## 2
CREATE VIEW NO2 AS
SELECT p.IdPetugas, COUNT(p.Kode_Buku) AS `Jumlah Buku Terpinjam`
FROM peminjaman p
GROUP BY p.IdPetugas;


SELECT * FROM NO2;

DROP VIEW NO1;
##3
CREATE VIEW NO3 AS
SELECT p.IdPetugas, COUNT(p.Kode_Buku) AS `Jumlah Buku Terpinjam`
FROM peminjaman p
GROUP BY p.IdPetugas
HAVING COUNT(Kode_Buku) = 
    (SELECT MAX(`Jumlah Buku Terpinjam`) 
        FROM (SELECT IdPetugas, COUNT(Kode_Buku) AS `Jumlah Buku Terpinjam` 
        FROM peminjaman GROUP BY IdPetugas) AS `Petugas Jumlah Buku`);
        
SELECT * FROM NO3;


##4
CREATE VIEW NO4 AS
SELECT b.Judul_Buku, COUNT(p.Kode_Buku) AS `Jumlah Peminjaman`
FROM buku b
JOIN peminjaman p ON b.Kode_Buku = p.Kode_Buku
GROUP BY b.Judul_Buku
HAVING COUNT(p.Kode_Buku) = 
    (SELECT MAX(`Jumlah Peminjaman`) 
        FROM (SELECT COUNT(Kode_Buku) AS `Jumlah Peminjaman` 
        FROM peminjaman GROUP BY Kode_Buku) AS `Buku Jumlah Peminjaman`);


SELECT * FROM NO4;

DROP VIEW NO4;

SHOW TABLES;
