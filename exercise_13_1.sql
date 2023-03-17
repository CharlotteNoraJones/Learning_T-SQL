USE tempdb;
GO

DROP TABLE IF EXISTS dbo.testCustomer;

CREATE TABLE dbo.testCustomer (
    CustomerID INT IDENTITY NOT NULL PRIMARY KEY NONCLUSTERED,
    FirstName VARCHAR(30),
    LastName VARCHAR(30),
    AGE INT,
    ACTIVE VARCHAR(1)
)
