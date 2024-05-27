CREATE DATABASE tokoswalayan;
USE tokoswalayan;

CREATE TABLE transaksi_pelanggan (
id_pelanggan INT (10), 
kode_barang INT (10), 
nama_barang VARCHAR (100),
jumlah_beli INT(20),
harga_beli INT(20), 
total_beli INT(20), 
tanggal_beli DATE, 
PRIMARY KEY (id_pelanggan));

CREATE TABLE transaksi_return (
id_brgreturn INT (10), 
kode_barang INT (10), 
nama_barang VARCHAR (100),
tanggal_kembali DATE, 
keterangan VARCHAR(100),  
PRIMARY KEY (id_brgreturn));

CREATE TABLE stok( 
kode_barang INT (10)NOT NULL AUTO_INCREMENT, 
nama_barang VARCHAR (100),
stok_barang VARCHAR(100) , 
harga_jual INT(20), 
PRIMARY KEY (kode_barang));

CREATE TABLE transaksi_supplier (
id_transaksisupp INT (50),
nama_pemasok VARCHAR (50), 
kode_barang  VARCHAR (50),
nama_barang VARCHAR (100), 
jumlah_barang INT(100), 
harga_barang INT(100),
total INT(100),
tanggal_pembelian DATE NULL, 
status_pembayaran VARCHAR (50), 
PRIMARY KEY (id_transaksisupp));

CREATE TABLE laporan_penjualan (
id_penjualan INT(10),
nama_pelanggan VARCHAR(100),
kode_barang INT(20),
stok_barang INT(50),
jumlah_beli INT(20),
harga_beli INT(20),
total_beli INT(20),
tanggal_beli DATE,
PRIMARY KEY (id_penjualan)
);

CREATE TABLE hutang (
id_hutang INT (10), 
nama_pemasok VARCHAR (500), 
kode_barang VARCHAR (50), 
jumlah_barang INT(100), 
total INT(100), 
tanggal_pembayaran DATE,
bayar_hutang INT(20),
tanggal_pelunasan 
DATE, PRIMARY KEY (id_hutang));

INSERT transaksi_pelanggan VALUES ('13',30,'cardigan' ,2,130000,160000, '2024-01-13');
INSERT transaksi_pelanggan VALUES ('14',31,'jeans' ,1,120000,140000, '2024-01-14');
INSERT transaksi_pelanggan VALUES ('15',32,'kulot' ,1,95000,95000, '2024-01-15');
INSERT transaksi_pelanggan VALUES ('16',33,'span', 2,50000,100000, '2024-01-15');
INSERT transaksi_pelanggan VALUES ('17',34,'kemeja', 1,250000,500000, '2024-01-15');
INSERT transaksi_pelanggan VALUES ('18',35,'jubah' ,1,300000,300000, '2024-01-16');
INSERT transaksi_pelanggan VALUES ('19',36,'kokoh' ,3,70000,210000, '2024-01-17');
INSERT transaksi_pelanggan VALUES ('20',37,'gamis' 1,300000,300000, '2024-01-18');
INSERT transaksi_pelanggan VALUES ('21',38,'daster' ,4,35000,140000, '2024-01-18');
INSERT transaksi_pelanggan VALUES ('22',39,'sweeter' ,2,150000,30000, '2024-01-19');


INSERT transaksi_return VALUES (7015,30,'cardigan','2024-03-2','mengalami kerusakan');
INSERT transaksi_return VALUES (7016,31,'jeans','2024-03-2','mengalami kerusakan');
INSERT transaksi_return VALUES (7017,32,'kulot','2024-03-3','mengalami kerusakan');
INSERT transaksi_return VALUES (7018,33,'span','2024-03-4','mengalami kerusakan');
INSERT transaksi_return VALUES (7019,34,'kemeja','2024-05-2','mengalami kerusakan');
INSERT transaksi_return VALUES (7020,35,'jubah','2024-03-5','mengalami kerusakan');
INSERT transaksi_return VALUES (7021,36,'kokoh','2024-03-5','mengalami kerusakan');
INSERT transaksi_return VALUES (7022,37,'gamis','2024-03-5','mengalami kerusakan');
INSERT transaksi_return VALUES (7023,38,'daster','2024-03-6','mengalami kerusakan');
INSERT transaksi_return VALUES (7024,39,'sweeter','2024-03-7','mengalami kerusakan');


INSERT stok VALUES(30,'cardigan',125,125000);
INSERT stok VALUES(31,'jeans',45,130000);
INSERT stok VALUES(32,'kulot',87,90000);
INSERT stok VALUES(33,'span',90,94000);
INSERT stok VALUES(34,'kemeja',80,150000);
INSERT stok VALUES(35,'jubah',70,250000);
INSERT stok VALUES(36,'kokoh',60,70000);
INSERT stok VALUES(37,'gamis',77,250000);
INSERT stok VALUES(38,'daster',99,35000);
INSERT stok VALUES(39,'sweeter',99,150000);

INSERT transaksi_supplier VALUES (660,'rasya',30,'cardigan',1,125000,25000,'2024-03-2','lunas');
INSERT transaksi_supplier VALUES (661,'jia',31,'jeans',2,135000,170000,'2024-03-2','lunas');
INSERT transaksi_supplier VALUES (662,'pinkan',32,'kulot',1,90000,90000,'2024-03-3','lunas');
INSERT transaksi_supplier VALUES (663,'rizka',33,'span',2,135000,170000,'2024-03-3','lunas');
INSERT transaksi_supplier VALUES (664,'arthur',34,'kemeja',1,120000,120000,'2024-03-4','lunas');
INSERT transaksi_supplier VALUES (665,'denmas',35,'jubah',2,225000,450000,'2024-03-5','lunas');
INSERT transaksi_supplier VALUES (667,'alvin',36,'kokoh',1,300000,300000,'2024-03-5','lunas');
INSERT transaksi_supplier VALUES (668,'alunk',37,'gamis',1,300000,300000,'2024-03-5','lunas');
INSERT transaksi_supplier VALUES (669,'kana',38,'daster',1,125000,125000,'2024-03-5','lunas');
INSERT transaksi_supplier VALUES (670,'rizka',39,'sweeter',1,50000,50000,'2024-03-6','lunas');


INSERT laporan_penjualan VALUES (31,'rasya' ,30 ,100, 2, 150000, 300000, '2024-01-2');
INSERT laporan_penjualan VALUES (32,'jia' ,31,100, 1, 120000, 120000, '2024-01-2');
INSERT laporan_penjualan VALUES (33,'pinkan' ,31 ,100, 1, 100000, 100000, '2024-01-3');
INSERT laporan_penjualan VALUES (34,'rizka' ,33,100, 1, 50000, 50000, '2024-01-4');
INSERT laporan_penjualan VALUES (35,'arthur' ,34 ,100, 1, 150000, 150000, '2024-01-10');
INSERT laporan_penjualan VALUES (36,'denmas' ,35 ,100, 2, 50000, 50000, '2024-01-11');
INSERT laporan_penjualan VALUES (37,'alvin' ,36,100, 1, 250000, 250000, '2024-01-12');
INSERT laporan_penjualan VALUES (38,'alunk' ,37,100, 1, 1500000, 150000, '2024-01-13');
INSERT laporan_penjualan VALUES (39,'kana' ,38,100, 1, 90000, 90000, '2024-01-13');
INSERT laporan_penjualan VALUES (40,'rizka' ,39 ,100, 1, 150000, 150000, '2024-01-14');

INSERT hutang VALUES (8001, 'rasya', 30, 1, 150000, '2024-3-1', 150000, '2024-4-2'); 
INSERT hutang VALUES (8002, 'jia', 31, 2, 120000, '2024-3-1', 120000, '2024-4-1'); 
INSERT hutang VALUES (8003, 'pinkan', 32, 1, 100000, '2024-3-3', 100000, '2024-4-3'); 
INSERT hutang VALUES (8004, 'rizka', 33, 1, 50000, '2024-3-4', 50000, '2024-4-5'); 
INSERT hutang VALUES (8005, 'arthur', 34, 1, 150000, '2024-3-5', 150000, '2024-4-6'); 
INSERT hutang VALUES (8006, 'denmas', 35, 1, 50000, '2024-3-8', 50000, '2024-4-9'); 
INSERT hutang VALUES (8007, 'alvin', 36, 1, 250000, '2024-3-9', 250000, '2024-4-12'); 
INSERT hutang VALUES (8008, 'alunk', 37, 1, 150000, '2024-3-9', 150000, '2024-4-12'); 
INSERT hutang VALUES (8009, 'kana', 38, 1, 900000, '2024-3-9', 90000, '2024-4-13'); 
INSERT hutang VALUES (8010, 'rizka', 39, 1, 1500000, '2024-3-9', 150000, '2024-4-20'); 


SELECT * FROM transaksi_pelanggan;
SELECT * FROM transaksi_return;
SELECT * FROM stok;
SELECT * FROM hutang;
SELECT * FROM transaksi_supplier;
SELECT * FROM laporan_penjualan;


ALTER TABLE hutang RENAME peminjaman;

DROP TABLE peminjaman;