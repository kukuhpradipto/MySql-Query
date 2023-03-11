

	-- 1. Menggabungkan data transaksi dari user id 1 dan user id 2.
	SELECT * FROM `transaction`
	WHERE user_id = 1
	UNION
	SELECT * FROM `transaction`
	WHERE user_id = 2;

	-- 2. Menampilkan semua field table product dan field name table product type yang saling berhubungan.
	SELECT pro.id, pro.nama, pro.price, pro.product_type_id, pro.operator_id, pro.created_at, pro.updated_at, prot.nama
	FROM product pro
	INNER JOIN product_type prot
	ON prot.id = pro.id

	-- 3. Menampilkan semua field table transaction, field name table product dan field name table user.`product`
	SELECT  transaction.* ,prod.nama, us.nama
	FROM `transaction`
	INNER JOIN product AS prod
	ON transaction.user_id = prod.id
	INNER JOIN `user` AS us
	ON us.id = prod.id

	-- 4. Menampilkan data products yang tidak pernah ada di tabel transaction_details dengan sub-query.
	SELECT *
	FROM  (
	SELECT product.id, product.nama, product.price, product.product_type_id, product.operator_id , transaction_detail.qty, transaction_detail.price AS harga
	FROM product
	RIGHT JOIN transaction_detail
	ON product.id = transaction_detail.id
	) AS  ap
	ORDER BY id DESC