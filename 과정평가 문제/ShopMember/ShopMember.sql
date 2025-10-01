USE hrdtest3;

-- 1. 테이블을 생성하시오. (제약조건 포함)
CREATE TABLE ShopMember (
   CustNo INT AUTO_INCREMENT PRIMARY KEY,          
   CustName VARCHAR(30) NOT NULL,                  
   Phone VARCHAR(13) UNIQUE,                       
   Address VARCHAR(50),                            
   JoinDate DATE NOT NULL,                        
   Grade CHAR(1) NOT NULL CHECK (Grade IN ('A','B','C')), 
   City CHAR(2)                                    
);
DESC shopmember;

-- 2. SQL 문을 작성하시오.
-- (1) 회원 등록: ShopMember 테이블에 다음 데이터를 삽입하시오.
INSERT INTO ShopMember (CustName, Phone, Address, JoinDate, Grade, City)
VALUES 
('홍길동', '010-1234-5678', '서울시 강남구', '2020-01-01', 'A', '01'),
('이순신', '010-2222-3333', '부산시 해운대구', '2021-03-15', 'B', '02'),
('강감찬', '010-7777-8888', '대구시 달서구', '2019-05-20', 'C', '03');
SELECT * FROM shopmember;

-- (2) 회원 조회
-- 고객등급이 A등급인 회원의 이름, 전화번호, 가입일자를 조회.
SELECT CustName, Phone, JoinDate
FROM ShopMember
WHERE Grade = 'A';
-- 가입일자가 2020년 이후인 회원을 조회하시오.
SELECT *
FROM ShopMember
WHERE JoinDate >= '2020-01-01';


-- (4) 판매 조회
-- 회원별 총 구매금액을 구하시오.
SELECT s.CustNo, m.CustName, SUM(s.Price) AS TotalPrice
FROM Sale s
JOIN ShopMember m ON s.CustNo = m.CustNo
GROUP BY s.CustNo, m.CustName;
-- 가장 구매금액이 높은 회원의 이름과 금액을 조회하시오.
SELECT m.CustName, SUM(s.Price) AS TotalPrice
FROM Sale s
JOIN ShopMember m ON s.CustNo = m.CustNo
GROUP BY m.CustName
ORDER BY TotalPrice DESC
LIMIT 1;


-- (5) 데이터 수정 / 삭제
-- '이순신' 회원의 등급을 A로 수정하시오.
UPDATE ShopMember
SET Grade = 'A'
WHERE CustName = '이순신';
-- CustNo = 3 인 회원을 삭제하시오.
DELETE FROM ShopMember
WHERE CustNo = 3;

SELECT * FROM ShopMember;