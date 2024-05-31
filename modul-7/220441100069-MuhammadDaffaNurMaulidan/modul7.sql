CREATE DATABASE sewa_mobil

USE sewa_mobil

CREATE TABLE mobil (
   Id_Mobil INT AUTO_INCREMENT PRIMARY KEY,
   PlatNo VARCHAR(50),
   Merk VARCHAR(50),
   Jenis VARCHAR(50),
   Harga_sewa_perhari DECIMAL(10, 2)
);

CREATE TABLE pelanggan (
   Id_pelanggan INT AUTO_INCREMENT PRIMARY KEY,
   Nama VARCHAR(50),
   alamat VARCHAR(100),
   Nik VARCHAR(50),
   no_telepon VARCHAR(50),
   Jenis_kelamin VARCHAR(50)
)

CREATE TABLE peminjaman(
   id INT AUTO_INCREMENT PRIMARY KEY,
   Id_Mobil INT,
   Id_pelanggan INT,
   Tgl_pinjam DATE,
   Tgl_rencana_kembali DATE,
   Total_hari VARCHAR(50),
   Total_kembali VARCHAR(50),
   Denda DECIMAL(10, 2),
   FOREIGN KEY (Id_Mobil) REFERENCES mobil(Id_Mobil),
   FOREIGN KEY (Id_pelanggan) REFERENCES pelanggan(Id_pelanggan)
)

INSERT INTO mobil (PlatNo, Merk, Jenis, Harga_sewa_perhari) VALUES
('B1234CD', 'Toyota', 'SUV', 500000.00),
('D5678EF', 'Honda', 'Sedan', 400000.00),
('F9012GH', 'Suzuki', 'Hatchback', 350000.00),
('G3456IJ', 'Mitsubishi', 'SUV', 600000.00),
('H7890KL', 'Nissan', 'Sedan', 450000.00),
('J1234MN', 'Mazda', 'Hatchback', 370000.00),
('K5678OP', 'Ford', 'SUV', 550000.00),
('L9012QR', 'Chevrolet', 'Sedan', 420000.00),
('M3456ST', 'BMW', 'SUV', 700000.00),
('N7890UV', 'Mercedes', 'Sedan', 750000.00),
('P1234WX', 'Kia', 'Hatchback', 300000.00),
('Q5678YZ', 'Hyundai', 'SUV', 480000.00),
('R9012AB', 'Audi', 'Sedan', 720000.00),
('S3456CD', 'Volkswagen', 'Hatchback', 380000.00),
('T7890EF', 'Subaru', 'SUV', 620000.00),
('U1234GH', 'Lexus', 'Sedan', 680000.00),
('V5678IJ', 'Jeep', 'SUV', 640000.00),
('W9012KL', 'Tesla', 'Sedan', 800000.00),
('X3456MN', 'Peugeot', 'Hatchback', 360000.00),
('Y7890OP', 'Renault', 'SUV', 470000.00);

INSERT INTO pelanggan (Nama, alamat, Nik, no_telepon, Jenis_kelamin) VALUES
('Adi Nugroho', 'Jl. Merpati No. 5', '3276010101010001', '081234567890', 'Laki-laki'),
('Budi Santoso', 'Jl. Rajawali No. 10', '3276010202020002', '081234567891', 'Laki-laki'),
('Cici Amelia', 'Jl. Kenari No. 15', '3276010303030003', '081234567892', 'Perempuan'),
('Dodi Saputra', 'Jl. Kutilang No. 20', '3276010404040004', '081234567893', 'Laki-laki'),
('Evi Lestari', 'Jl. Beo No. 25', '3276010505050005', '081234567894', 'Perempuan'),
('Feri Irawan', 'Jl. Elang No. 30', '3276010606060006', '081234567895', 'Laki-laki'),
('Gina Rahma', 'Jl. Kakaktua No. 35', '3276010707070007', '081234567896', 'Perempuan'),
('Hadi Wibowo', 'Jl. Jalak No. 40', '3276010808080008', '081234567897', 'Laki-laki'),
('Intan Permata', 'Jl. Cendrawasih No. 45', '3276010909090009', '081234567898', 'Perempuan'),
('Joko Susilo', 'Jl. Garuda No. 50', '3276011010100010', '081234567899', 'Laki-laki'),
('Kiki Amalia', 'Jl. Anis No. 55', '3276011111110011', '081234567800', 'Perempuan'),
('Lina Herlina', 'Jl. Pleci No. 60', '3276011212120012', '081234567801', 'Perempuan'),
('Miko Pratama', 'Jl. Jalak No. 65', '3276011313130013', '081234567802', 'Laki-laki'),
('Nia Safitri', 'Jl. Parkit No. 70', '3276011414140014', '081234567803', 'Perempuan'),
('Oki Setiawan', 'Jl. Perkutut No. 75', '3276011515150015', '081234567804', 'Laki-laki'),
('Prita Anggraeni', 'Jl. Puyuh No. 80', '3276011616160016', '081234567805', 'Perempuan'),
('Qori Hidayat', 'Jl. Gelatik No. 85', '3276011717170017', '081234567806', 'Laki-laki'),
('Rina Marlina', 'Jl. Jalak No. 90', '3276011818180018', '081234567807', 'Perempuan'),
('Sandi Pratama', 'Jl. Kenari No. 95', '3276011919190019', '081234567808', 'Laki-laki'),
('Tari Indah', 'Jl. Rajawali No. 100', '3276012020200020', '081234567809', 'Perempuan');


INSERT INTO peminjaman (Id_Mobil, Id_pelanggan, Tgl_pinjam, Tgl_rencana_kembali, Total_hari, Total_kembali, Denda) VALUES
(1, 1, '2024-05-01', '2024-05-05', '4', '2024-05-05', 0.00),
(2, 2, '2024-05-02', '2024-05-06', '4', '2024-05-06', 0.00),
(3, 3, '2024-05-03', '2024-05-07', '4', '2024-05-07', 0.00),
(4, 4, '2024-05-04', '2024-05-08', '4', '2024-05-08', 0.00),
(5, 5, '2024-05-05', '2024-05-09', '4', '2024-05-09', 0.00),
(6, 6, '2024-05-06', '2024-05-10', '4', '2024-05-10', 0.00),
(7, 7, '2024-05-07', '2024-05-11', '4', '2024-05-11', 0.00),
(8, 8, '2024-05-08', '2024-05-12', '4', '2024-05-12', 0.00),
(9, 9, '2024-05-09', '2024-05-13', '4', '2024-05-13', 0.00),
(10, 10, '2024-05-10', '2024-05-14', '4', '2024-05-14', 0.00),
(11, 11, '2024-05-11', '2024-05-15', '4', '2024-05-15', 0.00),
(12, 12, '2024-05-12', '2024-05-16', '4', '2024-05-16', 0.00),
(13, 13, '2024-05-13', '2024-05-17', '4', '2024-05-17', 0.00),
(14, 14, '2024-05-14', '2024-05-18', '4', '2024-05-18', 0.00),
(15, 15, '2024-05-15', '2024-05-19', '4', '2024-05-19', 0.00),
(16, 16, '2024-05-16', '2024-05-20', '4', '2024-05-20', 0.00),
(17, 17, '2024-05-17', '2024-05-21', '4', '2024-05-21', 0.00),
(18, 18, '2024-05-18', '2024-05-22', '4', '2024-05-22', 0.00),
(19, 19, '2024-05-19', '2024-05-23', '4', '2024-05-23', 0.00),
(20, 20, '2024-05-20',  '2024-05-29', '9', '2024-05-29', 50.000);  

-- soal nomer 1
-- Mengubah delimiter untuk memungkinkan penulisan seluruh trigger dalam satu blok
DELIMITER// 
-- Membuat trigger bernama check_tgl_rencana_kembali yang dijalankan sebelum data dimasukkan ke dalam tabel peminjaman
CREATE TRIGGER check_tgl_rencana_kembali
BEFORE INSERT ON peminjaman
FOR EACH ROW
BEGIN
    -- Memeriksa apakah Tgl_rencana_kembali lebih awal dari Tgl_pinjam
    IF NEW.Tgl_rencana_kembali < NEW.Tgl_pinjam THEN
        -- Jika ya, maka menghentikan operasi insert dan menampilkan pesan error
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Tanggal rencana kembali tidak boleh lebih awal dari tanggal pinjam';
    END IF;
END//
DELIMITER;
INSERT INTO peminjaman (Id_Mobil, Id_pelanggan, Tgl_pinjam, Tgl_rencana_kembali, Total_hari, Total_bayar, Denda) 
VALUES (1,2,'2024-05-25','2024-05-24','10',2000000.00,0.00);

-- nomer 2
DELIMITER //
CREATE TRIGGER hitung_total_bayar_dan_denda
BEFORE INSERT ON peminjaman
FOR EACH ROW
BEGIN
    DECLARE harga_sewa DECIMAL(10, 2);
    DECLARE total_bayar DECIMAL(10, 2);
    DECLARE total_hari INT;
    DECLARE denda DECIMAL(10, 2);
    DECLARE denda_perhari DECIMAL (10,2) DEFAULT 50000.00;
    
    -- Mengambil harga sewa per hari dari mobil yang dipinjam
    SELECT Harga_sewa_perhari INTO harga_sewa FROM mobil WHERE Id_Mobil = NEW.Id_Mobil;
    
    -- Menghitung total hari pinjam
    SET total_hari = DATEDIFF(NEW.Tgl_rencana_kembali, NEW.Tgl_pinjam);
    
    -- Menghitung total bayar
    SET total_bayar = harga_sewa * total_hari;
    
    -- Menghitung denda jika ada
    -- Menghitung denda jika ada
    IF NEW.Tgl_kembali > NEW.Tgl_rencana_kembali THEN
        SET denda = (NEW.Tgl_kembali - NEW.Tgl_rencana_kembali) * denda_perhari;
    ELSE
        SET denda = 0;
    END IF;
    
    -- Memasukkan nilai total bayar dan denda ke dalam record yang akan diinsert
    -- SET NEW.Total_hari = total_hari;
    SET NEW.Total_bayar = total_bayar;
    SET NEW.Denda = denda;
END//
DELIMITER ;
INSERT INTO peminjaman (Id_Mobil, Id_pelanggan, Tgl_pinjam, Tgl_rencana_kembali, Tgl_kembali, Total_hari, Total_bayar, Denda)
VALUES 
(5, 2, '2024-05-03', '2024-05-06', '2024-05-10', 5, 0, 0);


-- nomer 3
-- Mengubah delimiter untuk memungkinkan penulisan seluruh trigger dalam satu blok
DELIMITER//
-- Membuat trigger bernama check_nik_length yang dijalankan sebelum data dimasukkan ke dalam tabel pelanggan
CREATE TRIGGER check_nik_length
BEFORE INSERT ON pelanggan
FOR EACH ROW
BEGIN
    -- Memeriksa apakah panjang NIK yang baru dimasukkan tidak sama dengan 16 digit
    IF LENGTH(NEW.Nik) != 16 THEN
        -- Jika ya, maka menghentikan operasi insert dan menampilkan pesan error
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'NIK harus terdiri dari 16 digit';
    END IF;
END//
DELIMITER;

INSERT INTO pelanggan (Nama, alamat, Nik, no_telepon, Jenis_kelamin) VALUES
('Adi Nugroho', 'Jl. Merpati No. 5', '327601010', '081234567890', 'Laki-laki');

-- nomer 4
-- Mengubah delimiter untuk memungkinkan penulisan seluruh trigger dalam satu blok
DELIMITER//
-- Membuat trigger bernama check_platno_format yang dijalankan sebelum data dimasukkan ke dalam tabel mobil
CREATE TRIGGER check_platno_format
BEFORE INSERT ON mobil
FOR EACH ROW
BEGIN
    -- Memeriksa apakah dua karakter pertama dari PlatNo yang baru dimasukkan bukan huruf
    -- LEFT(NEW.PlatNo, 2): Fungsi LEFT mengambil dua karakter pertama dari PlatNo. 
    -- REGEXP '^[A-Za-z]{1,2}': Ekspresi reguler (REGEXP) memeriksa apakah dua karakter pertama adalah huruf (A-Z atau a-z)
    IF NOT (LEFT(NEW.PlatNo, 2) REGEXP '^[A-Za-z]{1,2}') THEN
        -- Jika ya, maka menghentikan operasi insert dan menampilkan pesan error
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Karakter pertama hingga kedua pada Plat Nomor harus huruf';
    END IF;
END//
DELIMITER;

INSERT INTO mobil (PlatNo, Merk, Jenis, Harga_sewa_perhari) VALUES
('1221234CD', 'Toyota', 'SUV', 500000.00);
