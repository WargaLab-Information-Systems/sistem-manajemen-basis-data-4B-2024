CREATE TABLE transaksi_pelanggan ( id_pelanggan VARCHAR (25), 
kode_barang INT (25), 
nama_barang VARCHAR (25), 
harga_beli INT (25),  
total_beli INT (25),  
tanggal_beli DATE,  
PRIMARY KEY(id_pelanggan)); 
 
INSERT INTO transaksi_pelanggan VALUES 
('a01', 101, 'soklin', 500, 2500, '2023-03-12'), 
('a02', 102, 'shampo', 1000, 2500, '2022-11-24'), 
('a03', 103, 'proklin', 1000, 2500, '2023-09-12'), 
('a04', 104, 'downy', 500, 2500, '2022-4-12'), 
('a05', 105, 'rinso', 1000, 2500, '2020-10-15'), 
('a06', 106, 'lifboy', 3000, 2500, '202`0-8-17'), 
('a07', 107, 'nuvo', 3500, 2500, '2019-7-30'), 
('a08', 108, 'pastagigi', 5000, 2500, '2020-5-24'), 
('a09', 109, 'citra', 3000, 2500, '2022-10-25'), 
('a10', 110, 'pemutih', 1000, 2500, '2020-8-09'); 
SELECT * FROM transaksi_pelanggan; 
 
CREATE TABLE transaksi_return( id_brgreturn INT(10),  
kode_barang INT(10),  
nama_barang VARCHAR(100),  
tanggal_kembali DATE,  
keterangan VARCHAR(100),  
PRIMARY KEY(id_brgreturn)); 
 
INSERT INTO transaksi_return VALUES 
(01, 201, 'jilbab', '2022-03-12', 'lecet'), 
(02, 202, 'daster', '2021-04-11', 'sobek'), 
(03, 203, 'Celana Pendek', '2022-03-12', 'lecet'), 
(04, 204, 'Rok Mini', '2022-03-12', 'sobek'), 
(05, 205, 'Pasmina', '2022-03-12', 'gasama'), 
(06, 206, 'Pasmina', '2022-03-12', 'gasama'), 
(07, 207, 'Pasmina', '2022-03-12', 'gasama'), 
(08, 208, 'Pasmina', '2022-03-12', 'gasama'), 
(09, 209, 'Pasmina', '2022-03-12', 'gasama'), (10, 210, 'Pasmina', '2022-03-12', 'gasama'); 
SELECT * FROM transaksi_return; 
 
CREATE TABLE stok ( 
kode_barang VARCHAR (25),  
nama_barang VARCHAR (100),  
stok_barang INT(50),  
harga_jual INT(20), 
PRIMARY KEY (kode_barang)); 
 
INSERT INTO stok VALUES 
('c00', 'molto', 50, 100), 
('c02', 'downy', 50, 1000), 
('c03', 'proklin', 50, 500), 
('c04', 'Energen', 250, 2000), 
('c05', 'Dancow', 100, 3500), 
('c06', 'Zee', 150, 3000), 
('c07', 'White Coffe', 100, 1500), 
('c08', 'Kapal Api', 90, 1500), 
('c09', 'Cokolates', 68, 3000), 
('c10', 'aline', 100, 3500); 
SELECT * FROM stok; 

CREATE TABLE transaksi_supplier( id_transaksisupp INT(50),  
nama_pemasok VARCHAR(50),  
kode_barang VARCHAR(50),  
nama_barang VARCHAR(100),  
jumlah_barang INT(100),  
harga_barang INT(100),  
total INT(100),  
tanggal_pembelian DATE NULL, 
total_hutang_ke_supplier DECIMAL (10,2) NOT NULL, 
tanggal_terakhir_bayar_hutang DATE NOT NULL,  
status_pembayaran VARCHAR(50),  
PRIMARY KEY(id_transaksisupp)); 
DESC transaksi_supplier; 

INSERT INTO transaksi_supplier VALUES 
(1, 'PT ABC', 'BRG001', 'Buku Tulis', 100, 5000, 500000, '2023-03-01', 500000, '2023-04-01', 'Belum Lunas'), 
(2, 'CV XYZ', 'BRG002', 'Pensil', 200, 2000, 400000, '2023-03-02', 400000, '2023-04-02', 'Belum Lunas'), 
(3, 'PT DEF', 'BRG003', 'Buku Gambar', 50, 10000, 500000, '2023-03-03', 500000, '2023-04-03', 'Belum Lunas'), 
(4, 'CV KLM', 'BRG004', 'Spidol', 150, 5000, 750000, '2023-03-04', 750000, '2023-04-04', 'Belum Lunas'), 
(5, 'PT GHI', 'BRG005', 'Kertas HVS', 500, 1000, 500000, '2023-03-05', 500000, '2023-04-05', 'Belum Lunas'), 
(6, 'CV NOP', 'BRG006', 'Penggaris', 100, 3000, 300000, '2023-03-06', 300000, '2023-04-06', 'Belum Lunas'), 
(7, 'PT QRS', 'BRG007', 'Stabilo', 200, 8000, 1600000, '2023-03-07', 1600000, '2023-04-07', 'Belum Lunas'), 
(8, 'CV TUV', 'BRG008', 'Buku Agenda', 75, 15000, 1125000, '2023-03-08', 1125000, '2023-04-08', 'Belum Lunas'), 
(9, 'PT WXY', 'BRG009', 'Map Kertas', 50, 5000, 250000, '2023-03-09', 250000, '2023-04-09', 'Belum Lunas'), 
(10, 'CV ZZZ', 'BRG010', 'Buku Kecil', 300, 1000, 300000, '2023-03-10', 300000, '2023-04-10', 'Belum Lunas'); 
SELECT * FROM  transaksi_supplier; 
 
CREATE TABLE laporan_penjualan( id_penjualan VARCHAR (10),  
nama_pelanggan VARCHAR(100),  
kode_barang VARCHAR (20),  
stok_barang INT(50),  
jumlah_beli INT(20),  
harga_beli INT(20),  
total_beli INT(20),  
tanggal_beli DATE,  
PRIMARY KEY (id_penjualan)); 
 
INSERT INTO laporan_penjualan  
(id_penjualan, nama_pelanggan, kode_barang, stok_barang, jumlah_beli, harga_beli, total_beli, tanggal_beli) 
VALUES  
('PJ0001', 'Andi', 'B0001', 20, 5, 10000, 50000, '2022-01-01'), 
('PJ0002', 'Budi', 'B0002', 15, 3, 5000, 15000, '2022-01-02'), 
('PJ0003', 'Cindy', 'B0003', 10, 2, 15000, 30000, '2022-01-03'), 
('PJ0004', 'Dian', 'B0004', 30, 4, 8000, 32000, '2022-01-04'), 
('PJ0005', 'Eka', 'B0005', 25, 1, 20000, 20000, '2022-01-05'), 
('PJ0006', 'Ferry', 'B0006', 12, 2, 7500, 15000, '2022-01-06'), 
('PJ0007', 'Gita', 'B0007', 8, 1, 100000, 100000, '2022-01-07'), 
('PJ0008', 'Hani', 'B0008', 5, 3, 12000, 36000, '2022-01-08'), 
('PJ0009', 'Indra', 'B0009', 18, 2, 9000, 18000, '2022-01-09'), ('PJ0010', 'Joko', 'B0010', 22, 4, 6000, 24000, '2022-01-10'); SELECT * FROM laporan_penjualan; 
 
CREATE TABLE koreksi_stok ( stok_barang INT PRIMARY KEY, 
id_barang INT NOT NULL, 
nama_barang VARCHAR(255) NOT NULL);
 
INSERT INTO koreksi_stok (stok_barang, id_barang, nama_barang) VALUES 
(60, 1, 'Baju'), 
(25, 2, 'Celana'), 
(15, 3, 'Sepatu'), 
(8, 4, 'Tas'), 
(90, 5, 'Topi'), 
(40, 6, 'Kacamata'), 
(12, 7, 'Jam Tangan'), 
(3, 8, 'Perhiasan'), 
(5, 9, 'Koper'), 
(150, 10, 'Gantungan Kunci');
SELECT * FROM brg; 

ALTER TABLE barang RENAME brg;
DESC brg
DROP DATABASE akhir;
SELECT * FROM brg;
 
UPDATE namatabel SET field1=nilai1, field2=nilai2 [WHERE kondisi];
UPDATE brg SET nama_barang='flanel', harga_barang=150000.00 WHERE id_barang= 1 ;

CREATE TABLE barang ( id_barang INT PRIMARY KEY, 
nama_barang VARCHAR(255) NOT NULL, 
harga_barang DECIMAL(10,2) NOT NULL, 
stok_barang INT NOT NULL, 
id_supplier INT NOT NULL, 
FOREIGN KEY (id_supplier) REFERENCES transaksi_supplier(id_transaksisupp) 

); 
 
INSERT INTO barang VALUES  
(1, 'Baju', 100000.00, 50, 1), 
(2, 'Celana', 150000.00, 30, 1), 
(3, 'Sepatu', 200000.00, 20, 2), 
(4, 'Tas', 250000.00, 10, 2), 
(5, 'Topi', 50000.00, 100, 3), 
(6, 'Kacamata', 75000.00, 50, 3), 
(7, 'Jam Tangan', 300000.00, 15, 4), 
(8, 'Perhiasan', 500000.00, 5, 4), 
(9, 'Koper', 400000.00, 10, 5), 
(10, 'Gantungan Kunci', 10000.00, 200, 5); 

SHOW DATABASES ;
SHOW TABLES;

/*menampilkan atribut dari tabel*/
DESC barang;

/*lihat isi tabel*/
SELECT * FROM barang; 
SELECT * FROM koreksi_stok; 
SELECT * FROM laporan_penjualan; 
SELECT * FROM stok; 
SELECT * FROM transaksi_pelanggan; 
SELECT * FROM transaksi_return; 
SELECT * FROM transaksi_supplier; 

DESC barang;
DROP TABLE ;