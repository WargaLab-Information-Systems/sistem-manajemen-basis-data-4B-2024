CREATE DATABASE perpustakaan;
USE perpustakaan;

CREATE TABLE petugas (
	idPetugas VARCHAR (10) PRIMARY KEY,
	username VARCHAR (15) NOT NULL,
	pass VARCHAR (15) NOT NULL,
	nama VARCHAR (25) NOT NULL
)
CREATE TABLE anggota (
	idAnggota VARCHAR (10) PRIMARY KEY,
	nama_anggota VARCHAR (20) NOT NULL,
	angkatan_anggota VARCHAR (6) NOT NULL,
	tempat_lahir_anggota VARCHAR (20) NOT NULL,
	tanggal_lahir_anggota DATE,
	no_telp INT NOT NULL,
	jenis_kelamin VARCHAR (15) NOT NULL,
	status_pinjam VARCHAR (15) NOT NULL
)
CREATE TABLE buku (
	kode_buku VARCHAR (10) PRIMARY KEY,
	judul_buku VARCHAR (25) NOT NULL,
	pengarang_buku VARCHAR (30) NOT NULL,
	penerbit_buku VARCHAR (30) NOT NULL,
	tahun_buku VARCHAR (10) NOT NULL,
	jumlah_buku VARCHAR (5) NOT NULL,
	status_buku VARCHAR (10) NOT NULL,
	klasifikasi_buku VARCHAR (20) NOT NULL
)
CREATE TABLE peminjaman (
	kode_peminjaman VARCHAR (10) NOT NULL,
	tanggal_pinjam DATE,
	tanggal_kembali DATE,
	idAnggota VARCHAR (10) NOT NULL,
	idPetugas VARCHAR (10) NOT NULL,
	kode_buku VARCHAR (10) NOT NULL,
	PRIMARY KEY (kode_peminjaman),
	FOREIGN KEY (idAnggota)REFERENCES anggota (idAnggota),
	FOREIGN KEY (idPetugas) REFERENCES petugas (idPetugas),
	FOREIGN KEY (kode_buku) REFERENCES buku (kode_buku)	
)
CREATE TABLE pengembalian (
	kode_kembali VARCHAR (10),
	tgl_pinjam DATE,
	tgl_kembali DATE,
	denda VARCHAR (15),
	idAnggota VARCHAR (10) NOT NULL,
	idPetugas VARCHAR (10) NOT NULL,
	kode_buku VARCHAR (10) NOT NULL,
	PRIMARY KEY (kode_kembali),
	FOREIGN KEY (idAnggota)REFERENCES anggota (idAnggota),
	FOREIGN KEY (idPetugas) REFERENCES petugas (idPetugas),
	FOREIGN KEY (kode_buku) REFERENCES buku (kode_buku)
)

INSERT INTO petugas VALUES ('001','ana','1234','ana fitrotin')
INSERT INTO petugas VALUES ('002','lina','5678','linana')
INSERT INTO petugas VALUES ('003','sukma','9101112','sukma ayu')
INSERT INTO petugas VALUES ('004','tri','0987','tri ayu')
INSERT INTO petugas VALUES ('005','wilda','6543','ana wildanun')
INSERT INTO petugas VALUES ('006','rina','4444','rinanggih')
INSERT INTO petugas VALUES ('007','andin','8888','andini')
INSERT INTO petugas VALUES ('008','luis','9999','luisa')
INSERT INTO petugas VALUES ('009','rike','7777','rikee')
INSERT INTO petugas VALUES ('010','nab','3333','anabila')

DROP TABLES petugas

INSERT INTO anggota VALUES ('101','tyas','2022','mojokerto','2004-07-10',085648114746,'perempuan','meminjam')
INSERT INTO anggota VALUES ('102','rina','2020','makassar','2002-06-20',085647464811,'perempuan','meminjam')
INSERT INTO anggota VALUES ('103','rike','2022','surabaya','2000-05-05',087754673421,'perempuan','mengembalikan')
INSERT INTO anggota VALUES ('104','lina','2022','madiun','1999-04-24',085690904532,'perempuan','meminjam')
INSERT INTO anggota VALUES ('105','devi','2023','magetan','2004-03-30',085621905674,'perempuan','meminjam')
INSERT INTO anggota VALUES ('106','adel','2020','jakarta','2002-02-29',085743217890,'perempuan','meminjam')
INSERT INTO anggota VALUES ('107','fira','2022','sampang','1999-01-01',085756438976,'perempuan','meminjam')
INSERT INTO anggota VALUES ('108','alam','2019','sumenep','1998-08-08',085654328907,'laki-laki','meminjam')
INSERT INTO anggota VALUES ('109','retha','2018','samarinda','2003-09-11',085687654567,'perempuan','mengembalikan')
INSERT INTO anggota VALUES ('110','rini','2018','malang','20-10-10',085649085678,'perempuan','meminjam')

SELECT * FROM anggota

INSERT INTO buku VALUES (1, 'Harry Potter and the Philosopher''s Stone', 'J.K. Rowling', 'Bloomsbury',1997, 10,'Tersedia', 'Fiksi')
INSERT INTO buku VALUES (2, 'The Hobbit', 'J.R.R. Tolkien', 'George Allen & Unwin', 1937, 5, 'Tersedia','Fiksi')
INSERT INTO buku VALUES (3, 'To Kill a Mockingbird', 'Harper Lee', 'J. B. Lippincott & Co.', 1960, 7,'Dipinjam', 'Fiksi')
INSERT INTO buku VALUES (4, 'The Catcher in the Rye', 'J.D. Salinger', 'Little, Brown and Company',1951, 3,'Tersedia', 'Fiksi')
INSERT INTO buku VALUES (5, 'Pride and Prejudice', 'Jane Austen', 'T. Egerton, Whitehall', 1813, 8,'Tersedia','Fiksi')
INSERT INTO buku VALUES (6, 'George Orwell', 'Secker and Warburg', 'T. Egerton, Whitehall',1949, 2, 'Dipinjam', 'Fiksi')
INSERT INTO buku VALUES (7, 'Animal Farm', 'George Orwell', 'Secker and Warburg', 1945, 1, 'Tersedia','Fiksi')
INSERT INTO buku VALUES (8, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Charles Scribner''s Sons', 1925, 6,'Tersedia','Fiksi')
INSERT INTO buku VALUES (9, 'One Hundred Years of Solitude', 'Gabriel Garcia Marquez', 'Editorial Sudamericana', 1967, 4, 'Dipinjam', 'Fiksi')
INSERT INTO buku VALUES (10, 'The Lord of the Rings', 'J.R.R. Tolkien', 'Allen & Unwin', 1954, 9,'Tersedia','Fiksi');

SELECT * FROM buku

INSERT INTO peminjaman VALUES ('501', '2023-03-15', '2023-03-25', '101','001','1')
INSERT INTO peminjaman VALUES ('502', '2023-03-15', '2023-03-22', '102','002','2')
INSERT INTO peminjaman VALUES ('503', '2023-03-21', '2023-03-29', '103','003','3')
INSERT INTO peminjaman VALUES ('504', '2023-03-13', '2023-03-19', '104','004','4')
INSERT INTO peminjaman VALUES ('505', '2023-03-11', '2023-03-21', '105','005','5')
INSERT INTO peminjaman VALUES ('506', '2023-03-12', '2023-03-20', '106','006','6')
INSERT INTO peminjaman VALUES ('507', '2023-03-10', '2023-03-17', '107','007','7')
INSERT INTO peminjaman VALUES ('508', '2023-03-15', '2023-03-21', '108','008','8')
INSERT INTO peminjaman VALUES ('509', '2023-03-18', '2023-03-26', '109','009','9')
INSERT INTO peminjaman VALUES ('510', '2023-03-16', '2023-03-24', '110','010','10');
INSERT INTO peminjaman VALUES ('511', '2023-03-16', '2023-03-24', '110','010','10');
INSERT INTO peminjaman VALUES ('512', '2023-03-16', '2023-03-24', '110','010','10');
INSERT INTO peminjaman VALUES ('513', '2023-03-16', '2023-03-24', '110','010','10');
INSERT INTO peminjaman VALUES ('514', '2023-03-16', '2023-03-24', '110','010','10');
INSERT INTO peminjaman VALUES ('515', '2023-03-16', '2023-03-24', '110','010','10');

SELECT * FROM  peminjaman

INSERT INTO pengembalian VALUES ('601','2023-03-15', '2023-03-25','0','101','001','1');
INSERT INTO pengembalian VALUES ('602','2023-03-15', '2023-03-20','0','102','002','2');
INSERT INTO pengembalian VALUES ('603','2023-03-13', '2023-03-19','0','103','003','3');
INSERT INTO pengembalian VALUES ('604','2023-03-12', '2023-03-28','0','104','004','4');
INSERT INTO pengembalian VALUES ('605','2023-03-15', '2023-03-25','0','105','005','5');
INSERT INTO pengembalian VALUES ('606','2023-03-16', '2023-03-23','0','106','006','6');
INSERT INTO pengembalian VALUES ('607','2023-03-20', '2023-03-29','0','107','007','7');
INSERT INTO pengembalian VALUES ('608','2023-03-15', '2023-03-19','0','108','008','8');
INSERT INTO pengembalian VALUES ('609','2023-03-22', '2023-03-29','0','109','009','9');
INSERT INTO pengembalian VALUES ('610','2023-03-15', '2023-03-28','0','110','010','10');

SELECT * FROM pengembalian

CREATE VIEW pinjaman_lebih5 AS SELECT
peminjaman.IdAnggota,
anggota.nama_anggota,
anggota.angkatan_anggota,
anggota.jenis_kelamin,
COUNT(peminjaman.IdAnggota) AS banyak_pinjaman
FROM anggota INNER JOIN peminjaman ON peminjaman.IdAnggota = anggota.IdAnggota GROUP BY Idanggota HAVING COUNT(*) > 5;
    
SELECT*FROM pinjaman_lebih5;

DROP VIEW pinjaman_lebih5;


CREATE VIEW transaksi_petugas AS SELECT
peminjaman.idPetugas,
petugas.username,
petugas.pass,
petugas.nama,
COUNT(peminjaman.Idpetugas) AS jumlah_transaksi_pinjam
FROM petugas INNER JOIN peminjaman ON petugas.idPetugas = peminjaman.idpetugas
GROUP BY idPetugas;

SELECT * FROM transaksi_petugas;

 
CREATE VIEW transaksi_petugas_terbanyak AS 
SELECT
    peminjaman.idPetugas,
    petugas.username,
    petugas.pass,
    petugas.nama,
    COUNT(peminjaman.idPetugas) AS jumlah_transaksi_pinjam
FROM petugas INNER JOIN
    peminjaman ON petugas.idPetugas = peminjaman.idPetugas
GROUP BY
    idPetugas
ORDER BY
    jumlah_transaksi_pinjam DESC
LIMIT 1;

SELECT * FROM transaksi_petugas_terbanyak;


CREATE VIEW buku_terpinjam_paling_banyak AS 
SELECT
    peminjaman.Kode_buku,
    buku.Judul_Buku,
    COUNT(peminjaman.Kode_buku) AS jumlah_buku_terbanyak
FROM buku INNER JOIN
    peminjaman ON buku.Kode_buku = peminjaman.Kode_buku
GROUP BY
    Kode_buku
ORDER BY
    jumlah_buku_terbanyak DESC
LIMIT 1;


SELECT * FROM buku_terpinjam_paling_banyak;

DROP VIEW buku_terpinjam_paling_banyak;














