-- The window function Average

-- returns the average value within the window

 SELECT
	OrderID,
	ProductID,
	Sales,
	ProductID,
	AVG(Sales) OVER() AvgSales,
	AVG(Sales) OVER(PARTITION BY ProductID) AvgSalesByProducts
	FROM Sales.orders


SELECT
	CustomerID,
	LastName,
	Score,
	AVG(Score) OVER() AvgScore
FROM Sales.Customers

-- in this case there is a problem with null . if it is considering null as zero or not
-- in default case it doesn't include null 
-- to include null in calculation, we can use COALESCE function

SELECT
	CustomerID,
	LastName,
	Score,
	COALESCE(Score,0)  CustomerScore,
	AVG(COALESCE(Score,0)) OVER() AvgScoreWithnull,
	AVG(Score) OVER() AvgScore
	
FROM Sales.Customers

