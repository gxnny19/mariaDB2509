-- joins
SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
FROM Orders
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;

SELECT * FROM customers;
SELECT * FROM orders;

-- inner join 테이블2개
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.CustomerName;

SELECT * FROM orders;
SELECT * FROM employees;

-- right join 테이블 2개
SELECT o.EmployeeID, e.EmployeeID, e.FirstName
FROM orders o
RIGHT JOIN employees e 
	ON o.EmployeeID = e.employeeID
ORDER BY o.EmployeeID;

SELECT * FROM customers;
SELECT * FROM orders;

-- cross join 테이블 2개
SELECT c.CustomerID, c.CustomerName, o.OrderID
FROM customers c
CROSS JOIN orders o
WHERE c.CustomerID = o.CustomerID;

-- self join 테이블 1개
SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City
FROM Customers A, Customers B
WHERE A.CustomerID <> B.CustomerID
AND A.City = B.City
ORDER BY A.City; 

-- union
SELECT * FROM customers;
SELECT * FROM suppliers;

SELECT city FROM customers
UNION
SELECT city FROM suppliers
ORDER BY city;

SELECT city, country FROM customers
WHERE country = 'germany'
union
SELECT city, country FROM suppliers
WHERE country = 'germany'
ORDER BY city;

SELECT 'Customer' AS Type, ContactName, City, Country
FROM customers
union
SELECT 'Supplier', ContactName, City, Country
FROM suppliers2;

-- uinon all
SELECT City, Country FROM Customers
WHERE Country='Germany'
UNION ALL
SELECT City, Country FROM Suppliers
WHERE Country='Germany'
ORDER BY City;