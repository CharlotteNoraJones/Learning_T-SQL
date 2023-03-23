USE AdventureWorks2019;
GO

CREATE OR ALTER PROC dbo.usp_CustomerTotals @CustomerID INT AS 
    SELECT CustomerID, YEAR(OrderDate) AS Year, MONTH(OrderDate) AS Month,
        SUM(TotalDue) as TotalCharges
    FROM Sales.SalesOrderHeader
    WHERE CustomerID = @CustomerID
    GROUP BY CustomerID, YEAR(OrderDate), MONTH(OrderDate);
GO

EXEC dbo.usp_CustomerTotals 19607;
GO

CREATE OR ALTER PROC dbo.usp_ProductSales @ProductID INT, @TotalSold INT = NULL OUTPUT AS
    SELECT @TotalSold = SUM(OrderQty)
    FROM Sales.SalesOrderDetail
    WHERE ProductID = @ProductID;
GO

DECLARE @Total INT;
EXEC dbo.usp_ProductSales @ProductID = 776, @TotalSold = @Total OUTPUT;
PRINT @Total;
GO

USE WideWorldImporters;
GO

CREATE OR ALTER PROC dbo.usp_InsertPaymentMethod @Name NVARCHAR(50) AS
    BEGIN TRAN
        BEGIN TRY
            INSERT INTO Application.PaymentMethods (PaymentMethodName, LastEditedBy)
                VALUES(@Name, 1);

            DECLARE @NewID INT;

            SELECT @NewID = PaymentMethodID
            FROM Application.PaymentMethods
            WHERE PaymentMethodName = @Name;

            RETURN @NewID;

            COMMIT TRAN
        END TRY
        BEGIN CATCH
            IF @@TRANCOUNT > 0 BEGIN
                ROLLBACK TRAN;
            END;

            SELECT
                ERROR_NUMBER() AS ErrorNumber,
                ERROR_MESSAGE() AS ErrorMessage;
                RETURN -1;
        END CATCH
GO
