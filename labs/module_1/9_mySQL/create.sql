USE lab_mysql;
 CREATE TABLE Cars
     (
     ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
     VIN int(20) NOT NULL,
# why are you using the name VIN?
     Manufacturer VARCHAR(255),
# 
I see students copying,  VARCHAR(255), for every field. As a database designer you really have to think on the type ((int, varchar)) and on how much space each field takes. Why? Because this scales up to the nr of records.  Using an unnecessarily long field takes loads of storage that is never used, and thats a waste of server storage (end environment). (e.g. for e-mail adres and home adres 50 chars will do the job, that's 80% reduction!
     Model VARCHAR(255),
     Year Year,

# proud of you that you used the datatype year! great job

     Colour Varchar(255)
     );

Create Table Customers
    (
     ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
# yes very well done, that is how an ID field should be defined!
     Customer_ID Int(20) NOT NULL,
# tip, work more punctual, more consistency, e.g. if you use capital letters for the datatypes like INT
# then do it everywhere like that
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
# always specify how many digits the int can contain
so INT(A NUMBER)
     Customer INT,
     Salesperson INT
     );

# i miss you specifying foreign keys, I advice this resource to read:
https://www3.ntu.edu.sg/home/ehchua/programming/sql/MySQL_Beginner.html

# for the rest you did a great job!!!


