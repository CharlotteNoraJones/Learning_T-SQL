USE AdventureWorks2019;
GO

SELECT ProductID, ProductSubcategoryID,
    ROW_NUMBER() OVER(PARTITION BY ProductSubcategoryID ORDER BY ProductID) AS RowNum
FROM Production.Product
WHERE ProductSubcategoryID IS NOT NULL

SELECT CustomerID, SUM(TotalDue) AS Total,
    NTILE(10) OVER(ORDER BY SUM(TotalDue)) as Bucket
FROM SALES.SalesOrderHeader 
WHERE YEAR(OrderDate) = 2011
GROUP BY CustomerID;
