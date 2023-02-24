USE WideWorldImporters;
GO

SELECT DISTINCT UnitPrice
FROM Sales.OrderLines
ORDER BY UnitPrice DESC;

SELECT UnitPrice
FROM Sales.OrderLines
GROUP BY UnitPrice
ORDER BY UnitPrice DESC;
