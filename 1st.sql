-- what is Window function in sql?
-- Window functions apply to aggregate and ranking functions over a particular window (set of rows). OVER clause is used with window functions to define that window. OVER clause does two things : 

-- Partitions rows to form a set of rows. (PARTITION BY clause is used) 
-- Orders rows within those partitions into a particular order. (ORDER BY clause is used) 
-- Note: If partitions aren’t done, then ORDER BY orders all rows of the table. 
-- There are two kind of opertion in sql: group by and window function 
-- more about the differences between window function and group by:https://learnsql.com/blog/sql-window-functions-vs-group-by/
-- Download all the materials from data with Bara :https://www.datawithbaraa.com/sql-introduction/advanced-sql-thank-you/



-- ******Find the total Sales Across all orders********

-- to open a data table right click on the table and select Top 1000 Rows.
-- to show the Sales table from Sales.Orders

SELECT
Sales 
FROM Sales.Orders
-- if you see error it might have caused because you are looking for the table in different database

USE SalesDB
-- to show the total sales under the name Total_Sales

SELECT
SUM(Sales) Total_Sales
FROM Sales.Orders
-- ******Find the total Sales for each products********

SELECT 
 ProductID,SUM(Sales) TotalSales
 From Sales.Orders
 GROUP BY ProductID


