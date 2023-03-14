USE AdventureWorks2019;
GO

DECLARE @Count INT;
SELECT @Count = COUNT(*)
FROM Sales.SalesOrderDetail;

IF @Count > 100000 BEGIN
    PRINT 'Over 100,000';
END
ELSE BEGIN 
    PRINT '100,000 or less';
END;
GO

IF MONTH(GETDATE()) IN (10, 11) BEGIN
    PRINT CONCAT('The month is ', DATENAME(month, GETDATE()));
    IF YEAR(GETDATE()) % 2 = 0 BEGIN
        PRINT 'The year is even.';
    END
    ELSE BEGIN
        PRINT 'The year is odd.';
    END;
END;
GO

IF EXISTS (SELECT * FROM Sales.SalesOrderHeader WHERE SalesOrderID = 1) BEGIN
    PRINT 'There is SalesOrderID = 1';
END
ELSE BEGIN
    PRINT 'There is not SalesOrderID = 1';
END;
GO

USE WideWorldImporters;
GO

DECLARE @Count INT;
SELECT @Count = COUNT(*)
FROM Purchasing.PurchaseOrders;

IF @Count <= 8000 BEGIN
    PRINT '<= 8000 rows';
END
ELSE BEGIN
    PRINT '> 8000 rows';
END
GO
