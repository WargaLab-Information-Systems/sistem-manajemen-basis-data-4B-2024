CREATE DATABASE perpustakaan;

USE perpustakaan;

-- Tabel petugas
CREATE TABLE petugas (
    IdPetugas VARCHAR(10) PRIMARY KEY,
    Username VARCHAR(15),
    PASSWORD VARCHAR(15),
    Nama VARCHAR(25)
);

-- Tabel buku
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

-- Tabel anggota
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

-- Tabel peminjaman
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

-- Tabel pengembalian
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
('PTG001', 'petugasAndi', 'pass12ab', 'Andi Wijaya'),
('PTG002', 'petugasBudi', 'pass34cd', 'Budi Santoso'),
('PTG003', 'petugasCitra', 'pass56ef', 'Citra Lestari'),
('PTG004', 'petugasDani', 'pass78gh', 'Dani Permana'),
('PTG005', 'petugasEka', 'pass90ij', 'Eka Suryani'),
('PTG006', 'petugasFani', 'pass20kl', 'Fani Utami'),
('PTG007', 'petugasGina', 'pass30mn', 'Gina Pratiwi'),
('PTG008', 'petugasHendra', 'pass47op', 'Hendra Kusuma');

INSERT INTO buku (Kode_Buku, Judul_Buku, Pengarang_Buku, Penerbit_Buku, Tahun_Buku, Jumlah_Buku, Status_Buku, Klasifikasi_Buku) VALUES
('BKU001', 'Novel Petualangan Pangeran', 'Surya Lesmana', 'Gramedia', '2018', 10, 'Tersedia', 'Fiksi'),
('BKU002', 'Sejarah Perang Dunia 2', 'Ridho Siswanto', 'Erlangga', '2020', 5, 'Dipinjam', 'Sejarah'),
('BKU003', 'Kumpulan Puisi Lama', 'Rania Putri Dewi', 'Mizan Publishing', '2019', 8, 'Tersedia', 'Sastra'),
('BKU004', 'Harry Potter and the Philosopher''s Stone', 'J.K. Rowling', 'Bloomsbury', '1997', 3, 'Dipinjam', 'Fantasi'),
('BKU005', 'Ensiklopedia Alam', 'Tommy Farizul Akbar', 'GagasMedia', '2017', 7, 'Tersedia', 'Sains'),
('BKU006', 'Panduan Belajar Coding', 'Asmi Pratika Rohma', 'Gramedia', '2022', 6, 'Dipinjam', 'Komputer'),
('BKU007', 'The Lord of the Rings', 'J.R.R. Tolkien', 'Allen & Unwin', '1954', 4, 'Tersedia', 'Fantasi'),
('BKU008', 'Buku Motivasi Diri', 'Billy Jane de Wick', 'Mizan Publishing', '2023', 9, 'Dipinjam', 'Pengembangan Diri');

INSERT INTO anggota (IdAnggota, Nama_Anggota, Angkatan_Anggota, Tempat_Lahir_Anggota, Tanggal_Lahir_Anggota, No_Telp, Jenis_Kelamin, Status_Pinjam) VALUES
('AGT001', 'Hadi Saputra', '2019', 'Surabaya', '2000-05-12', 08112345678, 'Laki-laki', 'Meminjam'),
('AGT002', 'Bella Nurmala', '2020', 'Bandung', '2001-08-20', 08222345633, 'Perempuan', 'Tidak Meminjam'),
('AGT003', 'Charles Teddy', '2022', 'Surabaya', '2003-11-03', 08532345300, 'Laki-laki', 'Meminjam'),
('AGT004', 'Dinda Permatasari', '2020', 'Yogyakarta', '2001-03-15', 08942345184, 'Perempuan', 'Meminjam'),
('AGT005', 'Abid Pratama', '2021', 'Semarang', '2002-07-25', 08152345999, 'Laki-laki', 'Tidak Meminjam'),
('AGT006', 'Fatima Azzahra', '2022', 'Sidoarjo', '2004-12-10', 08562345713, 'Perempuan', 'Meminjam'),
('AGT007', 'Gerry Wijaya', '2021', 'Sidoarjo', '2002-04-18', 08972345264, 'Laki-laki', 'Tidak Meminjam'),
('AGT008', 'Olivia Hana Putri', '2022', 'Makassar', '2004-09-28', 08282345885, 'Perempuan', 'Meminjam');

INSERT INTO peminjaman (Kode_Peminjaman, IdAnggota, IdPetugas, Tanggal_Pinjam, Tanggal_Kembali, Kode_Buku) VALUES
('PMJ0001', 'AGT001', 'PTG001', '2023-03-05', '2023-03-15', 'BKU001'),
('PMJ0002', 'AGT003', 'PTG001', '2023-03-05', '2023-03-17', 'BKU004'),
('PMJ0003', 'AGT004', 'PTG001', '2023-03-05', '2023-03-19', 'BKU003'),
('PMJ0004', 'AGT001', 'PTG004', '2023-03-07', '2023-03-21', 'BKU004'),
('PMJ0005', 'AGT003', 'PTG005', '2023-03-09', '2023-03-23', 'BKU007'),
('PMJ0006', 'AGT001', 'PTG002', '2023-03-11', '2023-03-25', 'BKU006'),
('PMJ0007', 'AGT003', 'PTG007', '2023-03-13', '2023-03-27', 'BKU007'),
('PMJ0008', 'AGT004', 'PTG003', '2023-03-15', '2023-03-29', 'BKU006'),
('PMJ0009', 'AGT001', 'PTG001', '2023-03-05', '2023-03-15', 'BKU001'),
('PMJ0010', 'AGT003', 'PTG006', '2023-03-06', '2023-03-17', 'BKU004'),
('PMJ0011', 'AGT004', 'PTG001', '2023-03-07', '2023-03-19', 'BKU003'),
('PMJ0012', 'AGT006', 'PTG004', '2023-03-07', '2023-03-21', 'BKU004'),
('PMJ0013', 'AGT004', 'PTG005', '2023-03-09', '2023-03-23', 'BKU007'),
('PMJ0014', 'AGT001', 'PTG002', '2023-03-11', '2023-03-25', 'BKU006'),
('PMJ0015', 'AGT003', 'PTG007', '2023-03-13', '2023-03-27', 'BKU007'),
('PMJ0016', 'AGT004', 'PTG003', '2023-03-15', '2023-03-29', 'BKU006'),
('PMJ0017', 'AGT008', 'PTG005', '2023-03-09', '2023-03-23', 'BKU007'),
('PMJ0018', 'AGT001', 'PTG002', '2023-03-11', '2023-03-25', 'BKU006'),
('PMJ0019', 'AGT003', 'PTG007', '2023-03-13', '2023-03-27', 'BKU007'),
('PMJ0020', 'AGT004', 'PTG008', '2023-03-15', '2023-03-29', 'BKU004');

INSERT INTO pengembalian (Kode_Kembali, IdAnggota, Kode_Buku, IdPetugas, Tgl_Pinjam, Tgl_Kembali, Denda) VALUES
('KML0001', 'AGT001', 'BKU001', 'PTG001', '2023-03-05', '2023-03-15', 'Tidak'),
('KML0002', 'AGT003', 'BKU004', 'PTG001', '2023-03-05', '2023-03-17', 'Rp 2.000'),
('KML0003', 'AGT004', 'BKU003', 'PTG001', '2023-03-05', '2023-03-19', 'Rp 4.000'),
('KML0004', 'AGT001', 'BKU004', 'PTG004', '2023-03-07', '2023-03-21', 'Rp 6.000'),
('KML0005', 'AGT003', 'BKU007', 'PTG005', '2023-03-09', '2023-03-23', 'Tidak'),
('KML0006', 'AGT001', 'BKU006', 'PTG002', '2023-03-11', '2023-03-25', 'Tidak'),
('KML0007', 'AGT003', 'BKU007', 'PTG007', '2023-03-13', '2023-03-27', 'Tidak'),
('KML0008', 'AGT004', 'BKU006', 'PTG003', '2023-03-15', '2023-03-29', 'Tidak'),
('KML0009', 'AGT001', 'BKU001', 'PTG001', '2023-03-05', '2023-03-15', 'Tidak'),
('KML0010', 'AGT003', 'BKU004', 'PTG006', '2023-03-06', '2023-03-17', 'Rp 1.000'),
('KML0011', 'AGT004', 'BKU003', 'PTG001', '2023-03-07', '2023-03-19', 'Rp 3.000'),
('KML0012', 'AGT006', 'BKU004', 'PTG004', '2023-03-07', '2023-03-21', 'Rp 6.000'),
('KML0013', 'AGT004', 'BKU007', 'PTG005', '2023-03-09', '2023-03-23', 'Tidak'),
('KML0014', 'AGT001', 'BKU006', 'PTG002', '2023-03-11', '2023-03-25', 'Tidak'),
('KML0015', 'AGT003', 'BKU007', 'PTG007', '2023-03-13', '2023-03-27', 'Tidak'),
('KML0016', 'AGT004', 'BKU006', 'PTG003', '2023-03-15', '2023-03-29', 'Tidak'),
('KML0017', 'AGT008', 'BKU007', 'PTG005', '2023-03-09', '2023-03-23', 'Tidak'),
('KML0018', 'AGT001', 'BKU006', 'PTG002', '2023-03-11', '2023-03-25', 'Tidak'),
('KML0019', 'AGT003', 'BKU007', 'PTG007', '2023-03-13', '2023-03-27', 'Tidak'),
('KML0020', 'AGT004', 'BKU004', 'PTG008', '2023-03-15', '2023-03-29', 'Tidak');

DROP TABLE anggota;

DROP TABLE peminjaman;

DROP TABLE pengembalian;


