

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