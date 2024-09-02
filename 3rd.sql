-- Window function with partition clause

SELECT 
	OrderID,
	OrderDate,
	Sales,
	RANK() OVER(ORDER BY Sales DESC) RankSales
from Sales.Orders

-- Window Frame

-- Frame clause can not be used without order by clause
-- Window function over (PARTITION BY __ ORDER BY__ ROWS BETWEEN CURRRENT ROW AND UNBOUNDED PRECEDING)
-- (Rows)there are two frame types - Rows and Range
-- (Current row) Frame boundary(lower value)= current row, n preceding, unbounded preceding
--(Frame Boundary) Frame Boundary (Higher Value)= current row, n following, unbounded following
-- lower boundary should be before higher boundary

SELECT 
	OrderID,
	OrderDate,
	OrderStatus,
	Sales,
	SUM(Sales) OVER(PARTITION BY OrderStatus ORDER BY OrderDate 
	ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING) TotalSales
from Sales.Orders


SELECT 
	OrderID,
	OrderDate,
	OrderStatus,
	Sales,
	SUM(Sales) OVER(PARTITION BY OrderStatus ORDER BY OrderDate 
	ROWS BETWEEN UNBOUNDED PRECEDING AND 2 FOLLOWING) TotalSales
from Sales.Orders


SELECT 
	OrderID,
	OrderDate,
	OrderStatus,
	Sales,
	SUM(Sales) OVER(PARTITION BY OrderStatus ORDER BY OrderDate 
	ROWS BETWEEN 1 PRECEDING AND 2 FOLLOWING) TotalSales
from Sales.Orders
