

-- a. Tampilkan nama user / pelanggan dengan gender Laki-laki / M.
	SELECT nama AS Pelanggan 
	FROM `user` 
	WHERE gender ='LAKI_LAKI';


-- b. Tampilkan product dengan id = 3.
	SELECT * FROM product
	WHERE id = 3;

-- c. Tampilkan data pelanggan yang created_at dalam range 7 hari kebelakang dan mempunyai nama mengandung kata ‘a’.
	SELECT * FROM `user`
	WHERE created_at >= DATE(NOW() - INTERVAL 7 DAY) AND nama LIKE '%a%';


-- d. Hitung jumlah user / pelanggan dengan status gender Perempuan.
	SELECT COUNT(nama) AS jumlahWanita FROM `user`
	WHERE gender ='PEREMPUAN';


-- e. Tampilkan data pelanggan dengan urutan sesuai nama abjad
	SELECT  id, nama, gender AS pelanggan FROM `user`
	ORDER BY nama;


-- f. Tampilkan 5 data transaksi dengan product id = 3
	SELECT * FROM transaction_detail
	WHERE product_id = 3
	LIMIT 5;
