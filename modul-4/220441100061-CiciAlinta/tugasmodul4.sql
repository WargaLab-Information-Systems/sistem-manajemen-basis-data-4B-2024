CREATE DATABASE coba;
USE coba;

##no 1
CREATE TABLE mahasiswa(
nama VARCHAR(15),
alamat VARCHAR(20));
SELECT*FROM mahasiswa;

##no 2
ALTER TABLE mahasiswa ADD keterangan VARCHAR(15);
SELECT*FROM mahasiswa;

## no 3
ALTER TABLE mahasiswa ADD nim INT(11) FIRST;
SELECT*FROM mahasiswa;


## no 4
ALTER TABLE mahasiswa ADD COLUMN phone VARCHAR(15) AFTER alamat;
SELECT*FROM mahasiswa;


## no 5
ALTER TABLE mahasiswa MODIFY COLUMN nim CHAR(11);
DESC mahasiswa;

## no 6
ALTER TABLE mahasiswa CHANGE COLUMN phone telepon VARCHAR(20);
DESC mahasiswa;


## no 7
ALTER TABLE mahasiswa DROP COLUMN keterangan;
SELECT*FROM mahasiswa;

## no 8
RENAME TABLE mahasiswa TO student;
SHOW TABLES;

##no 9
ALTER TABLE student ADD PRIMARY KEY (nim);
DESC student;

