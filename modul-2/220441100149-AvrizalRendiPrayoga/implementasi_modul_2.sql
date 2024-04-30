-- 1 --
CREATE VIEW pinjam_lebih_dari_5_buku AS
	SELECT a.IdAnggota, a.Nama_Anggota, COUNT(p.Kode_Buku) AS jml_dipinjam
	FROM anggota a
	JOIN peminjaman p 
	ON a.IdAnggota = p.IdAnggota
	GROUP BY a.IdAnggota
	HAVING jml_dipinjam > 5;
	
SELECT * FROM pinjam_lebih_dari_5_buku

-- 2 --
CREATE VIEW petugas_trx AS
	SELECT p.IdPetugas, p.Nama, COUNT(pj.Kode_Peminjaman) AS jml_trx_pinjam
	FROM peminjaman pj
	JOIN petugas p 
	ON p.IdPetugas = pj.IdPetugas
	GROUP BY p.IdPetugas;
	
SELECT * FROM petugas_trx
	
-- 3 --
CREATE VIEW max_trx_petugas AS		
	SELECT * FROM petugas_trx
	ORDER BY jml_trx_pinjam DESC
	LIMIT 1;
	
SELECT * FROM max_trx_petugas
	
-- 4 --
CREATE VIEW max_buku_dipinjam AS
	SELECT b.Kode_Buku, b.Judul_Buku, COUNT(p.Kode_Buku) AS jml_dipinjam
	FROM peminjaman p
	JOIN buku b 
	ON p.Kode_Buku = b.Kode_Buku
	GROUP BY b.Kode_Buku
	ORDER BY jml_dipinjam DESC
	LIMIT 1;
	
SELECT * FROM max_buku_dipinjam

	