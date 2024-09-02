-- COMPACT FRAME

-- For only precedng the current row can be skipped 
-- in normal form- rows between current flow and 2 following
--  in shhort form- rows 2 folllowing


SELECT 
	OrderID,
	OrderDate,
	OrderStatus,
	Sales,
	SUM(Sales) OVER(PARTITION BY OrderStatus ORDER BY OrderDate 
	ROWS  2 PRECEDING) TotalSales
from Sales.Orders

-- it only works for preceding