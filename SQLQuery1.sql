select* from ['supermarket_sales']


-- Monthly Sales Trends

SELECT 
    CONVERT(varchar, DATEPART(yyyy, Date)) + '-' + RIGHT('0' + CONVERT(varchar, DATEPART(mm, Date)), 2) AS YearMonth,
    SUM(Total) AS TotalSales,
    AVG(Total) AS AverageSale,
    COUNT([Invoice ID]) AS NumberOfSales
FROM ['supermarket_sales']
    
GROUP BY 
    CONVERT(varchar, DATEPART(yyyy, Date)) + '-' + RIGHT('0' + CONVERT(varchar, DATEPART(mm, Date)), 2)
ORDER BY 
    CONVERT(varchar, DATEPART(yyyy, Date)) + '-' + RIGHT('0' + CONVERT(varchar, DATEPART(mm, Date)), 2);


-- Customer Purchase Behaviour

SELECT
    "Customer type",
    Gender,
    SUM(Total) as TotalSales,
    AVG(Total) as AverageSale,
    COUNT("Invoice ID") as NumberOfSales
FROM ['supermarket_sales']
GROUP BY
    "Customer type", Gender;


-- Product Performance

SELECT
    "Product line",
    SUM(Total) as TotalSales,
    AVG(Total) as AverageSale,
    COUNT("Invoice ID") as NumberOfSales
FROM ['supermarket_sales']
GROUP BY
    "Product line";


-- Seasonal Effects

SELECT
    MONTH(CONVERT(datetime, Date, 101)) AS Month, -- Convert Date to datetime and extract month
    SUM(Total) AS TotalSales,
    AVG(Total) AS AverageSale,
    COUNT([Invoice ID]) AS NumberOfSales
FROM ['supermarket_sales']
GROUP BY
    MONTH(CONVERT(datetime, Date, 101)) -- Group by the extracted month
ORDER BY
    MONTH(CONVERT(datetime, Date, 101)); -- Order by the extracted month

