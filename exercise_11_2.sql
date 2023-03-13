USE AdventureWorks2019;
GO

BEGIN TRY 
    INSERT INTO HumanResources.Department (DepartmentID, [Name], GroupName, ModifiedDate)
    SELECT DepartmentID, [Name], GroupName, ModifiedDate
    FROM HumanResources.Department
    WHERE DepartmentID = 1;
END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage,
        ERROR_SEVERITY() AS ErrorSeverity;
END CATCH

USE AdventureWorks2019;
GO

BEGIN TRY 
    INSERT INTO HumanResources.Department (DepartmentID, [Name], GroupName, ModifiedDate)
    SELECT DepartmentID, [Name], GroupName, ModifiedDate
    FROM HumanResources.Department
    WHERE DepartmentID = 1;
END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage,
        ERROR_SEVERITY() AS ErrorSeverity;
    IF ERROR_NUMBER() = 544 BEGIN
        RAISERROR('You cannot insert duplicate values.', 16, 1);
    END;
END CATCH
