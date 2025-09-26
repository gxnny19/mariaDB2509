SHOW DATABASES;
USE exdb;
SHOW TABLES;

DROP TABLE suppliers;
CREATE TABLE Suppliers(
	SupplierID INT,
	SupplierName VARCHAR(50),
	ContactName	VARCHAR(20),
	Address VARCHAR(50),
	City VARCHAR(20),	
	PostalCode VARCHAR(20),	
	Country VARCHAR(20),	
	Phone VARCHAR(20)
);

SELECT * FROM Suppliers;