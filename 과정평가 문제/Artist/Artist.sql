CREATE DATABASE hrdtest4;
USE hrdtest4;

-- 1. 테이블을 생성하시오.
CREATE TABLE Artist (
   ArtistNo   INT AUTO_INCREMENT PRIMARY KEY,   
   ArtistName VARCHAR(30) NOT NULL UNIQUE,      
   DebutDate  DATE NOT NULL,                    
   Genre      VARCHAR(20) NOT NULL,             
   Agency     VARCHAR(30)                       
);
DESC artist;

CREATE TABLE Album (
   AlbumNo     INT AUTO_INCREMENT PRIMARY KEY,   
   ArtistNo    INT NOT NULL,                     
   AlbumTitle  VARCHAR(50) NOT NULL,             
   ReleaseDate DATE NOT NULL,                    
   Sales       INT DEFAULT 0 CHECK (Sales >= 0), 

   CONSTRAINT fk_album_artist
   FOREIGN KEY (ArtistNo) 
   REFERENCES Artist(ArtistNo)
   ON DELETE CASCADE
   ON UPDATE CASCADE
);
DESC Album;

-- 2. SQL 문을 작성하시오.
-- (1) 아티스트 등록:
INSERT INTO Artist (ArtistName, DebutDate, Genre, Agency)
VALUES 
('아이유', '2008-09-18', '발라드', 'EDAM엔터테인먼트'),
('BTS', '2013-06-13', 'K-POP', '하이브'),
('블랙핑크', '2016-08-08', 'K-POP', 'YG엔터테인먼트');
SELECT * FROM artist;
-- (2) 앨범 등록:
INSERT INTO Album (ArtistNo, AlbumTitle, ReleaseDate, Sales)
VALUES 
(1, '좋은 날', '2010-12-09', 500000),
(2, 'MAP OF THE SOUL: 7', '2020-02-21', 4300000),
(3, 'THE ALBUM', '2020-10-02', 1300000);
SELECT * FROM Album;


-- (3) 조회:
-- 장르가 'K-POP'인 아티스트의 이름과 소속사를 조회.
SELECT ArtistName, Agency
FROM Artist
WHERE Genre = 'K-POP';
-- 판매량이 1,000,000 이상인 앨범의 제목과 판매량을 조회.
SELECT AlbumTitle, Sales
FROM Album
WHERE Sales >= 1000000;
-- 아티스트별 총 판매량을 구하시오.
SELECT a.ArtistName, SUM(al.Sales) AS TotalSales
FROM Album al
JOIN Artist a ON al.ArtistNo = a.ArtistNo
GROUP BY a.ArtistName;



-- (4) 수정:
-- '아이유'의 소속사를 '카카오엔터테인먼트'로 수정하시오.
UPDATE Artist
SET Agency = '카카오엔터테인먼트'
WHERE ArtistName = '아이유';
SELECT * FROM artist;


-- (5) 삭제:
-- AlbumNo = 1 인 앨범을 삭제하시오.
DELETE FROM Album
WHERE AlbumNo = 1;
SELECT * FROM Album;


-- ** 확장 문제 (심화) **
-- “소속사별 매출현황”
-- (소속사, 아티스트 수, 총 판매량)을 조회.
SELECT 
   a.Agency AS 소속사,
   COUNT(DISTINCT a.ArtistNo) AS 아티스트수,
   COALESCE(SUM(al.Sales), 0) AS 총판매량
FROM Artist a
LEFT JOIN Album al ON a.ArtistNo = al.ArtistNo
GROUP BY a.Agency;
