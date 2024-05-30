CREATE DATABASE coba;

USE coba;

CREATE TABLE mahasiswa (
nama_mhs VARCHAR (20),
alamat_mhs VARCHAR (15))

--kolom keterangan >> kolom akhir
ALTER TABLE mahasiswa ADD COLUMN keterangan VARCHAR (15) AFTER alamat_mhs;

--menambahkan kolom nim diawal 
ALTER TABLE mahasiswa ADD COLUMN nim INT (11) FIRST;

--kolom phone setelah kolom alamat
ALTER TABLE mahasiswa ADD COLUMN phone VARCHAR (15) AFTER alamat_mhs;

--ubah nim INT menjadi nim CHAR
ALTER TABLE mahasiswa MODIFY COLUMN nim CHAR (11);

--Ubah nama kolom phone menjadi telepon (VARCHAR 20)
ALTER TABLE mahasiswa MODIFY COLUMN phone VARCHAR (20);

 Hapus kolom keterangan dari tabel :
ALTER TABLE mahasiswa DROP COLUMN keterangan;

 Ganti nama tabel menjadi student:
RENAME TABLE mahasiswa TO student;

 Jadikan nim sebagai PRIMARY KEY :
ALTER TABLE student ADD PRIMARY KEY (nim);

2. INNER, LEFT sm RIGHT




