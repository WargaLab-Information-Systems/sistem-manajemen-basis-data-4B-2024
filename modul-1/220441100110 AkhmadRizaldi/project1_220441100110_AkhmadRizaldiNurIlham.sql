CREATE DATABASE PraktikumSmbd;
USE PraktikumSmbd;

CREATE TABLE barang (
kode_barang CHAR (10) PRIMARY KEY,
nama_barang CHAR (10) NOT NULL,
harga_barang CHAR (10) NOT NULL,
stok INT NOT NULL ,
merk_barang CHAR (10) NOT NULL
);
INSERT INTO barang (kode_barang, nama_barang, harga_barang, stok, merk_barang) VALUES
		    ('R6T450', 'Sabun culay', 'Rp.200.000', '321', 'SUNGGONO');
INSERT INTO barang (kode_barang, nama_barang, harga_barang, stok, merk_barang) VALUES
		    ('R6T45r', 'Rinso', 'Rp.100.000', '3321', 'SUNGGONONG');
INSERT INTO barang (kode_barang, nama_barang, harga_barang, stok, merk_barang) VALUES
		    ('R6T45t', 'Pepso', 'Rp.210.000', '3271', 'TSUNGGONO');
INSERT INTO barang (kode_barang, nama_barang, harga_barang, stok, merk_barang) VALUES
		    ('R6T45tr', 'Pepsoden', 'Rp.610.000', '4271', 'rSUNGGONO'),
		    ('R7T45tr', 'shampo', 'Rp.810.000', '44271', 'yrSUNGGONO'),
		    ('R7yT45tr', 'shampo', 'Rp.810.000', '44271', 'yrSUNGGONO'),
		    ('R8T45tr', 'Mie Goreng', 'Rp.910.000', '45271', 'wrSUNGGONO'),
		    ('R55T45tr', 'Buku', 'Rp.330.000', '42671', 'urSUNGGONO'),
		    ('R44T45tr', 'Map', 'Rp.980.000', '42771', 'hrSUNGGONO'),
		    ('R22T45tr', 'cocacola', 'Rp.110.000', '42871', 'krSUNGGONO'),
		    ('R78T45tr', 'sprit', 'Rp.220.000', '42971', 'lrSUNGGONO');

SELECT*FROM barang;
ALTER TABLE barang2 RENAME TO barang;

CREATE TABLE keuangan (
kode_transaksi CHAR (10) NOT NULL ,
tanggal_transaksi CHAR (10) NOT NULL ,
jenis_transaksi CHAR (10) NOT NULL ,
nominal INT NOT NULL
);
INSERT INTO keuangan (kode_transaksi, tanggal_transaksi, jenis_transaksi, nominal) VALUES
			('aahh123', '14-02-2004', 'cod', '500.000,00'),
			('aahh1234', '24-02-2004', 'cod1', '200.000,00'),
			('aahh1236', '25-02-2004', 'cod2', '100.000,00'),
			('aahh12367', '26-02-2004', 'cod2', '900.000,00'),
			('aahh12367', '26-02-2004', 'cod2', '900.000,00'),
			('1ahh12367', '26-02-2004', 'cod2', '400.000,00'),
			('2ahh12367', '26-02-2004', 'cod2', '500.000,00'),
			('3ahh12367', '26-02-2004', 'cod2', '800.000,00'),
			('5ahh12367', '26-02-2004', 'cod2', '900.000,00'),
			('6ahh12367', '26-02-2004', 'cod2', '100.000,00');
			
SELECT*FROM keuangan;

CREATE TABLE koreksi_stok (
kode_koreksi VARCHAR (10) NOT NULL PRIMARY KEY,
tanggal_koreksi VARCHAR (10) NOT NULL,
kode_barang VARCHAR (10) NOT NULL,
stok_sebelum INT NOT NULL,
stok_setelah INT NOT NULL
);
INSERT INTO koreksi_stok (kode_koreksi, tanggal_koreksi, kode_barang, stok_sebelum, stok_setelah) VALUES
			('a1234', '23-04-2018', 'aaa','34', '67'),
			('b1234', '23-04-2018', 'bbb','35', '27'),
			('c1234', '23-04-2018', 'ccc','36', '57'),
			('d1234', '23-04-2018', 'ddd','34', '67'),
			('e1234', '23-04-2018', 'eee','34', '77'),
			('f1234', '23-04-2018', 'fff','54', '47'),
			('g1234', '23-04-2018', 'ggg','74', '97'),
			('h1234', '23-04-2018', 'hhh','14', '37'),
			('i1234', '23-04-2018', 'iii','84', '57'),
			('j1234', '23-04-2018', 'jjj','64', '87');
			
SELECT*FROM koreksi_stok;


CREATE TABLE laporan_penjualan (
kode_laporan INT NOT NULL PRIMARY KEY,
tgl_laporan INT NOT NULL,
kode_barang INT NOT NULL,
kode_transaksi INT NOT NULL,
total_transaksi INT NOT NULL,
total INT NOT NULL
);
INSERT INTO laporan_penjualan (kode_laporan, tgl_laporan, kode_barang, kode_transaksi, total_transaksi, total) VALUES
(1, 20240325, 101, 1, 150000, 135000),
(2, 20240324, 102, 2, 180000, 162000),
(3, 20240323, 103, 3, 120000, 108000),
(4, 20240322, 104, 4, 90000, 81000),
(5, 20240321, 105, 5, 110000, 99000),
(6, 20240320, 106, 6, 200000, 180000),
(7, 20240319, 107, 7, 170000, 153000),
(8, 20240318, 108, 8, 220000, 198000),
(9, 20240317, 109, 9, 240000, 216000),
(10, 20240316, 110, 10, 210000, 189000);
			
SELECT*FROM laporan_penjualan;

CREATE TABLE Pelanggan (
pelanggan_id INT NOT NULL PRIMARY KEY,
nama_pelanggan VARCHAR(50) NOT NULL,
alamat_pelanggan VARCHAR(100) NOT NULL,
email_pelanggan VARCHAR(50),
telepon_pelanggan VARCHAR(20) NOT NULL
);
INSERT INTO Pelanggan (pelanggan_id, nama_pelanggan, alamat_pelanggan, email_pelanggan, telepon_pelanggan) VALUES
			('342564', 'aku', 'tanjung rejo', 'wewe@gmail.com', '09876543'),
			('346256', 'aku', 'tanjung rejo', 'wewe@gmail.com', '09876543'),
			('342956', 'aku', 'tanjung rejo', 'wewe@gmail.com', '09876543'),
			('3425776', 'aku', 'tanjung rejo', 'wewe@gmail.com', '09876543'),
			('3425644', 'aku', 'tanjung rejo', 'wewe@gmail.com', '09876543'),
			('3564256', 'aku', 'tanjung rejo', 'wewe@gmail.com', '09876543'),
			('3429856', 'aku', 'tanjung rejo', 'wewe@gmail.com', '09876543'),
			('3429456', 'aku', 'tanjung rejo', 'wewe@gmail.com', '09876543'),
			('3425126', 'aku', 'tanjung rejo', 'wewe@gmail.com', '09876543'),
			('342560', 'aku', 'tanjung rejo', 'wewe@gmail.com', '09876543');
			
SELECT*FROM Pelanggan;

CREATE TABLE Penjualan (
  kode_transaksi INT NOT NULL PRIMARY KEY,
  tanggal_transaksi DATE NOT NULL,
  total_harga INT NOT NULL,
  pelanggan_id INT NOT NULL
);
INSERT INTO Penjualan (kode_transaksi, tanggal_transaksi, total_harga, pelanggan_id) VALUES
(1, '2024-03-25', 50000, 101),
(2, '2024-03-26', 75000, 102),
(3, '2024-03-27', 100000, 103),
(4, '2024-03-28', 45000, 104),
(5, '2024-03-29', 80000, 105),
(6, '2024-03-30', 60000, 106),
(7, '2024-03-31', 70000, 107),
(8, '2024-04-01', 90000, 108),
(9, '2024-04-02', 55000, 109),
(10, '2024-04-03', 95000, 110);
SELECT*FROM penjualan ;


CREATE TABLE Pembelian (
kode_transaksi INT NOT NULL PRIMARY KEY,
tanggal_transaksi DATE NOT NULL,
total_harga INT NOT NULL,
supplier_id INT NOT NULL
);
INSERT INTO Pembelian (kode_transaksi, tanggal_transaksi, total_harga, supplier_id) VALUES
(1, '2024-03-25', 50000, 101),
(2, '2024-03-24', 75000, 102),
(3, '2024-03-23', 60000, 103),
(4, '2024-03-22', 45000, 104),
(5, '2024-03-21', 55000, 105),
(6, '2024-03-20', 80000, 106),
(7, '2024-03-19', 70000, 107),
(8, '2024-03-18', 90000, 108),
(9, '2024-03-17', 95000, 109),
(10, '2024-03-16', 85000, 110);
SELECT*FROM pembelian;


CREATE TABLE Pengembalian (
kode_transaksi INT NOT NULL PRIMARY KEY,
tanggal_transaksi DATE NOT NULL,
total_harga INT NOT NULL,
pelanggan_id INT NOT NULL
);
INSERT INTO Pengembalian (kode_transaksi, tanggal_transaksi, total_harga, pelanggan_id) VALUES
(1, '2024-03-25', 30000, 201),
(2, '2024-03-24', 40000, 202),
(3, '2024-03-23', 35000, 203),
(4, '2024-03-22', 25000, 204),
(5, '2024-03-21', 32000, 205),
(6, '2024-03-20', 45000, 206),
(7, '2024-03-19', 38000, 207),
(8, '2024-03-18', 50000, 208),
(9, '2024-03-17', 52000, 209),
(10, '2024-03-16', 47000, 210);
SELECT*FROM pengembalian;

CREATE TABLE Supplier (
supplier_id INT NOT NULL PRIMARY KEY,
nama_supplier VARCHAR(50) NOT NULL,
alamat_supplier VARCHAR(100) NOT NULL,
email_supplier VARCHAR(50),
telepon_supplier VARCHAR(20) NOT NULL,
tgl_terakhir_stok TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
harga_barang_supplier INT NOT NULL,
total_barang_setor INT NOT NULL, 
total_hutang_ke_supplier INT NOT NULL, 
tgl_terakhir_bayar_hutang TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO Supplier (supplier_id, nama_supplier, alamat_supplier, email_supplier, telepon_supplier, harga_barang_supplier, total_barang_setor, total_hutang_ke_supplier) VALUES
(101, 'Supplier A', 'Jl. Contoh No. 123', 'supplierA@example.com', '123456789', 5000, 100, 0),
(102, 'Supplier B', 'Jl. Contoh No. 456', 'supplierB@example.com', '987654321', 6000, 150, 0),
(103, 'Supplier C', 'Jl. Contoh No. 789', NULL, '111222333', 5500, 120, 0),
(104, 'Supplier D', 'Jl. Contoh No. 012', 'supplierD@example.com', '444555666', 4800, 200, 0),
(105, 'Supplier E', 'Jl. Contoh No. 345', 'supplierE@example.com', '777888999', 5200, 180, 0),
(106, 'Supplier F', 'Jl. Contoh No. 678', NULL, '333444555', 5100, 160, 0),
(107, 'Supplier G', 'Jl. Contoh No. 901', 'supplierG@example.com', '666777888', 5300, 140, 0),
(108, 'Supplier H', 'Jl. Contoh No. 234', 'supplierH@example.com', '999000111', 4900, 220, 0),
(109, 'Supplier I', 'Jl. Contoh No. 567', NULL, '222333444', 4700, 240, 0),
(110, 'Supplier J', 'Jl. Contoh No. 890', 'supplierJ@example.com', '555666777', 5100, 200, 0);
SELECT*FROM Supplier;
DESC barang ;
ALTER TABLE supplier RENAME TO suplierrr;
----mengubah tipe ddata panjang salah satu dataa----
ALTER TABLE Supplier
MODIFY COLUMN CHANGE COLUMN nama_supplier VARCHAR(50);


---jika iningin menghapus -> 
DROP DATABASE praktikumSmbd;




----menambahkan colom  kode pos sebelum email---
ALTER TABLE Supplier
ADD kode_pos VARCHAR(10) AFTER alamat_supplier;

DESC supplier;

SELECT * FROM Supplier


