-- define duplicate---as duplicate leads to wrong analysis
-- check whether the table contains any duplicate rows

SELECT
	OrderID,
	COUNT(*) OVER(PARTITION BY OrderID) CheckPK
FROM Sales.Orders

-- if we have anything other than 1 in the CheckPK column , we have duplicates
-- here OrderId is primary key
SELECT
	COUNT(*) OVER(PARTITION BY OrderID) checkPK
FROM Sales.OrdersArchive

-- in this case we have duplicates

SELECT*
FROM(
	SELECT
		COUNT(*) OVER(PARTITION BY OrderID) checkPK
	FROM Sales.OrdersArchive
	)t WHERE CheckPk>1

-- conclusion:
--   we can use count function:
--     1.Overall analysis
--     2.Category analysis
--     3.Quality checks: Identify NULLS
--     4.Quality checks: Identify Duplicates