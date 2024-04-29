CREATE DATABASE coba;

USE coba

//soal no.1
CREATE TABLE mahasiswa (
nama VARCHAR(15),
alamat VARCHAR(15)
);

SELECT * FROM mahasiswa;

//soal no.2
ALTER TABLE mahasiswa ADD keterangan VARCHAR(15);
SELECT * FROM mahasiswa;

//soal no.3
ALTER TABLE mahasiswa ADD nim INT(11) FIRST;
SELECT * FROM mahasiswa;

//soal no.4
ALTER TABLE mahasiswa ADD COLUMN phone VARCHAR(15) AFTER alamat;
SELECT * FROM mahasiswa;

//soal no.5
ALTER TABLE mahasiswa MODIFY COLUMN nim CHAR(11);
DESC mahasiswa;

//soal no.6
ALTER TABLE mahasiswa CHANGE COLUMN phone telepon VARCHAR(20);
DESC mahasiswa;

//soal no.7
ALTER TABLE mahasiswa DROP keterangan;
SELECT*FROM mahasiswa;

//soal no.8
ALTER TABLE mahasiswa RENAME TO student;
SELECT*FROM student;

//soal no.9
ALTER TABLE student ADD CONSTRAINT PRIMARY KEY (nim);
DESC student;

DROP DATABASE coba;