USE AdventureWorks2019;
GO

SELECT SalesOrderID, OrderDate, TotalDue, CreditCardID
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2012 AND (TotalDue > 1000 OR CreditCardID IS NOT NULL);

SELECT P.ProductID, P.[Name] AS ProductName, S.[Name] AS SubCategoryName, P.Color
FROM Production.Product AS P
    INNER JOIN Production.ProductSubcategory AS S ON S.ProductSubcategoryID = P.ProductSubcategoryID
WHERE (S.Name LIKE '%Mountain%' OR p.Name LIKE '%Mountain%') AND P.Color = 'Silver';
