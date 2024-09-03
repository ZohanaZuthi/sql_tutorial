-- What are aggregate window function?

-- Aggregate functions operate on a set of values to return a single scalar value. These are SQL aggregate functions:
-- AVG() returns the average of the specified values.
-- SUM() calculates the sum of all values in the set.
-- MAX() and MIN() return the maximum and minimum value, respectively.
-- COUNT() returns the total number of values in the set.


-- COUNT FUNCTION

-- there are two ways to use count function
-- one way:
-- COUNT(*) or COUNT(1) counts the rows in the column . it also incldes null column.
-- for example with group by

SELECT
COUNT(*) TotalOrders
FROM Sales.Orders

-- with window function

SELECT
	OrderID,
	OrderDate,
COUNT(*) Over() TotalOrders
FROM Sales.Orders


SELECT
	OrderID,
	OrderDate,
COUNT(*) Over() TotalOrders,
COUNT(*) Over(PARTITION BY CustomerID) SUBTotalOrders 
FROM Sales.Orders

-- another way:
-- COUNT(column_name) counts the  rows that doesn't have any nulll values.

SELECT
	*,
COUNT(*) Over() TotalCustomers,
COUNT(Score) Over() Sub_totalCustomers
FROM Sales.Customers

