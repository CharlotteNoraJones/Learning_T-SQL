USE WideWorldImporters;
GO

SELECT C.CityName, C.LatestRecordedPopulation AS CityPopulation, SP.StateProvinceName, SP.LatestRecordedPopulation AS StateProvincePopulation
FROM Application.Cities AS C
    INNER JOIN Application.StateProvinces AS SP ON SP.StateProvinceID = C.StateProvinceID
WHERE C.LatestRecordedPopulation >= 1000000 OR SP.LatestRecordedPopulation >= 10000000;
