/* Change to lab_mysql database */
USE lab_mysql;


/* Creating all the tables */
CREATE TABLE cars (id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, vin_number CHAR(17), manufacturer VARCHAR(255), model VARCHAR(255), year CHAR(4), color VARCHAR(255));

CREATE TABLE customers (id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, customer_id CHAR(8), name VARCHAR(255), phone_number VARCHAR(255), email VARCHAR(255), address VARCHAR(255), city VARCHAR(255), state VARCHAR(255), country VARCHAR(255), zip_code VARCHAR(255));

CREATE TABLE salespersons (id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, staff_id CHAR(8), name VARCHAR(255), store VARCHAR(255));

CREATE TABLE invoices (id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, invoice_number CHAR(9), date_of_sale CHAR(10), car INT,  customer INT, salesperson INT);
