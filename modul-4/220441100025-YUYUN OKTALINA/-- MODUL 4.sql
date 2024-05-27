-- MODUL 4

CREATE DATABASE coba;
USE coba;

CREATE TABLE mahasiswa(
nama VARCHAR(20),
alamat VARCHAR(15));

SELECT*FROM mahasiswa;

ALTER TABLE mahasiswa ADD  keterangan VARCHAR(15);
SELECT*FROM mahasiswa;


ALTER TABLE mahasiswa ADD COLUMN nim INT(11) FIRST;
SELECT*FROM mahasiswa;


ALTER TABLE mahasiswa ADD COLUMN phone VARCHAR(15) AFTER alamat;

SELECT*FROM mahasiswa;

-- Mengubah atribut kolom nim menjadi char(11)
ALTER TABLE mahasiswa
MODIFY COLUMN nim CHAR(11);
SELECT*FROM mahasiswa;

-- Mengubah nama kolom phone menjadi telepon (varchar 20)
ALTER TABLE mahasiswa
CHANGE COLUMN phone telepon VARCHAR(20);
SELECT*FROM mahasiswa;

-- Menghapus kolom keterangan dari tabel
ALTER TABLE mahasiswa
DROP COLUMN keterangan;
SELECT*FROM mahasiswa;

-- Mengganti nama tabel menjadi student
ALTER TABLE mahasiswa
RENAME TO student;


SELECT*FROM student;

-- Menjadikan nim sebagai primary key
ALTER TABLE student
ADD PRIMARY KEY (nim);

-- Melihat struktut tabel menggunakan DESC
DESC student;

DROP TABLE student;
DROP DATABASE coba;