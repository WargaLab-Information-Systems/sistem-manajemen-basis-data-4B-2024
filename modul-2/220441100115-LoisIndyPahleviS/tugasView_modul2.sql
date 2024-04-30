USE perpustakaan;

SELECT * FROM petugas;

SELECT * FROM buku;

SELECT * FROM anggota;

SELECT * FROM peminjaman;

SELECT * FROM pengembalian;

-- 1. Definisikan view untuk mendapatkan data anggota yang hanya meminjam buku lebih dari 5 buku!
CREATE VIEW anggota_peminjam_banyak AS
SELECT a.IdAnggota, a.Nama_Anggota, a.Angkatan_Anggota, COUNT(p.Kode_Buku) AS Jumlah_Buku_Dipinjam
FROM anggota a
JOIN peminjaman p ON a.IdAnggota = p.IdAnggota
GROUP BY a.IdAnggota, a.Nama_Anggota, a.Angkatan_Anggota
HAVING COUNT(p.Kode_Buku) > 5;

SELECT * FROM anggota_peminjam_banyak;
DROP VIEW anggota_peminjam_banyak;


-- 2. Definisikan view petugas yang melakukan transaksi (peminjaman/ pengembalian) beserta jumlah buku 
-- yang terpinjam ketika petugas tersebut bertugas! 
CREATE VIEW petugas_transaksi AS
SELECT p.IdPetugas, p.Nama, COUNT(DISTINCT pm.Kode_Peminjaman) AS Jumlah_Buku_Dipinjam, COUNT(DISTINCT pg.Kode_Kembali) AS Jumlah_Buku_Dikembalikan, (COUNT(DISTINCT pm.Kode_Peminjaman) + COUNT(DISTINCT pg.Kode_Kembali)) AS Jumlah_Transaksi
FROM petugas p
LEFT JOIN peminjaman pm ON p.IdPetugas = pm.IdPetugas
LEFT JOIN pengembalian pg ON p.IdPetugas = pg.IdPetugas
GROUP BY p.IdPetugas, p.Nama;

SELECT * FROM petugas_transaksi;
DROP VIEW petugas_transaksi;


-- 3. Definisikan view dari tugas praktikum nomor 2 hanya petugas yang melayani transaksi terbanyak! 
CREATE VIEW petugas_transaksi_terbanyak AS
SELECT IdPetugas, Nama, Jumlah_Transaksi
FROM petugas_transaksi
WHERE Jumlah_Transaksi = (SELECT MAX(Jumlah_Transaksi) FROM petugas_transaksi);

SELECT * FROM petugas_transaksi_terbanyak;
DROP VIEW petugas_transaksi_terbanyak;


-- 4. Definisikasn view buku yang terpinjam paling banyak!
CREATE VIEW buku_terpinjam_terbanyak AS
SELECT b.Kode_Buku, b.Judul_Buku, COUNT(p.Kode_Buku) AS Jumlah_Dipinjam
FROM buku b
JOIN peminjaman p ON b.Kode_Buku = p.Kode_Buku
GROUP BY b.Kode_Buku, b.Judul_Buku
ORDER BY jumlah_dipinjam DESC
LIMIT 1;

SELECT * FROM buku_terpinjam_terbanyak;
DROP VIEW buku_terpinjam_terbanyak;
