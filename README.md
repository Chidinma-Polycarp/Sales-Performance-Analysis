# Sales-Performance-Analysis
This repository contains a comprehensive sales performance analysis done on a data set for a retail store. I have utilized Excel, SQL and Power BI to identify trends, patterns and correlations to uncover actionable insights that would drive business decisions.


## TABLE OF CONTENT
[INTRODUCTION](introduction)

[OVERVIEW](overview)

[GUIDE](guide)

[DATA FILES](data_files)

[EXCEL FILES](excel_files)

[SQL QUERIES](sql_queries)

[POWER BI REPORT](power_bi_report)

[DOCUMENTATION](documentation)


### OVERVIEW
---
This project analyzes sales data to uncover key insights such as top-selling products, regional performance, and monthly sales trends. The project uses Excel, SQL and Power BI to analyze a 50,000 sales record for a retail shop. 

#### KEY FEATURES

- Sales Performance Metrics (Revenue, Sales Growth, Average Order Revenue)
- Sales Channel Analysis (Product, Region)

#### DATA SET 

The dataset was given by the incubator hub and contains 50,000 sales record from the past year.

#### METHODOLOGY

The dataset was given in an excel workbook alongside another dataset, I transferred to a new workbook and then I checked for duplicates. 

I used the **conditional formatting function which is found in the styles group on the Home tab** to check for duplicate values, it highlighted the whole table but to be completely certain, I used the **COUNTIFS** function which also proved to me that i had rows with the same records. 

I proceeded to remove duplicate by using the **remove duplicate function under the data tools group in the DATA tab**. I was left with 9921 rows which I used to perform my analysis. I ensured that all duplicates had been removed by using the **COUNTIFS** function again and it returned only 1 record for each series of criterias thereby proving that I now had a clean dataset.

I created a column for total sales as my dataset contained only Quantity and Unit price, I went ahead to create a Region Count column using the **IFS** function to make it easier to analyse my data. Other calculations such as the average sales per product, total sales in the regions and the total revenue was carried out. I went ahead to use the **PIVOT TABLE** to summarize my findings. 

At the end of my excel analysis, I exported my main dataset to another workbook which I saved as a CSV file, so that I could import it easily into my **SQL management studio**. At the management studio, I wrote different querries using the SQL OPerators (Logical, comparison and arithmetic). I also utilized the SQL Join to write my querries.

I went further to import my data into my **POWER BI DESKTOP** work space and went ahead to transform my data. At the transform data page, I checked my column quality which was 100%, column distribution which showed that I had no empty rows or columns and column profile which gave a summary of my columns. I went further to add three conditional columns for Product count, Sales Performance Summary and Summary count. I created measures for **Average Order Sales, Revenue and Yearly Sales growth**. At the end of my analysis, I went ahead to create an interactive dashboard of 3pages. The first page showed the Sales Performance Overview, Page 2 showed sales trend and regional sales performsnce, page 3 showed product analysis. 

#### INSIGHTS AND RECOMMENDATION

### GUIDE
---
#### TOOLS NEEDED

- Microsoft Excel [Download Here](https://www.microsoft.com/en-us/microsoft-365/excel)
    
- SQL - Structured Querry Language for querrying data [Download Here](https://www.microsoft.com/en-us/sql-server/sql-server-downloads)

- Power BI [Install](https://www.microsoft.com/en-us/download/details.aspx?id=58494)

### DATA FILES
This contained the raw uncleaned data that was cleaned and used to perform this analysis.
[LITA Capstone Dataset.xlsx](https://github.com/user-attachments/files/17610774/LITA.Capstone.Dataset.xlsx)

### EXCEL FILES
---
I have included my excel project file alongside some pictures of my pivot table analysis and my excel worksheet.
[SALES DATA.xlsx](https://github.com/user-attachments/files/17610787/SALES.DATA.xlsx)

### SQL QUERRIES
---

I have included the querries I wrote that helped me to understand my dataset better.

``` SQL
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
```

### POWER BI REPORT
---

#### OVERVIEW
<img width="771" alt="Overview - Page 1" src="https://github.com/user-attachments/assets/43690f38-0712-4522-b7db-d39e05ce914b">

#### SALES TREND AND REGIONAL PERFORMANCE
<img width="610" alt="SALES TREND - PAGE 2" src="https://github.com/user-attachments/assets/ec89ab1e-d81b-467f-b8a2-ebf065409573">

#### PRODUCT ANALYSIS
<img width="608" alt="PRODUCT ANALYSIS-PAGE 3" src="https://github.com/user-attachments/assets/5f41687d-84bb-459e-9378-a5393e3d2596">

#### MONTHLY SALES TREND
<img width="408" alt="SUMMARY" src="https://github.com/user-attachments/assets/1091f851-195d-4dc8-8d9d-71ad1a38db28">




