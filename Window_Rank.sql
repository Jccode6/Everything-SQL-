SELECT
    --O.OrderID
    SG.StockGroupName
    --,O.StockItemID
    ,SUM(O.Quantity) AS ItemsSold
    ,RANK() OVER (ORDER BY SUM(O.Quantity) DESC) AS Rank
  --  ,O.UnitPrice
FROM
    Sales.OrderLines AS O
INNER JOIN Warehouse.StockItemStockGroups AS SI
    ON O.StockItemID = SI.StockItemID
INNER JOIN Warehouse.StockGroups AS SG
    ON SI.StockGroupID = SG.StockGroupID
GROUP BY
    --O.OrderID
   SG.StockGroupName
    --,O.Quantity
    --,O.StockItemID
  --  ,O.UnitPrice
--ORDER BY 1
    
SELECT 
    a."FirstName"
    ,a."LastName"
    ,a."Country"
FROM 
(
SELECT  
    C."CustomerId"
    ,C."FirstName"
    ,C."LastName"
    ,C."Country"
    ,SUM(I."Total") 
    ,ROW_NUMBER() OVER (ORDER BY SUM(I."Total") DESC) AS row_num
FROM 
    "public"."Customer" C 
INNER JOIN "public"."Invoice" I 
    ON C."CustomerId" = I."CustomerId"
GROUP BY 
   C."CustomerId"
    ,C."FirstName"
    ,C."LastName"
    ,C."Country" 
)a

WHERE a."row_num" BETWEEN 1 AND 10
