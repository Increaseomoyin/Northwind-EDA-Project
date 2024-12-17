SELECT CompanyName
FROM products AS pd
JOIN suppliers AS sp
ON pd.SupplierID= sp.SupplierID
WHERE ProductID = 1;

SELECT LastName, FirstName 
FROM orders as o
JOIN employees as e
ON o.EmployeeID=e.EmployeeID
WHERE o.OrderID=10248;

SELECT CategoryID, COUNT(*)
FROM products
WHERE CategoryID =1
GROUP BY CategoryID;

SELECT  OrderID, SUM(UnitPrice*Quantity) AS TotalPrice
FROM `order details`
GROUP BY OrderID
HAVING OrderID = 10248;

-- NO NUMBER 5

SELECT CustomerID, COUNT(*)
FROM orders
WHERE CustomerID = 'ALFKI';

SELECT ProductID, ContactName
FROM products as p
JOIN suppliers as s
ON p.SupplierID=s.SupplierID
WHERE ProductID =1;

SELECT LastName,FirstName
FROM employees
WHERE EmployeeID='5';

SELECT  DISTINCT COUNT( CustomerID) AS `Number of Customers`
FROM customers;

SELECT  DISTINCT COUNT( EmployeeID) AS `Number of Employees`
FROM employees;

SELECT DISTINCT COUNT(*)
FROM orders;

-- I am skipping to 18

SELECT *
FROM shippers
WHERE ShipperID =2;

SELECT s.ShipperID, CompanyName
FROM orders as o
JOIN shippers as s
ON o.ShipVia=s.ShipperID
WHERE s.ShipperID=2
GROUP BY s.ShipperID;

SELECT CustomerID, Phone
FROM customers
WHERE CustomerID ='ANATR';


SELECT CustomerID, City
FROM customers
WHERE CustomerID='ANATR';

-- Skipped to no 31

SELECT YEAR(ShippedDate) AS years, SUM(UnitPrice * Quantity)
FROM orders AS o
JOIN `order details` AS od
ON o.OrderID=od.OrderID
WHERE ShippedDate LIKE '1997%'
GROUP BY years ;

SELECT ProductName, Discontinued
FROM products
WHERE Discontinued =1;

SELECT *
FROM products
WHERE UnitsOnOrder <> 0;

SELECT 
    S.CC,
    SUM(S.UnitsOnOrder) AS TotalUnits
FROM (
    SELECT 
        CASE
            WHEN UnitsOnOrder <> 0 THEN 'Calc'
            ELSE 'No Calc'
        END AS CC,
        UnitsOnOrder
    FROM 
        products
) AS S
GROUP BY 
    S.CC;
   
SELECT CustomerID, COUNT(*) AS ORDERS
FROM orders
GROUP BY CustomerID
ORDER BY ORDERS DESC
LIMIT 1;

SELECT DISTINCT CustomerID ,SUM(UnitPrice*Quantity)
FROM `order details` AS od
JOIN orders AS o
ON od.OrderID=o.OrderID
WHERE OrderDate LIKE '1998%'
GROUP BY CustomerID;

SELECT *
FROM
(SELECT *
FROM employees AS e
JOIN employeeterritories AS et
ON e.EmployeeID=et.EmployeeID) AS t1
JOIN territories AS t
ON t1.et.TerritoryID =t.TerritoryID;

SELECT DISTINCT e.EmployeeID, e.LastName, e.FirstName
FROM employees AS e
JOIN orders AS o
ON e.EmployeeID=o.EmployeeID 
JOIN customers AS c
ON o.CustomerID =c.CustomerID
WHERE c.Country='USA';

SELECT 
    AVG(DATEDIFF(ShippedDate, OrderDate)) AS average_days_to_ship
FROM 
    orders
WHERE 
    OrderDate IS NOT NULL 
    AND ShippedDate IS NOT NULL;

SELECT DISTINCT e.EmployeeID, e.LastName, e.FirstName
FROM employees AS e
JOIN orders AS o
ON e.EmployeeID=o.EmployeeID 
JOIN customers AS c
ON o.CustomerID =c.CustomerID
WHERE c.Country='Germany';

SELECT ProductID, AVG(UnitPrice)
FROM `order details`
GROUP BY ProductID
ORDER BY ProductID;

SELECT  ProductID,SUM(Quantity)
FROM orders AS o
JOIN `order details` AS od
ON o.OrderID=od.OrderID
WHERE OrderDate LIKE '1998%'
GROUP BY ProductID;

-- ANSWERING THE LAST 10 QUESTIONS (70-80)
-- 70
SELECT o.CustomerID, SUM(UnitPrice * Quantity) AS TotalRevenue
FROM orders AS o
JOIN `order details` AS od
ON o.OrderID=od.OrderID
WHERE YEAR(RequiredDate) ='1996'
GROUP BY o.CustomerID;
-- 71
SELECT DISTINCT e.LastName, e.FirstName
FROM orders AS o
JOIN employees AS e
ON o.EmployeeID=e.EmployeeID
WHERE YEAR(RequiredDate) ='1996';
-- 72
SELECT CategoryID, SUM(od.UnitPrice *od.Quantity) AS TotalQuantity
FROM products AS p
JOIN `order details` AS od
ON p.ProductID=od.ProductID
JOIN orders AS o
ON od.OrderID=o.OrderID
WHERE YEAR(OrderDate) ='1998'
GROUP BY CategoryID;
-- --------------------------------------------------------------------------73
SELECT DISTINCT ContactName
FROM orders AS o
JOIN customers AS c
ON o.CustomerID=c.CustomerID
WHERE YEAR(OrderDate) ='1996';
-- ----------------------------------------------------------------------------------------------------------------74
SELECT p.ProductID, SUM(Quantity)
FROM orders AS o
JOIN `order details` AS od
ON o.OrderID=od.OrderID
JOIN products AS p
ON od.ProductID=p.ProductID
WHERE YEAR(o.OrderDate) ='1998' AND Discontinued <> 1
GROUP BY p.ProductID;
--------------------------------------------------------------------------------------------------------------------------------























