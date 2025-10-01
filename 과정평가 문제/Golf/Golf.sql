CREATE DATABASE hrdtest5;
USE hrdtest5;

-- GolfMember (회원) 테이블
CREATE TABLE GolfMember (
   MNo      INT AUTO_INCREMENT PRIMARY KEY,      
   MName    VARCHAR(30) NOT NULL,                
   Phone    VARCHAR(13) UNIQUE,                  
   JoinDate DATE NOT NULL,                       
   Grade    CHAR(1) NOT NULL,                   
   CONSTRAINT chk_golfmember_grade 
   CHECK (Grade IN ('A','B','C'))            
) ENGINE=InnoDB;
DESC GolfMember;


-- Lesson (강습) 테이블
CREATE TABLE Lesson (
   LNo       INT AUTO_INCREMENT PRIMARY KEY,        
   MNo       INT NOT NULL,                          
   Coach     VARCHAR(30) NOT NULL,                  
   StartDate DATE NOT NULL,                         
   Fee       INT DEFAULT 0 CHECK (Fee >= 0),        
    
   CONSTRAINT fk_lesson_member
   FOREIGN KEY (MNo) REFERENCES GolfMember(MNo)
   ON DELETE CASCADE
   ON UPDATE CASCADE
) ENGINE=InnoDB;
DESC Lesson;


-- Usage (연습장 이용내역) 테이블
CREATE TABLE USAGE1 (
   UNo   INT AUTO_INCREMENT PRIMARY KEY,        
   MNo   INT NOT NULL,                          
   UDate DATE NOT NULL,                         
   Time  INT NOT NULL CHECK (Time > 0),         
   Cost  INT DEFAULT 0 CHECK (Cost >= 0),       

   CONSTRAINT fk_usage_member
   FOREIGN KEY (MNo) REFERENCES GolfMember(MNo)
   ON DELETE CASCADE
   ON UPDATE CASCADE
) ENGINE=InnoDB;
DESC USAGE1;


-- 2. SQL 문을 작성하시오.
-- (1) 회원 등록:
INSERT INTO GolfMember (MName, Phone, JoinDate, Grade)
VALUES 
('홍길동', '010-1111-2222', '2020-01-01', 'A'),
('이순신', '010-3333-4444', '2021-05-10', 'B'),
('강감찬', '010-5555-6666', '2022-03-15', 'C');

SELECT * FROM GolfMember;

-- (2) 강습 등록:
INSERT INTO Lesson (MNo, Coach, StartDate, Fee)
VALUES
(1, '김프로', '2020-02-01', 300000),
(2, '박프로', '2021-06-01', 250000),
(3, '이프로', '2022-04-01', 200000);

SELECT * FROM Lesson;

-- (3) 이용내역 등록:
INSERT INTO Usage1 (MNo, UDate, Time, Cost)
VALUES
(1, '2020-02-10', 120, 24000),
(2, '2021-06-15', 90, 18000),
(3, '2022-04-20', 150, 30000);

SELECT * FROM Usage1;


-- (4) 조회:
-- A등급 회원의 이름, 전화번호, 가입일자를 조회.
SELECT MName, Phone, JoinDate
FROM GolfMember
WHERE Grade = 'A';
-- 강습비가 250,000 이상인 강습 내역
SELECT * 
FROM Lesson
WHERE Fee >= 250000;
-- 회원별 총 이용요금 (회원명, 총요금)
SELECT g.MName, SUM(u.Cost) AS TotalCost
FROM Usage1 u
JOIN GolfMember g ON u.MNo = g.MNo
GROUP BY g.MName;


-- (5) 수정:
-- 이순신 회원의 등급을 'A'로 수정
UPDATE GolfMember
SET Grade = 'A'
WHERE MName = '이순신';

SELECT * FROM GolfMember;


-- (5) 삭제:
-- MNo = 3 인 회원을 삭제
DELETE FROM GolfMember
WHERE MNo = 3;

SELECT * FROM GolfMember;


-- ** 확장 문제 (심화) **
-- “등급별 통계”
-- (등급, 회원 수, 평균 강습비, 총 이용요금)을 조회
SELECT 
   g.Grade AS 등급,
   COUNT(DISTINCT g.MNo) AS 회원수,
   COALESCE(AVG(l.Fee), 0) AS 평균강습비,
   COALESCE(SUM(u.Cost), 0) AS 총이용요금
FROM GolfMember g
LEFT JOIN Lesson l ON g.MNo = l.MNo
LEFT JOIN Usage1 u ON g.MNo = u.MNo
GROUP BY g.Grade;






