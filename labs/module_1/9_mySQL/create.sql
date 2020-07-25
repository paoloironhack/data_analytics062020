USE lab_mysql;
CREATE TABLE Customers ( ID Int auto_increment , CustomerID VARCHAR(50) NOT NULL, Name VARCHAR(255) , Phone VARCHAR(20),Email VARCHAR(50),Address VARCHAR (255) , City VARCHAR(50),State VARCHAR (20),COUNTRY VARCHAR(20),Zipcode INT,primary key(ID));
CREATE TABLE Salespersons (ID Int auto_increment, EmployeeID VARCHAR(50) NOT NULL , Name VARCHAR(20) , Store VARCHAR(50),Primary Key (ID));
CREATE TABLE Cars ( ID Int auto_increment, VehicleID Varchar(50) NOT NULL, Manufacturer VARCHAR(255), MODEL VARCHAR(20) , YEAR INT , COLOR VARCHAR(10), Primary Key(ID));
CREATE TABLE Invoices ( ID Int auto_increment ,InvoiceNumber Int NOT NULL , DATE date, VehicleID varchar(50) , CustomerID VARCHAR(50), EmployeeID VARCHAR(50),Primary key(ID), Foreign Key(ID) references Cars(ID),Foreign Key(ID) references Customers(ID),Foreign Key(ID) references Salespersons(ID))ENGINE InnoDB;













