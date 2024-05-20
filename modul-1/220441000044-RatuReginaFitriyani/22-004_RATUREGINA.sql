CREATE DATABASE db_modul;
USE db_modul;

CREATE TABLE transaksi_suplr(id_transaksi CHAR (25) NOT NULL, kode_brg CHAR (25)NOT NULL,
nama_supp CHAR (25)NOT NULL, nama_brg CHAR (25)NOT NULL, kategori CHAR (25)NOT NULL,
jumlah_brg INT (25)NOT NULL, harga_brg INT (25)NOT NULL, harga_total INT (25)NOT NULL,
keterangan VARCHAR (255)NOT NULL,waktu TIMESTAMP NOT NULL,PRIMARY KEY (id_transaksi) );

ALTER TABLE transaksi_suplr
ADD keterangan VARCHAR(25) AFTER waktu;

UPDATE transaksi_suplr
SET keterangan = 'BAGUS';

INSERT INTO transaksi_suplr VALUES(001, 65, 'Hendra', 'TEH KOTAK', 'PEMBELIAN', 150, 5000, 750000, 'BAGUS',
 '2023-01-10 09:23:20')

INSERT INTO transaksi_suplr VALUES(002, 75, 'Seali', 'fruit tea', 'PEMBELIAN', 300, 6500, 1950000, 'BAGUS',
 '2023-0112 10:23:27')

INSERT INTO transaksi_suplr VALUES(003, 85, 'Agus', 'MILKU', 'PEMBELIAN', 150, 3500, 525000, 'BAGUS',
 '2023-01-10 11:25:20')

 INSERT INTO transaksi_suplr VALUES(445, 85, 'APRIL', 'SPRITE', 'PEMBELIAN', 500, 3500, 1750000, 'BAGUS',
 '2023-01-10 11:25:20')
 UPDATE `transaksi_suplr`
SET keterangan ='PERLU RETUR(2 BOTOL PECAH)'
WHERE id_transaksi = 445;

 INSERT INTO transaksi_suplr VALUES(657, 97, 'Agus', 'MILKU', 'PEMBELIAN', 150, 3500, 525000, 'BAGUS',
 '2023-01-10 11:25:20')
 
UPDATE `transaksi_suplr`
SET nama_supp ='NILA'
WHERE id_transaksi = 657;

UPDATE `transaksi_suplr`
SET nama_brg ='GOLDA COFFE'
WHERE id_transaksi = 657;

 INSERT INTO transaksi_suplr VALUES(7231, 99, 'Suhay', 'fanta', 'PEMBELIAN', 150, 3500, 525000, 'BAGUS',
 '2023-01-10 14:25:09')

 INSERT INTO transaksi_suplr VALUES(4325, 101, 'Adzin', 'COCCA COLA', 'PEMBELIAN', 150, 3500, 525000, 'BAGUS',
 '2023-12-10 15:25:10')
UPDATE `transaksi_suplr`
SET kategori ='HUTANG'
WHERE id_transaksi = 4325;
 
 INSERT INTO transaksi_suplr VALUES(234, 102, 'LINA', 'SHAMPOO CLEAR', 'PEMBELIAN', 500, 500, 250000, 'BAGUS',
 '2023-2-10 20:25:09')

 INSERT INTO transaksi_suplr VALUES(224, 103, 'ANJANI', 'SABUN DAIA', 'PEMBELIAN', 200, 1000, 200000, 'BAGUS',
 '2023-2-10 20:28:09')

 INSERT INTO transaksi_suplr VALUES(557, 104, 'DZAFRI', 'AQUA VIT', 'PEMBELIAN', 150, 1500, 225, 'BAGUS',
 '2023-2-10 21:26:10')
UPDATE `transaksi_suplr`
SET kategori ='HUTANG'
WHERE id_transaksi = 557;
 
 ALTER TABLE `transaksi_suplr`
DROP COLUMN keterangan;

SELECT * FROM `transaksi_suplr`; 


CREATE TABLE transaksi_pelanggan(id_transaksi_p CHAR (25) NOT NULL, nama_brg CHAR (25)NOT NULL,
stok_brg INT (25)NOT NULL, jumlah_beli INT (25)NOT NULL, harga_brg INT (25)NOT NULL,total_harga INT (25)NOT NULL,
waktu TIMESTAMP , PRIMARY KEY (id_transaksi_p) );

INSERT INTO transaksi_pelanggan VALUES(221, 'SABUN DAIA',200, 2, 1500, 3000, '2023-3-24 13:42:54')
UPDATE `transaksi_pelanggan`
SET harga_brg ='1000'
WHERE id_transaksi_p = 221;
INSERT INTO transaksi_pelanggan VALUES(222, 'TEH KOTAK',150, 2, 5000, 10000, '2023-5-10 17:30:10')
INSERT INTO transaksi_pelanggan VALUES(223, 'FRUIT TEA',300, 1, 6500, 6500, '2023-5-10 17:45:12')
INSERT INTO transaksi_pelanggan VALUES(224, 'MILKU',150, 10,3500, 35000, '2023-6-10 07:30:10')
INSERT INTO transaksi_pelanggan VALUES(225, 'SHAMPO CLEAR',500, 50, 500, 25000, '2023-6-10 09:26:15')
INSERT INTO transaksi_pelanggan VALUES(226, 'COCCA COLA',150, 5, 3500, 17500, '2023-6-10 11:45:10')
INSERT INTO transaksi_pelanggan VALUES(227, 'AQUA VIT',150, 4, 2000, 8000, '2023-6-10 13:42:04')
INSERT INTO transaksi_pelanggan VALUES(228, 'SPRITE',150, 2, 3500, 7000, '2023-6-10 14:23:15')
INSERT INTO transaksi_pelanggan VALUES(229, 'GOLDA COFFE',150, 10, 3500, 35000, '2023-6-10 17:05:10')
INSERT INTO transaksi_pelanggan VALUES(220, 'FANTA',150, 4, 3500, 14000, '2023-6-10 17:26:10')

SELECT * FROM `transaksi_pelanggan`; 

CREATE TABLE data_barang(kode_brg CHAR  (25)NOT NULL,nama_brg CHAR (25)NOT NULL, stok_brg INT (25)NOT NULL
, harga_brg CHAR (25)NOT NULL, PRIMARY KEY (kode_brg) );

INSERT INTO data_barang VALUES(65, 'TEH KOTAK',150, 5000)
INSERT INTO data_barang VALUES(75, 'FRUIT TEA',300, 6500)
INSERT INTO data_barang VALUES(85, 'MILKU',150, 3500)
INSERT INTO data_barang VALUES(105, 'SPRITE',150, 3500)
INSERT INTO data_barang VALUES(99, 'FANTA',150, 3500)
INSERT INTO data_barang VALUES(97, 'GOLDA COFFE',150, 3500)
INSERT INTO data_barang VALUES(102, 'SHAMPOO CLEAR',500, 500)
INSERT INTO data_barang VALUES(101, 'COCCA COLA',150, 3500)
INSERT INTO data_barang VALUES(103, 'SABUN DAIA',200, 1000)
INSERT INTO data_barang VALUES(104, 'AQUA VIT',150, 2000)

SELECT * FROM data_barang;

CREATE TABLE keuangan_supp(id_transaksi CHAR (25)NOT NULL, nama_brg CHAR (25)NOT NULL,
kategori CHAR (20)NOT NULL, jumlah_brg INT (25)NOT NULL, harga_brg INT (25)NOT NULL, harga_total INT (25)NOT NULL
);

INSERT INTO keuangan_supp VALUES(001, 'TEH KOTAK', 'PEMBELIAN' ,150, 5000, 750000)
INSERT INTO keuangan_supp VALUES(002, 'FRUIT TEA', 'PEMBELIAN' ,300, 65000, 1950000)
INSERT INTO keuangan_supp VALUES(003, 'MILKU', 'PEMBELIAN' ,150, 3500, 525000)
INSERT INTO keuangan_supp VALUES(223, 'SPRITE', 'PEMBELIAN' ,150, 3500, 525000)
INSERT INTO keuangan_supp VALUES(224, 'GOLDA COFFE', 'PEMBELIAN' ,150, 3500, 525000)
INSERT INTO keuangan_supp VALUES(4325, 'FANTA', 'PEMBELIAN' ,150, 3500, 525000)
INSERT INTO keuangan_supp VALUES(445, 'SHAMPOO CLEAR', 'PEMBELIAN' ,500, 500, 250000)
INSERT INTO keuangan_supp VALUES(557, 'COCA COLA', 'HUTANG' ,150, 3500, 525000)
INSERT INTO keuangan_supp VALUES(657, 'SABUN DAIA', 'PEMBELIAN' ,200, 1000, 2000000)
INSERT INTO keuangan_supp VALUES(7231, 'AQUA VIT', 'HUTANG' ,150, 2000, 300000)

FOREIGN KEY (id_transaksi) REFERENCES transaksi_suplr(id_transaksi);

SELECT * FROM keuangan_supp;

CREATE TABLE keuangan_pembelian(id_transaksi_p CHAR (25)NOT NULL, nama_brg CHAR (25)NOT NULL,
kategori CHAR(25) NOT NULL, terjual INT (25) NOT NULL, harga_brg INT (25)NOT NULL, harga_total INT (25)NOT NULL)

INSERT INTO keuangan_pembelian VALUES(221, 'SABUN DAIA', 'PEMBELIAN', 2, 1000, 2000);
INSERT INTO keuangan_pembelian VALUES(222, 'TEH KOTAK', 'PEMBELIAN', 2, 5000, 10000);
INSERT INTO keuangan_pembelian VALUES(223, 'FRUIT TEA', 'PEMBELIAN', 1, 6500, 6500);
INSERT INTO keuangan_pembelian VALUES(224, 'MILKU', 'PEMBELIAN', 10, 3500, 35000);
INSERT INTO keuangan_pembelian VALUES(225, 'SHAMPOO CLEAR', 'PEMBELIAN', 50, 500, 25000);
INSERT INTO keuangan_pembelian VALUES(226, 'COCCA COLA', 'PEMBELIAN', 5, 3500, 17500);
INSERT INTO keuangan_pembelian VALUES(227, 'AQUA VIT', 'PEMBELIAN', 4, 2000, 8000);
INSERT INTO keuangan_pembelian VALUES(228, 'SPRITE', 'PEMBELIAN', 2, 3500, 7000);
INSERT INTO keuangan_pembelian VALUES(229, 'GOLDA COFFE', 'PEMBELIAN', 10, 3500, 35000);
INSERT INTO keuangan_pembelian VALUES(220, 'FANTA', 'PEMBELIAN', 4, 3500, 14000);

SELECT * FROM keuangan_pembelian;

CREATE TABLE laporan_penjualan(id_transaksi_p CHAR (25)NOT NULL, waktu TIMESTAMP, kode_brg CHAR (25), nama_brg CHAR (25),
stok_awal INT (25)NOT NULL, terjual INT(25)NOT NULL, harga_brg INT (25)NOT NULL, harga_total INT(25) NOT NULL,
sisa_stok CHAR(25)NOT NULL);

INSERT INTO laporan_penjualan VALUES(221, '2023-3-24 13:42:54', 103, 'SABUN DAIA', 200, 2, 1000, 2000, 188);
INSERT INTO laporan_penjualan VALUES(222, '2023-5-10 17:30:10', 65, 'TEH KOTAK ', 150, 2, 5000, 10000, 148);
INSERT INTO laporan_penjualan VALUES(223, '2023-5-10 17:45:12', 75, 'FRUIT TEA ', 300, 1, 6500, 6500, 299);
INSERT INTO laporan_penjualan VALUES(224, '2023-6-10 07:30:10', 85, 'MILKU ', 150, 10, 3500, 35000, 140);
INSERT INTO laporan_penjualan VALUES(225, '2023-6-10 09:26:15', 102, 'SHAMPOO CLEAR ', 500, 50, 500, 25000, 450);
INSERT INTO laporan_penjualan VALUES(226, '2023-6-10 11:45:10', 101, 'COCCA COLA', 150, 5, 3500, 17500, 145);
INSERT INTO laporan_penjualan VALUES(227, '2023-6-10 13:42:04', 104, 'AQUA VIT', 150, 4, 2000, 8000, 146);
INSERT INTO laporan_penjualan VALUES(228, '2023-6-10 14:23:15' , 105, 'SPRITE',150, 2, 3500, 7000, 148);
INSERT INTO laporan_penjualan VALUES(229, '2023-6-10 17:05:10' , 97, 'GOLDA COFFE',150, 10, 3500, 35000, 140)
INSERT INTO laporan_penjualan VALUES(220, '2023-6-10 17:26:10' , 99, 'FANTA',150, 4, 3500, 14000, 146)

SELECT * FROM laporan_penjualan;

CREATE TABLE laporan_supp(id_transaksi CHAR (25), kode_brg CHAR (25)NOT NULL, nama_brg CHAR (25)NOT NULL, 
nama_supp CHAR (25)NOT NULL, kategori CHAR (25)NOT NULL, jumlah_brg INT (25)NOT NULL, status_trans CHAR(25)NOT NULL);

INSERT INTO laporan_supp VALUES (001, 65, 'TEH KOTAK', 'Hendra', 'PEMBELIAN', 150, 'LUNAS')
INSERT INTO laporan_supp VALUES (002, 75, 'Seali', 'fruit tea', 'PEMBELIAN', 300, 'LUNAS')
INSERT INTO laporan_supp VALUES (003,  85, 'Agus', 'MILKU', 'PEMBELIAN', 150, 'LUNAS')
INSERT INTO laporan_supp VALUES (445,  85, 'APRIL', 'SPRITE', 'PEMBELIAN', 500, 'LUNAS')
INSERT INTO laporan_supp VALUES (657, 97, 'NILA', 'SPGOLDA COFFE', 'PEMBELIAN', 150, 'LUNAS')
INSERT INTO laporan_supp VALUES (7231, 99, 'Suhay', 'fanta', 'PEMBELIAN', 150, 'LUNAS')
INSERT INTO laporan_supp VALUES (4325, 101, 'Adzin', 'COCCA COLA', 'HUTANG', 150, 'BELUM LUNAS')
INSERT INTO laporan_supp VALUES (234, 102, 'LINA', 'SHAMPOO CLEAR', 'PEMBELIAN', 500,' LUNAS')
INSERT INTO laporan_supp VALUES (224, 103, 'ANJANI', 'SABUN DAIA', 'PEMBELIAN', 200,' LUNAS')
INSERT INTO laporan_supp VALUES (557, 104, 'DZAFRI', 'AQUA VIT', 'HUTANG', 150,'BELUM LUNAS')

SELECT * FROM laporan_supp;
SHOW TABLES;

ALTER TABLE keuangan_pembelian RENAME TO keuangan_pembeli;

DROP DATABASE db_modul;