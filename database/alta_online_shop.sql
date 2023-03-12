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