USE hrdtest3;

CREATE TABLE Sale (
   SaleNo INT AUTO_INCREMENT PRIMARY KEY, 
   CustNo INT NOT NULL,                   
   PCost INT NOT NULL,                    
   Amount INT NOT NULL,                  
   Price INT NOT NULL,                    
   PCode CHAR(3) NOT NULL,                
    
   CONSTRAINT fk_sale_customer
   FOREIGN KEY (CustNo) REFERENCES ShopMember(CustNo) 
);
DESC sale;

INSERT INTO Sale (CustNo, PCost, Amount, Price, PCode)
VALUES 
(1, 1000, 10, 10000, 'P01'),
(2, 2000, 5, 10000, 'P02'),
(3, 1500, 7, 10500, 'P03');
SELECT * FROM sale;

DELETE FROM Sale
WHERE CustNo = 3;

SELECT * FROM sale;