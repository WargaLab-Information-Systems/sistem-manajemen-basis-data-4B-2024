CREATE DATABASE db_swalayan
USE db_swalayan

-- suplier
CREATE TABLE tb_suplier (
	id_suplier INT NOT NULL AUTO_INCREMENT,
	nama VARCHAR (255) NOT NULL,
	alamat VARCHAR (255) NOT NULL,
	telp CHAR (12) NOT NULL,
	PRIMARY KEY (id_suplier)
)

-- pelanggan
CREATE TABLE tb_pelanggan (
	id_pel INT NOT NULL AUTO_INCREMENT,
	nama VARCHAR (255) NOT NULL,
	alamat VARCHAR (255) NOT NULL,
	telp CHAR (12) NOT NULL,
	PRIMARY KEY (id_pel)
)

-- stok
CREATE TABLE tb_produk (
	id_produk INT NOT NULL AUTO_INCREMENT,
	nama_produk VARCHAR (255) NOT NULL,
	hrg_beli BIGINT NOT NULL,
	hrg_jual BIGINT NOT NULL,
	stok INT (10) NOT NULL,
	PRIMARY KEY (id_produk)
)

-- penjualan ke pelanggan 
CREATE TABLE tb_penjualan (
	id_penjualan INT NOT NULL AUTO_INCREMENT,
	id_pel INT,
	id_produk INT,
	jml_produk INT (10) NOT NULL,
	tgl_penjualan DATE NOT NULL,
	total_hrg BIGINT NOT NULL,
	PRIMARY KEY (id_penjualan),
	FOREIGN KEY (id_pel) REFERENCES tb_pelanggan(id_pel),
	FOREIGN KEY (id_produk) REFERENCES tb_produk(id_produk)
)


-- pengembalian barang
CREATE TABLE tb_retur (
	id_retur INT NOT NULL AUTO_INCREMENT,
	id_produk INT,
	alasan VARCHAR (255) NOT NULL,
	tgl_retur DATE NOT NULL,
	PRIMARY KEY (id_retur),
	FOREIGN KEY (id_produk) REFERENCES tb_produk(id_produk)
)

-- pembelian barang dari suplier
CREATE TABLE tb_pembelian (
	id_pembelian INT NOT NULL AUTO_INCREMENT,
	id_suplier INT,
	id_produk INT,
	jml_produk INT (10) NOT NULL,
	tot_harga BIGINT NOT NULL,
	tgl_pembelian DATE NOT NULL,
	PRIMARY KEY (id_pembelian),
	FOREIGN KEY (id_suplier) REFERENCES tb_suplier(id_suplier),
	FOREIGN KEY (id_produk) REFERENCES tb_produk(id_produk)
)

-- koreksi stok
CREATE TABLE tb_koreksi (
	id_koreksi INT NOT NULL AUTO_INCREMENT,
	id_produk INT,
	stok_awal INT (10),
	stok_akhir INT (10),
	tgl_koreksi DATE,
	PRIMARY KEY (id_koreksi),
	FOREIGN KEY (id_produk) REFERENCES tb_produk(id_produk)
)

-- laporan penjualan
CREATE TABLE laporan_penjualan (
	id_laporan INT NOT NULL AUTO_INCREMENT,
	tgl_laporan DATE,
	jml_penjualan BIGINT,
	PRIMARY KEY (id_laporan)
)

-- hutang ke suplier
CREATE TABLE tb_hutang (
	id_hutang INT NOT NULL AUTO_INCREMENT,
	id_suplier INT,
	tot_hutang BIGINT,
	status_hutang BOOLEAN,
	PRIMARY KEY (id_hutang),
	FOREIGN KEY (id_suplier) REFERENCES tb_suplier(id_suplier)
)



INSERT INTO tb_suplier (nama, alamat, telp) VALUES
('Wonder Supplies', 'Jl. Fantasi No. 123', '081234567890'),
('Dreamland Distributors', 'Jl. Imajinasi Timur No. 45', '082345678901'),
('Creative Solutions Co.', 'Jl. Inovasi Barat No. 67', '083456789012'),
('Imagination Enterprises', 'Jl. Khayalan Selatan No. 89', '084567890123'),
('Visionary Ventures', 'Jl. Mimpi Utara No. 10', '085678901234'),
('Fantasy Import-Export', 'Jl. Awan Tengah No. 21', '086789012345'),
('Innovative Suppliers', 'Jl. Kreasi Lama No. 32', '087890123456'),
('Dreamworld Industries', 'Jl. Kreativitas Baru No. 43', '088901234567'),
('Imaginary Innovations', 'Jl. Bayangan Timur No. 54', '089012345678'),
('Creative Concepts Corp.', 'Jl. Cita-cita No. 65', '090123456789')

INSERT INTO tb_pelanggan (nama, alamat, telp) VALUES
('John Doe', 'Jl. Raya No. 123', '081234567890'),
('Jane Smith', 'Jl. Melati No. 456', '085678901234'),
('Michael Johnson', 'Jl. Mangga No. 789', '082345678901'),
('Sarah Lee', 'Jl. Anggrek No. 101', '081234567890'),
('David Brown', 'Jl. Bunga No. 202', '085678901234'),
('Emily Davis', 'Jl. Kenanga No. 303', '082345678901'),
('Chris Wilson', 'Jl. Mawar No. 404', '081234567890'),
('Jessica Taylor', 'Jl. Melati No. 505', '085678901234'),
('Ryan Martinez', 'Jl. Melon No. 606', '082345678901'),
('Amanda White', 'Jl. Jeruk No. 707', '081234567890')

INSERT INTO tb_produk (nama_produk, hrg_beli, hrg_jual, stok) VALUES
('Pensil', 5000, 7000, 100),
('Buku Tulis', 10000, 15000, 50),
('Penghapus', 2000, 3000, 80),
('Pulpen', 3000, 5000, 120),
('Spidol', 8000, 10000, 70),
('Buku Gambar', 12000, 18000, 40),
('Penggaris', 4000, 6000, 90),
('Stabilo', 10000, 12000, 60),
('Kertas HVS', 15000, 20000, 30),
('Lem Kertas', 6000, 8000, 110)

INSERT INTO tb_penjualan (id_pel, id_produk, jml_produk, tgl_penjualan, total_hrg) VALUES
(1, 1, 5, '2024-03-01', 500000),
(2, 3, 3, '2024-03-02', 300000),
(3, 2, 2, '2024-03-03', 200000),
(1, 4, 1, '2024-03-04', 100000),
(2, 5, 4, '2024-03-05', 400000),
(3, 1, 2, '2024-03-06', 200000),
(1, 3, 3, '2024-03-07', 300000),
(2, 2, 1, '2024-03-08', 100000),
(3, 5, 2, '2024-03-09', 200000),
(1, 4, 4, '2024-03-10', 400000)

INSERT INTO tb_retur (id_produk, alasan, tgl_retur) VALUES
(1, 'Kerusakan saat pengiriman', '2024-03-01'),
(2, 'Ukuran tidak sesuai', '2024-03-02'),
(3, 'Warna tidak sesuai', '2024-03-03'),
(4, 'Barang rusak', '2024-03-04'),
(5, 'Tidak sesuai dengan deskripsi', '2024-03-05'),
(6, 'Produk tidak berkualitas', '2024-03-06'),
(7, 'Pembeli berubah pikiran', '2024-03-07'),
(8, 'Produk tidak digunakan', '2024-03-08'),
(9, 'Tidak cocok dengan kebutuhan', '2024-03-09'),
(10, 'Pengiriman terlambat', '2024-03-10')

INSERT INTO tb_pembelian (id_suplier, id_produk, jml_produk, tot_harga, tgl_pembelian) VALUES
(1, 1, 100, 5000000, '2024-03-25'),
(2, 2, 75, 3000000, '2024-03-26'),
(3, 3, 50, 2000000, '2024-03-27'),
(4, 4, 120, 6000000, '2024-03-28'),
(5, 5, 90, 4500000, '2024-03-29'),
(6, 6, 110, 5500000, '2024-03-30'),
(7, 7, 80, 4000000, '2024-03-31'),
(8, 8, 70, 3500000, '2024-04-01'),
(9, 9, 130, 6500000, '2024-04-02'),
(10, 10, 95, 4750000, '2024-04-03')

INSERT INTO tb_koreksi (id_produk, stok_awal, stok_akhir, tgl_koreksi) VALUES
(1, 50, 45, '2024-03-01'),
(2, 100, 95, '2024-03-02'),
(3, 75, 70, '2024-03-03'),
(4, 120, 115, '2024-03-04'),
(5, 80, 85, '2024-03-05'),
(6, 150, 155, '2024-03-06'),
(7, 200, 195, '2024-03-07'),
(8, 90, 85, '2024-03-08'),
(9, 110, 105, '2024-03-09'),
(10, 65, 70, '2024-03-10')

INSERT INTO tb_laporan_penjualan (tgl_laporan, jml_penjualan) VALUES 
('2024-03-01', 15000),
('2024-03-02', 18000),
('2024-03-03', 22000),
('2024-03-04', 19000),
('2024-03-05', 25000),
('2024-03-06', 21000),
('2024-03-07', 23000),
('2024-03-08', 27000),
('2024-03-09', 24000),
('2024-03-10', 26000)

INSERT INTO tb_hutang (id_suplier, tot_hutang, status_hutang) VALUES
(1, 5000000, 1),
(2, 3500000, 0),
(3, 7000000, 1),
(4, 2000000, 1),
(5, 4500000, 0),
(6, 6000000, 1),
(7, 8000000, 1),
(8, 1500000, 0),
(9, 4000000, 1),
(10, 5500000, 0)



SELECT * FROM tb_suplier
SELECT * FROM tb_pelanggan
SELECT * FROM tb_produk
SELECT * FROM tb_penjualan
SELECT * FROM tb_retur
SELECT * FROM tb_pembelian
SELECT * FROM tb_koreksi
SELECT * FROM tb_laporan_penjualan
SELECT * FROM tb_hutang



ALTER TABLE laporan_penjualan RENAME TO tb_laporan_penjualan



DROP DATABASE db_swalayan