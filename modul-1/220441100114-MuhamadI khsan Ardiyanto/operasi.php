<?php
function hitungMean($arr)
{
    $total = array_sum($arr);
    $count = count($arr);
    if ($count > 0) {
        return $total / $count;
    }
    return 0;
}

function hitungModus($arr)
{
    $counts = array_count_values($arr);
    $maxCount = max($counts);
    $modus = [];

    foreach ($counts as $key => $count) {
        if ($count === $maxCount) {
            $modus[] = $key;
        }
    }

    return $modus;
}

function hitungMaksimum($arr)
{
    return max($arr);
}

function hitungMinimum($arr)
{
    return min($arr);
}

$angka = [];
$hasil = '';

if (isset($_POST['submit'])) {
    $operasi = $_POST['operasi'];
    $input = $_POST['numbers'];

    // Menghapus whitespace di awal dan akhir string, memisahkan string menjadi array
    $angka = explode(",", trim($input));

    // Mengkonversi array string menjadi array integer
    $angka = array_map('intval', $angka);

    // Melakukan operasi sesuai pilihan
    switch ($operasi) {
        case 'mean':
            $hasil = hitungMean($angka);
            break;
        case 'modus':
            $hasil = implode(", ", hitungModus($angka));
            break;
        case 'max':
            $hasil = hitungMaksimum($angka);
            break;
        case 'min':
            $hasil = hitungMinimum($angka);
            break;
        default:
            $hasil = 'Pilih operasi yang valid.';
            break;
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Operasi Statistik</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f2f2f2;
        }

        h2 {
            color: red;
            text-align: center;
        }

        form {
            margin-bottom: 20px;
            background-color: #fff;
            padding: 20px;
            border-radius: 4px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        select,
        input[type="text"],
        input[type="submit"] {
            padding: 10px;
            font-size: 14px;
            border: 1px solid red;
            border-radius: 4px;
            width: 100%;
        }

        input[type="submit"] {
            background-color: red;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: darkred;
        }

        h3 {
            margin-top: 20px;
            color: #333;
        }

        p {
            margin: 10px 0;
        }

        .hasil {
            background-color: #fff;
            padding: 20px;
            border-radius: 4px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
	<center>
    <h2>Operasi Statistik</h2>
    <form method="post">
        <label for="operasi">Pilih operasi:</label><br>
        <select id="operasi" name="operasi" required>
            <option value="mean">Mean</option>
            <option value="modus">Modus</option>
            <option value="max">Maksimum</option>
            <option value="min">Minimum</option>
        </select><br><br>
        <label for="numbers">Masukkan angka (pisahkan dengan koma):</label><br>
        <input type="text" id="numbers" name="numbers" required><br><br>
        <input type="submit" name="submit" value="Hitung"><br><br>
    </form>

    <?php if (!empty($hasil)) : ?>
        <h3>Hasil Perhitungan:</h3>
        <p>Operasi: <?php echo ucfirst($operasi); ?></p>
        <?php if (!empty($angka)) : ?>
            <p>Angka: <?php echo implode(", ", $angka); ?></p>
        <?php endif; ?>
        <p>Hasil: <?php echo $hasil; ?></p>
    <?php endif; ?>
	</center>
</body>
</html>
