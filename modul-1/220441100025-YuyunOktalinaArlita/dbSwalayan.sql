-- MEMBUAT DATABASE

-- Membuat Database
CREATE DATABASE dbSwalayan;

-- Menggunakan Database
USE dbSwalayan;

-- MEMBUAT TABEL

CREATE TABLE Pelanggan (
    ID_Pelanggan INT PRIMARY KEY,
    Nama_Pelanggan VARCHAR(100),
    Alamat_Pelanggan VARCHAR(255),
    Nomor_Telepon VARCHAR(20)
);

-- Membuat Tabel Barang
CREATE TABLE Barang (
    ID_Barang INT PRIMARY KEY,
    Nama_Barang VARCHAR(100),
    Harga_Jual DECIMAL(18, 2),
    Harga_Beli DECIMAL(18, 2),
    Stok INT
);

-- Membuat Tabel Supplier
CREATE TABLE Supplier (
    ID_Supplier INT PRIMARY KEY,
    Nama_Supplier VARCHAR(100),
    Alamat_Supplier VARCHAR(255),
    Nomor_Telepon VARCHAR(20)
);

-- Membuat Tabel Pembelian
CREATE TABLE Pembelian (
    ID_Pembelian INT PRIMARY KEY,
    Tanggal_Pembelian DATE,
    ID_Supplier INT,
    ID_Barang INT,
    Jumlah_Barang INT,
    Harga_Satuan DECIMAL(18, 2),
    Total_Harga DECIMAL(18, 2),
    Status_Pembayaran VARCHAR(20)
);

-- Membuat Tabel Hutang
CREATE TABLE Hutang (
    ID_Hutang INT PRIMARY KEY,
    ID_Supplier INT,
    Total_Hutang DECIMAL(18, 2),
    Status_Pembayaran VARCHAR(20)
);

-- membuat tabel return
CREATE TABLE retur (
    id_retur INT (20) NOT NULL,
    tgl_retur DATE, 
    alsan_retur VARCHAR (100) NOT NULL,
    jumlah_barang INT (20) NOT NULL,
    PRIMARY KEY (id_retur)
);



-- Membuat Tabel Transaksi
CREATE TABLE Transaksi (
    ID_Transaksi INT PRIMARY KEY,
    Tipe_Transaksi VARCHAR(20),
    Tanggal_Transaksi DATE,
    ID_Pelanggan INT,
    ID_Barang INT,
    Jumlah_Barang INT,
    Harga_Satuan DECIMAL(18, 2),
    Total_Harga DECIMAL(18, 2),
    Keterangan VARCHAR(255)
);

-- Membuat Tabel Laporan Penjualan
CREATE TABLE Laporan_Penjualan (
    ID_Laporan INT PRIMARY KEY,
    Tanggal_Laporan DATE,
    Total_Penjualan DECIMAL(18, 2)
);

-- Membuat Tabel Laporan Stok
CREATE TABLE Laporan_Stok (
    ID_Laporan INT PRIMARY KEY,
    Tanggal_Laporan DATE,
    ID_Barang INT,
    Nama_Barang VARCHAR(100),
    Stok_Awal INT,
    Stok_Akhir INT,
    Penjualan INT
);

-- MENGISI MASING-MASING TABEL

-- Isi data untuk tabel Pelanggan
INSERT INTO Pelanggan (ID_Pelanggan, Nama_Pelanggan, Alamat_Pelanggan, Nomor_Telepon)
VALUES 
(1, 'John Doe', 'Jl. Jendral Sudirman No. 123', '08123456789'),
(2, 'Jane Doe', 'Jl. Gatot Subroto No. 456', '08765432100'),
(3, 'Michael Smith', 'Jl. Thamrin No. 789', '08211223344'),
(4, 'Jennifer Smith', 'Jl. Pahlawan No. 10', '08555667788'),
(5, 'David Brown', 'Jl. Darmawangsa No. 15', '08999887766'),
(6, 'Sarah Brown', 'Jl. Mangga Dua No. 20', '08122334455'),
(7, 'Kevin Johnson', 'Jl. Kebon Jeruk No. 25', '08776655443'),
(8, 'Jessica Johnson', 'Jl. Tanah Abang No. 30', '08543215678'),
(9, 'Robert Williams', 'Jl. Sudirman No. 35', '08904561234'),
(10, 'Emily Williams', 'Jl. Panglima Polim No. 40', '08127893456');

-- Isi data untuk tabel Barang
INSERT INTO Barang (ID_Barang, Nama_Barang, Harga_Jual, Harga_Beli, Stok)
VALUES 
(1, 'Beras', 15000, 12000, 100),
(2, 'Gula', 12000, 10000, 150),
(3, 'Minyak Goreng', 25000, 20000, 80),
(4, 'Sabun Mandi', 5000, 4000, 200),
(5, 'Pasta Gigi', 7000, 6000, 120),
(6, 'Sampo', 30000, 25000, 90),
(7, 'Tepung Terigu', 10000, 8000, 180),
(8, 'Telur', 25000, 20000, 100),
(9, 'Kecap', 12000, 10000, 150),
(10, 'Susu', 15000, 13000, 120);

-- Isi data untuk tabel Supplier
INSERT INTO Supplier (ID_Supplier, Nama_Supplier, Alamat_Supplier, Nomor_Telepon)
VALUES 
(1, 'Supplier A', 'Jl. Mangga Besar No. 1', '08111111111'),
(2, 'Supplier B', 'Jl. Kebon Jeruk No. 2', '08222222222'),
(3, 'Supplier C', 'Jl. Ciputat No. 3', '08333333333'),
(4, 'Supplier D', 'Jl. Tanah Abang No. 4', '08444444444'),
(5, 'Supplier E', 'Jl. Darmawangsa No. 5', '08555555555'),
(6, 'Supplier F', 'Jl. Gatot Subroto No. 6', '08666666666'),
(7, 'Supplier G', 'Jl. Sudirman No. 7', '08777777777'),
(8, 'Supplier H', 'Jl. Thamrin No. 8', '08888888888'),
(9, 'Supplier I', 'Jl. Pahlawan No. 9', '08999999999'),
(10, 'Supplier J', 'Jl. Panglima Polim No. 10', '08000000000');

-- Isi data untuk tabel Pembelian
INSERT INTO Pembelian (ID_Pembelian, Tanggal_Pembelian, ID_Supplier, ID_Barang, Jumlah_Barang, Harga_Satuan, Total_Harga, Status_Pembayaran)
VALUES 
(1, '2024-03-20', 1, 1, 50, 12000, 600000, 'Lunas'),
(2, '2024-03-20', 2, 2, 70, 10000, 700000, 'Belum Lunas'),
(3, '2024-03-20', 3, 3, 40, 20000, 800000, 'Lunas'),
(4, '2024-03-20', 4, 4, 80, 4000, 320000, 'Lunas'),
(5, '2024-03-20', 5, 5, 60, 6000, 360000, 'Belum Lunas'),
(6, '2024-03-20', 6, 6, 50, 25000, 1250000, 'Lunas'),
(7, '2024-03-20', 7, 7, 90, 8000, 720000, 'Lunas'),
(8, '2024-03-20', 8, 8, 70, 20000, 1400000, 'Belum Lunas'),
(9, '2024-03-20', 9, 9, 80, 10000, 800000, 'Lunas'),
(10, '2024-03-20', 10, 10, 100, 13000, 1300000, 'Belum Lunas');

-- Isi data untuk tabel Hutang
INSERT INTO Hutang (ID_Hutang, ID_Supplier, Total_Hutang, Status_Pembayaran)
VALUES 
(1, 2, 700000, 'Belum Lunas'),
(2, 5, 360000, 'Belum Lunas'),
(3, 8, 1400000, 'Belum Lunas'),
(4, 10, 1300000, 'Belum Lunas'),
(5, 1, 600000, 'Lunas'),
(6, 3, 800000, 'Lunas'),
(7, 4, 320000, 'Lunas'),
(8, 6, 1250000, 'Lunas'),
(9, 7, 720000, 'Lunas'),
(10, 9, 800000, 'Lunas');

-- Isi data untuk tabel pengembalian barang
INSERT INTO retur (id_retur, tgl_retur, alsan_retur, jumlah_barang)
VALUES 
(101, '2024-12-10', 'barang rusak', '10'),
(202, '2024-03-29', 'barang berkualitas rendah', '5'),
(303, '2024-06-01', 'harga barang tidak sesuai', '15'),
(404, '2024-09-09', 'layanan pegawai kurang baik', '10'),
(505, '2024-01-12', 'tempat kurang bersih', '20'),
(606, '2024-07-12', 'pilihan yang terbatas', '5'),
(707, '2024-11-11', 'antrian terlalu panjang', '10'),
(808, '2024-04-25', 'promosi kurang menarik', '20'),
(909, '2024-12-18', 'waktu yang terbatas', '15'),
(123, '2024-07-07', 'tempat yang terlalu jauh', '5');

-- Isi data untuk tabel Transaksi
INSERT INTO Transaksi (ID_Transaksi, Tipe_Transaksi, Tanggal_Transaksi, ID_Pelanggan, ID_Barang, Jumlah_Barang, Harga_Satuan, Total_Harga, Keterangan)
VALUES 
(1, 'Penjualan', '2024-03-20', 1, 1, 10, 15000, 150000, 'Penjualan ke Pelanggan John Doe'),
(2, 'Penjualan', '2024-03-20', 2, 2, 15, 12000, 180000, 'Penjualan ke Pelanggan Jane Doe'),
(3, 'Penjualan', '2024-03-20', 3, 3, 20, 25000, 500000, 'Penjualan ke Pelanggan Michael Smith'),
(4, 'Penjualan', '2024-03-20', 4, 4, 25, 5000, 125000, 'Penjualan ke Pelanggan Jennifer Smith'),
(5, 'Penjualan', '2024-03-20', 5, 5, 30, 7000, 210000, 'Penjualan ke Pelanggan David Brown'),
(6, 'Penjualan', '2024-03-20', 6, 6, 12, 30000, 360000, 'Penjualan ke Pelanggan Sarah Brown'),
(7, 'Penjualan', '2024-03-20', 7, 7, 18, 10000, 180000, 'Penjualan ke Pelanggan Kevin Johnson'),
(8, 'Penjualan', '2024-03-20', 8, 8, 22, 25000, 550000, 'Penjualan ke Pelanggan Jessica Johnson'),
(9, 'Penjualan', '2024-03-20', 9, 9, 28, 12000, 336000, 'Penjualan ke Pelanggan Robert Williams'),
(10, 'Penjualan', '2024-03-20', 10, 10, 35, 15000, 525000, 'Penjualan ke Pelanggan Emily Williams');

-- Isi data untuk tabel Laporan Penjualan
INSERT INTO Laporan_Penjualan (ID_Laporan, Tanggal_Laporan, Total_Penjualan)
VALUES 
(1, '2024-03-20', 2596000),
(2, '2024-03-21', 2800000),
(3, '2024-03-22', 3200000),
(4, '2024-03-23', 3000000),
(5, '2024-03-24', 3500000),
(6, '2024-03-25', 3300000),
(7, '2024-03-26', 2900000),
(8, '2024-03-27', 2700000),
(9, '2024-03-28', 3100000),
(10, '2024-03-29', 3400000);

-- Isi data untuk tabel Laporan Stok
-- Asumsikan stok awal dan penjualan belum di-update sebelumnya
INSERT INTO Laporan_Stok (ID_Laporan, Tanggal_Laporan, ID_Barang, Nama_Barang, Stok_Awal, Stok_Akhir, Penjualan)
VALUES 
(1, '2024-03-20', 1, 'Beras', 100, 90, 10),
(2, '2024-03-20', 2, 'Gula', 150, 135, 15),
(3, '2024-03-20', 3, 'Minyak Goreng', 80, 60, 20),
(4, '2024-03-20', 4, 'Sabun Mandi', 200, 175, 25),
(5, '2024-03-20', 5, 'Pasta Gigi', 120, 90, 30),
(6, '2024-03-20', 6, 'Sampo', 90, 78, 12),
(7, '2024-03-20', 7, 'Tepung Terigu', 180, 162, 18),
(8, '2024-03-20', 8, 'Telur', 100, 78, 22),
(9, '2024-03-20', 9, 'Kecap', 150, 122, 28),
(10, '2024-03-20', 10, 'Susu', 120, 85, 35);

-- MENAMPILKAN DATA PADA TABEL

-- Menampilkan semua data dari tabel Pelanggan
SELECT * FROM Pelanggan;

-- Menampilkan semua data dari tabel Barang
SELECT * FROM Barang;

-- Menampilkan semua data dari tabel Supplier
SELECT * FROM Supplier;

-- Menampilkan semua data dari tabel Pembelian
SELECT * FROM Pembelian;

-- Menampilkan semua data dari tabel Hutang
SELECT * FROM Hutang;

--menampilan pengembalian barang
SELECT * FROM retur;

-- Menampilkan semua data dari tabel Transaksi
SELECT * FROM Transaksi;

-- Menampilkan semua data dari tabel Laporan Penjualan
SELECT * FROM Laporan_Penjualan;

-- Menampilkan semua data dari tabel Laporan Stok
SELECT * FROM Laporan_Stok;

-- MERUBAH NAMA PADA SALAH SATU TABEL

-- Mengubah nama tabel Pelanggan menjadi Customer
ALTER TABLE Pelanggan RENAME TO Customer;

-- MENGHAPUS DATABASE

-- Menghapus database swalayan
DROP DATABASE dbSwalayan;
