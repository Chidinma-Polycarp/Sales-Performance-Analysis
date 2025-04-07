SELECT * FROM [dbo].[Project_Sales Data]

---------------TOTAL SALES----------------------
SELECT SUM(Quantity) AS [TOTAL SALES], Product fROM [dbo].[Project_Sales Data]
GROUP BY Product
ORDER BY 1 ASC

-------SALES TRANSACTION IN EACH REGION------
SELECT COUNT(OrderID) AS [Number of Sales Transaction], 
Region FROM [dbo].[Project_Sales Data]
GROUP BY Region

------Highest Selling Product-------
SELECT TOP 1 Product, SUM(SALES_PRICE) AS [TOTAL SALES] FROM [dbo].[Project_Sales Data]
GROUP BY Product 
ORDER BY 1

---------TOTAL REVENUE PER PRODUCT-------
SELECT SUM(Sales_price) AS [Total Sales], Product fROM [dbo].[Project_Sales Data]
GROUP BY Product
ORDER BY 1 DESC

---------- MONTHLY SALES TOTAL---------
SELECT MONTH(OrderDate) AS [Month], SUM(sales_price) AS [Sales Per Month] 
FROM [dbo].[Project_Sales Data]
WHERE YEAR(OrderDate) = 2024
GROUP BY MONTH(OrderDate)
ORDER BY 1 DESC

---------- TOP 5 CUSTOMERS-------
SELECT TOP 5 Customer_Id, SUM(SALES_PRICE)AS [Total Sales] FROM [dbo].[Project_Sales Data]
GROUP BY Customer_Id
ORDER BY 2 desc

-----------PERCENTAGE OF TOTAL SALES FROM EACH REGION-------
WITH Regionalsales AS (
Select Region, SUM(sales_price) AS RegionalSales FROM [dbo].[Project_Sales Data]
GROUP BY Region),
TotalSales AS (
SELECT SUM(Sales_price) AS TotalSales FROM [dbo].[Project_Sales Data])

SELECT 
RS.Region, RS.Regionalsales, ROUND(RS.Regionalsales / TS.Totalsales, 4) * 100
AS [Sales Percentage]
from Regionalsales Rs 
cross join Totalsales TS
ORDER BY [Sales percentage] desc

-------------PRODUCTS WITH NO SALES IN LAST QUARTER---------
SELECT DISTINCT product FROM [dbo].[Project_Sales Data]
WHERE product not in
(SELECT product FROM [dbo].[Project_Sales Data]
WHERE OrderDate Between '7/1/2024' and '9/30/2024')


