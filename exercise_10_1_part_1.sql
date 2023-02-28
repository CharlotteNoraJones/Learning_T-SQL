USE AdventureWorks2019;
GO

INSERT INTO dbo.demoSalesOrderHeader
    (SalesOrderID, OrderDate, CustomerID, 
    SubTotal, TaxAmt, Freight)
SELECT SalesOrderID, OrderDate, CustomerID, SubTotal, TaxAmt, Freight
FROM Sales.SalesOrderHeader;
