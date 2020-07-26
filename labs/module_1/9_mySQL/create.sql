CREATE DATABASE lab_mysql;
USE lab_mysql;
CREATE TABLE INVOICES (
invoice_number int,
date DATE,
car VARCHAR(55),
customer VARCHAR(55),
salesperson VARCHAR (55));
SHOW databases;
SHOW TABLES;
SELECT * FROM invoices;
CREATE TABLE CARS (
vehicle_ID VARCHAR(55),
manufacturer VARCHAR(105),
model VARCHAR(55),
year YEAR,
color VARCHAR(25));
SELECT * FROM cars;
CREATE TABLE SALESPERSONS (
staff_id VARCHAR(55),
salesname VARCHAR(55),
store_at_company VARCHAR(155));
SELECT * FROM salespersons;
CREATE TABLE CUSTOMERS (
customer_ID INT, name VARCHAR(55),
phone VARCHAR(55),
email VARCHAR(55),
address VARCHAR(155),
city varchar (55),
state_province VARCHAR (155),
country VARCHAR (55),
zip_postal VARCHAR(55));
SELECT * FROM customers;
alter table cars ADD ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT FIRST;
alter table salespersons ADD ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT FIRST;
alter table customers ADD ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT FIRST;
alter table invoices ADD ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT FIRST;
# Well, I couldn't figure out how to change structure of date from YY-MM-DD (default for mysql) to DD-MM-YY even though I checked google - did try to convert but didn't work-, so decided to move forward by using VARCHAR(xx) instead DATE data type..
ALTER TABLE invoices MODIFY date VARCHAR(15);
SHOW KEYS FROM cars WHERE Key_name = 'PRIMARY';	
SHOW KEYS FROM invoices WHERE Key_name = 'PRIMARY';
SHOW KEYS FROM customers WHERE Key_name = 'PRIMARY';
SHOW KEYS FROM salespersons WHERE Key_name = 'PRIMARY';
SHOW TABLES;
