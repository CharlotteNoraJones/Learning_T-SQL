USE AdventureWorks2019;
GO

SELECT AddressLine2
FROM dbo.demoAddress
WHERE AddressLine2 IS NULL;

UPDATE dbo.demoAddress
SET AddressLine2 = 'N/A'
WHERE AddressLine2 IS NULL;

SELECT AddressLine2
FROM dbo.demoAddress;

SELECT StandardCost
FROM dbo.demoProduct;

UPDATE dbo.demoProduct
SET StandardCost = StandardCost * 1.1;

SELECT StandardCost
FROM dbo.demoProduct;

SELECT UnitPrice
FROM dbo.demoSalesOrderDetail;

UPDATE SOD 
SET SOD.UnitPrice = DP.StandardCost
FROM dbo.demoSalesOrderDetail AS SOD
    INNER JOIN dbo.demoProduct AS DP ON DP.ProductID = SOD.ProductID;

SELECT UnitPrice
FROM dbo.demoSalesOrderDetail;
