USE db_perpus
---Soal NO 1---
DELIMITER //
CREATE PROCEDURE hitung_pinjam (IN tgl_pinjam VARCHAR (20))
BEGIN
	SELECT kode_kembali, id_anggota, DATEDIFF(tanggal_kembali, tanggal_pinjam)
	AS lama_peminjaman
	FROM pengembalian WHERE tanggal_pinjam = tgl_pinjam;
END //
DELIMITER //


SELECT * FROM pengembalian
CALL hitung_pinjam ('2023-05-10')
---------------------------------------
SELECT * FROM buku
---Soal NO 2---
DELIMITER //
CREATE PROCEDURE delete_buku (IN tahun_terbit VARCHAR(20))
BEGIN
	DELETE FROM buku WHERE tahun_buku <= tahun_terbit
	AND penerbit_buku != 'Andi Publisher';
	SELECT * FROM buku;
end //
delimiter //

select * from buku
drop procedure delete_buku
call delete_buku('2000')

select * from buku
select * from peminjaman
---Soal No 3---
DELIMITER //

CREATE PROCEDURE update_jumlah_buku(IN kode_buku_param VARCHAR(10))
BEGIN
    DECLARE jumlah_peminjaman INT;
    DECLARE jumlah_pengembalian INT;

    -- Menghitung jumlah peminjaman berdasarkan kode buku
    SELECT COUNT(*) INTO jumlah_peminjaman
    FROM peminjaman
    WHERE kode_buku = kode_buku_param;

    -- Menghitung jumlah pengembalian berdasarkan kode buku
    SELECT COUNT(*) INTO jumlah_pengembalian
    FROM pengembalian
    WHERE kode_buku = kode_buku_param;

    -- Mengupdate jumlah buku berdasarkan perbedaan jumlah peminjaman dan pengembalian
    UPDATE buku
    SET jumlah_buku = jumlah_buku - jumlah_peminjaman + jumlah_pengembalian
    WHERE kode_buku = kode_buku_param;
END //
DELIMITER ;

call update_jumlah_buku('bk-05')
SELECT jumlah_buku FROM buku WHERE kode_buku = 'bk-05'
select * from buku

select * from pengembalian 
select * from peminjaman
select * from buku
select jumlah_buku from buku where kode_buku = 'bk-02'
select * from buku


---Soal No 4---
delimiter //
create procedure jum_buku_pinjam (in p_id_anggota varchar (10))
begin
	select peminjaman.id_anggota, anggota.nama_anggota, count(peminjaman.kode_peminjaman) as jumlah_buku_dipinjam
	from peminjaman
	inner join anggota on anggota.id_anggota = peminjaman.id_anggota
	where peminjaman.id_anggota = p_id_anggota;
end //
delimiter//
call jum_buku_pinjam('a5')

select * from peminjaman


---Soal No 5---
drop procedure 




