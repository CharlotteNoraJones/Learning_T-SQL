USE WideWorldImporters;
GO

SELECT S.SupplierID, S.SupplierName, P.FullName as SupplierContact, P.PhoneNumber, P.FaxNumber, S.WebsiteURL, COUNT(PO.PurchaseOrderID) AS TotalOrders
FROM Purchasing.Suppliers AS S
    INNER JOIN Purchasing.SupplierCategories AS SC ON S.SupplierCategoryID = SC.SupplierCategoryID
    INNER JOIN Application.People AS P ON S.PrimaryContactPersonID = P.PersonID
    LEFT OUTER JOIN Purchasing.PurchaseOrders AS PO ON PO.SupplierID = S.SupplierID
GROUP BY S.SupplierID, S.SupplierName, P.FullName, P.PhoneNumber, P.FaxNumber, S.WebsiteURL;
