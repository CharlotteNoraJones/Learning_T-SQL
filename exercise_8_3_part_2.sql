USE WideWorldImporters;
GO

SELECT CustomerID, InvoiceDate,
    SUM(TotalDryItems) OVER(
        PARTITION BY CustomerID
        ORDER BY InvoiceDate
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
        AS RunningDryItemTotal
FROM Sales.Invoices;
