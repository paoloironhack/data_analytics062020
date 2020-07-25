
Merti@MSI MINGW64 ~
$ mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 8.0.19 MySQL Community Server - GPL

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> SHOW databases;
+--------------------+
| Database           |
+--------------------+
| apps               |
| information_schema |
| lab_mysql          |
| mysql              |
| performance_schema |
| publications       |
| sys                |
+--------------------+
7 rows in set (0.00 sec)

mysql> USE lab_mysql;
Database changed
mysql> CREATE TABLE cars (ID int NOT NULL AUTO_INCREMENT, VIN varchar(100), Manufacturer varchar(100), Model varchar(50), Year int(4), Color varchar(20), PRIMARY KEY (ID));
Query OK, 0 rows affected, 1 warning (0.06 sec)

mysql> CREATE TABLE Customers (ID int NOT NULL AUTO_INCREMENT, Customer_ID int(50), Name varchar(100), Phone_number varchar(100), Email varchar(100), Address varchar (100), City varchar(100), State_Province varchar(100), Country varchar(100), Zip_PostalCode varchar(10), PRIMARY KEY (ID));
Query OK, 0 rows affected, 1 warning (0.04 sec)

mysql> CREATE TABLE Salespersons (ID int NOT NULL AUTO_INCREMENT, Staff_ID int(50), Name varchar(100), Store varchar(100), PRIMARY KEY (ID));
Query OK, 0 rows affected, 1 warning (0.04 sec)

mysql> CREATE TABLE Invoices (ID int NOT NULL AUTO_INCREMENT, Invoice_Nbr int(50), Date DATE, PRIMARY KEY (ID), FOREIGN KEY (ID) REFERENCES cars.ID, FOREIGN KEY (ID) REFERENCES Customers.ID, FOREIGN KEY (ID) REFERENCES Salespersons.ID);
ERROR 1239 (42000): Incorrect foreign key definition for 'foreign key without name': Key reference and table reference don't match
mysql> CREATE TABLE Invoices (ID int NOT NULL AUTO_INCREMENT, Invoice_Nbr int(50), Date DATE, PRIMARY KEY (ID));
Query OK, 0 rows affected, 1 warning (0.05 sec)

mysql> ALTER TABLE Invoices ADD FOREIGN KEY (ID) REFERENCES cars(ID);
Query OK, 0 rows affected (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE Invoices ADD FOREIGN KEY (ID) REFERENCES Customers(ID);
Query OK, 0 rows affected (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE Invoices ADD FOREIGN KEY (ID) REFERENCES Salespersons(ID);
Query OK, 0 rows affected (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>