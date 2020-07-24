{\rtf1\ansi\ansicpg1252\cocoartf2513
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;\red27\green31\blue34;\red244\green246\blue249;\red0\green0\blue0;
}
{\*\expandedcolortbl;;\cssrgb\c14118\c16078\c18039;\cssrgb\c96471\c97255\c98039;\csgray\c0;
}
\paperw11900\paperh16840\margl1440\margr1440\vieww25400\viewh16000\viewkind0
\deftab720
\pard\tx6461\pardeftab720\sl380\partightenfactor0

\f0\fs27\fsmilli13600 \cf2 \cb3 \expnd0\expndtw0\kerning0
USE lab_mysql;\
\pard\tx6461\pardeftab720\pardirnatural\partightenfactor0

\fs22 \cf4 \cb1 \kerning1\expnd0\expndtw0 \CocoaLigature0  CREATE TABLE Cars\
     (\
     ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,\
     VIN int(20) NOT NULL,\
     Manufacturer VARCHAR(255),\
     Model VARCHAR(255),\
     Year Year,\
     Colour Varchar(255)\
     );\
\
Create Table Customers\
    (\
     ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,\
     Customer_ID Int(20) NOT NULL,\
     Name VARCHAR(255),\
     Email VARCHAR(255),\
     Address VARCHAR(255),\
     City VARCHAR(255),\
     State_Province VARCHAR(255),\
     ZIP_Code Int(10)\
     );\
\
CREATE TABLE Salespersons\
     (\
     ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,\
     Employee_ID INT(20)NOT NULL,\
     Name VARCHAR(255),\
     Store VARCHAR(255)\
     );\
\
 CREATE TABLE Invoices\
     (\
     ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,\
     Invoice_Nr INT(20) NOT NULL,\
     Date DATE,\
     Car INT,\
     Customer INT,\
     Salesperson INT\
     );\
\
}