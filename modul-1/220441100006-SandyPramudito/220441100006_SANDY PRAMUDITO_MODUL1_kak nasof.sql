CREATE DATABASE toko_swalayan;

USE toko_swalayan;


-- tabel produk 
CREATE TABLE produk (
    id_produk INT AUTO_INCREMENT PRIMARY KEY,
    nama_produk VARCHAR(100) NOT NULL,
    jenis_produk VARCHAR(50) NOT NULL,
    harga INT NOT NULL,
    stok INT NOT NULL
);

SELECT * FROM produk;

INSERT INTO produk (nama_produk, jenis_produk, harga, stok) VALUES
('Smartphone Xiaomi Redmi Note 11', 'Smartphone', 3000000, 50),
('Laptop Lenovo Ideapad 5', 'Laptop', 10000000, 20),
('TV LED LG OLED 65 Inch', 'TV', 22000000, 10),
('Kulkas Panasonic 2 Pintu', 'Elektronik Rumah Tangga', 18000000, 15),
('Mesin Cuci Sharp Top Loading', 'Elektronik Rumah Tangga', 5000000, 30),
('Smartwatch Samsung Galaxy Watch 4', 'Smartwatch', 4000000, 40),
('Headphone Sony WH-1000XM4', 'Audio', 3500000, 25),
('Speaker Bluetooth JBL Flip 5', 'Audio', 2000000, 35),
('Monitor Dell 27 Inch', 'Monitor', 6000000, 15),
('Router TP-Link Archer AX6000', 'Networking', 3500000, 10);


-- tabel transaksi
CREATE TABLE tb_transaksi (
    id_transaksi INT AUTO_INCREMENT PRIMARY KEY,
    nama_produk VARCHAR(100),
    jenis_transaksi VARCHAR(50) NOT NULL,
    return_tidak VARCHAR (100) NOT NULL,
    tanggal DATE NOT NULL,
    keterangan VARCHAR(255),
    jumlah_transaksi INT,
    stok_awal INT,
    stok_akhir INT
);

SELECT * FROM tb_transaksi;
ALTER TABLE tb_transaksi
ADD COLUMN nama_produk VARCHAR(100);
UPDATE tb_transaksi AS t
JOIN produk AS p ON t.id_produk = p.id_produk
SET t.nama_produk = p.nama_produk;
ALTER TABLE tb_transaksi
DROP COLUMN id_produk;
ALTER TABLE tb_transaksi
ADD COLUMN keterangan VARCHAR(255);
DROP TABLE IF EXISTS tb_transaksi;

INSERT INTO tb_transaksi (nama_produk, jenis_transaksi, return_tidak, tanggal, keterangan, jumlah_transaksi, stok_awal, stok_akhir) VALUES
('Smartphone Xiaomi Redmi Note 11', 'Penjualan', 'Tidak', '2024-03-20', 'Penjualan kepada pelanggan A', 3, 50, 47),
('Laptop Lenovo Ideapad 5', 'Penjualan', 'Tidak', '2024-03-21', 'Penjualan kepada pelanggan B', 2, 30, 28),
('TV LED LG OLED 65 Inch', 'Penjualan', 'Tidak', '2024-03-22', 'Penjualan kepada pelanggan C', 5, 20, 15),
('Kulkas Panasonic 2 Pintu', 'Pembelian', 'Tidak', '2024-03-23', 'Pembelian dari supplier X', 1, 15, 16),
('Mesin Cuci Sharp Top Loading', 'Pembelian', 'Tidak', '2024-03-24', 'Pembelian dari supplier Y', 4, 25, 29),
('Smartwatch Samsung Galaxy Watch 4', 'Penjualan', 'Ya', '2024-03-25', 'Pengembalian dari pelanggan D', 1, 10, 11),
('Headphone Sony WH-1000XM4', 'Pembelian', 'Ya', '2024-03-26', 'Pengembalian dari pelanggan E', 1, 23, 22),
('TV LED LG OLED 65 Inch', 'Penjualan', 'Ya', '2024-03-27', 'Pengembalian dari pelanggan F', 1, 15, 16),
('Speaker Bluetooth JBL Flip 5', 'Penjualan', 'Tidak', '2024-03-28', 'Penjualan kepada pelanggan G', 6, 8, 2),
('Router TP-Link Archer AX6000', 'Pembelian', 'Tidak', '2024-03-29', 'Pembelian dari supplier X', 2, 12, 14);


-- tabelpenjualan
CREATE TABLE tb_penjualan (
    id_penjualan INT AUTO_INCREMENT PRIMARY KEY,
    nama_produk VARCHAR (100),
    tgl_penjualan DATE NOT NULL,
    jumlah INT NOT NULL,
    total_harga INT NOT NULL,
    akun VARCHAR(50) NOT NULL -- Akun yang relevan (misalnya, "penjualan")
);

SELECT * FROM tb_penjualan;
DROP TABLE IF EXISTS tb_penjualan;

INSERT INTO tb_penjualan (nama_produk, tgl_penjualan, jumlah, total_harga, akun)
VALUES
('Smartphone Xiaomi Redmi Note 11', '2024-03-20', 3, 9000000, 'Penjualan kepada pelanggan A'),
('Laptop Lenovo Ideapad 5', '2024-03-21', 2, 20000000, 'Penjualan kepada pelanggan B'),
('TV LED LG OLED 65 Inch', '2024-03-22', 5, 110000000, 'Penjualan kepada pelanggan C'),
('Smartwatch Samsung Galaxy Watch 4', '2024-03-25', 2, 8000000, 'Penjualan kepada pelanggan D'),
('TV LED LG OLED 65 Inch', '2024-03-27', 1, 22000000, 'Penjualan kepada pelanggan E'),
('Speaker Bluetooth JBL Flip 5', '2024-03-28', 6, 12000000, 'Penjualan kepada pelanggan F');


-- Tabel Pembelian
CREATE TABLE tb_pembelian (
    id_pembelian INT AUTO_INCREMENT PRIMARY KEY,
    nama_produk VARCHAR(100),
    tgl_pembelian DATE NOT NULL,
    jumlah INT NOT NULL,
    total_harga INT NOT NULL,
    akun VARCHAR(50) NOT NULL DEFAULT 'hutang'
);

SELECT * FROM tb_pembelian;
DROP TABLE IF EXISTS tb_pembelian;

INSERT INTO tb_pembelian (nama_produk, tgl_pembelian, jumlah, total_harga, akun)
VALUES
('Kulkas Panasonic 2 Pintu', '2024-03-23', 1, 18000000, 'hutang'),
('Mesin Cuci Sharp Top Loading', '2024-03-24', 4, 5000000, 'hutang'),
('Headphone Sony WH-1000XM4', '2024-03-26', 3, 10500000, 'hutang'),
('Router TP-Link Archer AX6000', '2024-03-29', 2, 7000000, 'hutang');


-- Tabel Laporan
CREATE TABLE tb_laporan (
    id_laporan INT AUTO_INCREMENT PRIMARY KEY,
    nama_produk VARCHAR(100),
    total_produk INT NOT NULL,
    keterangan_laporan VARCHAR(50) NOT NULL,
    tanggal DATE NOT NULL,
    stok_sekarang INT NOT NULL
);

SELECT * FROM tb_laporan;
DROP TABLE IF EXISTS tb_laporan;

INSERT INTO tb_laporan (nama_produk, total_produk, keterangan_laporan, tanggal, stok_sekarang) VALUES
('Smartphone Xiaomi Redmi Note 11', 3, 'Penjualan', '2024-03-20', 47),
('Laptop Lenovo Ideapad 5', 2, 'Penjualan', '2024-03-21', 28),
('TV LED LG OLED 65 Inch', 5, 'Penjualan', '2024-03-22', 15),
('Kulkas Panasonic 2 Pintu', 1, 'Pembelian', '2024-03-23', 16),
('Mesin Cuci Sharp Top Loading', 4, 'Pembelian', '2024-03-24', 29),
('Smartwatch Samsung Galaxy Watch 4', 2, 'Penjualan', '2024-03-25', 10),
('Headphone Sony WH-1000XM4', 3, 'Pembelian', '2024-03-26', 23),
('TV LED LG OLED 65 Inch', 1, 'Penjualan', '2024-03-27', 15),
('Speaker Bluetooth JBL Flip 5', 6, 'Penjualan', '2024-03-28', 2),
('Router TP-Link Archer AX6000', 2, 'Pembelian', '2024-03-29', 14);

ALTER TABLE tb_pembelian
RENAME TO tabel_pembelian;

SELECT * FROM tabel_pembelian;

DROP TABLE tb_transaksi;

DROP DATABASE toko_swalayan;