USE WideWorldImporters;
GO

SELECT StockItemID, StockItemName
FROM Warehouse.StockItems
WHERE StockItemName LIKE 'USB%';
