USE AdventureWorks2019;
GO

SELECT ProductID, [Name]
FROM Production.Product
WHERE [Name] LIKE 'Chain%';

SELECT ProductID, [Name]
FROM Production.Product
WHERE [Name] LIKE '%Paint%' ;

SELECT ProductID, [Name]
FROM Production.Product
WHERE [Name] NOT LIKE '%Paint%' ;

SELECT BusinessEntityID, FirstName, MiddleName, LastName
FROM Person.Person
WHERE MiddleName LIKE '%[EB]%';
