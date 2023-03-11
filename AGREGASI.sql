	
	
-- 1. SUM 
	-- Menampilkan total harga transaksi user id 1.
	SELECT SUM(transaction_detail.price) AS totalHarga, transaction.user_id
	FROM `transaction`
	INNER JOIN transaction_detail
	ON transaction_detail.transaction_id = transaction.id
	WHERE  user_id= 1
	GROUP BY user_id
	
	-- Menampilkan total quantity dari masing-masing user
	SELECT SUM(transaction_detail.price) AS Total, transaction.user_id
	FROM transaction_detail
	RIGHT JOIN TRANSACTION
	ON transaction.id = transaction_detail.id
	GROUP BY user_id


-- 2. COUNT
	-- Menampilkan jumlah transaksi dengan product type 2.
	SELECT COUNT(transaction_detail.price) AS jumlahTransaksi,  product.product_type_id
	FROM transaction_detail
	INNER JOIN product
	ON product.id = transaction_detail.id
	WHERE product_type_id = 2;
	
	--  Menampilkan jumlah transaksi masing-masing user_id
	SELECT user_id, COUNT(user_id)  AS jumlahTransaksi FROM `transaction`
	GROUP BY user_id
	
	
-- 3. AVERAGE
	-- Menampilkan rata-rata transansaksi 
	SELECT transaction.user_id, AVG(transaction_detail.price) AS rataRataTransaksi
	FROM `transaction`
	INNER JOIN transaction_detail
	ON transaction_detail.id = transaction.user_id
	GROUP BY transaction.user_id
	
	-- Menampilkan rata-rata  quantity secara keseluruhan
	SELECT AVG(qty) AS rataRataQuanity FROM transaction_detail
	
	
-- 4. MAX
	-- Menampilkan nilai transansaksi paling besar
	SELECT id, MAX(price) AS nilaiTertinggi FROM transaction_detail
	
	-- Menampilkan quantity terbesar
	SELECT MAX(qty) AS maksimalQuanity FROM transaction_detail

	
	
-- 5 MIN
	-- Menampilkan nilai transansaksi paling kecil
	SELECT id, MIN(price) AS nilaiTerendah FROM transaction_detail
	
	-- Menampilkan quantity terkecil
	SELECT MIN(qty) AS minimalQuanity FROM transaction_detail
