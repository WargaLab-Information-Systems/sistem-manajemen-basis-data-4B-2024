-- Membuat database
CREATE DATABASE IF NOT EXISTS swalayan;

-- Menggunakan database
USE swalayan;

-- Membuat tabel Pelanggan
CREATE TABLE pelanggan (
    id_pelanggan INT (50),
    nama_pelanggan VARCHAR(50),
    alamat VARCHAR(100),
    telepon VARCHAR(15),
    PRIMARY KEY (id_pelanggan)
);

-- Membuat tabel Supplier
CREATE TABLE supplier (
    id_supplier INT PRIMARY KEY,
    nama_supplier VARCHAR(50),
    alamat VARCHAR(100),
    telepon VARCHAR(15)
);

-- Membuat tabel Barang
CREATE TABLE IF NOT EXISTS barang (
    id_barang INT AUTO_INCREMENT PRIMARY KEY,
    nama_barang VARCHAR(50),
    harga INT,
    stok INT
);

-- Membuat tabel Transaksi
CREATE TABLE transaksi (
    id_transaksi INT PRIMARY KEY,
    jenis_transaksi VARCHAR(20),
    tanggal_transaksi DATE,
    id_barang INT,
    jumlah_barang INT,
    id_pelanggan INT,
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan)
);

ALTER TABLE transaksi  MODIFY COLUMN jenis_transaksi CHAR(25)

DESC transaksi
DESC pelanggan
DESC supplier
DESC barang
DESC keuangan


SHOW TABLES;
 
-- Membuat tabel Keuangan
CREATE TABLE keuangan (
    id_transaksi INT PRIMARY KEY,
    jenis_transaksi VARCHAR(20),
    nominal INT,
    tanggal_transaksi DATE,
    FOREIGN KEY (id_transaksi) REFERENCES transaksi(id_transaksi)
);

-- Tambahkan data ke tabel Pelanggan
INSERT INTO pelanggan VALUES
(1, 'Budi', 'Jl. Merdeka No. 1', '08123456789'),
(2, 'Ani', 'Jl. Jenderal Sudirman No. 2', '08567890123'),
(3, 'Citra', 'Jl. Gajah Mada No. 3', '08123456780'),
(4, 'Dewi', 'Jl. Diponegoro No. 4', '08567890120'),
(5, 'Eko', 'Jl. Asia Afrika No. 5', '08123456781'),
(6, 'Fani', 'Jl. Pahlawan No. 6', '08567890121');


-- Tambahkan data ke tabel Supplier
INSERT IGNORE INTO supplier (nama_supplier, alamat, telepon) VALUES
('Supplier A', 'Jl. Gatot Subroto No. 10', '08123456782'),
('Supplier B', 'Jl. Thamrin No. 20', '08567890122'),
('Supplier C', 'Jl. HR Rasuna Said No. 30', '08123456783'),
('Supplier D', 'Jl. Kebon Kacang No. 40', '08567890124'),
('Supplier E', 'Jl. Prof. Dr. Satrio No. 50', '08123456784'),
('Supplier F', 'Jl. Senayan No. 60', '08567890125');

-- Tambahkan data ke tabel Barang
INSERT IGNORE INTO barang (nama_barang, harga, stok) VALUES
('Gula', 5000, 50),
('Beras', 10000, 30),
('Minyak', 7000, 100),
('Tepung', 6000, 80),
('Sabun', 3000, 120),
('Shampoo', 12000, 40),
('Sikat Gigi', 5000, 60),
('Pasta Gigi', 7000, 50),
('Susu', 15000, 20),
('Kopi', 8000, 40);

-- Tambahkan data ke tabel Transaksi
INSERT INTO transaksi (jenis_transaksi, tanggal_transaksi, id_barang, jumlah_barang, id_pelanggan) VALUES
('POS', '2024-01-01', 1, 5, 1),
('POS', '2024-01-02', 2, 3, 2),
('Retur', '2024-01-03', 1, 1, 3),
('Pembelian', '2024-01-04', 3, 10, NULL),
('Pembelian', '2024-01-05', 4, 7, NULL),
('Koreksi Stok', '2024-01-06', 1, -2, NULL),
('POS', '2024-01-07', 2, 2, 4),
('POS', '2024-01-08', 3, 6, 5),
('Retur', '2024-01-09', 1, 1, 6),
('Pembelian', '2024-01-10', 4, 5, NULL);

-- Tambahkan data ke tabel Keuangan
INSERT INTO keuangan (id_transaksi, jenis_transaksi, nominal, tanggal_transaksi) VALUES
(1, 'Penjualan', 250000, '2024-01-01'),
(2, 'Penjualan', 180000, '2024-01-02'),
(3, 'Pembelian', 50000, '2024-01-04'),
(4, 'Pembelian', 70000, '2024-01-05'),
(5, 'Penjualan', 420000, '2024-01-08'),
(6, 'Pembelian', 25000, '2024-01-10');

SELECT * FROM pelanggan; 
SELECT * FROM supplier; 
SELECT * FROM barang; 
SELECT * FROM transaksi; 
SELECT * FROM keuangan; 

ALTER TABLE pelanggann RENAME TO pelanggan;
ALTER TABLE pelanggan RENAME TO pelanggann;

UPDATE pelanggan SET nama_pelanggan = 'Mamad' WHERE id_pelanggan = 1;

ALTER TABLE pelanggan CHANGE COLUMN alamat Alamat VARCHAR(100);