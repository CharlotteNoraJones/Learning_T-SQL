USE AdventureWorks2019;
GO

SELECT P.BusinessEntityID, P.FirstName, P.LastName, COUNT(*) AS TotalOrdersPlaced
FROM Sales.SalesOrderHeader AS SOH
    INNER JOIN Sales.Customer AS C ON SOH.CustomerID = C.CustomerID
    INNER JOIN Person.Person AS P ON C.PersonID = P.BusinessEntityID
GROUP BY P.BusinessEntityID, p.FirstName, p.LastName;

SELECT P.Name, SOH.OrderDate, SUM(SOD.OrderQty) AS TotalOrders
FROM Sales.SalesOrderHeader AS SOH
    INNER JOIN Sales.SalesOrderDetail AS SOD ON SOD.SalesOrderID = SOH.SalesOrderID
    INNER JOIN Production.Product AS P ON SOD.ProductID = P.ProductID
GROUP BY P.Name, SOH.OrderDate;
