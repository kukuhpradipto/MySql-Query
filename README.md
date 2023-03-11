# MySql-Query
MySQL adalah sistem manajemen database relasional (RDBMS) open-source berbasis SQL yang bekerja dengan model client-server. Kalau DBMS adalah sistem manajemen database secara umum, RDBMS merupakan software pengelolaan database berdasarkan model relasional.


### Tools used
<li>XAMPP Control Panel</li>
<p>XAMPP adalah software atau aplikasi komputer yang banyak digunakan dalam dunia web developer yang juga bisa dipelajari untuk membuat website. XAMPP adalah perangkat lunak berbasis web server yang bersifat open source (bebas) serta mendukung di berbagai sistem operasi seperti OS Linux, OS Windows, Mac OS, dan juga Solaris.</p>
<li>SQLyog</li>
<p>SQLyog adalah salah satu aplikasi Client MySQL (My Structured Query Language) yang dikembangkan oleh Webyog, Inc. Saat ini ada dua versi SQLyog yang bisa digunakan yaitu enterprise dan community.</p>

### Struktur Folder

```text
Mysql-Query
    |------database
    |------AGREGASI
    |------DELETE
    |------INSERT
    |------JOIN
    |------SELECT
    |------UPDATE
```


### Contoh MYSql Query
### Agregasi
-- 1. (SUM) Menampilkan total harga transaksi user id 1.
```roomsql
	SELECT SUM(transaction_detail.price) AS totalHarga, transaction.user_id
	FROM `transaction`
	INNER JOIN transaction_detail
	ON transaction_detail.transaction_id = transaction.id
	WHERE  user_id= 1
	GROUP BY user_id
```

-- 2. (COUNT) Menampilkan jumlah transaksi masing-masing user_id.
```roomsql
	SELECT user_id, COUNT(user_id)  AS jumlahTransaksi FROM `transaction`
	GROUP BY user_id
```

-- 3. (AVERAGE) Menampilkan rata-rata  quantity secara keseluruhan.
```roomsql
	SELECT AVG(qty) AS rataRataQuanity FROM transaction_detail
```

-- 4. (MAX) Menampilkan nilai transansaksi paling besar.
```roomsql
	SELECT id, MAX(price) AS nilaiTertinggi FROM transaction_detail
```

-- 5 (MIN) Menampilkan nilai transansaksi paling kecil.
```roomsql
	SELECT id, MIN(price) AS nilaiTerendah FROM transaction_detail
```

### DELETE
-- Delete data pada tabel product dengan id 1.
```roomsql
	SET FOREIGN_KEY_CHECKS = 0;
	DELETE FROM product
	WHERE id = 1;
	SET FOREIGN_KEY_CHECKS = 1;
```

### INSERT
-- Insert 3 product dengan product type id = 2.
```roomsql
	INSERT INTO  product (nama, price, product_type_id, operator_id) VALUES 
	('Yamaha', 12500000, 2,2),
	('Honda', 9000000, 2,2),
	('Suzuki', 21000000, 2,2);
```

### DELETE
-- Delete data pada tabel product dengan id 1.
```roomsql
	SET FOREIGN_KEY_CHECKS = 0;
	DELETE FROM product
	WHERE id = 1;
	SET FOREIGN_KEY_CHECKS = 1;
```

### JOIN
-- Menampilkan semua field table product dan field name table product type yang saling berhubungan.
```roomsql
	SELECT pro.id, pro.nama, pro.price, pro.product_type_id, pro.operator_id, pro.created_at, pro.updated_at, prot.nama
	FROM product pro
	INNER JOIN product_type prot
	ON prot.id = pro.id
```

### SELECT
-- Tampilkan data pelanggan yang created_at dalam range 7 hari kebelakang dan mempunyai nama mengandung kata ‘a’.
```roomsql
	SELECT * FROM `user`
	WHERE created_at >= DATE(NOW() - INTERVAL 7 DAY) AND nama LIKE '%a%';
```

### UPDATE
-- Update data product id 1 dengan nama ‘product dummy’.
```roomsql
	UPDATE product
	SET nama = 'product dummy'
	WHERE  id =1;
```