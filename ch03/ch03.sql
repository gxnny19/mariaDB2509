-- 과제 챕터03

SHOW DATABASES;
CREATE DATABASE shopDB;
USE shopDB;
SHOW TABLES;

CREATE TABLE memberTBL(
	memberID CHAR(8) NOT NULL,
	memberName CHAR(15) NOT NULL,
	memberAddress CHAR(60)
);

CREATE TABLE productTBL(
	productName CHAR(12) NOT NULL,
	COST INT NOT NULL,
	MAKEDATE DATE,
	company CHAR(15),
	AMOUNT INT NOT null
);

SELECT * FROM membertbl;
DESC membertbl;

SELECT * FROM productTBL;
DESC producttbl;	