USE WideWorldImporters;
GO

SELECT StockItemID, SUM(QuantityOnHand) AS TotalOnHand
FROM Warehouse.StockItemHoldings
GROUP BY StockItemID
ORDER BY SUM(QuantityOnHand) DESC;

SELECT TransactionDate, COUNT(*) AS TotalTransactions
FROM Purchasing.SupplierTransactions
WHERE DATEPART(quarter, TransactionDate) = 1 AND YEAR(TransactionDate) = 2016
GROUP BY TransactionDate
HAVING COUNT(*) > 1
