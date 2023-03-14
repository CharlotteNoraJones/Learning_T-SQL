USE AdventureWorks2019;
GO

DECLARE @myInt INT;
SET @myInt = 10;
PRINT @myInt;
GO

DECLARE @mySmallInt TINYINT;
SET @mySmallInt = 4000;
PRINT @mySmallInt;
GO

DECLARE @ID INT = 123.4567;
SELECT @ID;
PRINT @ID;
GO

DECLARE @myString VARCHAR(20);
SET @myString = 'This is a test';
PRINT @myString;
GO

DECLARE @MaxID INT;
DECLARE @MinID INT;

SELECT @MaxID = MAX(SalesOrderID),
    @MinID = MIN(SalesOrderID)
FROM Sales.SalesOrderHeader;

PRINT @MaxID;
PRINT @MinID;
GO

DECLARE @ID INT = 70000;
SELECT SalesOrderID
FROM Sales.SalesOrderHeader
WHERE SalesOrderID > @ID;
GO

DECLARE @ID INT;
DECLARE @FirstName NVARCHAR(50);
DECLARE @LastName NVARCHAR(50);

SELECT @ID = BusinessEntityID, @FirstName = FirstName, @LastName = LastName
FROM Person.Person
WHERE BusinessEntityID = 1;

PRINT CONCAT(@ID, ': ', @FirstName, ' ', @LastName);
GO

DECLARE @SalesCount INT;
SELECT @SalesCount = COUNT(*)
FROM Sales.SalesOrderHeader;

SELECT @SalesCount - COUNT(*) AS CustCountDiff, CustomerID
FROM Sales.SalesOrderHeader
GROUP BY CustomerID;
GO
