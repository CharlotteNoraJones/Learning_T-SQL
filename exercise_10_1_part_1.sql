USE AdventureWorks2019;
GO

INSERT INTO dbo.demoSalesOrderHeader
    (SalesOrderID, OrderDate, CustomerID, 
    SubTotal, TaxAmt, Freight)
SELECT SalesOrderID, OrderDate, CustomerID, SubTotal, TaxAmt, Freight
FROM Sales.SalesOrderHeader;

SELECT C.CustomerID, 
    COUNT(ISNULL(SOH.SalesOrderID, 0)) AS TotalOrders,
    SUM(SOH.TotalDue) AS TotalDue
INTO dbo.tempCustomerSales
FROM Sales.Customer AS C
    LEFT JOIN Sales.SalesOrderHeader AS SOH
        ON SOH.CustomerID = C.CustomerID
GROUP BY C.CustomerID;

SELECT TOP (10) CustomerID, TotalOrders, TotalDue
FROM dbo.tempCustomerSales;

INSERT INTO dbo.demoProduct (ProductID, [Name], Color, StandardCost, ListPrice, [Size], [Weight])
SELECT ProductID, [Name], Color, StandardCost, ListPrice, [Size], [Weight]
FROM Production.Product AS P
WHERE NOT EXISTS (
    SELECT ProductID
    FROM dbo.demoProduct AS DP
    WHERE DP.ProductID = P.ProductID
);
