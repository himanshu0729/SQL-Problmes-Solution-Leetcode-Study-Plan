====================                         DAY 1 (SELECT)           

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
    
====================                        DAY 2 (SELECT AND ORDER)

Solution 1 

SELECT employee_id, 
    CASE 
WHEN employee_id % 2 = 1 AND name NOT LIKE 'M%' then salary
ELSE 0
    END
AS bonus FROM Employees ORDER BY employee_id;

Solution 2

UPDATE salary
SET sex = (CASE WHEN sex = "m" 
                THEN "f" 
                ELSE "m"
          END)

Solution 3 

DElETE FROM Person WHERE id NOT IN (
    SELECT did FROM (SELECT MIN(id) AS did FROM Person GROUP BY email
) AS C
);

====================                        DAY 3 (String Processing Functions)

Solution 1 

SELECT user_id, CONCAT( UPPER(SUBSTR(name, 1, 1)), LOWER(SUBSTR(name, 2, LENGTH(name)-1)) ) AS name
FROM Users 
ORDER BY user_id;

Solution 2 

SELECT sell_date, COUNT(DISTINCT(product)) AS num_sold, GROUP_CONCAT(DISTINCT(product)) AS products 
FROM Activities
GROUP BY sell_date 
ORDER BY sell_date;

Solution 3 

SELECT patient_id, patient_name, conditions 
FROM Patients
WHERE conditions LIKE 'DIAB1%' OR conditions LIKE '% DIAB1%';

====================                        DAY 4 (Union & Select)

Solution 1

SELECT employee_id 
FROM Employees 
WHERE employee_id NOT IN (SELECT employee_id FROM Salaries) 
UNION
SELECT employee_id
FROM Salaries 
WHERE employee_id NOT IN (SELECT employee_id FROM Employees) 
ORDER BY employee_id;

Solution 2 

SELECT product_id, store, price 
FROM 
(SELECT product_id, 'store1' AS store, store1 AS price From Products
UNION
SELECT product_id, 'store2' AS store, store2 AS price From Products
UNION
SELECT product_id, 'store3' AS store, store3 AS price From Products) AS Store
WHERE price IS NOT NULL;

Solution 3 

SELECT id, 
CASE 
WHEN p_id IS NULL THEN 'Root' 
WHEN id IN (SELECT p_id FROM Tree) THEN 'Inner'
ELSE 'Leaf'
END AS type 
FROM Tree;

Solution 4

SELECT 
(SELECT DISTINCT salary FROM Employee 
ORDER BY salary DESC LIMIT 1 OFFSET 1) AS SecondHighestSalary;

====================                        DAY 5 (Union)

Solution 1

SELECT Person.firstName, Person.lastName, Address.city, Address.state
FROM Person Left JOIN Address USING(personId);

Solution 2 

SELECT Visits.customer_id, COUNT(*) AS count_no_trans 
FROM Visits LEFT JOIN Transactions ON Visits.visit_id = Transactions.visit_id 
WHERE Transactions.transaction_id IS NULL 
GROUP BY Visits.customer_id 
ORDER BY count_no_trans DESC;

Solution 3 

SELECT DISTINCT(author_id) AS id 
FROM Views 
WHERE author_id = viewer_id 
ORDER BY id;

====================                    DAY 6 (Union)

Solution 1 

SELECT A.id 
FROM Weather A INNER JOIN Weather B ON DATE_SUB(A.recordDate, INTERVAL 1 DAY) = B.recordDate
WHERE A.temperature > B.temperature
ORDER BY Id;

Solution 2 

SELECT name FROM SalesPerson 
WHERE sales_id NOT IN (
  SELECT sales_id FROM Orders
  INNER JOIN Company 
  ON Orders.com_id = Company.com_id
  WHERE Company.name = "RED"
);

====================                      DAY 7 (Function)

Solution 1

SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users 
FROM Activity 
WHERE activity_date BETWEEN  DATE_SUB('2019-07-27', INTERVAL 29 DAY) AND '2019-07-27'
GROUP BY activity_date;

Solution 2

SELECT date_id, make_name, COUNT(DISTINCT(lead_id)) AS unique_leads, COUNT(DISTINCT(partner_id)) AS unique_partners
FROM DailySales
GROUP BY date_id, make_name;

Solution 3 

SELECT user_id, COUNT(follower_id) AS followers_count 
FROM Followers
GROUP BY user_id
ORDER BY user_id;

====================                      DAY 8 (Function) 

Solution 1 

SELECT customer_number
FROM Orders 
GROUP BY customer_number
ORDER BY COUNT(order_number) DESC
LIMIT 1;

Solution 2 

SELECT player_id, MIN(event_date) AS first_login
FROM Activity 
GROUP BY player_id
ORDER BY player_id;

Solution 3 

SELECT user_id, MAX(time_stamp) AS last_stamp
FROM Logins 
WHERE YEAR(time_stamp) = '2020'
GROUP BY user_id;

Solution 4 

SELECT event_day AS day, emp_id, SUM(out_time - in_time) AS total_time
FROM Employees
GROUP BY event_day, emp_id;

====================                      DAY 9 (Control of Flow)

Solution 1

SELECT stock_name, (SUM(if(operation = 'Sell', price, 0))  -  SUM(if(operation = 'Buy', price, 0))) AS  capital_gain_loss 
FROM Stocks
GROUP BY stock_name;

----------

SELECT stock_name,
SUM(
    CASE 
        WHEN operation = 'Buy' THEN -price
        ELSE price
    END 
) AS capital_gain_loss
FROM Stocks
GROUP By stock_name;

Solution 2 

SELECT Users.name, if(SUM(distance) IS NULL, 0, SUM(distance))AS travelled_distance
FROM Users LEFT JOIN Rides 
ON Users.id = Rides.user_id
GROUP BY Users.id
ORDER BY travelled_distance DESC, Users.name;

-----------

SELECT Users.name, ifnull(SUM(distance), 0) AS travelled_distance
FROM Users LEFT JOIN Rides 
ON Users.id = Rides.user_id
GROUP BY Users.id
ORDER BY travelled_distance DESC, Users.name;

Solution 3 

select u.user_id as buyer_id,join_date,ifnull(count(order_id),0) as orders_in_2019
from Users u left join Orders o
on u.user_id = o.buyer_id
where year(order_date)='2019'
group by u.user_id



SELECT u.user_id as buyer_id,
u.join_date,
ifnull(count(o.order_id),0) as orders_in_2019
from users u
left join orders o
on u.user_id = o.buyer_id
and year(o.order_date) = '2019'
group by u.user_id 


#Be careful if you use where in join here you would lose the Null occurence of orders thus zero number of orders won't show up in the final table.

#The upper one is wrong because although left join table first but the where clause will eliminate the 2019 orders. i.e. no 3 and 4 on the output.

#instead the lower one is correct. the year codition in on the join clause there will have no orders for buyer 3 and 4 but since it is left join the user 3 and 4 are still in the user table.




 ====================                       DAY 10 ()

Solution 1
Solution 2 
Solution 3 
Solution 4
