CREATE DATABASE toko;

USE toko;

CREATE TABLE penjualan (
  kode_transaksi INT NOT NULL PRIMARY KEY,
  tanggal_transaksi DATE NOT NULL,
  total_harga INT NOT NULL,
  pelanggan_id INT NOT NULL
);

CREATE TABLE pengembalian (
kode_transaksi INT NOT NULL PRIMARY KEY,
tanggal_transaksi DATE NOT NULL,
total_harga INT NOT NULL,
pelanggan_id INT NOT NULL
);

CREATE TABLE list_barang (
id_barang INT NOT NULL PRIMARY KEY,
nama_barang VARCHAR (255) NOT NULL,
harga_barang INT NOT NULL,
stok_barang INT NOT NULL,
id_supplier INT NOT NULL
);

CREATE TABLE koreksi_stok (
id_barang INT NOT NULL,
nama_barang VARCHAR (255) NOT NULL,
tanggal_koreksi DATE NOT NULL,
stok_awal INT NOT NULL,
stok_akhir INT NOT NULL
);

CREATE TABLE supplier (
id_supplier INT NOT NULL PRIMARY KEY,
nama_supplier VARCHAR (255) NOT NULL,
no_telepon INT (13) NOT NULL,
alamat_supplier VARCHAR (255),
tanggal_terakhir_stok TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
harga_barang_supplier INT NOT NULL,
total_barang_setor INT NOT NULL,
total_hutang_ke_supplier INT NOT NULL
);

CREATE TABLE pelanggan (
pelanggan_id INT NOT NULL PRIMARY KEY,
nama_pelanggan VARCHAR(50) NOT NULL,
alamat_pelanggan VARCHAR(50) NOT NULL
);

CREATE TABLE status_penjualan_barang (
kode_transaksi INT NOT NULL,
id_barang INT NOT NULL,
status_transaksi VARCHAR (255)
);

CREATE TABLE laporan_penjualan (
id_laporan INT NOT NULL PRIMARY KEY,
tanggal_laporan TIMESTAMP,
id_barang INT NOT NULL,
kode_transaksi INT,
total_transaksi INT NOT NULL,
total_nominal_penjualan INT NOT NULL 
);

SELECT * FROM penjualan;

INSERT INTO penjualan (kode_transaksi, tanggal_transaksi, total_harga, pelanggan_id) VALUES 
(1, '2023-03-24', 250000, 201),
(2, '2023-03-24', 400000, 202),
(3, '2023-03-24', 300000, 203),
(4, '2023-03-24', 450000, 204),
(5, '2023-03-24', 500000, 205),
(6, '2023-03-24', 100000, 206),
(7, '2023-03-24', 50000, 207),
(8, '2023-03-24', 150000, 208),
(9, '2023-03-24', 350000, 209),
(10, '2023-03-24', 350000, 210);

SELECT * FROM pengembalian;

INSERT INTO pengembalian (kode_transaksi, tanggal_transaksi, total_harga, pelanggan_id) VALUES 
(1, '2023-03-24', 250000, 201),
(2, '2023-03-24', 400000, 202),
(3, '2023-03-24', 300000, 203),
(4, '2023-03-24', 450000, 204),
(5, '2023-03-24', 500000, 205),
(6, '2023-03-24', 100000, 206),
(7, '2023-03-24', 50000, 207),
(8, '2023-03-24', 150000, 208),
(9, '2023-03-24', 350000, 209),
(10, '2023-03-24', 350000, 210);

SELECT * FROM list_barang;

INSERT INTO list_barang (id_barang, nama_barang, harga_barang, stok_barang, id_supplier) VALUES 
(1001, 'Beras sania 5 kg', 75000, 500, 001),
(1002, 'Kecap laron 250 gram', 20000, 300, 002),
(1003, 'Gula pasir 1 kg', 18000, 400, 003),
(1004, 'Tepung terigu 1 kg', 20000, 600, 004),
(1005, 'Minyak goreng 1 liter', 25000, 200, 005),
(1006, 'Susu kental manis 370ml', 17000, 250, 006),
(1007, 'mie sedap goreng', 3000, 350, 007),
(1008, 'Teh celup sariwangi', 8000, 100, 008),
(1009, 'Top kopi', 11000, 90, 009),
(1010, 'Telur 1 kg', 32000, 70, 010);

SELECT * FROM koreksi_stok;

INSERT INTO koreksi_stok (id_barang, nama_barang, tanggal_koreksi, stok_awal, stok_akhir) VALUES
(1001, 'Beras sania 5 kg', '2023-03-29', 500, 450),
(1002, 'Kecap laron 250 gram', '2023-03-29', 300, 260),
(1003, 'Gula pasir 1 kg', '2023-03-29', 400, 340),
(1004, 'Tepung terigu 1 kg', '2023-03-29', 600,500),
(1005, 'Minyak goreng 1 liter', '2023-03-29', 200, 130),
(1006, 'Susu kental manis 370ml', '2023-03-29', 250, 200),
(1007, 'mie sedap goreng', '2023-03-29', 350,270),
(1008, 'Teh celup sariwangi', '2023-03-29', 100, 20),
(1009, 'Top kopi', '2023-03-29', 90, 30),
(1010, 'Telur 1 kg', '2023-03-29', 70, 25);

SELECT * FROM supplier;

INSERT INTO supplier (id_supplier, nama_supplier, no_telepon, alamat_supplier, tanggal_terakhir_stok, harga_barang_supplier, total_barang_setor, total_hutang_ke_supplier) VALUES
(001, 'PT Makmur', 081374958234, 'Surabaya', '2023-03-02 12:05:09', 700000, 10, 300000),
(002, 'PT Abadi', 082364817273, 'Pasuruan', '2023-03-05 13:09:15', 1500000,100,700000),
(003, 'PT Sentosa', 083926192748, 'Mojokerto', '2023-03-01 15:06:12', 650000, 50, 200000),
(004, 'PT Jaya', 081234576847, 'Jombang', '2023-03-07 10:12:13', 450000, 30, 150000),
(005, 'PT Cemerlang', 082364785912, 'Gresik', '2023-03-10 11:12:56', 400000, 20, 200000),
(006, 'PT Berkah Jaya', 085765843284, 'Lamongan', '2023-03-14 09:04:12', 120000, 10, 500000),
(007, 'PT Maju Sejahtera', 081289347561, 'Tuban', '2023-03-12 08:12:34', 200000, 100, 100000),
(008, 'PT Bumi Mulya', 082876129871, 'Kediri', '2023-03-15 12:23:56', 300000, 50, 150000),
(009, 'PT Indah Makmur',082354678956, 'Malang', '2023-03-16 14:45:12', 900000, 100, 450000),
(010, 'PT Sejahtera', 082758456273, 'Sidoarjo', '2023-03-06 16:56:40', 280000, 10, 180000);

SELECT * FROM pelanggan;

INSERT INTO pelanggan (pelanggan_id, nama_pelanggan, alamat_pelanggan) VALUES
(201, 'Arya Kusuma', 'Kediri'),
(202, 'Rani Fitriani', 'Malang'),
(203, 'Anisa Putri', 'Wonosobo'),
(204, 'Maya Dwi', 'Surabaya'),
(205, 'Zidan Baihaqi', 'Bojonegoro'),
(206, 'Risky Ramadhan', 'Lamongan'),
(207, 'Seila Ramadhani', 'Gresik'),
(208, 'Aditya Pratama', 'Tuban'),
(209, 'Feby Ayu', 'Jombang'),
(210, 'Linda Herianti', 'Sidoarjo');

SELECT * FROM  status_penjualan_barang;

INSERT INTO status_penjualan_barang (kode_transaksi, id_barang, status_transaksi) VALUES
(1, 1001,'Lunas'),
(2, 1002, 'Lunas'),
(3, 1003, 'Lunas'),
(4, 1004, 'Lunas'),
(5, 1005, 'Lunas'),
(6, 1006, 'Lunas'),
(7, 1007,'Lunas'),
(8, 1008, 'Lunas'),
(9, 1009, 'Lunas'),
(10,1010,'Lunas');


SELECT * FROM laporan_penjualan;

INSERT INTO laporan_penjualan (id_laporan,tanggal_laporan, id_barang, kode_transaksi, total_transaksi, total_nominal_penjualan) VALUES
 (40,'2023-03-25 16:40:55', 1001, 1, 375000, 5),
 (41, '2023-03-25 16:45:44', 1002, 2, 200000, 10),
 (42, '2023-03-25 16:50:56', 1003, 3, 180000, 10),
 (43, '2023-03-25 16:55:47', 1004, 4, 400000, 20),
 (44, '2023-03-25 16:58:00', 1005,5, 250000, 10),
 (45, '2023-03-25 17:00:23', 1006,6,255000, 15),
 (46, '2023-03-25 17:02:12', 1007, 7, 75000, 25),
 (47, '2023-03-25 17:05:28', 1008, 8, 80000, 10),
 (48, '2023-03-25 17:08:45', 1009, 9, 330000, 30),
 (49, '2023-03-25 17:10:26', 1010, 10, 160000,5);
 
  ALTER TABLE pengembalian RENAME retur_barang;
  
  SELECT * FROM retur_barang;
  
  DROP DATABASE toko;
  