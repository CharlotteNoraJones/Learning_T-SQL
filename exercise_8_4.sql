
SELECT Symbol, TradingDate, ClosingPrice,
    ClosingPrice - LAG(ClosingPrice, 1, ClosingPrice) OVER(PARTITION BY Symbol ORDER BY TradingDate) AS ClosingPriceChange
FROM #STOCK;

SELECT city, rate, logdate,
    PERCENT_RANK() OVER(ORDER BY rate) AS RateRank
FROM #Rates;

SELECT city, rate, logdate,
    PERCENTILE_DISC(0.5) WITHIN GROUP(ORDER BY rate) OVER() AS Median
FROM #Rates;
