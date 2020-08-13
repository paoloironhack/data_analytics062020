USE lab_mysql;

CREATE TABLE cars (VIN NUMERIC(10), manufacturer VARCHAR(50), model VARCHAR(50), year_built YEAR, color VARCHAR(50));
CREATE TABLE customers (Cus_ID NUMERIC(10), cus_name VARCHAR(50), phone NUMERIC(20), email VARCHAR(50), address VARCHAR(100), city VARCHAR(50), state_prov VARCHAR(50), country VARCHAR(50), zip_postal_code VARCHAR(10));
CREATE TABLE salespersons (Staff_ID NUMERIC(10), empl_name VARCHAR(50), store VARCHAR(50));
CREATE TABLE invoices (invoice_number NUMERIC(10), date_inv DATE, car NUMERIC(10), customer NUMERIC(10), salesperson NUMERIC(10));