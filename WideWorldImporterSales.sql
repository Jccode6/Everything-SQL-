/************************
This query pulls the number of sales made, total revenue generated
and total profit over a three fiscal year period.
*************************/

SELECT 
    S.[Sale Key]
    ,C.Customer
    ,S.[Invoice Date Key]
    ,City.[State Province]
    ,D.[Month]
    ,D.[Fiscal Year]
    ,S.[Description]
    ,SUM(S.Quantity * S.[Unit Price]) AS Sales
    ,S.Profit
FROM
    Fact.Sale AS S
INNER JOIN Dimension.Customer AS C
    ON S.[Customer Key] = C.[Customer Key]
INNER JOIN Dimension.City AS City
    ON S.[City Key] = City.[City Key]
INNER JOIN Dimension.Date AS D
    ON S.[Invoice Date Key] = D.[Date]
GROUP BY
    S.[Sale Key]
    ,C.Customer
    ,S.[Invoice Date Key]
    ,City.[State Province]
    ,D.[Month]
    ,D.[Fiscal Year]
    ,S.[Description]
    ,S.Profit
ORDER BY 1
