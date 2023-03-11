

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


