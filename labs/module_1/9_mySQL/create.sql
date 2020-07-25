USE sql7356922;
CREATE TABLE aline_cars (ID int, VIN VARCHAR(30), Manufacturer VARCHAR(30), Model VARCHAR(30), Year CHAR(4), Colour VARCHAR(10));
CREATE TABLE aline_customers (ID int, Customer_ID VARCHAR(30), Name VARCHAR(30), Phone VARCHAR(20), Email VARCHAR(30), Address VARCHAR(30), City VARCHAR(20), State_Province VARCHAR(30), Country VARCHAR(20), ZIP_Postal_code VARCHAR(15));
CREATE TABLE aline_salespersons (ID int, Staff_ID VARCHAR(30), Name VARCHAR(30), Store VARCHAR(30));
CREATE TABLE aline_invoices (ID int, Invoice_nr VARCHAR(30), Invoice_date DATE, Car VARCHAR(30), Customer VARCHAR(30), Salesperson VARCHAR(30));