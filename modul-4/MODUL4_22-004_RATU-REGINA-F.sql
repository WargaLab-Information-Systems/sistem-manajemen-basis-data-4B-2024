CREATE DATABASE coba 

CREATE TABLE mahasiswa (nim INT (11), alamat VARCHAR (15), keterangan VARCHAR (15))
SELECT * FROM mahasiswa

ALTER TABLE mahasiswa ADD COLUMN phone VARCHAR (15) AFTER alamat

ALTER TABLE mahasiswa MODIFY COLUMN nim VARCHAR (11)

ALTER TABLE mahasiswa CHANGE COLUMN phone telepon VARCHAR (20)

USE coba

ALTER TABLE mahasiswa DROP keterangan

ALTER TABLE mahasiswa RENAME TO student

ALTER TABLE student ADD PRIMARY KEY (nim)