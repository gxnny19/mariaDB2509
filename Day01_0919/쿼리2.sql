SHOW DATABASES;
USE employees;
SHOW TABLES;

SELECT * FROM employees;
SELECT first_name FROM employees;
SELECT first_name, last_name FROM employees;
SELECT first_name, last_name, gender FROM employees;

DESCRIBE employees;

SELECT first_name AS 이름, gender AS 성별, hire_date AS '회사 입사일' 
FROM employees;

-- 유저 테이블 생성
DROP TABLE IF EXISTS buyTb1;
DROP TABLE IF EXISTS userTb;
CREATE TABLE userTb
(
    userID CHAR(8) NOT NULL PRIMARY KEY,
    userNAME VARCHAR(20) NOT NULL,
    birthYear INT NOT NULL,
    addr VARCHAR(10) NOT NULL,  
    mobile1 CHAR(3),
    mobile2 CHAR(8),
    height SMALLINT,
    mDate DATE
);
CREATE TABLE buyTb1
( 
num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
userID CHAR(8) NOT NULL,
prodName VARCHAR(20) NOT NULL,
groupName VARCHAR(10) ,
price INT NOT NULL,
amount SMALLINT NOT NULL,
FOREIGN KEY (userID) REFERENCES userTb(userID)
);

-- userTb 데이터 삽입
INSERT INTO userTb VALUES('LSG', '이승기', 1987, '서울', '011', '11111111', 182, '2008-08-08');
INSERT INTO userTb VALUES('KBS', '김범수', 1979, '경남', '011', '22222222', 173, '2012-04-04');
INSERT INTO userTb VALUES('KKH', '김경호', 1971, '전남', '019', '33333333', 177, '2007-07-07');
INSERT INTO userTb VALUES('JYP', '조용필', 1950, '경기', '011', '44444444', 166, '2009-04-04');
INSERT INTO userTb VALUES('SSK', '성시경', 1979, '서울', NULL, NULL, 186, '2013-12-12');

INSERT INTO buyTb1 VALUES(NULL, 'KBS', '운동화', NULL, 30, 2);
INSERT INTO buyTb1 VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1);
INSERT INTO buyTb1 VALUES(NULL, 'JYP', '모니터', '전자', 200, 1);
INSERT INTO buyTb1 VALUES(NULL, 'KKH', '모니터', '전자', 200, 5);
INSERT INTO buyTb1 VALUES(NULL, 'KBS', '청바지', '의류', 50, 3);
INSERT INTO buyTb1 VALUES(NULL, 'JYP', '메모리', '전자', 80, 10);

-- 결과 확인
SELECT * FROM usertb;
SELECT * FROM buyTb1;

SELECT DATABASE();
SHOW TABLES;

