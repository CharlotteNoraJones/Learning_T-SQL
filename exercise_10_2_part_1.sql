USE AdventureWorks2019;
GO

SELECT *
FROM dbo.demoCustomer
WHERE LastName LIKE 'S%';

DELETE dbo.demoCustomer
WHERE LastName LIKE 'S%';

SELECT *
FROM dbo.demoCustomer
WHERE LastName LIKE 'S%';

SELECT DC.CustomerID
FROM dbo.demoCustomer AS DC
WHERE EXISTS (
    SELECT *
    FROM DBO.demoSalesOrderHeader AS SOH
    WHERE DC.CustomerID = SOH.CustomerID
    GROUP BY SOH.CustomerID
    HAVING SUM(TotalDue) < 1000
);

DELETE DC
FROM dbo.demoCustomer AS DC
WHERE EXISTS (
    SELECT *
    FROM DBO.demoSalesOrderHeader AS SOH
    WHERE DC.CustomerID = SOH.CustomerID
    GROUP BY SOH.CustomerID
    HAVING SUM(TotalDue) < 1000
);

SELECT DC.CustomerID
FROM dbo.demoCustomer AS DC
WHERE EXISTS (
    SELECT *
    FROM DBO.demoSalesOrderHeader AS SOH
    WHERE DC.CustomerID = SOH.CustomerID
    GROUP BY SOH.CustomerID
    HAVING SUM(TotalDue) < 1000
);

SELECT ProductID
FROM dbo.demoProduct AS DP
WHERE NOT EXISTS (
    SELECT *
    FROM dbo.demoSalesOrderDetail AS SOD
    WHERE SOD.ProductID = DP.ProductID
);

DELETE P 
FROM dbo.demoProduct AS P
WHERE NOT EXISTS (
SELECT *
FROM dbo.demoSalesOrderDetail AS SOD
WHERE P.ProductID = SOD.ProductID);

SELECT ProductID
FROM dbo.demoProduct AS DP
WHERE NOT EXISTS (
    SELECT *
    FROM dbo.demoSalesOrderDetail AS SOD
    WHERE SOD.ProductID = DP.ProductID
);
