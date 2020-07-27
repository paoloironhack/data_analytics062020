USE lab_mysql;

CREATE TABLE cars (id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, VIN varchar(25), manufacturer VARCHAR(50), model VARCHAR(50), year_built YEAR, color VARCHAR(50));
CREATE TABLE customers (id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, Cus_ID NUMERIC(5), cus_name VARCHAR(50), phone NUMERIC(20), email VARCHAR(50), address VARCHAR(100), city VARCHAR(50), state_prov VARCHAR(50), country VARCHAR(50), zip_postal_code VARCHAR(10));
CREATE TABLE salespersons (id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, Staff_ID NUMERIC(10), empl_name VARCHAR(50), store VARCHAR(50));
CREATE TABLE invoices (id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, invoice_number NUMERIC(10), date_inv DATE, car NUMERIC(10), customer NUMERIC(10), salesperson NUMERIC(10));

INSERT INTO cars (VIN, manufacturer, model, year_built, color) VALUES ('3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', 2019, 'Blue'), 
('ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', 2019, 'Red'), ('RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', 2018, 'White'), 
('HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', 2018, 'Silver'), ('DAM41UDN3CHU2WVF6', 'Volvo', 'V60', 2019, 'Gray'), 
('DAM41UDN3CHU2WVF6', 'Volvo', 'V60 Cross Country', 2019, 'Gray');

INSERT INTO customers (Cus_ID, cus_name, phone, email, address, city, state_prov, country, zip_postal_code) VALUES 
(10001, 'Pablo Picasso', '+34 636 17 63 82', '-', 'Paseo de la Chopera, 14', 'Madrid', 'Madrid', 'Spain', 28045), 
(20001, 'Abraham Lincoln', '+1 305 907 7086', '-', '120 SW 8th St', 'Miami', 'Florida', 'United States', 33130), 
(30001, 'Napoléon Bonaparte', '+33 1 79 75 40 00', '-', '40 Rue du Colisée', 'Paris', 'Île-de-France', 'France', 75008);

INSERT INTO salespersons (Staff_ID, empl_name, store) VALUES (00001, 'Petey Cruiser', 'Madrid'), (00002, 'Anna Sthesia', 'Barcelona'), 
(00003, 'Paul Molive', 'Berlin'), (00004, 'Gail Forcewind', 'Paris'), (00005, 'Paige Turner', 'Mimia'), (00006, 'Bob Frapples', 'Mexico City'),
(00007, 'Walter Melon', 'Amsterdam'), (00008, 'Shonda Leer', 'São Paulo');

INSERT INTO invoices (invoice_number, date_inv, car, customer, salesperson) VALUES (852399038, '2018-08-22', '0', '1', '3'), (731166526,
'2018-12-31', '3', '0', '5'), (271135104, '2019-01-22', '2', '2', '7');

UPDATE salespersons SET store = 'Miami' WHERE id = 5;

UPDATE customers SET email = 'ppicasso@gmail.com' WHERE id = 1;
UPDATE customers SET email = 'lincoln@us.gov' WHERE id = 2;
UPDATE customers SET email = 'hello@napoleon.me' WHERE id = 3;

DELETE FROM cars WHERE id = 4;