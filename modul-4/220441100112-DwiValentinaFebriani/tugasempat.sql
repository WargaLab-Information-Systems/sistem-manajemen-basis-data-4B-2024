-- MODUL 4

CREATE DATABASE coba;
USE coba;

CREATE TABLE mahasiswa;

-- Menambahkan sebuah kolom keterangan (varchar 15) sebagai kolom terakhir
ALTER TABLE mahasiswa
ADD keterangan VARCHAR(15);

-- Menambahkan kolom nim (int11) diawal sebagai kolom pertama
ALTER TABLE mahasiswa
ADD COLUMN nim INT(11) FIRST;

-- Sisipkan sebuah kolom dengan nama phone (varchar 15) setelah kolom alamat varchar (15)
ALTER TABLE mahasiswa
ADD COLUMN alamat VARCHAR(15) AFTER nim;

ALTER TABLE mahasiswa
ADD COLUMN phone VARCHAR(15) AFTER alamat;

SELECT*FROM mahasiswa

-- Mengubah atribut kolom nim menjadi char(11)
ALTER TABLE mahasiswa
MODIFY COLUMN nim CHAR(11);

-- Mengubah nama kolom phone menjadi telepon (varchar 20)
ALTER TABLE mahasiswa
CHANGE COLUMN phone telepon VARCHAR(20);

-- Menghapus kolom keterangan dari tabel
ALTER TABLE mahasiswa
DROP COLUMN keterangan;

-- Mengganti nama tabel menjadi student
ALTER TABLE mahasiswa
RENAME TO student;

SELECT*FROM student;

-- Menjadikan nim sebagai primary key
ALTER TABLE student
ADD PRIMARY KEY (nim);

-- Melihat struktut tabel menggunakan DESC
DESC student;
