show databases;
SET SQL_SAFE_UPDATES = 0;
use lab_mysql;
show tables;
select * from salespersons;
UPDATE salespersons SET store_at_company = REPLACE(store_at_company,'Mimia','Miami');

select * from customers;

UPDATE customers SET email = 'ppicasso@gmail.com' WHERE ID = 1;
UPDATE customers SET email = 'lincoln@us.gov' WHERE name = 'Abraham Lincoln';
UPDATE customers SET email = 'hello@napoleon.me' WHERE name = 'Napoléon Bonaparte';


