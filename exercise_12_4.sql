USE AdventureWorks2019;
GO

DROP TABLE IF EXISTS #CustomerInfo
CREATE TABLE #CustomerInfo (CustomerID INT, FirstName NVARCHAR(50), LastName NVARCHAR(50), 
CountOfSales INT, SumOfTotalDue MONEY);

INSERT INTO #CustomerInfo
SELECT C.CustomerID, P.FirstName, P.LastName, COUNT(*), SUM(SOH.TotalDue)
FROM Sales.SalesOrderHeader AS SOH
    INNER JOIN Sales.Customer AS C ON C.CustomerID = SOH.CustomerID
    INNER JOIN Person.Person AS P ON P.BusinessEntityID = C.PersonID
GROUP BY C.CustomerID, P.FirstName, P.LastName;

SELECT CustomerID, FirstName, LastName, CountOfSales, SumOfTotalDue
FROM #CustomerInfo;

DROP TABLE #CustomerInfo;
GO

DECLARE @CustomerInfoVar TABLE (CustomerID INT, FirstName NVARCHAR(50), LastName NVARCHAR(50), 
CountOfSales INT, SumOfTotalDue MONEY);

INSERT INTO @CustomerInfoVar
SELECT C.CustomerID, P.FirstName, P.LastName, COUNT(*), SUM(SOH.TotalDue)
FROM Sales.SalesOrderHeader AS SOH
    INNER JOIN Sales.Customer AS C ON C.CustomerID = SOH.CustomerID
    INNER JOIN Person.Person AS P ON P.BusinessEntityID = C.PersonID
GROUP BY C.CustomerID, P.FirstName, P.LastName;

SELECT CustomerID, FirstName, LastName, CountOfSales, SumOfTotalDue
FROM @CustomerInfoVar;
GO

SET NOCOUNT ON;
DECLARE @RanNums TABLE (ID INT NOT NULL IDENTITY, RandomNum INT);

DECLARE @i INT = 0;

WHILE @i < 1000 BEGIN
    INSERT INTO @RanNums
    VALUES(CAST(RAND() * 10000 AS INT) + 1);
    SET @i += 1;
END;

SET @i = 1;
DECLARE @value INT;
WHILE @i <= 1000 BEGIN
    SELECT @value = RandomNum
    FROM @RanNums
    WHERE ID = @i; 
    SET @i += 1;
    PRINT @value;
END;
GO

DROP TABLE IF EXISTS #TestTemp;
CREATE TABLE #TestTemp (ID INT NOT NULL PRIMARY KEY IDENTITY, 
    val1 VARCHAR(20), 
    val2 VARCHAR(20));
GO

DECLARE @TestTemp TABLE (ID INT NOT NULL PRIMARY KEY IDENTITY, 
    val1 VARCHAR(20), 
    val2 VARCHAR(20));

INSERT INTO @TestTemp
VALUES ('VAL1', 'VAL2');

UPDATE @TestTemp
SET val1 = 'VAL3'
WHERE ID = 1;

SELECT ID, val1, val2
FROM @TestTemp;
GO
