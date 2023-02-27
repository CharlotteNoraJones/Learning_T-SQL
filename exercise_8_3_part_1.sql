USE AdventureWorks2019;
GO

SELECT SalesOrderID, ProductID, LineTotal,
    SUM(LineTotal) OVER(
    PARTITION BY ProductID
    ORDER BY SalesOrderID
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) 
    AS RunningTotal
FROM Sales.SalesOrderDetail;
