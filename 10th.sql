-- Agregate window function MIN ans MAX

--  find the highest and lowest sales of all orders

SELECT
	OrderID,
	OrderDate,
	ProductID,
	MAX(Sales) OVER() HighestSale,
	MIN(Sales) OVER() lowestSale
FROM Sales.Orders

-- Find the highest and the lowest sales for each product

SELECT
	OrderID,
	OrderDate,
	ProductID,
	MAX(Sales) OVER() HighestSale,
	MIN(Sales) OVER() lowestSale,
	MAX(Sales) OVER(PARTITION BY ProductID) HighestSale,
	MIN(Sales) OVER(PARTITION BY ProductID) lowestSale
FROM Sales.Orders
 
--  employee with highest salary

SELECT*
FROM
(
SELECT*,
	MAX(Salary) OVER() MaxSalary	
FROM Sales.Employees
)t WHERE Salary = MaxSalary

-- deviation from min and max

SELECT
	OrderID,
	OrderDate,
	ProductID,
	MAX(Sales) OVER() HighestSale,
	MIN(Sales) OVER() lowestSale,
    MAX(Sales) OVER()-Sales max_deviation,
	Sales - MIN(Sales) OVER() min_deviation
FROM Sales.Orders



