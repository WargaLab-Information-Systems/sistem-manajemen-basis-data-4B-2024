CREATE DATABASE tokoswalayanabadi;
USE tokoswalayanabadi;
CREATE TABLE Pelanggan (
  id_pelanggan INT PRIMARY KEY,
  nama_pelanggan VARCHAR(100),
  alamat_pelanggan VARCHAR(255)
);

CREATE TABLE Barang (
    id_barang INT PRIMARY KEY,
    nama_barang VARCHAR(100),
    harga_barang FLOAT(10),
    stok INT
);
CREATE TABLE Transaksi (
    id_transaksi INT PRIMARY KEY,
    jenis_transaksi VARCHAR(50), -- Penjualan, Retur, Pembelian, Koreksi
    id_pelanggan INT, -- Foreign Key ke Pelanggan
    waktu_transaksi TIMESTAMP,
    total FLOAT(10),
    FOREIGN KEY (id_pelanggan) REFERENCES Pelanggan(id_pelanggan)
);
CREATE TABLE Detail_Transaksi (
    id_detail_transaksi INT PRIMARY KEY,
    id_transaksi INT, -- Foreign Key ke Transaksi
    id_barang INT, -- Foreign Key ke Barang
    jumlah INT,
    subtotal FLOAT(10),
    FOREIGN KEY (id_transaksi) REFERENCES Transaksi(id_transaksi),
    FOREIGN KEY (id_barang) REFERENCES Barang(id_barang)
);
CREATE TABLE Supplier (
    id_supplier INT PRIMARY KEY,
    nama_supplier VARCHAR(100),
    alamat_supplier VARCHAR(255)
);

CREATE TABLE Pembelian (
    id_pembelian INT PRIMARY KEY,
    id_supplier INT, -- Foreign Key ke Supplier
    waktu_pembelian TIMESTAMP,
    total FLOAT(10),
    FOREIGN KEY (id_supplier) REFERENCES Supplier(id_supplier)
);
CREATE TABLE Keuangan (
    id_keuangan INT PRIMARY KEY,
    jenis_transaksi VARCHAR(50), -- Penjualan, Pembelian
    id_transaksi INT, -- Foreign Key ke Transaksi / Pembelian
    waktu_transaksi TIMESTAMP,
    total FLOAT(10)
);
CREATE TABLE Koreksi_Stok (
    id_koreksi INT PRIMARY KEY,
    id_barang INT, -- Foreign Key ke Barang
    waktu_koreksi TIMESTAMP,
    stok_awal INT,
    stok_akhir INT,
    keterangan VARCHAR(255),
    FOREIGN KEY (id_barang) REFERENCES Barang(id_barang)
);
CREATE TABLE Detail_Pembelian (
    id_detail_pembelian INT PRIMARY KEY,
    id_pembelian INT, -- Foreign Key ke Pembelian
    id_barang INT, -- Foreign Key ke Barang
    jumlah INT,
    subtotal FLOAT(10),
    FOREIGN KEY (id_pembelian) REFERENCES Pembelian(id_pembelian),
    FOREIGN KEY (id_barang) REFERENCES Barang(id_barang)
);
INSERT INTO Pelanggan (id_pelanggan, nama_pelanggan, alamat_pelanggan) 
VALUES (1, 'John Doe', 'Jl. Merdeka No. 123'),
(2, 'Jane Smith', 'Jl. Pahlawan No. 45'),
(3, 'Michael Johnson', 'Jl. Gatot Subroto No. 67'),
(4, 'Emma Lee', 'Jl. Asia Afrika No. 89'),
(5, 'David Brown', 'Jl. Diponegoro No. 10'),
(6, 'Sarah Garcia', 'Jl. Thamrin No. 22'),
(7, 'Kevin Martinez', 'Jl. Sudirman No. 35'),
(8, 'Amanda Wilson', 'Jl. Teuku Umar No. 14'),
(9, 'Jason Taylor', 'Jl. Hayam Wuruk No. 78'),
(10, 'Lisa Anderson', 'Jl. Dr. Sutomo No. 56');
INSERT INTO Barang (id_barang, nama_barang, harga_barang, stok) 
VALUES 
(1, 'Gula', 10000, 50),
(2, 'Kopi', 25000, 80),
(3, 'Teh', 15000, 100),
(4, 'Minyak Goreng', 12000, 120),
(5, 'Sabun Mandi', 5000, 200),
(6, 'Sikat Gigi', 3000, 150),
(7, 'Shampoo', 12000, 90),
(8, 'Pasta Gigi', 6000, 100),
(9, 'Susu', 18000, 70),
(10, 'Beras', 15000, 180);
INSERT INTO Supplier (id_supplier, nama_supplier, alamat_supplier) 
VALUES 
(1, 'PT Sumber Alfaria Trijaya Tbk', 'Jl. Akses No. 10'), 
(2, 'PT Hero Supermarket Tbk', 'Jl. Bakti No. 20'), 
(3, 'PT Matahari Putra Prima Tbk', 'Jl. Cendana No. 30'), 
(4, 'PT Indofood CBP Sukses Makmur Tbk', 'Jl. Durian No. 40'), 
(5, 'PT Unilever Indonesia Tbk', 'Jl. Enak No. 50'), 
(6, 'PT Nestle Indonesia', 'Jl. Fantastis No. 60'), 
(7, 'PT Indofood Sukses Makmur Tbk', 'Jl. Gandaria No. 70'), 
(8, 'PT Wings Surya', 'Jl. Harapan No. 80'), 
(9, 'PT Frisian Flag Indonesia', 'Jl. Indah No. 90'), 
(10, 'PT Mayora Indah Tbk', 'Jl. Jaya No. 100');
INSERT INTO Transaksi (id_transaksi, jenis_transaksi, id_pelanggan, waktu_transaksi, total) 
VALUES 
(1, 'Penjualan', 1, '2024-03-24 08:00:00', 200000),
(2, 'Penjualan', 3, '2024-03-24 09:30:00', 150000),
(3, 'Penjualan', 5, '2024-03-24 11:15:00', 300000),
(4, 'Pembelian', 1, '2024-03-24 13:45:00', 180000),
(5, 'Pembelian', 6, '2024-03-24 15:20:00', 250000),
(6, 'Pembelian', 7, '2024-03-24 17:10:00', 210000),
(7, 'Pembelian', 9, '2024-03-24 18:40:00', 220000),
(8, 'Penjualan', 10, '2024-03-24 19:55:00', 230000),
(9, 'Penjualan', 4, '2024-03-24 21:00:00', 50000),
(10, 'Pembelian', 4, '2024-03-24 22:30:00', 70000);
INSERT INTO Pembelian (id_pembelian, id_supplier, waktu_pembelian, total) 
VALUES 
(1, 1, '2024-03-24 13:45:00', 180000),
(2, 2, '2024-03-24 15:20:00', 250000),
(3, 3, '2024-03-24 17:10:00', 210000),
(4, 4, '2024-03-24 19:00:00', 300000),
(5, 5, '2024-03-24 20:30:00', 220000),
(6, 6, '2024-03-24 22:00:00', 400000),
(7, 7, '2024-03-24 23:45:00', 180000),
(8, 8, '2024-03-25 01:00:00', 270000),
(9, 9, '2024-03-25 02:30:00', 240000),
(10, 10, '2024-03-25 04:15:00', 190000);
INSERT INTO Detail_Pembelian (id_detail_pembelian, id_pembelian, id_barang, jumlah, subtotal) 
VALUES 
(1, 1, 1, 5, 50000),
(2, 1, 3, 10, 150000),
(3, 2, 2, 8, 200000),
(4, 2, 5, 5, 25000),
(5, 3, 4, 15, 180000),
(6, 3, 6, 20, 60000),
(7, 4, 7, 10, 120000),
(8, 4, 8, 8, 48000),
(9, 5, 9, 12, 216000),
(10, 5, 10, 9, 135000);
INSERT INTO Detail_Transaksi (id_detail_transaksi, id_transaksi, id_barang, jumlah, subtotal) 
VALUES 
(1, 1, 1, 2, 20000),
(2, 1, 3, 3, 45000),
(3, 2, 2, 4, 100000),
(4, 2, 5, 2, 10000),
(5, 3, 4, 5, 60000),
(6, 3, 6, 4, 12000),
(7, 4, 7, 3, 36000),
(8, 4, 8, 2, 12000),
(9, 5, 9, 4, 72000),
(10, 5, 10, 3, 45000);
INSERT INTO Koreksi_Stok (id_koreksi, id_barang, waktu_koreksi, stok_awal, stok_akhir, keterangan)
VALUES 
(1, 1, '2024-03-24 18:40:00', 50, 45, 'Kesalahan input stok'),
(2, 2, '2024-03-24 19:55:00', 80, 75, 'Perhitungan ulang stok'),
(3, 3, '2024-03-24 21:30:00', 100, 95, 'Retur dari pelanggan'),
(4, 4, '2024-03-24 23:10:00', 120, 115, 'Penggantian barang rusak'),
(5, 5, '2024-03-25 00:45:00', 200, 205, 'Pembelian tambahan stok');

SELECT * FROM barang;
SELECT * FROM detail_pembelian;
SELECT * FROM detail_transaksi;
SELECT * FROM koreksi_stok;
SELECT * FROM pelanggan;
SELECT * FROM pembelian;
SELECT * FROM supplier;
SELECT * FROM transaksi;

ALTER TABLE koreksi_stok RENAME TO stok;
DROP DATABASE tokoswalayanabadi;
