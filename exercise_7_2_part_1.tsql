USE AdventureWorks2019;
GO

SELECT SalesOrderID, COUNT(*) AS DetailCount
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
HAVING COUNT(*) > 3; 

SELECT SalesOrderID, SUM(LineTotal) AS Total
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
HAVING SUM(LineTotal) > 1000;

SELECT ProductID, COUNT(*) AS Total, Color
FROM Production.Product
WHERE Color IN ('Red', 'Blue')
GROUP BY ProductID, Color
HAVING COUNT(*) = 1;
