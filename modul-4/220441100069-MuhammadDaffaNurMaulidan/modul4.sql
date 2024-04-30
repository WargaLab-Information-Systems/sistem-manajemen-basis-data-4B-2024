CREATE DATABASE coba
USE coba

-- nomer 2
CREATE TABLE mahasiswa(
   nim INT PRIMARY KEY,
   alamat VARCHAR(15),
   phone VARCHAR(15),
   keterangan VARCHAR(15)
)
-- soal option 3
ALTER TABLE mahasiswa CHANGE COLUMN nim nim CHAR(50)
-- soal option 4
ALTER TABLE mahasiswa CHANGE COLUMN phone telepon VARCHAR(20)
-- soal option 5
ALTER TABLE mahasiswa DROP COLUMN keterangan;
-- soal option 6
ALTER TABLE mahasiswa RENAME TO	student
