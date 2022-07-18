                                                                                     DAY 1
Solution 1

SELECT name, population, area
FROM World
WHERE area >= 3000000

UNION

SELECT name, population, area
FROM World
WHERE population >= 25000000;

Solution 2 

SELECT product_id
FROM Products
WHERE low_fats = 'Y' 
    AND recyclable ='Y';

Solution 3 

SELECT name 
FROM Customer 
WHERE referee_id != 2
    OR referee_id IS NULL;

Solution 4 

SELECT name 
AS Customers
FROM Customers
WHERE id 
NOT IN (SELECT customerId 
    FROM Orders);
    
    
