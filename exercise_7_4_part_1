USE AdventureWorks2019;
GO

SELECT COUNT(DISTINCT ProductID) AS TotalDistinctProducts
FROM Sales.SalesOrderDetail

SELECT CustomerID, COUNT(DISTINCT TerritoryID) AS DistinctTerritories
FROM Sales.SalesOrderHeader
GROUP BY CustomerID;
