CREATE DATABASE hrdtest;
SHOW DATABASES;

DROP TABLE IF EXISTS Book;
DROP TABLE IF EXISTS Rental;
DROP TABLE IF EXISTS Member;

CREATE TABLE Book(
	BookID INT AUTO_INCREMENT PRIMARY KEY,      
   Title VARCHAR(255) NOT NULL,               
   Author VARCHAR(255),                         
   Publisher VARCHAR(255),                     
   Price INT CHECK (Price >= 0),     
   PubYear CHAR(4) 
);
DESC Book;
SELECT * FROM Book;
ALTER TABLE Book
MODIFY Price INT CHECK (Price >= 0);



CREATE TABLE Rental (
   RentalID INT AUTO_INCREMENT PRIMARY KEY,        
   MemberID INT NOT NULL,                          
   BookID INT NOT NULL,                            
   RentDate DATE NOT NULL,                         
   ReturnDate DATE,                               
   FOREIGN KEY (MemberID) REFERENCES Member(MemberID),
   FOREIGN KEY (BookID) REFERENCES Book(BookID)
);
DESC Rental;

CREATE TABLE Member (
   MemberID INT AUTO_INCREMENT PRIMARY KEY,   
   Name VARCHAR(100) NOT NULL,              
   Phone VARCHAR(20),                        
   Address VARCHAR(255)                       
);
DESC Member;

INSERT INTO Member (Name, Phone, Address) VALUES
('홍길동', '010-1111-1111', '서울시 강남구'),
('김철수', '010-2222-2222', '서울시 마포구'),
('이영희', '010-3333-3333', '서울시 서초구');

INSERT INTO Book (Title, Author, Publisher, Price, PubYear) VALUES
('SQL 기본서', '임정원', '한빛', 25000, '2021'),
('자바 완전정복', '김현수', '길벗', 32000, '2020'),
('파이썬 입문', '이예지', '위키북스', 28000, '2019'),
('HTML/CSS 디자인', '박민수', '정보문화사', 22000, '2022'),
('자료구조와 알고리즘', '임정원', '한빛', 35000, '2021');

UPDATE Book
SET Author = '임정원'
WHERE Title = 'SQL 기본서';

UPDATE Book
SET Author = '김현수'
WHERE Title = '자바 완전정복';

UPDATE Book
SET Author = '이예지'
WHERE Title = '파이썬 입문';

UPDATE Book
SET Author = '박민수'
WHERE Title = 'HTML/CSS 디자인';

UPDATE Book
SET Author = '임정원'
WHERE Title = '자료구조와 알고리즘';


INSERT INTO Rental (MemberID, BookID, RentDate, ReturnDate) VALUES
(1, 1, '2023-09-01', '2023-09-10'), 
(2, 2, '2023-09-05', NULL),           
(3, 3, '2023-09-07', '2023-09-15'),   
(1, 5, '2023-09-10', NULL),           
(2, 4, '2023-09-12', '2023-09-20');


-- 1) 2020년 이후 출판된 도서를 검색하시오.
SELECT *
FROM Book
WHERE PubYear >= '2020';

-- 2) ‘홍길동’ 회원이 대출한 도서 목록을 출력하시오.
SELECT m.Name AS MemberName, b.BookID, b.Title, b.Publisher, b.Price, r.RentDate, r.ReturnDate
FROM Rental r
JOIN Member m ON r.MemberID = m.MemberID
JOIN Book b ON r.BookID = b.BookID
WHERE m.Name = '홍길동';


-- 3) 반납하지 않은 도서를 검색하시오.
SELECT r.RentalID, m.Name AS MemberName, b.Title AS BookTitle, r.RentDate
FROM Rental r
JOIN Member m ON r.MemberID = m.MemberID
JOIN Book b ON r.BookID = b.BookID
WHERE r.ReturnDate IS NULL;

-- 4) 도서별 대출 횟수를 출력하시오.
SELECT b.BookID, b.Title, COUNT(r.RentalID) AS RentalCount
FROM Book b
LEFT JOIN Rental r ON b.BookID = r.BookID
GROUP BY b.BookID, b.Title
ORDER BY RentalCount DESC;

-- 5) 가격이 가장 비싼 도서를 출력하시오.
SELECT *
FROM Book
WHERE Price = (SELECT MAX(Price) FROM Book)
LIMIT 1;