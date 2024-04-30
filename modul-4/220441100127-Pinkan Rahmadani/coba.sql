CREATE DATABASE coba;

USE coba;
-- inner join --
-- life join---
-- reight join --
1. 
CREATE TABLE mahasiswa(
nama VARCHAR(20),
alamat VARCHAR(20));
SELECT*FROM mahasiswa;

2.
ALTER TABLE mahasiswa ADD keterangan VARCHAR(15);
SELECT*FROM mahasiswa;

3.
ALTER TABLE mahasiswa ADD nim INT(11) FIRST;
SELECT*FROM mahasiswa;

4.
ALTER TABLE mahasiswa ADD COLUMN phone VARCHAR(15) AFTER alamat;
SELECT*FROM mahasiswa;

5.
ALTER TABLE mahasiswa MODIFY COLUMN nim CHAR(11);
DESC mahasiswa;

6. 
ALTER TABLE mahasiswa CHANGE COLUMN phone telepon VARCHAR(20);
DESC mahasiswa;

7.
ALTER TABLE mahasiswa DROP keterangan;
SELECT*FROM mahasiswa;

8.
ALTER TABLE mahasiswa RENAME student;
SELECT*FROM student;

9. 
ALTER TABLE student ADD PRIMARY KEY (nim);
DESC student;

DESC student;

DROP DATABASE coba;
 

 
 
 
 