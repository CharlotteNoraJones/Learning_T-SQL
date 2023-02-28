USE AdventureWorks2019;
GO

SELECT ProductID, Comments
FROM Production.ProductReview
WHERE CONTAINS(*, 'socks');

SELECT Title, [FileName]
FROM Production.Document
WHERE CONTAINS(*, 'reflector AND NOT seat');

SELECT Title, [FileName], Document
FROM Production.Document
WHERE FREETEXT(*, 'replaced');
