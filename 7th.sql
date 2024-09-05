-- Aggregete window function SUM
-- Sum function returns the sum of values within a window


-- Find the total sales across all orders
-- and total sales for each product
-- Additionally,provide details such as order ID and order date

SELECT 
    OrderID,
    OrderDate,
    Sales,
    SUM(Sales) OVER() TotalSales
FROM Sales.Orders


SELECT 
    OrderID,
    OrderDate,
    Sales,
	ProductID,
    SUM(Sales) OVER() TotalSales,
	SUM(Sales) OVER(PARTITION BY ProductID) TotalSalesByProduct
FROM Sales.Orders