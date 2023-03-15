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
