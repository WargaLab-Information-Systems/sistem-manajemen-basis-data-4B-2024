CREATE DATABASE dbperpustakaan;

USE dbperpustakaan;

CREATE TABLE petugas (
    IdPetugas VARCHAR(10) PRIMARY KEY,
    Username VARCHAR(15),
    PASSWORD VARCHAR(15),
    Nama VARCHAR(25)
);

CREATE TABLE buku (
    Kode_Buku VARCHAR(10) PRIMARY KEY,
    Judul_Buku VARCHAR(25),
    Pengarang_Buku VARCHAR(30),
    Penerbit_Buku VARCHAR(30),
    Tahun_Buku VARCHAR(10),
    Jumlah_Buku INT,
    Status_Buku VARCHAR(10),
    Klasifikasi_Buku VARCHAR(20)
);

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

CREATE TABLE peminjaman (
    Kode_Peminjaman VARCHAR(10) PRIMARY KEY,
    IdAnggota VARCHAR(10),
    IdPetugas VARCHAR(10),
    Tanggal_Pinjam DATE,
    Tanggal_Kembali DATE,
    Kode_Buku VARCHAR(10),
    FOREIGN KEY (IdAnggota) REFERENCES anggota(IdAnggota),
    FOREIGN KEY (IdPetugas) REFERENCES petugas(IdPetugas),
    FOREIGN KEY (Kode_Buku) REFERENCES buku(Kode_Buku)
);

CREATE TABLE pengembalian (
    Kode_Kembali VARCHAR(10) PRIMARY KEY,
    IdAnggota VARCHAR(10),
    Kode_Buku VARCHAR(10),
    IdPetugas VARCHAR(10),
    Tgl_Pinjam DATE,
    Tgl_Kembali DATE,
    Denda VARCHAR(15),
    FOREIGN KEY (IdAnggota) REFERENCES anggota(IdAnggota),
    FOREIGN KEY (Kode_Buku) REFERENCES buku(Kode_Buku),
    FOREIGN KEY (IdPetugas) REFERENCES petugas(IdPetugas)
);

SHOW TABLES;

INSERT INTO petugas (IdPetugas, Username, PASSWORD, Nama) VALUES
('P101', 'petugas101', 'pass20101', 'Dewi Kartika'),
('P102', 'petugas102', 'pass20102', 'Indah Permatasari'),
('P103', 'petugas103', 'pass20103', 'Ari Wibowo'),
('P104', 'petugas104', 'pass20104', 'Wijaya Kusuma '),
('P105', 'petugas105', 'pass20105', 'Ujang Arifin'),
('P106', 'petugas106', 'pass20106', 'Elis Arini');

INSERT INTO buku (Kode_Buku, Judul_Buku, Pengarang_Buku, Penerbit_Buku, Tahun_Buku, Jumlah_Buku, Status_Buku, Klasifikasi_Buku) VALUES
('B101', 'Negeri 5 Menara', 'Ahmad Fuadi', 'Gramedia Pustaka Utama', '2009', 10, 'Tersedia', 'Novel'),
('B102', 'Sejarah Nasional Indonesia', 'M.C. Ricklefs', 'Balai Pustaka', '2008', 5, 'Dipinjam', 'Sejarah'),
('B103', 'Pemrograman Python untuk Pemula', 'Budi Raharjo', 'Informatika', '2020', 8, 'Tersedia', 'Komputer'),
('B104', 'Biografi Bung Karno', 'Cindy Adams', 'Yayasan Bung Karno', '2015', 7, 'Tersedia', 'Biografi'),
('B105', 'Hujan Bulan Juni', 'Sapardi Djoko Damono', 'Grasindo', '2004', 12, 'Dipinjam', 'Puisi'),
('B106', 'Ensiklopedia Tumbuhan Obat', 'Indra Ridwan', 'Penebar Swadaya', '2012', 4, 'Tersedia', 'Sains'),
('B107', 'Laskar Pelangi', 'Andrea Hirata', 'Bentang Pustaka', '2005', 6, 'Dipinjam', 'Novel');

INSERT INTO anggota (IdAnggota, Nama_Anggota, Angkatan_Anggota, Tempat_Lahir_Anggota, Tanggal_Lahir_Anggota, No_Telp, Jenis_Kelamin, Status_Pinjam) VALUES
('A101', 'Andi Pratama', '2018', 'Jakarta', '2000-05-12', 08112345678, 'Laki-laki', 'Meminjam'),
('A102', 'Aldo Wijaya', '2019', 'Surabaya', '2001-09-25', 08123456789, 'Laki-laki', 'Tidak Meminjam'),
('A103', 'Alika Jastinia', '2017', 'Bandung', '1999-03-08', 08987654321, 'Perempuan', 'Meminjam'),
('A104', 'Dimas Prasetyo', '2020', 'Yogyakarta', '2002-11-03', 08567891234, 'Laki-laki', 'Tidak Meminjam'),
('A105', 'Naila Sari', '2019', 'Semarang', '2001-07-20', 08345678912, 'Perempuan', 'Meminjam'),
('A106', 'Fandi Wibowo', '2018', 'Medan', '2000-02-15', 08789123456, 'Laki-laki', 'Tidak Meminjam'),
('A107', 'Gitania Purwanti', '2017', 'Makassar', '1999-11-20', 08456789123, 'Perempuan', 'Meminjam'),
('A108', 'Hasan Amir', '2019', 'Palembang', '2001-06-15', 08234567890, 'Laki-laki', 'Meminjam');


INSERT INTO peminjaman (Kode_Peminjaman, IdAnggota, IdPetugas, Tanggal_Pinjam, Tanggal_Kembali, Kode_Buku) VALUES
('PM101', 'A101', 'P101', '2023-03-01', '2023-03-15', 'B101'),
('PM102', 'A103', 'P102', '2023-03-10', '2023-03-24', 'B102'),
('PM103', 'A101', 'P103', '2023-03-20', '2023-04-03', 'B103'),
('PM104', 'A104', 'P104', '2023-04-01', '2023-04-15', 'B104'),
('PM105', 'A105', 'P105', '2023-04-10', '2023-04-24', 'B105'),
('PM106', 'A106', 'P106', '2023-04-20', '2023-05-04', 'B106'),
('PM107', 'A102', 'P101', '2023-05-01', '2023-05-15', 'B102'),
('PM108', 'A103', 'P102', '2023-05-10', '2023-05-24', 'B103'),
('PM109', 'A105', 'P103', '2023-05-20', '2023-06-03', 'B105'),
('PM110', 'A106', 'P104', '2023-06-01', '2023-06-15', 'B101'),
('PM111', 'A107', 'P105', '2023-03-15', '2023-03-29', 'B102'),
('PM112', 'A107', 'P106', '2023-04-01', '2023-04-15', 'B104'),
('PM113', 'A107', 'P101', '2023-04-20', '2023-05-04', 'B106'),
('PM114', 'A108', 'P102', '2023-04-10', '2023-04-24', 'B101'),
('PM115', 'A108', 'P103', '2023-05-01', '2023-05-15', 'B103'),
('PM116', 'A108', 'P104', '2023-05-20', '2023-06-03', 'B105'),
('PM117', 'A106', 'P104', '2023-06-01', '2023-06-15', 'B101'),
('PM118', 'A106', 'P104', '2023-06-01', '2023-06-15', 'B101'),
('PM119', 'A106', 'P104', '2023-06-01', '2023-06-15', 'B101'),
('PM120', 'A106', 'P104', '2023-06-01', '2023-06-15', 'B101'),
('PM121', 'A106', 'P104', '2023-06-01', '2023-06-15', 'B101');


INSERT INTO pengembalian (Kode_Kembali, IdAnggota, Kode_Buku, IdPetugas, Tgl_Pinjam, Tgl_Kembali, Denda) VALUES
('PK101', 'A101', 'B101', 'P101', '2023-03-01', '2023-03-15', 'Tidak'),
('PK102', 'A103', 'B102', 'P102', '2023-03-10', '2023-03-28', 'Ya'),
('PK103', 'A101', 'B103', 'P103', '2023-03-20', '2023-04-03', 'Tidak'),
('PK104', 'A104', 'B104', 'P104', '2023-04-01', '2023-04-15', 'Tidak'),
('PK105', 'A105', 'B105', 'P105', '2023-04-10', '2023-04-28', 'Ya'),
('PK106', 'A106', 'B106', 'P106', '2023-04-20', '2023-05-04', 'Tidak'),
('PK107', 'A102', 'B102', 'P101', '2023-05-01', '2023-05-17', 'Ya'),
('PK108', 'A103', 'B103', 'P102', '2023-05-10', '2023-05-24', 'Tidak'),
('PK109', 'A105', 'B105', 'P103', '2023-05-20', '2023-06-05', 'Ya'),
('PK110', 'A106', 'B101', 'P104', '2023-06-01', '2023-06-15', 'Tidak'),
('PK111', 'A107', 'B102', 'P105', '2023-03-15', '2023-03-31', 'Ya'),
('PK112', 'A107', 'B104', 'P106', '2023-04-01', '2023-04-15', 'Tidak'),
('PK113', 'A107', 'B106', 'P101', '2023-04-20', '2023-05-04', 'Tidak'),
('PK114', 'A108', 'B101', 'P102', '2023-04-10', '2023-04-24', 'Tidak'),
('PK115', 'A108', 'B103', 'P103', '2023-05-01', '2023-05-17', 'Ya'),
('PK116', 'A108', 'B105', 'P104', '2023-05-20', '2023-06-05', 'Ya');

DROP TABLE anggota;

DROP TABLE peminjaman;

DROP TABLE pengembalian;

DROP TABLE petugas;

DROP DATABASE dbperpustakaan;
