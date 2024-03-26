USE dbswalayan

CREATE TABLE pelanggan (
id_pelanggan INT (10) NOT NULL,
nama_pelanggan VARCHAR (100) NOT NULL,
nomor_telephon INT (15) NOT NULL,
PRIMARY KEY (id_pelanggan)
)

SELECT * FROM pelanggan

INSERT INTO pelanggan (id_pelanggan, nama_pelanggan, nomor_telephon)
VALUES
(112, 'gilang', 089223980),
(132, 'fira', 087990221),
(331, 'putri', 089667541),
(227, 'alifiyah', 0812340099),
(110, 'ratu', 081229873),
(117, 'aprilia', 089771290),
(345, 'pinkan', 087661234),
(200, 'yuyun', 087663210),
(109, 'nita', 087554300),
(789, 'lidia', 082111902);


CREATE TABLE barang (
id_barang INT (20) NOT NULL,
nama_barang VARCHAR (100) NOT NULL, 
harga_barang DECIMAL (18, 2),
PRIMARY KEY (id_barang)
)

SELECT * FROM barang

INSERT INTO barang (id_barang, nama_barang, harga_barang)
VALUES 
(10, 'nike', '500000'),
(09, 'adidas', '400000'),
(08, 'puma', '300000'),
(07, 'converse', '100000'),
(06, 'vans', '50000'),
(05, 'reebok', '600000'),
(04, 'newbalance', '700000'),
(03, 'timberland', '800000'),
(02, 'skechers', '900000'),
(01, 'asics', '1000000');


CREATE TABLE supplier (
id_supplier INT (20) NOT NULL,
nama_supplier VARCHAR (100) NOT NULL,
nomor_telephon INT (20) NOT NULL,
PRIMARY KEY (id_supplier)
)

SELECT * FROM supplier

INSERT INTO supplier (id_supplier, nama_supplier, nomor_telephon)
VALUES
(123, 'nikestore', 089111234561),
(234, 'adidasstore', 089778901234),
(345, 'pumastore', 087665589009),
(456, 'conversestore', 081222330986),
(567, 'vansstore', 08777998123),
(678, 'reebokstore', 082333433219),
(789, 'newbalancestore', 087790907712),
(987, 'timberlandstore', 083446789012),
(765, 'skechersstore', 089907123456),
(543, 'asicsstore', 087111022909);

CREATE TABLE penjualan (
id_penjualan INT (20) NOT NULL,
id_transaksi INT (20) NOT NULL,
id_pelanggan INT (20) NOT NULL,
tgl_penjualan DATE,
jumlah_barang INT (15) NOT NULL,
harga_barang DECIMAL (18, 2),
total_harga DECIMAL (18, 2),
PRIMARY KEY (id_penjualan)
)

SELECT * FROM penjualan

INSERT INTO penjualan (id_penjualan, id_transaksi, id_pelanggan, tgl_penjualan, jumlah_barang, harga_barang, total_harga) 
VALUES
(01, 22, 1011, '2029-01-22', '5', '50000', '200000'),
(02, 33, 2022, '2024-05-12', '10', '100000', '300000'),
(03, 44, 3033, '2024-02-28', '5', '200000', '400000'),
(04, 55, 4044, '2024-01-25', '20', '300000', '500000'),
(05, 66, 5055, '2024-03-10', '15', '400000', '550000'),
(06, 77, 6066, '2024-03-27', '10', '100000', '250000'),
(07, 88, 7077, '2024-04-02', '5', '150000', '350000'),
(08, 99, 8088, '2024-05-11', '20', '200000', '400000'),
(09, 100, 9099, '2024-07-24', '15', '350000', '450000'),
(10, 150, 1001, '2024-09-19', '5', '150000', '200000');



CREATE TABLE laporan_penjualan (
id_laporan_penjualan INT (20) NOT NULL,
tgl_laporan DATE,
jumlah_barang_terjual INT (15) NOT NULL,
total_pendapat DECIMAL (18, 2),
PRIMARY KEY (id_laporan_penjualan)
)

SELECT * FROM laporan_penjualan

INSERT INTO laporan_penjualan (id_laporan_penjualan, tgl_laporan, jumlah_barang _terjual, total_pendapat)
VALUES
(100, '2024-01-24', 2, '100000'),
(200, '2024-05-14', 5, '350000'),
(300, '2024-02-29', 3, '450000'),
(400, '2024-01-27', 10, '550000'),
(500, '2024-03-11', 10, '600000'),
(600, '2024-03-28', 7, '300000'),
(700, '2024-04-03', 2, '400000'),
(800, '2024-05-13', 15, '450000'),
(900, '2024-07-26', 10, '500000'),
(1000,'2024-09-20', 1, '300000');


CREATE TABLE stok (
id_stok INT (20) NOT NULL,
nama_barang VARCHAR (100) NOT NULL,
jumlah_barang INT (20) NOT NULL,
harga_barang DECIMAL (18, 2),
PRIMARY KEY (id_stok)
)

SELECT * FROM stok

INSERT INTO stok (id_stok, nama_barang, jumlah_barang, harga_barang)
VALUES 
(100, 'nike', 10, '500000'),
(90, 'adidas', 5, '400000'),
(80, 'puma', 15, '300000'),
(70, 'converse', 10, '100000'),
(60, 'vans', 20, '50000'),
(50, 'reebok', 5, '600000'),
(40, 'newbalance', 10, '700000'),
(30, 'timberland', 20, '800000'),
(20, 'skechers', 15, '900000'),
(10, 'asics', 5, '1000000');


CREATE TABLE koreksi_stok (
id_koreksi INT (20) NOT NULL,
tgl_koreksi DATE,
jumlah_barang INT (20) NOT NULL,
PRIMARY KEY (id_koreksi)
)

SELECT * FROM koreksi_stok

INSERT INTO koreksi_stok (id_koreksi, tgl_koreksi, jumlah_barang)
VALUES
(111, '2024-01-28', '10'),
(222, '2024-02-02', '5'),
(333, '2024-03-05', '15'),
(444, '2024-04-27', '10'),
(555, '2024-05-20', '20'),
(666, '2024-06-17', '5'),
(777, '2024-08-21', '10'),
(888, '2024-07-11', '20'),
(999, '2024-09-10', '15'),
(000, '2024-10-24', '5');


CREATE TABLE retur (
id_retur INT (20) NOT NULL,
tgl_retur DATE, 
alsan_retur VARCHAR (100) NOT NULL,
jumlah_barang INT (20) NOT NULL,
PRIMARY KEY (id_retur)
)

SELECT * FROM retur

INSERT INTO retur (id_retur, tgl_retur, alsan_retur, jumlah_barang)
VALUES 
(101, '2024-12-10', 'barang tidak sesuai', '10'),
(202, '2024-03-29', 'kualitas kurang bagus', '5'),
(303, '2024-06-01', 'harga barang terlalu mahal', '15'),
(404, '2024-09-09', 'layanan pegawai kurang baik', '10'),
(505, '2024-01-12', 'tempat kurang bersih', '20'),
(606, '2024-07-12', 'pilihan yang terbatas', '5'),
(707, '2024-11-11', 'antrian terlalu panjang', '10'),
(808, '2024-04-25', 'promosi kurang menarik', '20'),
(909, '2024-12-18', 'waktu yang terbatas', '15'),
(123, '2024-07-07', 'tempat yang terlalu jauh', '5');


CREATE TABLE utang (
id_utang INT (20) NOT NULL,
id_supplier INT (20) NOT NULL,
jumlah_utang DECIMAL (18, 2),
status_pembayaran VARCHAR (100) NOT NULL,
PRIMARY KEY (id_utang)
)


SELECT * FROM utang

INSERT INTO utang (id_utang, id_supplier, jumlah_utang, status_pembayaran)
VALUES
(201, 123, '200000', 'belum lunas'),
(202, 234, '300000', 'belum lunas'),
(203, 345, '400000', 'belum lunas'),
(204, 456, '500000', 'belum lunas'),
(205, 567, '550000', 'belummlunas'),
(206, 678, '250000', 'belum lunas'),
(207, 789, '350000', 'belum lunas'),
(208, 987, '400000', 'belum lunas'),
(209, 765, '450000', 'belum lunas'),
(300, 543, '200000', 'belum lunas');



DROP TABLE IF EXISTS laporan_jual ;



)