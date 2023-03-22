USE AdventureWorks2019;
GO

IF OBJECT_ID('dbo.vw_Products') IS NOT NULL BEGIN
    DROP VIEW dbo.vw_Products;
END;
GO

CREATE VIEW dbo.vw_Products AS
    SELECT P.ProductID, P.Name, P.ProductLine, P.Color, PCH.StandardCost
    FROM Production.Product AS P
        INNER JOIN Production.ProductCostHistory AS PCH ON PCH.ProductID = P.ProductID;
GO

SELECT ProductID, Name, ProductLine, Color, StandardCost
FROM dbo.vw_Products;

IF OBJECT_ID('dbo.vw_CustomerTotals') IS NOT NULL BEGIN
    DROP VIEW dbo.vw_Customertotals;
END;
GO

CREATE VIEW dbo.vw_CustomerTotals AS
    SELECT CustomerID, YEAR(OrderDate) AS Year, MONTH(OrderDate) AS Month,
        SUM(TotalDue) AS TotalCharges
    FROM Sales.SalesOrderHeader
    GROUP BY CustomerID, YEAR(OrderDate), MONTH(OrderDate);
GO

SELECT CustomerID, Year, Month, TotalCharges
FROM vw_CustomerTotals;

USE WideWorldImporters;
GO

IF OBJECT_ID('Application.CityView') IS NOT NULL BEGIN
    DROP VIEW Application.Cityview;
END;
GO

CREATE VIEW Application.CityView AS 
    SELECT CityID, CityName, StateProvinceID AS StateID
    FROM Application.Cities;
GO

IF OBJECT_ID('dbo.vw_BackOrderPct') IS NOT NULL BEGIN
    DROP VIEW dbo.vw_BackOrderPct;
END;
GO

CREATE VIEW dbo.vw_BackorderPct AS
    SELECT CONCAT(CAST(COUNT(BackorderOrderID) * 1.0 / COUNT(OrderID) * 100 
        AS DECIMAL (5,3)), '%') AS BackPct
    FROM Sales.Orders;
GO

SELECT BackPct
FROM vw_BackorderPct;
GO
