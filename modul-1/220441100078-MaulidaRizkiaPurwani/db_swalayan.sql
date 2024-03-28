CREATE DATABASE
IF NOT EXISTS toko_swalayan;

USE toko_swalayan;

-- Buat tabel baru
CREATE TABLE
IF NOT EXISTS Pelanggan
(
    id_pelanggan VARCHAR
(10) PRIMARY KEY,
    nama_pelanggan VARCHAR
(255),
    alamat VARCHAR
(255)
);

-- Masukkan data ke dalam tabel
INSERT INTO Pelanggan
    (id_pelanggan, nama_pelanggan, alamat)
VALUES
    ('CS01', 'Lisnaldi', 'Gubeng Masjid'),
    ('CS02', 'Tika', 'Gubeng Masjid'),
    ('CS03', 'Ana', 'Bangkalan'),
    ('CS04', 'Kiki', 'Telang Timur'),
    ('CS05', 'Dwi', 'Kamal'),
    ('CS06', 'Nisa', 'Kertajaya'),
    ('CS07', 'Roiyan', 'Ngagel'),
    ('CS08', 'Ryan', 'Diponegoro'),
    ('CS09', 'Velin', 'Kapasari'),
    ('CS10', 'Riris', 'Bojonegoro');
-- Tampilkan data dari tabel

SELECT *
FROM Pelanggan;

-- Tabel Barang
CREATE TABLE
IF NOT EXISTS Barang
(
    id_barang VARCHAR
(20) PRIMARY KEY,
    nama_barang VARCHAR
(255),
    harga_satuan DECIMAL
(10,2),
    stok INT
);

INSERT INTO Barang
    (id_barang, nama_barang, harga_satuan, stok)
VALUES
    ('BR001', 'Beras Sania 5kg', 75000, 130),
    ('GU002', 'Gulaku 1kg', 14000, 100),
    ('MG003', 'Minyak Goreng Fortune 2L', 35000, 110),
    ('SB004', 'Terigu Segitiga Biru', 10000, 90),
    ('SJ005', 'Sajiku Serbaguna 250gr', 5000, 75),
    ('TC006', 'Terigu Cakra 1kg', 11000, 50),
    ('LB007', 'Larutan Cap Badak', 8000, 65),
    ('CL008', 'Coklat Latulip 250gr', 25000, 90),
    ('MM009', 'Maesto Mayonis 250', 8000, 77),
    ('NC010', 'Inaco Nata De Coco 1kg', 15000, 89);
SELECT *
FROM Barang;

-- Tabel Supplier
CREATE TABLE
IF NOT EXISTS Supplier
(
    id_supplier VARCHAR
(5) PRIMARY KEY,
    nama_supplier VARCHAR
(255),
    alamat_supplier VARCHAR
(255)
);

INSERT INTO Supplier
    (id_supplier, nama_supplier, alamat_supplier)
VALUES
    ('SP01', 'Lotte Mart', 'Jl. Wonokromo, Surabaya'),
    ('SP02', 'Indogrosir', 'Jl. Kapas Krembangan, Surabaya'),
    ('SP03', 'Sembako Ps. Turi', 'Jl. Pasar Turi, Surabaya'),
    ('SP04', 'UD Sumber Makmur', 'Jl. Tambaksari, Surabaya'),
    ('SP05', 'Grosir Sembako Murah Surabaya', 'Jl. Rungkut, Surabaya'),
    ('SP06', 'Grosir Superindo', 'Jl. Ahmad Yani No. 55, Surabaya'),
    ('SP07', 'UD Maju Jaya', 'Jl. Kenjeran, Surabaya'),
    ('SP08', 'AEON', 'Jl. Kapasari, Surabaya'),
    ('SP09', 'Toko Grosir Murah', 'Jl. Kalasan, Surabaya'),
    ('SP10', 'Grosir Hj. Maulida', 'Jl. Gubeng, Surabaya');
SELECT *
FROM Supplier;

-- Tabel Transaksi_Penjualan
CREATE TABLE
IF NOT EXISTS Transaksi_Penjualan
(
    id_penjualan VARCHAR
(10) PRIMARY KEY,
    id_pelanggan VARCHAR
(10),
    tanggal_penjualan DATE,
    total_penjualan DECIMAL
(10,2),
    FOREIGN KEY
(id_pelanggan) REFERENCES Pelanggan
(id_pelanggan)
);

INSERT INTO Transaksi_Penjualan
    (id_penjualan, id_pelanggan, tanggal_penjualan, total_penjualan)
VALUES
    ('PJ001', 'CS01', '2024-03-24', 150000),
    ('PJ002', 'CS02', '2024-03-24', 42000),
    ('PJ003', 'CS03', '2024-03-24', 350000),
    ('PJ004', 'CS04', '2024-03-24', 500000),
    ('PJ005', 'CS05', '2024-03-24', 72000),
    ('PJ006', 'CS06', '2024-03-24', 16000),
    ('PJ007', 'CS07', '2024-03-24', 150000),
    ('PJ008', 'CS08', '2024-03-24', 140000),
    ('PJ009', 'CS09', '2024-03-24', 175000),
    ('PJ010', 'CS10', '2024-03-24', 35000);
SELECT *
FROM Transaksi_Penjualan;

CREATE TABLE
IF NOT EXISTS Detail_Transaksi_Penjualan
(
    id_detail_penjualan INT PRIMARY KEY,
    id_penjualan VARCHAR
(10),
    id_barang VARCHAR
(20),
    jumlah_barang INT,
    subtotal DECIMAL
(10,2),
    FOREIGN KEY
(id_penjualan) REFERENCES Transaksi_Penjualan
(id_penjualan),
    FOREIGN KEY
(id_barang) REFERENCES Barang
(id_barang)
);

-- Isi data pada tabel Detail_Transaksi_Penjualan
INSERT INTO Detail_Transaksi_Penjualan
    (id_detail_penjualan, id_penjualan, id_barang, jumlah_barang, subtotal)
VALUES
    (1, 'PJ001', 'BR001', 2, 150000),
    (2, 'PJ002', 'GU002', 3, 42000),
    (3, 'PJ003', 'MG003', 1, 35000),
    (4, 'PJ004', 'SB004', 50, 500000),
    (5, 'PJ005', 'LB007', 9, 72000),
    (6, 'PJ006', 'MM009', 2, 16000),
    (7, 'PJ007', 'NC010', 10, 150000),
    (8, 'PJ008', 'GU002', 10, 140000),
    (9, 'PJ009', 'CL008', 7, 175000),
    (10, 'PJ010', 'MG003', 1, 35000);
SELECT *
FROM Detail_Transaksi_Penjualan;

-- Tabel Transaksi_Retur
CREATE TABLE
IF NOT EXISTS Transaksi_Retur
(
    id_retur INT PRIMARY KEY,
    id_penjualan VARCHAR
(10),
    tanggal_retur DATE,
    alasan_retur VARCHAR
(255),
    FOREIGN KEY
(id_penjualan) REFERENCES Transaksi_Penjualan
(id_penjualan)
);

-- Isi data pada tabel Transaksi_Retur
INSERT INTO Transaksi_Retur
    (id_retur, id_penjualan, tanggal_retur, alasan_retur)
VALUES
    (1, 'PJ001', '2024-03-28', 'Barang rusak'),
    (2, 'PJ003', '2024-03-29', 'Pesanan salah'),
    (3, 'PJ005', '2024-03-30', 'Kuantitas tidak sesuai'),
    (4, 'PJ007', '2024-03-31', 'Barang kadaluarsa'),
    (5, 'PJ009', '2024-04-01', 'Barang tidak sesuai'),
    (6, 'PJ002', '2024-04-02', 'Barang rusak'),
    (7, 'PJ004', '2024-04-03', 'Pesanan salah'),
    (8, 'PJ006', '2024-04-04', 'Kuantitas tidak sesuai'),
    (9, 'PJ008', '2024-04-05', 'Barang kadaluarsa'),
    (10, 'PJ010', '2024-04-06', 'Barang tidak sesuai');
-- Menampilkan data dari tabel Transaksi_Retur
SELECT *
FROM Transaksi_Retur;


-- Tabel Transaksi_Pembelian
CREATE TABLE
IF NOT EXISTS Transaksi_Pembelian
(
    id_pembelian INT PRIMARY KEY,
    id_supplier VARCHAR
(5),
    tanggal_pembelian DATE,
    total_pembelian DECIMAL
(10,2),
    FOREIGN KEY
(id_supplier) REFERENCES Supplier
(id_supplier)
);

-- Isi data pada tabel Transaksi_Pembelian
INSERT INTO Transaksi_Pembelian
    (id_pembelian, id_supplier, tanggal_pembelian, total_pembelian)
VALUES
    (1, 'SP01', '2024-03-25', 700000),
    (2, 'SP02', '2024-03-26', 550000),
    (3, 'SP03', '2024-03-27', 620000),
    (4, 'SP04', '2024-03-28', 800000),
    (5, 'SP05', '2024-03-29', 450000),
    (6, 'SP06', '2024-03-30', 670000),
    (7, 'SP07', '2024-03-31', 590000),
    (8, 'SP08', '2024-04-01', 720000),
    (9, 'SP09', '2024-04-02', 480000),
    (10, 'SP10', '2024-04-03', 560000);
SELECT *
FROM Detail_Transaksi_Penjualan;

-- Tabel Detail_Transaksi_Pembelian
CREATE TABLE
IF NOT EXISTS Detail_Transaksi_Pembelian
(
    id_detail_pembelian INT PRIMARY KEY,
    id_pembelian INT,
    id_barang VARCHAR
(20),
    jumlah_barang INT,
    subtotal DECIMAL
(10,2),
    FOREIGN KEY
(id_pembelian) REFERENCES Transaksi_Pembelian
(id_pembelian),
    FOREIGN KEY
(id_barang) REFERENCES Barang
(id_barang)
);

-- Isi data pada tabel Detail_Transaksi_Pembelian
INSERT INTO Detail_Transaksi_Pembelian
    (id_detail_pembelian, id_pembelian, id_barang, jumlah_barang, subtotal)
VALUES
    (1, 1, 'BR001', 2, 150000),
    (2, 2, 'GU002', 3, 42000),
    (3, 3, 'MG003', 1, 35000),
    (4, 4, 'SB004', 50, 500000),
    (5, 5, 'LB007', 9, 72000),
    (6, 6, 'MM009', 2, 16000),
    (7, 7, 'NC010', 10, 150000),
    (8, 8, 'GU002', 10, 140000),
    (9, 9, 'CL008', 7, 175000),
    (10, 10, 'MG003', 1, 35000);
SELECT *
FROM Detail_Transaksi_Pembelian;


-- Tabel Koreksi_Stok
CREATE TABLE
IF NOT EXISTS Koreksi_Stok
(
    id_koreksi_stok INT PRIMARY KEY,
    id_barang VARCHAR
(20),
    tanggal_koreksi DATE,
    jumlah_koreksi INT,
    alasan_koreksi VARCHAR
(255),
    FOREIGN KEY
(id_barang) REFERENCES Barang
(id_barang)
);

-- Isi data pada tabel Koreksi_Stok
INSERT INTO Koreksi_Stok
    (id_koreksi_stok, id_barang, tanggal_koreksi, jumlah_koreksi, alasan_koreksi)
VALUES
    (1, 'BR001', '2024-03-25', 5, 'Kerusakan'),
    (2, 'GU002', '2024-03-26', 2, 'Retur pelanggan'),
    (3, 'MG003', '2024-03-27', 3, 'Penambahan stok gudang'),
    (4, 'SB004', '2024-03-28', 1, 'Kadaluarsa'),
    (5, 'SJ005', '2024-03-29', 2, 'Kesalahan pengiriman'),
    (6, 'TC006', '2024-03-30', 3, 'Pengembalian barang'),
    (7, 'LB007', '2024-03-31', 4, 'Penyesuaian stok'),
    (8, 'CL008', '2024-04-01', 2, 'Barang cacat'),
    (9, 'MM009', '2024-04-02', 3, 'Koreksi fisik'),
    (10, 'NC010', '2024-04-03', 1, 'Kesalahan pengemasan');
SELECT *
FROM Koreksi_Stok;


-- Tabel Laporan_Penjualan
CREATE TABLE
IF NOT EXISTS Laporan_Penjualan
(
    id_laporan_penjualan INT PRIMARY KEY,
    tanggal_laporan DATE,
    total_penjualan DECIMAL
(10,2)
);

-- Isi data pada tabel Laporan_Penjualan
INSERT INTO Laporan_Penjualan
    (id_laporan_penjualan, tanggal_laporan, total_penjualan)
VALUES
    (1, '2024-03-24', 100000),
    (2, '2024-03-25', 120000),
    (3, '2024-03-26', 90000),
    (4, '2024-03-27', 150000),
    (5, '2024-03-28', 300000),
    (6, '2024-03-29', 70000),
    (7, '2024-03-30', 150000),
    (8, '2024-03-31', 140000),
    (9, '2024-04-01', 175000),
    (10, '2024-04-02', 35000);
-- Menampilkan data dari tabel Laporan_Penjualan
SELECT *
FROM Laporan_Penjualan;
-- Tabel Laporan_Stok
CREATE TABLE
IF NOT EXISTS Laporan_Stok
(
    id_laporan_stok INT PRIMARY KEY,
    tanggal_laporan DATE,
    id_barang VARCHAR
(20),
    stok_awal INT,
    stok_akhir INT,
    FOREIGN KEY
(id_barang) REFERENCES Barang
(id_barang)
);

-- Isi data pada tabel Laporan_Stok
INSERT INTO Laporan_Stok
    (id_laporan_stok, tanggal_laporan, id_barang, stok_awal, stok_akhir)
VALUES
    (1, '2024-03-24', 'BR001', 130, 125),
    (2, '2024-03-25', 'GU002', 100, 95),
    (3, '2024-03-26', 'MG003', 110, 108),
    (4, '2024-03-27', 'SB004', 90, 85),
    (5, '2024-03-28', 'LB007', 65, 60),
    (6, '2024-03-29', 'MM009', 77, 75),
    (7, '2024-03-30', 'NC010', 89, 87),
    (8, '2024-03-31', 'GU002', 95, 93),
    (9, '2024-04-01', 'CL008', 90, 88),
    (10, '2024-04-02', 'MG003', 108, 105);
-- Menampilkan data dari tabel Laporan_Stok

SELECT *
FROM Laporan_Stok;
ALTER TABLE Laporan_Stok RENAME TO stok_barang;
SHOW TABLES;
UPDATE Barang
SET nama_barang = 'Minyak Goreng Bimoli', harga_satuan = 6500
WHERE id_barang = 'MG003';
ALTER TABLE Barang
CHANGE COLUMN nama_barang produk VARCHAR
(255);


