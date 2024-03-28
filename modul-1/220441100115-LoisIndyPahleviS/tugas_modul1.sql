CREATE DATABASE toko_swalayan;

USE toko_swalayan;

CREATE TABLE pelanggan (
    id_pelanggan INT PRIMARY KEY,
    nama_pelanggan VARCHAR(100),
    alamat_pelanggan VARCHAR(200),
    no_telp VARCHAR(20)
);

CREATE TABLE supplier (
    id_supplier INT PRIMARY KEY,
    nama_supplier VARCHAR(100),
    alamat_supplier VARCHAR(200),
    no_telp VARCHAR(20)
);

CREATE TABLE produk (
    id_produk INT PRIMARY KEY,
    nama_produk VARCHAR(100),
    harga_beli DECIMAL(18,2),
    harga_jual DECIMAL(18,2),
    stok INT
);

CREATE TABLE pembelian (
    id_pembelian INT PRIMARY KEY,
    tgl_pembelian DATE,
    id_supplier INT,
    id_produk INT,
    jumlah_produk INT,
    harga_satuan DECIMAL(18, 2),
    total_harga DECIMAL(18, 2),
    status_pembayaran VARCHAR(20),
    FOREIGN KEY (id_supplier) REFERENCES supplier(id_supplier),
    FOREIGN KEY (id_produk) REFERENCES produk(id_produk)
);

CREATE TABLE hutang (
    id_hutang INT PRIMARY KEY,
    id_supplier INT,
    total_hutang DECIMAL(18, 2),
    status_pembayaran VARCHAR(20),
    FOREIGN KEY (id_supplier) REFERENCES supplier(id_supplier)
);

CREATE TABLE transaksi_penjualan (
    id_transaksi_penjualan INT PRIMARY KEY,
    id_pelanggan INT,
    id_produk INT,
    tgl_transaksi DATE,
    jumlah_produk INT,
    harga_satuan DECIMAL(18, 2),
    total_harga DECIMAL(18, 2),
    keterangan VARCHAR(200),
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan),
    FOREIGN KEY (id_produk) REFERENCES produk(id_produk)
);

CREATE TABLE laporan_penjualan (
    id_laporan INT PRIMARY KEY,
    tgl_laporan DATE,
    total_penjualan DECIMAL(18, 2)
);

CREATE TABLE retur (
    id_retur INT PRIMARY KEY,
    tgl_retur DATE, 
    jumlah_barang INT,
    keterangan VARCHAR (100)
);

CREATE TABLE laporan_stok (
    id_laporan INT PRIMARY KEY,
    tgl_laporan DATE,
    id_produk INT,
    nama_produk VARCHAR(100),
    stok_awal INT,
    penjualan INT,
    stok_akhir INT,
    FOREIGN KEY (id_produk) REFERENCES produk(id_produk)
);




INSERT INTO customer (id_pelanggan, nama_pelanggan, alamat_pelanggan, no_telp) VALUES 
(01, 'Yuki Kato', 'Perum Melati Indah 2 blok i no. 6', '082171352600'),
(02, 'Mawar Eva de Jongh', 'Perum Dahlia Bunga 5 blok f no. 1', '089287365128'),
(03, 'Tatjana Saphira', 'Perum Anggrek Ungu 8 blok rr no. 12', '087392073495'),
(04, 'Prilly Latuconsina', 'Perum Mawar Mekar 1 blok p no. 7', '081234567890'),
(05, 'Shenina Cinnamon', 'Perum Edelweis Flory 6 blok v no. 2', '085190563871'),
(06, 'Iqbaal Ramadhan', 'Perum Tulip Merah 3 blok g no. 17', '089753029555'),
(07, 'Ari Irham', 'Perum Sedap Malam 1 blok dd no. 3', '08776655443'),
(08, 'Bryan Domani', 'Perum Kamboja Regency 9 blok c no. 9', '082109397584'),
(09, 'Refal Hady', 'Perum Lotus Teratai 1 blok j no. 6', '08904561234'),
(010, 'Angga Yunanda', 'Perum Wijaya Kusuma 4 blok yy no. 5', '089384751043');

INSERT INTO supplier (id_supplier, nama_supplier, alamat_supplier, no_telp) VALUES
(01, 'Supplier Q', 'Jl. Jenderal Ahmad Yani Utara No. 198', '085678901234'),
(02, 'Supplier R', 'Jl. Raya Ki Ageng Gribig No. 45', '081234567890'),
(03, 'Supplier S', 'Jl. Jl. Ampera Raya No. 133', '0823456778901'),
(04, 'Supplier T', 'Jl. Cut Meutia No. 23', '089012345678'),
(05, 'Supplier U', 'Jl. Soekarno Hatta Binti No. 16', '082109876543'),
(06, 'Supplier V', 'Jl. Merdeka No. 105', '085123456678'),
(07, 'Supplier W', 'Jl. Raya Jend Sudirman No. 90', '081099876554'),
(08, 'Supplier X', 'Jl. Pahlawan No. 9', '082134563390'),
(09, 'Supplier Y', 'Jl. PKP. Mujahidin No. 14', '089877665543'),
(010, 'Supplier Z', 'Jl. Jaksa Agung Suprapto Raya Suprapto No. 10', '085885532200');

INSERT INTO produk (id_produk, nama_produk, harga_beli, harga_jual, stok) VALUES
(01, 'Buku Tulis', 20000, 23000, 100),
(02, 'Bolpoin', 22000, 25000, 150),
(03, 'Pensil Mekanik', 24000, 27000, 100),
(04, 'Pensil Kayu', 10000, 13000, 200),
(05, 'Spidol Papan', 60000, 65000, 50),
(06, 'Spidol Permanen', 64000, 68000, 50),
(07, 'Klip Kertas', 18000, 22000, 200),
(08, 'Penggaris', 20000, 22000, 250),
(09, 'Map Plastik', 19000, 23000, 300),
(010, 'Stapler', 28000, 33000, 100);

INSERT INTO pembelian (id_pembelian, tgl_pembelian, id_supplier, id_produk, jumlah_produk, harga_satuan, total_harga, status_pembayaran) VALUES 
(01, '2024-03-20', 01, 01, 50, 20000, 1000000, 'Lunas'),
(02, '2024-03-20', 02, 02, 30, 22000, 660000, 'Belum Lunas'),
(03, '2024-03-21', 03, 03, 30, 24000, 720000, 'Lunas'),
(04, '2024-03-21', 04, 04, 50, 10000, 500000, 'Lunas'),
(05, '2024-03-21', 05, 05, 20, 60000, 1200000, 'Belum Lunas'),
(06, '2024-03-23', 06, 06, 20, 64000, 1280000, 'Lunas'),
(07, '2024-03-23', 07, 07, 60, 18000, 1080000, 'Lunas'),
(08, '2024-03-23', 08, 08, 30, 20000, 600000, 'Belum Lunas'),
(09, '2024-03-24', 09, 09, 50, 19000, 950000, 'Lunas'),
(010, '2024-03-24', 010, 010, 20, 28000, 560000, 'Belum Lunas');

INSERT INTO hutang (id_hutang, id_supplier, total_hutang, status_pembayaran) VALUES
(01, 02, 660000, 'Belum Lunas'),
(02, 05, 1200000, 'Belum Lunas'),
(03, 08, 600000, 'Belum Lunas'),
(04, 010, 560000, 'Belum Lunas'),
(05, 01, 1000000, 'Lunas'),
(06, 03, 720000, 'Lunas'),
(07, 04, 500000, 'Lunas'),
(08, 06, 1280000, 'Lunas'),
(09, 07, 1080000, 'Lunas'),
(010, 09, 950000, 'Lunas');

INSERT INTO transaksi_penjualan (id_transaksi_penjualan, id_pelanggan, id_produk, tgl_transaksi, jumlah_produk, harga_satuan, total_harga, keterangan) VALUES 
(01, 01, 01, '2024-03-22', 10, 23000, 230000, 'Transaksi kpd. pelanggan Yuki Kato telah berhasil'),
(02, 02, 02, '2024-03-22', 10, 25000, 250000, 'Transaksi kpd. pelanggan Mawar Eva de Jongh telah berhasil'),
(03, 03, 03, '2024-03-22', 50, 27000, 1350000, 'Transaksi kpd. pelanggan Tatjana Saphira telah berhasil'),
(04, 04, 04, '2024-03-23', 20, 13000, 260000, 'Transaksi kpd. pelanggan Prilly Latuconsina telah berhasil'),
(05, 05, 05, '2024-03-23', 50, 65000, 3250000, 'Transaksi kpd. pelanggan Shenina Cinnamon telah berhasil'),
(06, 06, 06, '2024-03-24', 50, 68000, 3400000, 'Transaksi kpd. pelanggan Iqbaal Ramadhan telah berhasil'),
(07, 07, 07, '2024-03-24', 5, 18000, 90000, 'Transaksi kpd. pelanggan Ari Irham telah berhasil'),
(08, 08, 08, '2024-03-24', 10, 22000, 220000, 'Transaksi kpd. pelanggan Bryan Domani telah berhasil'),
(09, 09, 09, '2024-03-24', 20, 23000, 460000, 'Transaksi kpd. pelanggan Refal Hady telah berhasil'),
(010, 010, 010, '2024-03-24', 5, 33000, 165000, 'Transaksi kpd. pelanggan Angga Yunanda telah berhasil'); 

INSERT INTO laporan_penjualan (id_laporan, tgl_laporan, total_penjualan) VALUES 
(01, '2024-03-20', 2000000),
(02, '2024-03-21', 3500000),
(03, '2024-03-22', 1830000),
(04, '2024-03-23', 3510000),
(05, '2024-03-24', 4335000),
(06, '2024-03-25', 3300000),
(07, '2024-03-26', 2900000),
(08, '2024-03-27', 2700000),
(09, '2024-03-28', 1300000),
(010, '2024-03-29', 3400000);

INSERT INTO retur (id_retur, tgl_retur, jumlah_barang, keterangan) VALUES 
(01, '2024-03-20', 5, 'barang tidak sesuai'),
(02, '2024-03-20', 2, 'kualitas kurang bagus'),
(03, '2024-03-21', 4, 'barang tidak sesuai'),
(04, '2024-03-21', 10, 'barang tidak sesuai'),
(05, '2024-03-21', 1, 'kualitas kurang bagus'),
(06, '2024-03-22', 7, 'barang tidak sesuai'),
(07, '2024-03-23', 5, 'barang tidak sesuai'),
(08, '2024-03-24', 1, 'barang tidak sesuai'),
(09, '2024-03-24', 3, 'kualitas kurang bagus'),
(010, '2024-03-25', 3, 'kualitas kurang bagus');

INSERT INTO laporan_stok (id_laporan, tgl_laporan, id_produk, nama_produk, stok_awal, penjualan, stok_akhir) VALUE
(01, '2024-03-24', 01, 'Buku Tulis', 150, 10, 140),
(02, '2024-03-24', 02, 'Bolpoin', 180, 10, 170),
(03, '2024-03-24', 03, 'Pensil Mekanik', 130, 50, 80),
(04, '2024-03-24', 04, 'Pensil Kayu', 250, 50, 230),
(05, '2024-03-24', 05, 'Spidol Papan', 70, 50, 20),
(06, '2024-03-24', 06, 'Spidol Permanen', 70, 50, 20),
(07, '2024-03-24', 07, 'Klip Kertas', 260, 5, 255),
(08, '2024-03-24', 08, 'Penggaris', 280, 10, 270),
(09, '2024-03-24', 09, 'Map Plastik', 350, 20, 330),
(010, '2024-03-24', 010, 'Stapler', 120, 5, 115);




SELECT * FROM customer;

SELECT * FROM produk;

SELECT * FROM supplier;

SELECT * FROM pembelian;

SELECT * FROM hutang;

SELECT * FROM transaksi_penjualan;

SELECT * FROM laporan_penjualan;

SELECT * FROM retur;

SELECT * FROM laporan_stok;



SHOW TABLES;

ALTER TABLE pelanggan RENAME TO customer;

DROP DATABASE toko_swalayan;