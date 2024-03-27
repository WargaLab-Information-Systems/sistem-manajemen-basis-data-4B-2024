CREATE DATABASE Swalayan;
USE Swalayan;
CREATE TABLE barang(
	id_barang INT PRIMARY KEY,
	nama_barang VARCHAR (50) NOT NULL,
	jumlah_barang INT NOT NULL,
	harga_jual INT NOT NULL,
	harga_beli INT NOT NULL
)

CREATE TABLE laporan_penjualan(
	id_transaksi INT PRIMARY KEY,
	nama_barang VARCHAR(50)NOT NULL,
	stok_awal INT NOT NULL
)

CREATE TABLE laporan_stok(
	id_stok INT PRIMARY KEY,
	nama_barang VARCHAR(50)NOT NULL,
	sisa_stok INT NOT NULL
)

CREATE TABLE suplier(
	id_suplier INT PRIMARY KEY,
	nama_suplier VARCHAR(20) NOT NULL,
	nama_barang VARCHAR(20) NOT NULL
)

CREATE TABLE transaksi_pembelian(
	id_pembelian INT PRIMARY KEY,
	jumlah_beli INT NOT NULL,
	tgl_pembelian DATE NOT NULL,
	id_barang INT NOT NULL
)

CREATE TABLE transaksi_penjualan(
	id_penjualan INT PRIMARY KEY,
	id_barang INT NULL,
	tgl_penjualan DATE NOT NULL,
	jumlah_penjualan INT NOT NULL,
	total INT NULL
)

CREATE TABLE transaksi_retur(
	id_retur INT PRIMARY KEY,
	id_barang INT NOT NULL,
	id_suplier INT NOT NULL,
	tgl_retur DATE NOT NULL,
	jumlah_retur INT NOT NULL
)

CREATE TABLE stok (
	id_stok INT PRIMARY KEY,
	nama_barang VARCHAR (20) NOT NULL,
	stok_barang INT NOT NULL,
	harga_jual INT NOT NULL
)

INSERT INTO barang VALUES (1,'sabun mandi',10,4000,3000);
INSERT INTO barang VALUES (2,'pasta gigi',15,5000,4000);
INSERT INTO barang VALUES (3,'sikat gigi',8,5000,3000);
INSERT INTO barang VALUES (4,'gayung mandi',20,8000,5000);
INSERT INTO barang VALUES (5,'sabun muka',5,15000,13000);	
INSERT INTO barang VALUES (6,'shampo',20,3000,2000);	
INSERT INTO barang VALUES (7,'detergen',10,5000,4000);
INSERT INTO barang VALUES (8,'sikat wc',20,3000,2000);
INSERT INTO barang VALUES (9,'ember',17,13000,10000);
INSERT INTO barang VALUES (10,'handuk',20,23000,20000);	

INSERT INTO laporan_penjualan VALUES (1,'sabun mandi',10);
INSERT INTO laporan_penjualan VALUES (2,'pasta gigi',15);	
INSERT INTO laporan_penjualan VALUES (3,'sikat gigi',8);	
INSERT INTO laporan_penjualan VALUES (4,'gayung mandi',20);
INSERT INTO laporan_penjualan VALUES (5,'sabun muka',5);
INSERT INTO laporan_penjualan VALUES (6,'shampo',20);
INSERT INTO laporan_penjualan VALUES (7,'detergen',10);
INSERT INTO laporan_penjualan VALUES (8,'sikat wc',20);
INSERT INTO laporan_penjualan VALUES (9,'ember',17);
INSERT INTO laporan_penjualan VALUES (10,'handuk',10);	

INSERT INTO laporan_stok VALUES (1,'sabun mandi',5);
INSERT INTO laporan_stok VALUES (2,'pasta gigi',10);
INSERT INTO laporan_stok VALUES (3,'sikat gigi',6);
INSERT INTO laporan_stok VALUES (4,'gayung mandi',10);
INSERT INTO laporan_stok VALUES (5,'sabun muka',2);
INSERT INTO laporan_stok VALUES (6,'shampo',5);
INSERT INTO laporan_stok VALUES (7,'detergen',10);
INSERT INTO laporan_stok VALUES (8,'sikat wc',6);
INSERT INTO laporan_stok VALUES (9,'ember',10);
INSERT INTO laporan_stok VALUES (10,'handuk',2);

INSERT INTO suplier VALUES (101,'ratna','sabun mandi');
INSERT INTO suplier VALUES (102,'agus','pasta gigi');
INSERT INTO suplier VALUES (103,'mukti','sikat gigi');
INSERT INTO suplier VALUES (104,'devi','gayung mandi');
INSERT INTO suplier VALUES (105,'rina','sabun muka');
INSERT INTO suplier VALUES (106,'gusti','shampo');
INSERT INTO suplier VALUES (107,'fajar','detergen');
INSERT INTO suplier VALUES (108,'nabila','sikat wc');
INSERT INTO suplier VALUES (109,'rike','ember');
INSERT INTO suplier VALUES (110,'andini','handuk');

INSERT INTO transaksi_pembelian VALUES (01,1,'2024-03-21',1);
INSERT INTO transaksi_pembelian VALUES (02,2,'2024-03-22',2);
INSERT INTO transaksi_pembelian VALUES (03,3,'2024-03-23',3);
INSERT INTO transaksi_pembelian VALUES (04,3,'2024-03-17',4);
INSERT INTO transaksi_pembelian VALUES (05,4,'2024-03-18',5);
INSERT INTO transaksi_pembelian VALUES (06,2,'2024-03-21',6);
INSERT INTO transaksi_pembelian VALUES (07,2,'2024-03-22',7);
INSERT INTO transaksi_pembelian VALUES (08,1,'2024-03-23',8);
INSERT INTO transaksi_pembelian VALUES (09,3,'2024-03-17',9);
INSERT INTO transaksi_pembelian VALUES (010,3,'2024-03-18',10);

INSERT INTO transaksi_penjualan VALUES (001,1,101,'2024-03-23',1);
INSERT INTO transaksi_penjualan VALUES (002,1,102,'2024-03-22',1);
INSERT INTO transaksi_penjualan VALUES (003,1,103,'2024-03-21',2);
INSERT INTO transaksi_penjualan VALUES (004,1,104,'2024-03-21',2);
INSERT INTO transaksi_penjualan VALUES (005,1,105,'2024-03-20',2);
INSERT INTO transaksi_penjualan VALUES (006,1,106,'2024-03-23',2);
INSERT INTO transaksi_penjualan VALUES (007,1,107,'2024-03-20',3);
INSERT INTO transaksi_penjualan VALUES (008,1,108,'2024-03-21',2);
INSERT INTO transaksi_penjualan VALUES (009,1,109,'2024-03-19',3);
INSERT INTO transaksi_penjualan VALUES (010,1,110,'2024-03-23',1);

INSERT INTO stok VALUES (501,'sabun mandi',10,4000);
INSERT INTO stok VALUES (502,'pasta gigi',15,5000);
INSERT INTO stok VALUES (503,'sikat gigi',8,5000);
INSERT INTO stok VALUES (504,'gayung mandi',20,8000);
INSERT INTO stok VALUES (505,'sabun muka',5,15000);
INSERT INTO stok VALUES (506,'shampo',20,3000);
INSERT INTO stok VALUES (507,'detergen',10,5000);
INSERT INTO stok VALUES (508,'sikat wc',20,3000);
INSERT INTO stok VALUES (509,'ember',17,13000);
INSERT INTO stok VALUES (510,'handuk',20,23000);

INSERT INTO transaksi_retur VALUES (201,'sabun mandi',101,'2004-03-19',1);
INSERT INTO transaksi_retur VALUES (202,'pasta gigi',102,'2004-03-19',3);
INSERT INTO transaksi_retur VALUES (203,'sikat gigi',103,'2004-03-13',2);
INSERT INTO transaksi_retur VALUES (204,'gayung mandi',104,'2004-03-19',1);
INSERT INTO transaksi_retur VALUES (205,'sabun muka',105,'2004-03-19',1);
INSERT INTO transaksi_retur VALUES (206,'shampo',106,'2004-03-19',1);
INSERT INTO transaksi_retur VALUES (207,'detergen',107,'2004-03-19',3);
INSERT INTO transaksi_retur VALUES (208,'sikat wc',108,'2004-03-19',2);
INSERT INTO transaksi_retur VALUES (209,'ember',109,'2004-03-19',1);
INSERT INTO transaksi_retur VALUES (210,'handuk',110,'2004-03-19',5);

SHOW TABLES;

SELECT * FROM barang
SELECT * FROM transaksi_penjualan
SELECT * FROM transaksi_pembelian
SELECT * FROM transaksi_retur
SELECT * FROM suplier
SELECT * FROM laporan_stok
SELECT * FROM laporan_penjualan
SELECT * FROM stok

ALTER TABLE barang RENAME TO data_barang;
DROP DATABASE swalayan;
