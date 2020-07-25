create database lab_mysql;
use lab_mysql;


CREATE TABLE `Cars` (
  `ID` int(6) AUTO_INCREMENT primary key,
  `VIN` varchar(255) NOT NULL,
  `Manufacturer` varchar(40) DEFAULT NULL,
  `Model` varchar(40) DEFAULT NULL,
  `Year` int(4) DEFAULT NULL,
  `color` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `Customers` (
  `ID` int(6) AUTO_INCREMENT primary key,
  `Customer ID` int(5) NOT NULL,
  `Name` varchar(60) NOT NULL,
  `Phone` VARCHAR(40) DEFAult null, 
  `Email` varchar(40) DEFAULT NULL,
  `Address` VARCHAR(60) DEFAult null, 
  `City` varchar(60) DEFAULT NULL,
  `State/Province` varchar(60) DEFAULT NULL,
  `Postal` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/* INSERT INTO `Cars` */

CREATE TABLE `Salespersons` (
  `ID` int(6) AUTO_INCREMENT primary key,
  `Staff ID` int(5) NOT NULL,
  `Name` varchar(60) NOT NULL,
  `Store` VARCHAR(40) DEFAult null
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Invoices` (
  `ID` int(6) AUTO_INCREMENT primary key,
  `Invoice Number` int(9) NOT NULL,
  `Date` varchar(10) NOT NULL,
  `Car` int(4) NOT NULL,
  `Customer` int(4) NOT NULL,
  `Sales Person` int(4) NOT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/* drop database Lukas; */