-- ---<

SHOW DATABASE;
USE exdb;

SHOW TABLES;
SELECT * FROM persons;

-- 태이블 생성
CREATE TABLE Persons(
	id INT NOT NULL,
	lastname VARCHAR(255) NOT NULL,
	firstname VARCHAR(255) NOT NULL,
	age INT
);
DESCRIBE Persons;

-- 테이블 필드구조 수정
ALTER TABLE Persons; 
MODIFY age INT NOT NULL;
DESC Persons;

DROP TABLE persons;
SELECT * FROM persons;

--
CREATE TABLE Persons(
	id INT NOT NULL,
	lastname VARCHAR(255) NOT NULL,
	firstname VARCHAR(255),
	age INT,
	UNIQUE(id)
);
DESCRIBE Persons;

DROP TABLE Persons;
SELECT * FROM persons;

-- UNIQUE(id) : 1,2,3,... 즉 id 값이 중복안됨.
-- UNIQUE(id, lastname)
-- :id+lastname 두개의 필드값을 합친값이 중복안됨.
-- 1길동, 2길동, 3길동, 1지매, 2지매, 3지매, ... 중복가능
-- 
CREATE TABLE Persons(
	id INT NOT NULL,
	lastname VARCHAR(255) NOT NULL,
	firstname VARCHAR(255),
	age INT,
	CONSTRAINT UC_Person UNIQUE (ID,LastName)
);

DROP TABLE Persons;
SELECT * FROM persons;

CREATE TABLE Persons(
	id INT NOT NULL,
	lastname VARCHAR(255) NOT NULL,
	firstname VARCHAR(255),
	age INT
);
DESC Persons;

ALTER TABLE Persons
ADD UNIQUE(id);

DROP TABLE Persons;
SELECT * FROM persons;

CREATE TABLE Persons(
	id INT NOT NULL,
	lastname VARCHAR(255) NOT NULL,
	firstname VARCHAR(255),
	age INT
);
DESC Persons;

ALTER TABLE Persons
ADD CONSTRAINT UC_person UNIQUE (ID,LastName);


--  CONSTRANIT를 관리하는 방법: start ---
SHOW INDEX FROM Persons;

SELECT * 
FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Persons';





--  CONSTRANIT를 관리하는 방법: end ---

DROP TABLE Persons;
SELECT * FROM persons;

CREATE TABLE Persons(
	ID INT NOT NULL,
	LastName varchar(255) NOT NULL,
   FirstName varchar(255),
   Age int,
   CONSTRAINT PK_Person PRIMARY KEY (ID,LastName)
);
DESC persons;

ALTER TABLE Persons
ADD CONSTRAINT PK_Person PRIMARY KEY (ID,LastName);
DESC persons;

ALTER TABLE Persons
DROP PRIMARY KEY;

-- ---------------------
SELECT * FROM Person;
SELECT * FROM orders_f;

-- 인원표
CREATE TABLE Person_f(
	PersonID INT PRIMARY KEY,
	LastName VARCHAR(255),
   FirstName VARCHAR(255),
   Age INT
);
SELECT * FROM Person_f;

-- 주문표
CREATE TABLE orders_f(
	orderID INT NOT NULL,
	ordernumber INT NOT NULL,
	PersonID INT,
	PRIMARY KEY (OrderID),
   FOREIGN KEY (PersonID) REFERENCES Persons_f(PersonID)
);
SELECT * FROM orders_f;
DESC Person_f;
DESC orders_f;

-- constraint 등록
DROP TABLE orders_f;
DESC orders_f;

CREATE TABLE orders_f(
	orderID INT NOT NULL,
	ordernumber INT NOT NULL,
	PersonID INT,
	PRIMARY KEY (OrderID),
   CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID) REFERENCES Persons_f(PersonID)
);
SHOW INDEX FROM orders_f;

DROP TABLE orders_f;
CREATE TABLE orders_f(
	orderID INT NOT NULL,
	ordernumber INT NOT NULL,
	PersonID INT,
);
DESC orders_f;

ALTER TABLE orders_f
ADD FOREIGN KEY(PersonID) REFERENCES Person_f(PersonID);

ALTER TABLE orders_f
ADD CONSTRAINT FK_PersonOrder
FOREIGN KEY(PersonID) REFERENCES Person_f(PersonID);

SHOW INDEX FROM orders_f;

ALTER TABLE orders_f
DROP FOREIGN KEY FK_PersonOrder;

-- ---------------------------

DROP TABLE persons;

CREATE TABLE persons(
	ID int NOT NULL,
   LastName varchar(255) NOT NULL,
   FirstName varchar(255),
   Age int,
   CHECK (Age>=18)
);
DESC persons;
SHOW CREATE TABLE persons;

DROP TABLE persons;

CREATE TABLE Persons (
   ID INT NOT NULL,
   LastName varchar(255) NOT NULL,
   FirstName varchar(255),
   Age int,
   City varchar(255),
   CONSTRAINT CHK_Person CHECK (Age>=18 AND City='Sandnes')
);
-- show index from persons;
SHOW CREATE TABLE persons;

SELECT *
FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'persons';

DROP TABLE persons;
CREATE TABLE Persons (
   ID INT NOT NULL,
   LastName varchar(255) NOT NULL,
   FirstName varchar(255),
   Age int,
   City varchar(255),
);
DESC persons;

ALTER TABLE Persons
ADD CHECK (Age>=18);

SELECT *
FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'persons';

DROP TABLE persons;

ALTER TABLE Persons
ADD CONSTRAINT CHK_PersonAge CHECK (Age>=18 AND City='Sandnes');

ALTER TABLE Persons
DROP CONSTRAINT CHK_PersonAge;