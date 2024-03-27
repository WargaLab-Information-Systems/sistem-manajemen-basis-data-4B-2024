CREATE DATABASE Toko_24Jam;
SHOW DATABASES Toko_24Jam;
USE toko_24jam;

CREATE TABLE transaksi_pelanggan (id_pelanggan INT (10) PRIMARY KEY, kode_barang INT (20), nama_barang VARCHAR (100), 
jumlah_beli INT (20), harga_beli INT (20), total_beli INT (20), tanggal_beli DATE);

CREATE TABLE transaksi_supplier (id_supplier INT (50) PRIMARY KEY, nama_supplier VARCHAR (50), kode_barang VARCHAR(50), 
nama_barang VARCHAR (100), jumlah_barang INT (100), harga_barang INT (100), total INT (100), tanggal_pembelian DATE,
status_pembayaran VARCHAR (50));

CREATE TABLE transaksi_return (id_return INT (10) PRIMARY KEY, kode_barang INT (10), nama_barang VARCHAR (100),
tanggal_kembali DATE, keterangan VARCHAR (100));

CREATE TABLE stok (kode_barang INT (10) PRIMARY KEY AUTO_INCREMENT, nama_barang VARCHAR (100), stok_barang INT (50),
harga_jual INT (20));

CREATE TABLE laporan_penjualan (id_penjualan INT (10) PRIMARY KEY, nama_pelanggan VARCHAR (100), kode_barang INT (20), stok_barang INT (50),
jumlah_beli INT (20), harga_beli INT (20), total_beli INT (20), tanggal_beli DATE); 

CREATE TABLE hutang (id_hutang INT (50) PRIMARY KEY, nama_supplier VARCHAR (50), kode_barang INT (20), jumlah_barang INT (100),
total INT (100), tanggal_pembelian DATE, bayar_hutang INT (20), tanggal_pelunasan DATE);

INSERT transaksi_pelanggan VALUES (001, 01, 'Hoodie', 2, 50000, 100000, '2023-03-12');
INSERT transaksi_pelanggan VALUES (002, 02, 'Celana', 2, 80000, 160000, '2023-03-12');
INSERT transaksi_pelanggan VALUES (003, 03, 'Dress', 1, 150000, 150000, '2023-03-13');
INSERT transaksi_pelanggan VALUES (004, 04, 'Kaos', 2, 35000, 70000, '2023-03-13');
INSERT transaksi_pelanggan VALUES (005, 05, 'Crewneck', 2, 60000, 120000, '2023-03-14');
INSERT transaksi_pelanggan VALUES (006, 06, 'Blouse', 2, 45000, 90000, '2023-03-14');
INSERT transaksi_pelanggan VALUES (007, 07, 'Cardigan', 1, 30000, 60000, '2023-03-15');
INSERT transaksi_pelanggan VALUES (008, 08, 'Topi', 1, 50000, 50000, '2023-03-15');
INSERT transaksi_pelanggan VALUES (009, 09, 'Kerudung', 2, 15000, 30000, '2023-03-14');
INSERT transaksi_pelanggan VALUES (010, 10, 'Kemeja', 3, 50000, 150000, '2023-03-14');

INSERT transaksi_return VALUES (1001, 01, 'Hoodie', '2023-03-13', 'Kebesaran');
INSERT transaksi_return VALUES (1002, 02, 'Celana', '2023-03-13', 'Terdapat bagian yang bolong');
INSERT transaksi_return VALUES (1003, 04, 'Kaos', '2023-03-13', 'Kekecilan');
INSERT transaksi_return VALUES (1004, 07, 'Cardigan', '2023-03-13', 'Terdapat Kerusakan');
INSERT transaksi_return VALUES (1005, 03, 'Dress', '2023-03-14', 'Terdapat bagian yang luntur');
INSERT transaksi_return VALUES (1006, 05, 'Crewneck', '2023-03-14', 'terjadi Kesalahan Warna');
INSERT transaksi_return VALUES (1007, 10, 'Kemeja', '2023-03-15', 'Kebesaran');
INSERT transaksi_return VALUES (1008, 06, 'Blouse', '2023-03-16', 'Terdapat bagian yang bolong');
INSERT transaksi_return VALUES (1009, 09, 'Kerudung', '2023-03-16', 'Kesalahan Warna');
INSERT transaksi_return VALUES (1010, 08, 'Topi', '2023-03-16', 'Kesalahan Ukuran');

INSERT stok VALUES (01, 'Hoodie', 30, 50000);
INSERT stok VALUES (02, 'Celana', 50, 80000);
INSERT stok VALUES (03, 'Dress', 10, 150000);
INSERT stok VALUES (04, 'Kaos', 100, 35000);
INSERT stok VALUES (05, 'Crewneck', 50, 60000);
INSERT stok VALUES (06, 'Blouse', 30, 45000);
INSERT stok VALUES (07, 'Cardigan', 25, 30000);
INSERT stok VALUES (08, 'Topi', 10, 50000);
INSERT stok VALUES (09, 'Kerudung', 30, 15000);
INSERT stok VALUES (10, 'Kemeja', 100, 50000);

INSERT transaksi_supplier VALUES (2001, 'Ziva', 01, 'Hoodie', 50, 30000, 1500000, '2023-03-15', 'Hutang');
INSERT transaksi_supplier VALUES (2002, 'Kevin', 02, 'Celana', 20, 40000, 800000, '2023-03-15', 'Lunas');
INSERT transaksi_supplier VALUES (2003, 'Rafathar', 03, 'Dress', 10, 75000, 750000, '2023-03-15', 'Lunas');
INSERT transaksi_supplier VALUES (2004, 'Nagita', 04, 'Kaos', 50, 30000, 1500000, '2023-03-15', 'Hutang');
INSERT transaksi_supplier VALUES (2005, 'Raffi', 05, 'Crewneck', 30, 30000, 900000, '2023-03-15', 'Hutang');
INSERT transaksi_supplier VALUES (2006, 'Alliyah', 06, 'Blouse', 50, 20000, 1000000, '2023-03-15', 'Hutang');
INSERT transaksi_supplier VALUES (2007, 'Ray', 07, 'Cardigan', 50, 15000, 750000, '2023-03-15', 'Lunas');
INSERT transaksi_supplier VALUES (2008, 'Jessica', 08, 'Topi', 5, 20000, 100000, '2023-03-15', 'Lunas');
INSERT transaksi_supplier VALUES (2009, 'Justin', 09, 'Kerudung', 20, 10000, 200000, '2023-03-15', 'Lunas');
INSERT transaksi_supplier VALUES (2010, 'Sisca', 10, 'Kemeja', 50, 30000, 1500000, '2023-03-15', 'Hutang');

INSERT laporan_penjualan VALUES (3001, 'Rini', 01, 30, 2, 50000, 100000, '2023-03-12');
INSERT laporan_penjualan VALUES (3002, 'Merry', 02, 50, 2, 80000, 160000, '2023-03-12');
INSERT laporan_penjualan VALUES (3003, 'Sensen', 04, 10, 2, 35000, 70000, '2023-03-13');
INSERT laporan_penjualan VALUES (3004, 'Olik', 03, 100, 1, 150000, 150000, '2023-03-13');
INSERT laporan_penjualan VALUES (3005, 'Olivia', 05, 50, 2, 60000, 120000, '2023-03-14');
INSERT laporan_penjualan VALUES (3006, 'Lala', 06, 30, 2, 45000, 90000, '2023-03-14');
INSERT laporan_penjualan VALUES (3007, 'Caca', 08, 25, 1, 50000, 50000, '2023-03-15');
INSERT laporan_penjualan VALUES (3008, 'Aruni', 07, 10, 1, 30000, 60000, '2023-03-15');
INSERT laporan_penjualan VALUES (3009, 'Ryan', 09, 30, 2, 15000, 30000, '2023-03-14');
INSERT laporan_penjualan VALUES (3010, 'Amar', 10, 100, 3, 50000, 150000, '2023-03-14');

INSERT hutang VALUES (4001, 'Ziva', 01, 50, 1500000, '2023-03-15', 500000, '2023-03-18');
INSERT hutang VALUES (4002, 'Nagita', 04, 50, 1500000, '2023-03-15', 1000000, '2023-03-19');
INSERT hutang VALUES (4003, 'Nagita', 04, 50, 1500000, '2023-03-15', 500000, '2023-03-20');
INSERT hutang VALUES (4004, 'Raffi', 05, 30, 900000, '2023-03-15', 900000, '2023-03-20');
INSERT hutang VALUES (4005, 'Alliyah', 06, 50,1000000, '2023-03-15', 500000, '2023-03-20');
INSERT hutang VALUES (4006, 'Alliyah', 06, 50,1000000, '2023-03-15', 500000, '2023-03-20');
INSERT hutang VALUES (4007, 'Ziva', 01, 50, 1500000, '2023-03-15', 1000000, '2023-03-20');
INSERT hutang VALUES (4008, 'Sisca', 10, 50, 1500000, '2023-03-15', 500000, '2023-03-17');
INSERT hutang VALUES (4009, 'Sisca', 10, 50, 1500000, '2023-03-15', 500000, '2023-03-19');
INSERT hutang VALUES (4010, 'Sisca', 10, 50, 1500000, '2023-03-15', 500000, '2023-03-20');

SELECT *  FROM transaksi_pelanggan
SELECT *  FROM transaksi_supplier
SELECT *  FROM transaksi_return
SELECT *  FROM laporan_penjualan
SELECT *  FROM stok
SELECT *  FROM hutang
SELECT *  FROM persedian_barang

ALTER TABLE stok RENAME TO persediaan_barang;
