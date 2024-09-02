-- Find the total sales for each product, additiomally provide details such order id and order date
SELECT 
 OrderID,
 OrderDate,
 ProductID,
 SUM(Sales) TotalSales
 From Sales.Orders
GROUP BY OrderID,
         OrderDate,
		 ProductID

-- This will provide some error as it can not aggregate and provide details at once  by group by function 
-- That is why we have window function 

SELECT
	OrderID,
	OrderDate,
    ProductID,
	SUM(Sales) OVER(PARTITION BY ProductID) TotalSalesByProducts
 FROM Sales.Orders

--  this will provide correct aggregation
-- Here OVER() is a window function
-- there are two part of window function
-- window function+Over clause[partition clause, orderr clause, frame clause]

SELECT
	OrderID,
	OrderDate,
    ProductID,
	Sales,
	SUM(Sales) OVER() Total_Sale,
	SUM(Sales) OVER(PARTITION BY ProductID) TotalSalesByProducts
 FROM Sales.Orders
