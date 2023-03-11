	
	
-- a. Update data product id 1 dengan nama ‘product dummy’.
	UPDATE product
	SET nama = 'product dummy'
	WHERE  id =1;

-- b. Update qty = 3 pada transaction detail dengan product id 1.
	UPDATE  transaction_detail
	SET qty =3
	WHERE  product_id =1;
	
-- c. Update status  menjadi SUCCES pada transaction dengan id 15
	UPDATE `transaction`
	SET  STATUS = 'SUCCESS'
	WHERE id = 15;
	
-- d. Update nama menjadi Natasya pada user dengan id 1
	UPDATE `operator`
	SET `nama` = 'Natasya'
	WHERE id =1;