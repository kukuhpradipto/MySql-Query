`classicmodels`CREATE DATABASE alta_online_shop;
USE alta_online_shop;

CREATE TABLE USER (
	id INT NOT NULL AUTO_INCREMENT,
	nama VARCHAR(255) NOT NULL,
	gender ENUM('LAKI_LAKI', 'PEREMPUAN'),
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW(),
	PRIMARY KEY (id)
);

CREATE TABLE operator (
	id INT NOT NULL AUTO_INCREMENT,
	nama VARCHAR(255) NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW(),
	PRIMARY KEY (id)
);



CREATE TABLE product_type (
	id INT NOT NULL AUTO_INCREMENT,
	nama VARCHAR(255) NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW(),
	PRIMARY KEY (id)
);

CREATE TABLE product (
	id INT NOT NULL AUTO_INCREMENT,
	nama VARCHAR(255) NOT NULL,
	price INT NOT NULL,
	product_type_id INT NOT NULL,
	operator_id INT NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW(),
	PRIMARY KEY (id),
	FOREIGN KEY (product_type_id) REFERENCES product_type(id),
	FOREIGN KEY (operator_id) REFERENCES operator(id)
);

CREATE TABLE product_description (
	id INT NOT NULL AUTO_INCREMENT,
	DESCRIPTION MEDIUMTEXT NOT NULL,
	product_id INT NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW(),
	PRIMARY KEY (id),
	FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE payment_method(
	id INT NOT NULL AUTO_INCREMENT,
	nama VARCHAR(255) NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW(),
	PRIMARY KEY (id)
);

CREATE TABLE TRANSACTION (
	id INT NOT NULL AUTO_INCREMENT,
	user_id INT NOT NULL,
	payment_method_id INT NOT NULL,
	STATUS ENUM('PENDING', 'SUCCESS', 'FAILED'),
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW(),
	PRIMARY KEY (id),
	FOREIGN KEY (user_id) REFERENCES USER(id),
	FOREIGN KEY (payment_method_id) REFERENCES payment_method(id)
);


CREATE TABLE transaction_detail (
	id INT NOT NULL AUTO_INCREMENT,
	product_id INT NOT NULL,
	qty INT NOT NULL,
	price INT NOT NULL,
	transaction_id INT NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW(),
	PRIMARY KEY (id),
	FOREIGN KEY (transaction_id) REFERENCES TRANSACTION(id),
	FOREIGN KEY (product_id) REFERENCES product(id)
);


SELECT * FROM transaction_detail


-- Release 1: Create, Update, and Delete Data
	-- 1. Insert 
		-- a. Insert 3 product type.
		INSERT INTO  product_type  (nama) VALUES ('Sepeda'),('Sepeda Motor'),('Mobil');

		-- b. Insert 2 product dengan product type id = 1
		INSERT INTO operator (nama) VALUES ('Kukuh'),('Pradipto'),('Dito'),('Amanda');
		INSERT INTO  product (nama, price, product_type_id, operator_id) VALUES 
		('Polygon', 4900000, 1,1),
		('Wimcycle', 2100000, 1,1);
		SELECT * FROM product

		-- c. Insert 3 product dengan product type id = 2
		INSERT INTO  product (nama, price, product_type_id, operator_id) VALUES 
		('Yamaha', 12500000, 2,2),
		('Honda', 9000000, 2,2),
		('Suzuki', 21000000, 2,2);


		-- d. Insert 3 product dengan product type id = 3
		INSERT INTO  product (nama, price, product_type_id, operator_id) VALUES 
		('Toyota', 12500000, 3,3),
		('BMW', 9000000,3,3),
		('Lamborghini', 21000000,3,3);
		UPDATE product
		SET nama = 'Lamborghini'
		WHERE id =8;

		-- e. Insert product description pada setiap product.
		INSERT INTO product_description (DESCRIPTION, product_id) VALUES
		('Sepeda Wimcycle merupakan brand sepeda yang sudah eksis sejak puluhan tahun lalu. Brand sepeda ini cukup terkenal karena desainnya yang unik dan berbeda dari yang lain.', 1),
		('Berdiri sejak tahun 1989, Polygon telah berhasil mengekspor produk sepedanya ke berbagai negara. Perusahaan asal Jawa Timur ini juga menawarkan harga sepeda Polygon dengan bervariasi, dari yang terjangkau hingga yang harganya cukup spektakuler.', 2),
		('Yamaha adalah sebuah produsen sepeda motor, produk kelautan, seperti perahu dan mesin tempel, serta produk bermotor lain asal Jepang.', 3),
		('Honda adalah produsen mobil asal Jepang pertama yang meluncurkan merek mobil mewah tersendiri, yakni Acura, pada tahun 1986. Selain memproduksi mobil dan sepeda motor.', 4),
		('Suzuki adalah sebuah perusahaan multinasional yang berkantor pusat di Minami-ku, Hamamatsu, Jepang.[4] Suzuki memproduksi mobil, kendaraan four-wheel drive, sepeda motor, all-terrain vehicles (ATV), mesin tempel, kursi roda, dan berbagai macam mesin pembakaran dalam kecil lain.', 5),
		('Toyota adalah salah satu produsen mobil terbesar di dunia. Perusahaan yang bermarkas di Tokyo (Jepang) ini didirikan pada 28 Agustus 1937, 82 tahun lalu',6),
		('BMW adalah perusahaan besar asal Jerman yang memproduksi mesin dan motor. Didirikan pada tahun 1916 oleh Franz Josef Popp',7),
		('Lamborghini adalah sebuah perusahaan pembuat mobil di Italia. Perusahaan ini didirikan oleh Ferruccio Lamborghini pada tahun 1963, dengan tujuan untuk menghasilkan mobil grand wisata yang dapat bersaing dengan mobil yang telah ada dipasaran terlebih dahulu seperti Ferrari.',8),

		-- f. Insert 3 payment methods.
		INSERT INTO payment_method (nama) VALUES ('Cash'),('Cicil'),('Payment Later');

		-- g. Insert 5 user pada tabel user.
		INSERT INTO `user` (nama,gender) VALUES 
		('Aliyah','PEREMPUAN'),
		('Marisa','PEREMPUAN'),
		('Syeh','LAKI_LAKI'),
		('Kadar','LAKI_LAKI'),
		('Radit','LAKI_LAKI');

		-- h. Insert 3 transaksi di masing-masing user (min 3 user)
		INSERT INTO `transaction` (user_id, payment_method_id, STATUS) VALUES 
		(1,1,'PENDING'), (1,2,'SUCCESS'),(1,3,'FAILED'), (2,1,'PENDING'),
		(2,2,'SUCCESS'), (2,3,'FAILED'),(3,1,'PENDING'), (3,2,'SUCCESS'),
		(3,3,'FAILED'), (4,1,'PENDING'),(4,2,'SUCCESS'), (4,3,'FAILED'),
		(5,1,'PENDING'), (5,2,'SUCCESS'),(5,3,'FAILED');

		-- Insert 3 product di masing-masing transaksi.
		INSERT INTO transaction_detail (product_id, qty, price, transaction_id) VALUES 
		(1,1,4900000,1),(2,1,2100000,1),(3,1,12500000,1),(4,1,9000000,2),(5,1,21000000,2),(6,1,12500000,2),
		(1,1,4900000,3),(2,1,2100000,3),(3,1,12500000,3),(4,1,9000000,4),(5,1,21000000,4),(6,1,12500000,4),
		(1,1,4900000,5),(2,1,2100000,5),(3,1,12500000,5),(4,1,9000000,6),(5,1,21000000,6),(6,1,12500000,6),
		(1,1,4900000,7),(2,1,2100000,7),(3,1,12500000,7),(4,1,9000000,8),(5,1,21000000,8),(6,1,12500000,8),
		(1,1,4900000,9),(2,1,2100000,9),(3,1,12500000,9),(4,1,9000000,10),(5,1,21000000,10),(6,1,12500000,10),
		(1,1,4900000,11),(2,1,2100000,11),(3,1,12500000,11),(4,1,9000000,12),(5,1,21000000,12),(6,1,12500000,12),
		(4,1,9000000,13),(5,1,21000000,13),(6,1,12500000,13),(4,1,9000000,14),(5,1,21000000,14),(6,1,12500000,14),
		(4,1,9000000,15),(5,1,21000000,15),(6,1,12500000,15);

	-- 2. Select
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


	-- 3. Update
		-- a. Ubah data product id 1 dengan nama ‘product dummy’.
		UPDATE product
		SET nama = 'product dummy'
		WHERE  id =1;

		-- b. Update qty = 3 pada transaction detail dengan product id 1.
		UPDATE  transaction_detail
		SET qty =3
		WHERE  product_id =1;

	-- 4. Delete
		-- a. Delete data pada tabel product dengan id 1.
		SET FOREIGN_KEY_CHECKS = 0;
		DELETE FROM product
		WHERE id = 1;
		SET FOREIGN_KEY_CHECKS = 1;

		-- b. Delete pada tabel product dengan product-type id 1.
		SET FOREIGN_KEY_CHECKS = 0;
		DELETE FROM product
		WHERE product_type_id = 1;
		SET FOREIGN_KEY_CHECKS = 1;

-- Release 2 : Join, Union, Sub-query
	-- 1. Gabungkan data transaksi dari user id 1 dan user id 2.
	SELECT * FROM `transaction`
	WHERE user_id = 1
	UNION
	SELECT * FROM `transaction`
	WHERE user_id = 2;

	-- 2. Tampilkan jumlah harga transaksi user id 1.
	SELECT SUM(transaction_detail.price) AS jumlahHarga, transaction.user_id
	FROM `transaction`
	INNER JOIN transaction_detail
	ON transaction_detail.transaction_id = transaction.id
	WHERE  user_id= 1
	GROUP BY user_id

	-- 3. Tampilkan total transaksi dengan product type 2.

	SELECT COUNT(transaction_detail.price) AS totalTransaksi,  product.product_type_id
	FROM transaction_detail
	INNER JOIN product
	ON product.id = transaction_detail.id
	WHERE product_type_id = 2;
	
	-- 4. Tampilkan semua field table product dan field name table product type yang saling berhubungan.
	SELECT pro.id, pro.nama, pro.price, pro.product_type_id, pro.operator_id, pro.created_at, pro.updated_at, prot.nama
	FROM product pro
	INNER JOIN product_type prot
	ON prot.id = pro.id

	-- 5. Tampilkan semua field table transaction, field name table product dan field name table user.
	SELECT  transaction.* ,prod.nama, us.nama
	FROM `transaction`
	INNER JOIN product AS prod
	ON transaction.user_id = prod.id
	INNER JOIN `user` AS us
	ON us.id = prod.id

	-- 6. Tampilkan data products yang tidak pernah ada di tabel transaction_details dengan sub-query.
	SELECT *
	FROM  (
	SELECT product.id, product.nama, product.price, product.product_type_id, product.operator_id , transaction_detail.qty, transaction_detail.price AS harga
	FROM product
	RIGHT JOIN transaction_detail
	ON product.id = transaction_detail.id
	) AS  ap
	ORDER BY id DESC