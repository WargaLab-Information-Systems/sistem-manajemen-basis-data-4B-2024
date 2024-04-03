SELECT * FROM buku;
SELECT * FROM anggota;
SELECT * FROM peminjaman;
SELECT * FROM pengembalian;
SELECT * FROM petugas;


USE perpustakaan;

//soal no.1
CREATE VIEW anggotalebihdari5buku AS
SELECT anggota.IdAnggota, anggota.NamaAnggota, COUNT(peminjaman.KodeBuku) AS Jumlah_Buku_Dipinjam FROM anggota
INNER JOIN peminjaman ON anggota.IdAnggota = peminjaman.IdAnggota
GROUP BY anggota.IdAnggota, anggota.NamaAnggota
HAVING COUNT(peminjaman.KodeBuku) > 5;

SELECT * FROM anggotalebihdari5buku;

//soal no.2
CREATE VIEW TransaksiPetugas AS
SELECT petugas.IdPetugas, petugas.Username, petugas.Nama, COUNT(peminjaman.KodeBuku) AS Jumlah_Buku_Dipinjam,
COUNT(pengembalian.KodeBuku) AS Jumlah_Buku_Dikembalikan
FROM petugas
LEFT JOIN peminjaman ON petugas.IdPetugas = peminjaman.IdPetugas
LEFT JOIN pengembalian ON petugas.IdPetugas = pengembalian.IdPetugas
GROUP BY petugas.IdPetugas, petugas.Username, petugas.Nama;
    
SELECT * FROM TransaksiPetugas;
  
//soal no.3    
CREATE VIEW PetugasTerbanyakTransaksi AS
SELECT petugas.IdPetugas, petugas.Username, petugas.Nama, COUNT(*) AS Jumlah_Transaksi
FROM petugas
LEFT JOIN peminjaman ON petugas.IdPetugas = peminjaman.IdPetugas
LEFT JOIN pengembalian ON petugas.IdPetugas = pengembalian.IdPetugas
GROUP BY petugas.IdPetugas, petugas.Username, petugas.Nama
ORDER BY Jumlah_Transaksi DESC
LIMIT 1;

SELECT * FROM PetugasTerbanyakTransaksi;
 
soal no.4    
CREATE VIEW BukuTerpinjamBanyak AS
SELECT buku.KodeBuku, buku.JudulBuku, COUNT(peminjaman.KodeBuku) AS Jumlah_Peminjaman
FROM buku INNER JOIN peminjaman ON buku.KodeBuku = peminjaman.KodeBuku
GROUP BY buku.KodeBuku, buku.JudulBuku ORDER BY Jumlah_Peminjaman DESC
LIMIT 1;

SELECT * FROM BukuTerpinjamBanyak;