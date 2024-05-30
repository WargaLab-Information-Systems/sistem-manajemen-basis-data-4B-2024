CREATE DATABASE dbToserba;
USE dbToserba;

-- membuat tabel --
CREATE TABLE Pelanggan (
    ID_Pelanggan INT PRIMARY KEY,
    Nama_Pelanggan VARCHAR(100),
    Alamat_Pelanggan VARCHAR(255),
    Nomor_Telepon VARCHAR(20)
);

CREATE TABLE Barang (
    ID_Barang INT PRIMARY KEY,
    Nama_Barang VARCHAR(100),
    Harga_Jual INT(100),
    Harga_Beli INT(100),
    Stok INT
);

CREATE TABLE Supplier (
    ID_Supplier INT PRIMARY KEY,
    Nama_Supplier VARCHAR(100),
    Alamat_Supplier VARCHAR(255),
    Nomor_Telepon VARCHAR(20)
);

CREATE TABLE Transaksi (
    ID_Transaksi INT PRIMARY KEY,
    Tipe_Transaksi VARCHAR(20),
    Tanggal_Transaksi DATE,
    ID_Pelanggan INT,
    ID_Barang INT,
    Jumlah_Barang INT,
    Harga_Satuan INT(100),
    Total_Harga INT(100),
    Keterangan VARCHAR(255)
);

CREATE TABLE Pembelian (
    ID_Pembelian INT PRIMARY KEY,
    Tanggal_Pembelian DATE,
    ID_Supplier INT,
    ID_Barang INT,
    Jumlah_Barang INT,
    Harga_Satuan INT(100),
    Total_Harga INT(100),
    Status_Pembayaran VARCHAR(20)
);

CREATE TABLE Hutang (
    ID_Hutang INT PRIMARY KEY,
    ID_Supplier INT,
    Total_Hutang INT(100),
    Status_Pembayaran VARCHAR(20)
);


CREATE TABLE Laporan_Penjualan (
    ID_Laporan INT PRIMARY KEY,
    Tanggal_Laporan DATE,
    Total_Penjualan INT(100)
);


CREATE TABLE Laporan_Stok (
    ID_Laporan INT PRIMARY KEY,
    Tanggal_Laporan DATE,
    ID_Barang INT,
    Nama_Barang VARCHAR(100),
    Stok_Awal INT,
    Stok_Akhir INT,
    Penjualan INT
);

-- mengisi data masing" tabel --
INSERT INTO Pelanggan (ID_Pelanggan, Nama_Pelanggan, Alamat_Pelanggan, Nomor_Telepon)
VALUES 
(1, 'Syafira', 'Jl. Randu Barat No. 10', '08123456789'),
(2, 'Putri', 'Jl. Randu Timur No. 11', '08765432100'),
(3, 'Kamila', 'Jl. Kedinding No. 12', '08211223344'),
(4, 'Lois', 'Jl. Pahlawan No. 13', '08555667788'),
(5, 'Indy', 'Jl. Dharmawangsa No. 14', '08999887766'),
(6, 'Pahlevi', 'Jl. Dharmo No. 15', '08122334455'),
(7, 'Yuyun', 'Jl. Wiyung No. 16', '08776655443'),
(8, 'Oktalina', 'Jl. Tellang No. 17', '08543215678'),
(9, 'Dwi', 'Jl. Kamal No. 18', '08904561234'),
(10, 'Valentina', 'Jl. Jati Asih No. 19', '08127893456');


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


INSERT INTO Supplier (ID_Supplier, Nama_Supplier, Alamat_Supplier, Nomor_Telepon)
VALUES 
(1, 'Supplier A', 'Jl. Tellang Indah No. 1', '08111111111'),
(2, 'Supplier B', 'Jl. Kamal No. 2', '08222222222'),
(3, 'Supplier C', 'Jl. Bangkalan No. 3', '08333333333'),
(4, 'Supplier D', 'Jl. Pahlawan No. 4', '08444444444'),
(5, 'Supplier E', 'Jl. Surabaya No. 5', '08555555555'),
(6, 'Supplier F', 'Jl. Semarang No. 6', '08666666666'),
(7, 'Supplier G', 'Jl. Sudirman No. 7', '08777777777'),
(8, 'Supplier H', 'Jl. Malang No. 8', '08888888888'),
(9, 'Supplier I', 'Jl. Kalianyar No. 9', '08999999999'),
(10, 'Supplier J', 'Jl. Panglima No. 10', '08000000000');


INSERT INTO Transaksi (ID_Transaksi, Tipe_Transaksi, Tanggal_Transaksi, ID_Pelanggan, ID_Barang, Jumlah_Barang, Harga_Satuan, Total_Harga, Keterangan)
VALUES 
(1, 'Penjualan', '2024-03-20', 1, 1, 10, 15000, 150000, 'Penjualan ke Pelanggan Syafira'),
(2, 'Penjualan', '2024-03-20', 2, 2, 15, 12000, 180000, 'Penjualan ke Pelanggan Putri'),
(3, 'Penjualan', '2024-03-20', 3, 3, 20, 25000, 500000, 'Penjualan ke Pelanggan Kamila'),
(4, 'Penjualan', '2024-03-20', 4, 4, 25, 5000, 125000, 'Penjualan ke Pelanggan Lois'),
(5, 'Penjualan', '2024-03-20', 5, 5, 30, 7000, 210000, 'Penjualan ke Pelanggan Indy'),
(6, 'Penjualan', '2024-03-20', 6, 6, 12, 30000, 360000, 'Penjualan ke Pelanggan Pahlevi'),
(7, 'Penjualan', '2024-03-20', 7, 7, 18, 10000, 180000, 'Penjualan ke Pelanggan Yuyun'),
(8, 'Penjualan', '2024-03-20', 8, 8, 22, 25000, 550000, 'Penjualan ke Pelanggan Oktalina'),
(9, 'Penjualan', '2024-03-20', 9, 9, 28, 12000, 336000, 'Penjualan ke Pelanggan Dwi'),
(10, 'Penjualan', '2024-03-20', 10, 10, 35, 15000, 525000, 'Penjualan ke Pelanggan Valentina');


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


-- menampilkan semua data dari setiap tabel --
SELECT * FROM Pelanggan;

SELECT * FROM Barang;

SELECT * FROM Supplier;

SELECT * FROM Transaksi;

SELECT * FROM Pembelian;

SELECT * FROM Hutang;

SELECT * FROM Laporan_Penjualan;

SELECT * FROM Laporan_Stok;

-- mengubah nama tabel pelanggan menjadi pembeli --
ALTER TABLE Pelanggan RENAME TO Pembeli;

-- menghapus database -- 
DROP DATABASE dbToserba;


