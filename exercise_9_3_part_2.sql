USE WideWorldImporters;
GO

SELECT StockItemID, StockItemName
FROM Warehouse.StockItems
WHERE CONTAINS(SearchDetails, 'SELECT');


SELECT PersonID, FullName, CustomFields
FROM Application.People AS P
    INNER JOIN FREETEXTTABLE(Application.People, CustomFields, 'member') AS C
        ON P.PersonID = C.[KEY]; 
