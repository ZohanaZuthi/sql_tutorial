-- comparison use cases

-- compare the current value and aggregate value of window functions

-- find the percentage of each prouduct's sales to the total sales
SELECT
	OrderID,
	ProductID,
	Sales,
	SUM(Sales) OVER() TotalSales,
	CAST(Sales AS FLOAT) / SUM(Sales) OVER() *100 PercentageofTotal
	FROM Sales.orders

-- here cast fuction is used for changing the data type
-- as the data type of the sales is integer dividing it will produce an integer value

-- in this case we get so many digits after point 
-- in order to limit into two digits we can use round function

SELECT
	OrderID,
	ProductID,
	Sales,
	SUM(Sales) OVER() TotalSales,
	ROUND(CAST(Sales AS FLOAT) / SUM(Sales) OVER() *100,2) PercentageofTotal
	FROM Sales.orders