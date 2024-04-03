CREATE DATABASE db_tokoswalayan

USE db_tokoswalayan

CREATE TABLE tbl_pelanggan (
id_pelanggan INT (4) NOT NULL,
nama_pelanggan VARCHAR (100) NOT NULL,
alamat_pelanggan VARCHAR (100) NOT NULL,
no_telp INT (12) NOT NULL,
PRIMARY KEY (id_pelanggan)
)

INSERT INTO tbl_pelanggan (id_pelanggan, nama_pelanggan, alamat_pelanggan, no_telp)
VALUES 
(1111, 'atta luthi', 'Jl. cikande asem No. 531', 0812345670),
(1112, 'febriansyah', 'Jl. Jakarta selatan No. 41', 087432100),
(1113, 'dinda cicya', 'Jl. Raya Telang No. 539', 022334400),
(1114, 'septian nahdi', 'Jl. Surabaya No. 18', 085557788),
(1115, 'amanda kharisma', 'Jl. Airlangga No. 03', 0999808646),
(1116, 'aisya fitriya', 'Jl. Gumarang No. 04', 0812233455),
(1117, 'nafa herlangga', 'Jl. Pasar Senen No. 27', 0877665543),
(1118, 'ummatus soleha', 'Jl. Pasar Turi 293. 30', 0854321578),
(1119, 'alonso nathan', 'Jl. Pahlwan No. 48', 0804561234),
(1120, 'muhamad ilmi', 'Jl. Kertajaya No. 90', 0812793456);


CREATE TABLE tbl_produk (
    id_produk INT (4),
    nama_produk VARCHAR(100),
    Harga_Jual DECIMAL(18, 2),
    Harga_Beli DECIMAL(18, 2),
    stok INT (5)NOT NULL,
    PRIMARY KEY (id_produk)
); 

INSERT INTO tbl_produk (id_produk, nama_produk, Harga_Jual, Harga_Beli, stok) 
VALUES
(1, 'Indomie Goreng', 3000, 2000, 100),
(2, 'Indomie Kuah', 12000, 10000, 150),
(3, 'Mie Sedaap Soto', 25000, 20000, 80),
(4, 'Baygon', 20000, 25000, 200),
(5, 'Stella Apel', 15000, 17000, 120),
(6, 'Sabun Mandi', 25000, 28000, 90),
(7, 'Rapika', 7000, 9000, 180),
(8, 'HandBody', 25000, 29000, 100),
(9, 'Sampoo', 3000, 5000, 150),
(10, 'Gula', 15000, 16000, 120);

CREATE TABLE tbl_supplier (
    id_supplier INT (4) NOT NULL,
    nama_supplier VARCHAR(100) NOT NULL,
    nomor_Telepon INT(12) NOT NULL,
    PRIMARY KEY (id_supplier)
)

INSERT INTO tbl_supplier (id_supplier, nama_supplier, nomor_Telepon)
VALUES 
(2151, 'indomart', 083865213456),
(2152, 'minimart', 083865219241),
(2153, 'alfamart', 083865219367),
(2154, 'sidomart', 083865214320),
(2155, 'asixmart', 083865210838),
(2156, 'aprilindo', 083865217142),
(2157, 'tigamart', 083865210987),
(2158, 'expressmart', 0838652172829),
(2159, 'lumart', 083865319292);


CREATE TABLE tbl_beli (
    id_beli INT (4) NOT NULL,
    tgl_beli DATE,
    id_supplier INT (4) NOT NULL,
    id_produk INT (4) NOT NULL,
    jumlah_beli INT (2) NOT NULL,
    total_harga DECIMAL(18, 2),
    PRIMARY KEY (id_beli)
)

INSERT INTO tbl_beli (id_beli, tgl_beli, id_supplier, id_produk, jumlah_beli, total_harga)
VALUES
(3001, '2024-03-01', 2151, 1, 2, 6000),
(3002, '2024-03-02', 2152, 2, 1, 12000),
(3003, '2024-03-03', 2153, 3, 4, 100000),
(3004, '2024-03-04', 2154, 4, 2, 40000),
(3005, '2024-03-05', 2155, 5, 1, 15000),
(3006, '2024-03-06', 2156, 6, 3, 75000),
(3007, '2024-03-07', 2157, 7, 2, 14000),
(3008, '2024-03-08', 2158, 8, 2, 60000),
(3009, '2024-03-09', 2159, 9, 2, 10000),
(3010, '2024-03-10', 2160, 10, 1, 15000);


CREATE TABLE tbl_transaksi(
id_transaksi INT (4) NOT NULL,
tgl_transaksi DATE,
id_pelanggan INT (4) NOT NULL,
id_produk INT (4) NOT NULL,
jumlah_produk INT (2) NOT NULL,
total_harga DECIMAL(18, 2),
PRIMARY KEY (id_transaksi)
)

INSERT INTO tbl_transaksi (id_transaksi, tgl_transaksi, id_pelanggan, id_produk, jumlah_produk, total_Harga)
VALUES
(7190, '2024-01-01', 1111, 1, 1, 4000), 
(7191, '2024-01-01', 1112, 2, 1, 12000), 
(7192, '2024-01-01', 1113, 3, 1, 25000), 
(7193, '2024-01-01', 1114, 4, 1, 20000), 
(7194, '2024-01-01', 1115, 5, 2, 30000), 
(7195, '2024-01-01', 1116, 6, 2, 50000), 
(7196, '2024-01-01', 1117, 7, 3, 21000), 
(7197, '2024-01-01', 1118, 8, 3, 50000), 
(7198, '2024-01-01', 1119, 9, 4, 9000), 
(7199, '2024-01-01', 1120, 10, 4, 60000); 


CREATE TABLE tbl_LaporanPenjualan (
    id_laporan INT (4) NOT NULL,
    tgl_laporan DATE,
    total_penjualan DECIMAL(18, 2)
)

INSERT INTO tbl_LaporanPenjualan (id_laporan, tgl_laporan, total_penjualan)
VALUES
 (6550, '2024-12-17', 500000),
 (6551, '2024-12-18', 600000),
 (6552, '2024-12-19', 850000),
 (6553, '2024-12-20', 378000),
 (6554, '2024-12-21', 650000),
 (6555, '2024-12-22', 550000),
 (6556, '2024-12-23', 960000),
 (6557, '2024-12-24', 100000),
 (6558, '2024-12-25', 1300000),
 (6560, '2024-12-26', 545000);
 
 CREATE TABLE tbl_koreksi(
 id_koreksi INT (4) NOT NULL,
 id_produk INT (4) NOT NULL,
 nama_produk VARCHAR (100) NOT NULL,
 stok_awal INT (5) NOT NULL,
 stok_akhir INT (5) NOT NULL,
 PRIMARY KEY (id_koreksi)
 )
 
 
 INSERT INTO tbl_koreksi (id_koreksi, id_produk, nama_produk, stok_awal, stok_akhir)
 VALUES
 (5210, 1, 'indomie goreng', 100, 99),
 (5211, 2, 'indomie kuah', 150, 140),
 (5212, 3, 'mie sedaap soto', 80, 75),
 (5213, 4, 'baygon', 200, 190),
 (5214, 5, 'stella apel', 120, 100),
 (5215, 6, 'sabun mandi', 90, 50),
 (5216, 7, 'rapika', 100, 78),
 (5217, 8, 'handbody', 100, 76),
 (5218, 9, 'sampoo', 150, 84),
 (5219, 10, 'gula', 120, 100);
 
 CREATE TABLE tbl_hutang (
    id_hutang INT (4) NOT NULL,
    id_supplier INT (4) NOT NULL,
    total_hutang DECIMAL(18, 2),
    status_pembayaran VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_hutang)
);


INSERT INTO tbl_hutang (id_hutang, id_supplier, total_hutang, status_pembayaran)
VALUES
(7010, 2151, 100000, 'lunas'),
(7011, 2152, 200000, 'lunas'),
(7013, 2153, 300000, 'lunas'),
(7014, 2154, 400000, 'lunas'),
(7015, 2155, 500000, 'lunas'),
(7016, 2156, 600000, 'belum lunas'),
(7017, 2157, 700000, 'belum lunas'),
(7018, 2158, 800000, 'belum lunas'),
(7019, 2159, 900000, 'belum lunas'),
(7020, 2160, 950000, 'belum lunas');

CREATE TABLE tbl_return (
id_return INT (4) NOT NULL,
produk_return VARCHAR (100) NOT NULL,
id_produk INT (4) NOT NULL,
tgl_return DATE,
alasan_return VARCHAR (200) NOT NULL,
PRIMARY KEY (id_return)
)
 
 INSERT INTO tbl_return (id_return, produk_return, id_produk, tgl_return, alasan_return)
 VALUES
 (1231, 'indomie kuah', 2, '2024-02-17', 'kadaluarsa'),
 (1232, 'Gula', 10, '2024-02-11', 'kadaluarsa'),
 (1233, 'Rapika', 7, '2024-02-05', 'Kemasan Terbuka'),
 (1234, 'mie sedaap soto', 3, '2024-02-14', 'kadaluarsa'),
 (1235, 'HandBody', 8, '2024-02-28', 'sudah cair'),
 (1236, 'indomie goreng', 1, '2024-02-23', 'kadaluarsa'),
 (1237, 'Sabun Mandi', 6, '2024-02-17', 'kemasan terbuka'),
 (1238, 'Baygon', 4, '2024-02-15', 'Kosong'),
 (1239, 'Stella Apel', 5, '2024-02-14', 'kosong'),
 (1240, 'sampoo', 9, '2024-02-12', 'kadaluarsa');

SELECT * FROM tbl_pelanggan
SELECT * FROM tbl_produk
SELECT * FROM tbl_supplier
SELECT * FROM tbl_beli
SELECT * FROM tbl_transaksi
SELECT * FROM tbl_LaporanPenjualan
SELECT * FROM tbl_koreksi
SELECT * FROM tbl_hutang
SELECT * FROM tbl_return

ALTER TABLE tbl_pelanggan RENAME TO tblPelanggan;
DROP DATABASE db_tokoswalayan;