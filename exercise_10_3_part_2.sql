USE WideWorldImporters;
GO

SELECT PickedByPersonID
FROM Sales.Orders;

UPDATE Sales.Orders
SET PickedByPersonID = 1
WHERE PickedByPersonID IS NULL;

SELECT PickedByPersonID
FROM Sales.Orders;
