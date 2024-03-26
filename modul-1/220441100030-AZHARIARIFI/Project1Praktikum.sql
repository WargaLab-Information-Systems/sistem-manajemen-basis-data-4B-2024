USE Toko_Jawa;

CREATE TABLE Penjualan (
  kode_transaksi INT NOT NULL PRIMARY KEY,
  tanggal_transaksi DATE NOT NULL,
  total_harga INT NOT NULL,
  pelanggan_id INT NOT NULL
);

CREATE TABLE Pengembalian (
  kode_transaksi INT NOT NULL PRIMARY KEY,
  tanggal_transaksi DATE NOT NULL,
  total_harga INT NOT NULL,
  pelanggan_id INT NOT NULL
);

CREATE TABLE Barang (
  kode_barang INT NOT NULL PRIMARY KEY,
  nama_barang VARCHAR(50) NOT NULL,
  jumlah_stok INT NOT NULL,
  harga_barang INT NOT NULL
);

CREATE TABLE Pembelian (
  kode_transaksi INT NOT NULL PRIMARY KEY,
  tanggal_transaksi DATE NOT NULL,
  total_harga INT NOT NULL,
  supplier_id INT NOT NULL
);

CREATE TABLE Koreksi_Stok (
  kode_koreksi INT NOT NULL PRIMARY KEY,
  tanggal_koreksi DATE NOT NULL,
  kode_barang INT NOT NULL,
  stok_sebelum INT NOT NULL,
  stok_setelah INT NOT NULL
);

CREATE TABLE laporan_penjualan (
  kode_laporan INT NOT NULL PRIMARY KEY,
  tgl_laporan DATE NOT NULL,
  kode_barang INT NOT NULL,
  kode_transaksi INT NOT NULL,
  total_transaksi INT NOT NULL,
  total_nominal_penjualan INT NOT NULL
);

CREATE TABLE Keuangan (
  kode_transaksi INT NOT NULL PRIMARY KEY,
  tanggal_transaksi DATE NOT NULL,
  jenis_transaksi VARCHAR(10) NOT NULL,
  nominal INT NOT NULL
);

CREATE TABLE Pelanggan (
  pelanggan_id INT NOT NULL PRIMARY KEY,
  nama_pelanggan VARCHAR(50) NOT NULL,
  alamat_pelanggan VARCHAR(100) NOT NULL,
  email_pelanggan VARCHAR(50),
  telepon_pelanggan VARCHAR(20) NOT NULL
);

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

CREATE TABLE status_penjualan_barang (
  kode_transaksi INT NOT NULL PRIMARY KEY,
  kode_barang INT NOT NULL,
  status_transaksi VARCHAR(200) NOT NULL
);


INSERT INTO pelanggan (pelanggan_id, nama_pelanggan, alamat_pelanggan, email_pelanggan, telepon_pelanggan) VALUES
(101, 'Annisa Arcy', 'Sukabumi', 'Anissaarc31@gmail.com', '08123456789'),
(102, 'Denny Rozy Alfanto', 'Situbondo', 'Dnnyrzy12@gmail.com', '08982348234'),
(103, 'Cristianta Dimas Putra', 'Situbondo', 'crsdimas10@gmail.com', '08912242327383'),
(104, 'Kevin Pratama', 'Bondowoso', 'kpratama99@gmail.com', '089173981928'),
(105, 'Krishna Bayu', 'Bangkalan', 'krisbayu@gmail.com', '081199991111'),
(106, 'Lutfi Pratama Himawan', 'Sampang', 'lutfiph@gmail.com', '081232787493'),
(107, 'Lanang Nugroho', 'Surabaya', 'nugi1212@gmail.com', '089789802028'),
(108, 'Aisyah Athiya', 'Sidoarjo', 'aisyahathiya@gmail.com', '089190829372'),
(109, 'Wisnu Aji', 'Malang', 'wisnuajirudiansyah@gmail.com', '081678980191'),
(110, 'Masita Dwi Aprilia', 'Bekasi', 'masitadp@gmail.com', '089510212115');

INSERT INTO pelanggan (

SELECT * FROM pelanggan;

INSERT INTO supplier (supplier_id, 
                    nama_supplier,
                    alamat_supplier,
                    email_supplier,
                    telepon_supplier,
                    tgl_terakhir_stok,
                    harga_barang_supplier,
                    total_barang_setor,
                    total_hutang_ke_supplier,
                    tgl_terakhir_bayar_hutang) VALUES
(111, 'PT. SIGANAMA', 'Surabaya', 'sigana@gmail.com', '081080890987', '2024-03-12 15:24:30', 1000000, 100, 10000, '2024-04-14 15:14:30'),
(112, 'PT. CUPAPI', 'Mojokerto', 'cupapi@gmail.com', '089234567897', '2024-01-23 11:00:30', 1150000, 10, 100000, '2024-04-14 15:14:30'),
(113, 'PT. Jaya Makmur', 'Sukabumi', 'jaya@gmail.com', '08910288198', '2024-01-01 10:11:10', 1500000, 50, 50000, '2024-04-14 15:14:30'),
(114, 'PT. SALERO KITO', 'Sidoarjo', 'salto@gmail.com', '087870789089', '2024-02-24 17:09:40', 2500000, 150, 5000, '2024-04-14 15:14:30'),
(115, 'PT. MASYAALLAH', 'Lumajang', 'masyaallah@gmail.com', '08129291012', '2024-05-10 11:12:00', 3000000, 75, 50000, '2024-04-14 15:14:30'),
(116, 'PT. MEKANIK', 'Brebes', 'mekan@gmail.com', '081080890987', '2024-03-12 15:24:30', 1000000, 100, 10000, '2024-04-14 15:14:30'),
(117, 'PT. ONEPIECE', 'Ngawi', 'luffyd@gmail.com', '08123476890', '2024-01-11 10:01:00', 2000000, 200, 100000, '2024-02-02 11:11:11'),
(118, 'PT. TANGLED', 'Tegal', 'tangd@gmail.com', '0890809099', '2024-04-16 16:30:30', 3000000, 300, 100000, '2024-05-11 11:12:30'),
(119, 'PT. GRID', 'Bojonegoro', 'gridd@gmail.com', '08991110019', '2024-02-30 11:22:20', 1000000, 50, 10000, '2024-04-14 15:14:30'),
(120, 'PT. SUKA MALAS', 'Bangkalan', 'MforMalas@gmail.com', '0809101292', '2024-02-11 11:12:11', 5000000, 500, 20000, '2024-04-14 15:14:30');

SELECT * FROM supplier;

INSERT INTO barang (kode_barang, nama_barang, jumlah_stok, harga_barang) VALUES 
(1001, 'Mie Instan', 1000, 10000),
(1002, 'Telur', 300, 40000),
(1003, 'Nigaa', 1000, 3500),
(1004, 'Minyak Goreng', 1000, 3500),
(1005, 'Pasta Gigi', 100, 50000),
(1006, 'Sabun Colek', 100, 35000),
(1007, 'Beras Jawir', 100, 25000),
(1008, 'Bumbu Pemutih', 100, 100000),
(1009, 'Rujak Hytam', 100, 300000),
(1010, 'Kecoa Geprek', 50, 400000);

SELECT * FROM barang;

INSERT INTO koreksi_stok (kode_koreksi, tanggal_koreksi, kode_barang, stok_sebelum, stok_setelah) VALUES 
(1111, '2024-03-03', '1001', 1000, 900),
(1112, '2024-03-03', '1002', 300, 100),
(1113, '2024-03-03', '1003', 1000, 950),
(1114, '2024-03-03', '1004', 1000, 990),
(1115, '2024-03-03', '1005', 100, 70),
(1116, '2024-03-03', '1006', 100, 50),
(1117, '2024-03-03', '1007', 100, 70),
(1118, '2024-03-03', '1008', 100, 90),
(1119, '2024-03-03', '1009', 100, 90),
(1120, '2024-03-03', '1010', 50, 40);

SELECT * FROM koreksi_stok;

INSERT INTO penjualan (kode_transaksi, tanggal_transaksi, total_harga, pelanggan_id) VALUES
(1, '2023-04-05', 300000, 110),
(2, '2023-04-25', 150000, 109),
(3, '2023-04-19', 250000, 101),
(4, '2023-04-19', 50000, 101),
(5, '2023-05-19', 20000, 102),
(6, '2023-05-19', 30000, 107),
(7, '2023-05-19', 450000, 106),
(8, '2023-05-19', 125000, 103),
(9, '2023-06-19', 120000, 104),
(10, '2023-06-19', 200000, 105);

SELECT * FROM penjualan;

INSERT INTO pengembalian (kode_transaksi, tanggal_transaksi, total_harga, pelanggan_id) VALUES
(1, '2023-03-19', 300000, 110),
(2, '2023-03-19', 150000, 109),
(3, '2023-03-19', 250000, 101),
(4, '2023-03-19', 50000, 101),
(5, '2023-03-19', 20000, 102),
(6, '2023-03-19', 30000, 107),
(7, '2023-03-19', 450000, 106),
(8, '2023-03-19', 125000, 103),
(9, '2023-03-19', 120000, 104),
(10, '2023-03-19', 200000, 105);

SELECT * FROM pengembalian;

INSERT INTO pembelian (kode_transaksi, tanggal_transaksi, total_harga, supplier_id) VALUES
(1, '2023-03-19', 1000000, 111),
(2, '2023-03-19', 1500000, 11 2),
(3, '2023-03-19', 2500000, 113),
(4, '2023-03-19', 5000000, 114),
(5, '2023-03-19', 2000000, 115),
(6, '2023-03-19', 3000000, 116),
(7, '2023-03-19', 4500000, 117),
(8, '2023-03-19', 1250000, 118),
(9, '2023-03-19', 1200000, 119),
(10, '2023-03-19', 2000000, 120);

SELECT * FROM pembelian;

INSERT INTO keuangan (kode_transaksi, tanggal_transaksi, jenis_transaksi, nominal) VALUES
(1, '2023-03-19', 'Hutang', 20),
(2, '2023-03-19', 'Lunas', 20),
(3, '2023-03-19', 'Hutang', 20),
(4, '2023-03-19', 'Hutang', 20),
(5, '2023-03-19', 'Hutang', 20),
(6, '2023-03-19', 'Lunas', 20),
(7, '2023-03-19', 'Hutang', 20),
(8, '2023-03-19', 'Hutang', 20),
(9, '2023-03-19', 'Hutang', 20),
(10, '2023-03-19', 'Lunas', 20);

SELECT * FROM keuangan;

INSERT INTO laporan_penjualan (kode_laporan, tgl_laporan, kode_barang, kode_transaksi, total_transaksi, total_nominal_penjualan) VALUES
(901, '2024-03-20 15:30:21', 1001, 1, 200000, 4),
(902, '2024-03-20 15:35:21', 1003, 2, 100000, 2),
(903, '2024-03-20 15:40:21', 1005, 3, 300000, 1),
(904, '2024-03-20 15:45:21', 1007, 4, 400000, 3),
(905, '2024-03-20 15:55:21', 1009, 5, 500000, 5),
(906, '2024-03-20 15:57:21', 1002, 6, 100000, 4),
(907, '2024-03-20 15:59:21', 1004, 7, 300000, 7),
(908, '2024-03-20 16:05:21', 1006, 8, 200000, 4),
(909, '2024-03-20 16:10:21', 1008, 9, 200000, 3),
(910, '2024-03-20 16:15:21', 1010, 10, 200000, 8);

SELECT * FROM laporan_penjualan;

INSERT INTO status_penjualan_barang (kode_transaksi, kode_barang, status_transaksi) VALUES
(1, 1001, 'Lunas'),
(2, 1002, 'Lunas'),
(3, 1003, 'Lunas'),
(4, 1004, 'Lunas'),
(5, 1005, 'Lunas'),
(6, 1006, 'Lunas'),
(7, 1007, 'Lunas'),
(8, 1008, 'Lunas'),
(9, 1009, 'Lunas'),
(10, 1010,'Lunas');

SELECT * FROM status_penjualan_barang;

ALTER TABLE `return` RENAME TO `pengembalian`;

DROP DATABASE toko_jawa;

SHOW TABLES;

