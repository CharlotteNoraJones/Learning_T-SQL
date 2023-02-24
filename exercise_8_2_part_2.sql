USE WideWorldImporters;
GO

WITH OrderLines (OrderID, OrderLineID, StockItemID, [Description], Quantity, UnitPrice, SubTotal, GrandTotal)
AS (
    SELECT OrderID, OrderLineID, StockItemID, [Description], Quantity, UnitPrice,
    SUM(Quantity * UnitPrice) OVER(PARTITION BY OrderID) AS SubTotal,
    SUM(Quantity * UnitPrice) OVER() AS GrandTotal
    FROM Sales.OrderLines
    WHERE OrderID BETWEEN 1 AND 10
)
SELECT OrderID, OrderLineID, StockItemID, [Description], Quantity, UnitPrice, SubTotal, GrandTotal, 
    SUM((SubTotal / GrandTotal) * 100) OVER(PARTITION BY OrderID) AS PercentOfTotal
FROM OrderLines
ORDER BY OrderID;
