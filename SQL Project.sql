
--------------------------SQL Project----------------------------------------------------
create database Customers_Orders_Products 

CREATE TABLE Customers (CustomerID INT PRIMARY KEY, Name VARCHAR(50), Email VARCHAR(100))
select * from Customers
INSERT INTO Customers (CustomerID, Name, Email)
VALUES
  (1, 'John Doe', 'johndoe@example.com'),
  (2, 'Jane Smith', 'janesmith@example.com'),
  (3, 'Robert Johnson', 'robertjohnson@example.com'),
  (4, 'Emily Brown', 'emilybrown@example.com'),
  (5, 'Michael Davis', 'michaeldavis@example.com'),
  (6, 'Sarah Wilson', 'sarahwilson@example.com'),
  (7, 'David Thompson', 'davidthompson@example.com'),
  (8, 'Jessica Lee', 'jessicalee@example.com'),
  (9, 'William Turner', 'williamturner@example.com'),
  (10, 'Olivia Martinez', 'oliviamartinez@example.com')

  CREATE TABLE Orders ( OrderID INT PRIMARY KEY, CustomerID INT, ProductName VARCHAR(50), OrderDate DATE, Quantity INT)
  INSERT INTO Orders (OrderID, CustomerID, ProductName, OrderDate, Quantity)
VALUES
  (1, 1, 'Product A', '2023-07-01', 5),
  (2, 2, 'Product B', '2023-07-02', 3),
  (3, 3, 'Product C', '2023-07-03', 2),
  (4, 4, 'Product A', '2023-07-04', 1),
  (5, 5, 'Product B', '2023-07-05', 4),
  (6, 6, 'Product C', '2023-07-06', 2),
  (7, 7, 'Product A', '2023-07-07', 3),
  (8, 8, 'Product B', '2023-07-08', 2),
  (9, 9, 'Product C', '2023-07-09', 5),
  (10, 10, 'Product A', '2023-07-10', 1)
  select * from Orders

  CREATE TABLE Products ( ProductID INT PRIMARY KEY, ProductName VARCHAR(50), Price DECIMAL(10, 2))
  INSERT INTO Products (ProductID, ProductName, Price)
VALUES
  (1, 'Product A', 10.99),
  (2, 'Product B', 8.99),
  (3, 'Product C', 5.99),
  (4, 'Product D', 12.99),
  (5, 'Product E', 7.99),
  (6, 'Product F', 6.99),
  (7, 'Product G', 9.99),
  (8, 'Product H', 11.99),
  (9, 'Product I', 14.99),
  (10, 'Product J', 4.99)
  select * from Products


  --------------TASL 1------------------------------------------------------------
 --1.Write a query to retrieve all records from the Customers table..
  select * from Customers

 --2.Write a query to retrieve the names and email addresses of customers whose names start with 'J'.
 select Name,Email from Customers
 where Name like'j%'

 --3.Write a query to retrieve the order details (OrderID, ProductName, Quantity) for all orders..
 select OrderID, ProductName, Quantity from Orders

 --4.Write a query to calculate the total quantity of products ordered.
 select sum(Quantity)'TotalQuantity' from Orders

 --5.Write a query to retrieve the names of customers who have placed an order.
 select * from Customers
 select * from Orders
 select * from Products

 select Customers.Name,Orders.CustomerID,Orders.OrderID,Orders.OrderDate,Orders.ProductName from Customers
 right join Orders
 on Customers.CustomerID=Orders.OrderID

 --6.Write a query to retrieve the products with a price greater than $10.00.
 select * from Products
 where Price>10.00

 --7.Write a query to retrieve the customer name and order date for all orders placed on or after '2023-07-05'.----------doubt
 select Customers.Name,Orders.CustomerID,Orders.OrderID,Orders.OrderDate,Orders.ProductName from Customers
 inner join Orders
 on Customers.CustomerID=Orders.OrderID
 where Orders.OrderDate='2023-07-05'

 --8.	Write a query to calculate the average price of all products.
 select AVG(Price)'AveragePrie' from Products

 --9.Write a query to retrieve the customer names along with the total quantity of products they have ordered.
 select Customers.Name,Orders.OrderID,Orders.ProductName,Orders.Quantity from Customers
 inner join Orders
 on Customers.CustomerID=Orders.OrderID

 --10.Write a query to retrieve the products that have not been ordered.
 
 select Orders.OrderID,Products.ProductID,Products.ProductName from Orders
 left join Products
 on Orders.OrderID=Products.ProductID
 where Orders.ProductName is null
 ---------------------------------------------------------------------------------------------
 ---------------------TASK 2--------------------------------------
 --1.Write a query to retrieve the top 5 customers who have placed the highest total quantity of orders.
with Result as
(
 SElect CustomerID,Quantity, 
 DENSE_RANK() over(order by Quantity desc) 'Rank' from Orders
 )
 select * from Result
 where Result.Rank in(1,2,3,4,5)

 --2.Write a query to calculate the average price of products for each product category.
 select ProductID, AVG(Price) 'AveragePrice'from Products
 group by ProductID

 --3.Write a query to retrieve the customers who have not placed any orders.
 Select c.Name,c.CustomerID,o.OrderID,o.CustomerID from Customers c
Left join Orders o
on c.CustomerID=o.CustomerID
where OrderID is NULL
-------------------------------------------------------------------------------------------------------------------------
 --4.Write a query to retrieve the order details (OrderID, ProductName, Quantity) 
 --for orders placed by customers whose names start with 'M'.
 select Customers.Name,Orders.OrderID,Orders.ProductName,Orders.Quantity from Customers
 inner join Orders
 on Customers.CustomerID=Orders.CustomerID
 where Customers.Name like'm%'
-----------------------------------------------------------------------------------------------------------------------
 --5.Write a query to calculate the total revenue generated from all orders.
 SELECT Orders.OrderID,Orders.ProductName,Orders.Quantity,Products.Price,  Orders.Quantity * Products.Price 'Total Revenue'from Orders
 inner join Products
 on Orders.OrderID=Products.ProductID
------------------------------------------------------------------------------------------------------------------- 
--6.Write a query to retrieve the customer names along with the total revenue generated from their orders.
   select Customers.Name,Orders.OrderID,Orders.ProductName,Orders.Quantity,Products.Price, 
   Orders.Quantity * Products.Price 'Total Revenue' FROM Customers
   join Orders
   on Customers.CustomerID=Orders.OrderID 
   join Products
   on Orders.OrderID=Products.ProductID 
------------------------------------------------------------------------------------------------------------------------
 --8.Write a query to retrieve the customers who have placed orders on consecutive days.
 SELECT DISTINCT  o1.CustomerID FROM Orders o1
JOIN Orders o2
ON o1.CustomerID = o2.CustomerID 
AND o1.OrderDate = DATEADD(DAY, -1, o2.OrderDate)
ORDER BY o1.CustomerID;

--9.Write a query to retrieve the top 3 products with the highest average quantity ordered.

 SELECT AVG(Quantity)'AVGQuantity',
 DENSE_RANK() over(order by AVG(Quantity) desc) 'Rank'from Orders
 group by ProductName
------------------------------------------------------------------------------------------------

 --10.	Write a query to calculate the percentage of orders that have a quantity greater than the average quantity.
 Select  * From Orders where Quantity>(select avg(Quantity)from Orders)
 ------------------------------------------TASK 3-----------------------------------

 --1.	Write a query to retrieve the customers who have placed orders for all products.
 select Customers.Name,Orders.OrderID from Customers
 inner join Orders
 on Customers.CustomerID=Orders.OrderID

 --2.	Write a query to retrieve the products that have been ordered by all customers.
 select Orders.OrderID,Orders.ProductName,Customers.CustomerID from Orders
 left join Customers
 on Orders.OrderID=Customers.CustomerID

 --3.	Write a query to calculate the total revenue generated from orders placed in each month.
 select orders.OrderDate,(orders.Quantity*Products.Price) 'TotalRevenue'from Orders
 inner join Products
 on Orders.OrderID=Products.ProductID
 group by Orders.OrderDate
--------------------------------------------------------------------------------------------------
 --5.Write a query to retrieve the top 5 customers who have spent the highest amount of money on orders.
 
 SELECT  c.CustomerID,c.Name AS CustomerName,SUM(p.Price) AS TotalSpent FROM Products p
  JOIN Customers c
  ON c.CustomerID = p.ProductID
  GROUP BY c.CustomerID, c.Name
  order by TotalSpent
-------------------------------------------------------------------------------------------------
--6.Write a query to calculate the running total of order quantities for each customer.
 select CustomerID,sum(Quantity)'Total Quantity'from Orders
 where CustomerID=CustomerID
 group by CustomerID
 ------------------------------------------------------------------------------------------------
 --7.	Write a query to retrieve the top 3 most recent orders for each customer.
 SELECT TOP (3) [OrderID]
      ,count(CustomerID)
      ,[ProductName]
      ,[OrderDate]
      ,[Quantity]
  FROM [Customers_Orders_Products].[dbo].[Orders]
  
 
 select * from orders
 with Result As
 (
 select OrderID,CustomerID,OrderDate,
 ROW_NUMBER() over(partition by CustomerID order by OrderDate Desc)'RN' FROM Orders
 )
 select * from Result
 where Result.RN in (1,2,3)

--8.	Write a query to calculate the total revenue generated by each customer in the last 30 days.
SELECT 
    o.CustomerID,AVG( o.Quantity * p.Price) as TotalRevenue
FROM 
    Orders o
JOIN 
   Products p 
ON 
    o.CustomerID = p.ProductID
WHERE 
    o.OrderDate >= DATEADD(DAY, -30, GETDATE()) -- For SQL Server
GROUP BY 
    o.CustomerID 
ORDER BY 
    TotalRevenue DESC;


--9.	Write a query to retrieve the customers who have placed orders for at least two different product categories.


--10.	Write a query to calculate the average revenue per order for each customer. 
 SELECT Orders.OrderID,Orders.ProductName,Orders.Quantity,Products.Price,  AVG( Orders.Quantity * Products.Price) 'Total Revenue'from Orders
 inner join Products
 on Orders.OrderID=Products.ProductID
 group by orders.CustomerID
----------------------------------------------------------------------------------------------------------------------------
--11.	Write a query to retrieve the customers who have placed orders for every month of a specific year.
 select customers.Name,Orders.OrderID from Customers
 inner join Orders
 Customers.CustomerID=Orders.OrderID
-----------------------------------------------------------------------------------------------------------------------------

