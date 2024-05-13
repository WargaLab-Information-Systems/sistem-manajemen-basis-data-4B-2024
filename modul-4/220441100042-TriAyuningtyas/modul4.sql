CREATE DATABASE coba;
USE coba;

CREATE TABLE mahasiswa(nama VARCHAR(20),alamat VARCHAR(20));
SELECT * FROM mahasiswa;

ALTER TABLE mahasiswa ADD keterangan VARCHAR(15);
SELECT*FROM mahasiswa;

ALTER TABLE mahasiswa ADD nim INT(11) FIRST;
SELECT*FROM mahasiswa;

ALTER TABLE mahasiswa ADD COLUMN phone VARCHAR(15) AFTER alamat;
SELECT*FROM mahasiswa;

ALTER TABLE mahasiswa MODIFY COLUMN nim CHAR(11);
DESC mahasiswa;
 
ALTER TABLE mahasiswa CHANGE COLUMN phone telepon VARCHAR(20);
DESC mahasiswa;

ALTER TABLE mahasiswa DROP keterangan;
SELECT*FROM mahasiswa;

ALTER TABLE mahasiswa RENAME student;
SELECT*FROM student;
 
ALTER TABLE student ADD CONSTRAINT PRIMARY KEY (nim);
DESC student;

DROP DATABASE coba;

INSERT INTO student VALUES ("1","","mojokerto","0856")


