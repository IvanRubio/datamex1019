CREATE TABLE IF NOT EXISTS cars (
ID int(5) NOT NULL AUTO_INCREMENT,
vin varchar(45) NOT NULL,
manufacturer varchar(45) DEFAULT NULL,
model varchar(45) DEFAULT NULL,
year int(4) DEFAULT NULL,
color varchar(15) DEFAULT NULL,
fk_invoice int NOT NULL,
Foreign Key(fk_invoice) references invoices(ID),
PRIMARY KEY(ID)
);


CREATE TABLE IF NOT EXISTS customers (
ID int(5) NOT NULL AUTO_INCREMENT,
customerID int(10) NOT NULL,
name varchar(45) DEFAULT NULL,
phone int(20) DEFAULT NULL,
email varchar(40) DEFAULT NULL,
address varchar(100) DEFAULT NULL,
city varchar(15) DEFAULT NULL,
state varchar(15) DEFAULT NULL,
country varchar(15) DEFAULT NULL,
zipcode int(5) DEFAULT NULL,
PRIMARY KEY(ID)
);


CREATE TABLE IF NOT EXISTS salespersons (
ID int(5) NOT NULL AUTO_INCREMENT,
staffID int(10) NOT NULL,
name varchar(45) DEFAULT NULL,
store varchar(40) DEFAULT NULL,
PRIMARY KEY(ID)
);


CREATE TABLE IF NOT EXISTS invoices (
ID int(5) NOT NULL AUTO_INCREMENT,
invoiceID int(15) NOT NULL,
date DATE DEFAULT NULL,
car int NOT NULL,
fk_customer int NOT NULL,
fk_staff int NOT NULL,
Foreign Key(fk_customer) references customers(ID),
Foreign Key(fk_staff) references salespersons(ID),
PRIMARY KEY(ID)
);



