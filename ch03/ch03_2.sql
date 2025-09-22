--과제 chapter03

SHOW DATABASES;

CREATE TABLE if NOT EXISTS a(
	num INT,
	NAME VARCHAR(10)
);

CREATE TABLE testNull(
	num INT,
	NAME VARCHAR(10)
);
SELECT * FROM testNull;

INSERT INTO testNull VALUES(1, '홍길동');
INSERT INTO testNull(num) VALUES(2);	
INSERT INTO testNull VALUES(3, '이순신');
INSERT INTO testNull VALUES(4, '춘향동');

-- name이 null
SELECT * FROM testNull
WHERE NAME IS NULL;
-- name이 null 아닐것.
SELECT * FROM testNull
WHERE NAME IS NOT NULL;