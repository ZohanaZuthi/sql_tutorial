-- Window function 4 rules
-- 1. window function can not be written without select and order by function and ost definately inside select function.
-- 2. window function can not be written within the another window function
-- 3. window function can not be used for filtering data
-- 4. window function can be used with group only if the group by operation is same as the window operation .
-- for example:


SELECT 
	CustomerID
	Sales,
	SUM(Sales) TotalSales,
	RANK() OVER(ORDER BY CustomerID DESC) RankCustomers
FROM Sales.Orders
GROUP BY CustomerID


SELECT 
	CustomerID
	Sales,
	SUM(Sales) TotalSales,
	RANK() OVER(ORDER BY SUM(Sales) DESC) RankCustomers
FROM Sales.Orders
GROUP BY CustomerID