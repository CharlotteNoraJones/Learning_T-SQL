USE AdventureWorks2019;
GO

DROP TABLE IF EXISTS dbo.Demo;
CREATE TABLE dbo.Demo(ID INT PRIMARY KEY, Name VARCHAR(25));

BEGIN TRAN
    INSERT INTO dbo.Demo (ID, Name)
    SELECT 1, 'Test';

    INSERT INTO dbo.Demo (ID, Name)
    SELECT 2, 'Test2';
COMMIT TRAN;

SELECT *
FROM dbo.Demo;
