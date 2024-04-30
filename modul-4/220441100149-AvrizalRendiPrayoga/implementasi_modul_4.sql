CREATE DATABASE coba;
USE coba;

CREATE TABLE mahasiswa (keterangan VARCHAR(15));
ALTER TABLE mahasiswa ADD nim INT (11) FIRST;
ALTER TABLE mahasiswa ADD alamat VARCHAR(15);
ALTER TABLE mahasiswa ADD phone VARCHAR(15) AFTER alamat;
ALTER TABLE mahasiswa MODIFY COLUMN nim CHAR(11);
ALTER TABLE mahasiswa CHANGE COLUMN phone telepon VARCHAR(20);
ALTER TABLE mahasiswa DROP COLUMN keterangan;
ALTER TABLE mahasiswa RENAME TO student;
ALTER TABLE student ADD PRIMARY KEY (nim);

SELECT pj.Kode_Peminjaman, a.IdAnggota, a.Nama_Anggota 
FROM peminjaman pj 
JOIN anggota a 
ON a.IdAnggota = pj.IdAnggota;

SELECT a.IdAnggota, a.Nama_Anggota, p.Kode_Buku
	FROM anggota a
	LEFT JOIN peminjaman p
	ON a.IdAnggota = p.IdAnggota;
	
SELECT a.IdAnggota, a.Nama_Anggota, p.Kode_Buku
	FROM anggota a
	RIGHT JOIN peminjaman p
	ON a.IdAnggota = p.IdAnggota;