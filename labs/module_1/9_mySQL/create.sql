USE lab_mysql;
 CREATE TABLE Cars
     (
     ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
     VIN int(20) NOT NULL,
     Manufacturer VARCHAR(255),
     Model VARCHAR(255),
     Year Year,
     Colour Varchar(255)
     );

Create Table Customers
    (
     ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
     Customer_ID Int(20) NOT NULL,
     Name VARCHAR(255),
     Email VARCHAR(255),
     Address VARCHAR(255),
     City VARCHAR(255),
     State_Province VARCHAR(255),
     ZIP_Code Int(10)
     );

CREATE TABLE Salespersons
     (
     ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
     Employee_ID INT(20)NOT NULL,
     Name VARCHAR(255),
     Store VARCHAR(255)
     );

 CREATE TABLE Invoices
     (
     ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
     Invoice_Nr INT(20) NOT NULL,
     Date DATE,
     Car INT,
     Customer INT,
     Salesperson INT
     );
