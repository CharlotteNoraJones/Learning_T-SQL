USE AdventureWorks2019;
GO

SELECT SalesOrderID, OrderDate, CustomerID, TotalDue,
    AVG(TotalDue) OVER() AS AverageTotal,
    AVG(TotalDue) OVER(PARTITION BY CustomerID) AS CustomerAverageTotal
FROM Sales.SalesOrderHeader;
