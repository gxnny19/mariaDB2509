CREATE DATABASE hrdtest2;
USE hrdtest2;

-- 1. 테이블을 생성하시오. (제약조건 포함)
CREATE TABLE employee (
   EmpNo INT PRIMARY KEY AUTO_INCREMENT,         
   EmpName VARCHAR(30) NOT NULL UNIQUE,                
   Dept VARCHAR(20) NOT NULL,                    
   HireDate DATE NOT NULL,                       
   Salary INT CHECK (Salary >= 2000000)          
);
DESC employee;

ALTER TABLE employee
ADD CONSTRAINT uq_empname UNIQUE (EmpName);

ALTER TABLE employee
ADD CONSTRAINT chk_salary CHECK (Salary >= 2000000);

USE hrdtest2;
CREATE DATABASE IF NOT EXISTS hrdtest2;

-- 2. SQL 문을 작성하시오.
-- (1) 사원 등록: Employee 테이블에 다음 데이터를 삽입하시오.
INSERT INTO employee (EmpName, Dept, HireDate, Salary)
VALUES 
('홍길동', '영업부', '2020-03-01', 2500000),
('이순신', '인사부', '2019-07-15', 3200000),
('강감찬', '개발부', '2021-01-10', 2800000);
SELECT * FROM employee;

-- (2) 조회:
-- 부서가 '개발부'인 사원의 사번, 이름, 급여를 조회하시오.
SELECT EmpNo, EmpName, Salary
FROM employee
WHERE Dept = '개발부';
-- 급여가 3,000,000원 이상인 사원의 이름과 부서를 조회하시오.
SELECT EmpName, Dept
FROM employee
WHERE Salary >= 3000000;

-- (3) 수정:
-- 이순신의 급여를 3,500,000원으로 수정하시오.
UPDATE employee
SET Salary = 3500000
WHERE EmpName = '이순신';

SELECT * FROM employee WHERE EmpName = '이순신';

-- (4) 삭제:
-- 사번이 1번인 사원의 정보를 삭제하시오.
DELETE FROM employee
WHERE EmpNo = 1;
SELECT * FROM employee;