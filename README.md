# Sales-Performance-Analysis
This repository contains a comprehensive sales performance analysis done on a data set for a retail store. I have utilized Excel, SQL and Power BI to identify trends, patterns and correlations to uncover actionable insights that would drive business decisions.


## TABLE OF CONTENT

[OVERVIEW](#overview)

[GUIDE](#guide)

[DATA FILES](#data-files)

[EXCEL FILES](#excel-files)

[SQL QUERIES](#sql-queries)

[POWER BI REPORT](#power-bi-report)

[DOCUMENTATION](#documentation)


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

I created a column for total sales as my dataset contained only Quantity and Unit price, I went ahead to create a Region Count column using the **IFS** function to make it easier to analyse my data. Other calculations such as the average sales per product, total sales in the regions and the total revenue was carried out. I used the **PIVOT TABLE** to summarize my findings. 

At the end of my excel analysis, I exported my main dataset to another workbook which I saved as a CSV file, so that I could import it easily into my **SQL management studio**. At the management studio, I wrote different querries using the SQL OPerators (Logical, comparison and arithmetic). I also utilized the SQL Join to write my querries.

I went further to import my data into my **POWER BI DESKTOP** work space and went ahead to transform my data. At the transform data page, I checked my column quality which was 100%, column distribution which showed that I had no empty rows or columns and column profile which gave a summary of my columns. I went further to add three conditional columns for Product count, Sales Performance Summary and Summary count. I created measures for **Average Order Sales, Revenue and Yearly Sales growth**. At the end of my analysis, I went ahead to create an interactive dashboard of 3pages. The first page showed the Sales Performance Overview, Page 2 showed sales trend and regional sales performsnce, page 3 showed product analysis. 

#### INSIGHTS AND RECOMMENDATION
The insights gotten at the end of the project, alongsides my recommendations will be given in details in the [DOCUMENTATION](#documentation) section.

### GUIDE
---
#### TOOLS NEEDED

- Microsoft Excel [Download Here](https://www.microsoft.com/en-us/microsoft-365/excel)
    
- SQL - Structured Querry Language for querrying data [Download Here](https://www.microsoft.com/en-us/sql-server/sql-server-downloads)

- Power BI [Install](https://www.microsoft.com/en-us/download/details.aspx?id=58494)
  

### DATA FILES
---
I have attached the raw dataset that was cleaned and used to perform this analysis.
[LITA Capstone Dataset.xlsx](https://github.com/user-attachments/files/17610774/LITA.Capstone.Dataset.xlsx)

### EXCEL FILES
---
I have included my excel project file alongside some pictures of my pivot table analysis and my excel worksheet.
[SALES DATA.xlsx](https://github.com/user-attachments/files/17610787/SALES.DATA.xlsx)

#### EXCEL WORKSHEET SHOWING SOME ANALYSIS CARRIED OUT
<img width="810" alt="EXCEL SALES DATA" src="https://github.com/user-attachments/assets/77efe17c-31bc-4e7d-a4f6-3100ee256da8">

#### PIVOT TABLE 
<img width="680" alt="SALES DATA PIVOT TABLE" src="https://github.com/user-attachments/assets/028f54b1-a952-444b-8581-0c10916faa5f">

### SQL QUERIES
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
<img width="710" alt="PRODUCT ANALYSIS-PAGE 3" src="https://github.com/user-attachments/assets/b4cbff4a-46f4-426d-b00d-59cf9e2e3f91">


#### MONTHLY SALES TREND
<img width="408" alt="SUMMARY" src="https://github.com/user-attachments/assets/1091f851-195d-4dc8-8d9d-71ad1a38db28">



DOCUMENTATION
---

**Data Dictionary**

The dataset initially contained 7 columns but for analysis purpose extra 5 columns where added. This columns include;

- **OrderID**: Original column and contained a 4 digit code. It was not used during this analysis as it was not unique to any customer.
  
- **Customer ID**: This is an original column that contained a mixture of text and figures, it was used to distinguish the customers and helped to track the customer with the highest purchase.
  
- **Product**: It contained the list of products sold at the retail store. The best selling product helped to show the products preferred in a particular region.
  
- **Region**: This is also an original column and it contained the region from which the customer was making his purchase from.
  
- **OrderDate**: An original Column, showed the date the order was made. It helped to understand the sales trend and track the revenues for the different years and months.
  
- **Quantity**: An original column that contained the number of product the customer purchased. It helped to track product perfoemance.
  
- **UnitPrice**: An original column showed how much each of the product was sold at.
  
- **Sales Price**: A calculated column that was added in excel, it was gotten by multiplying the quantity column by unitPrice. This gave us the basis of our analysis.
  
- **Region Count**: A conditional column that was added in excel using the IFS function to make it easier to analyze the region column.
  
- **Product Count**: A conditional column added in the power BI transform page which was used to sort the product column.

- **Sales Performance**: A conditional column which was also added in power BI and was used to summarize the revenue gotten from each region, product and customers. The column contained four categories; **Poor, Fair, Good and Excellent**. The average order value is 211.78 which helped to determine the range for the sales performance grading. All sales **< 20** was summarized as **Poor**, while sales **>20 but <200** was summarized as **Fair**, Sales **>200 but <400** was summarized as **GOOD** and finally sales **>400** was summarized as **Excellent**

- **Sumary Count**: A conditional column added in the BI workspace, which was used to sort the sales performance column.

In the Power BI workspace, measures were created to help to summarize data and bring out insights. These measures include:

- **Revenue**: This was created using the **SUM** function to add the values of the Sales price column and produce the total revenue made for the store. The total revenue gotten is **2,101,090**.

- **Average Order Sales**: This was created using the **AVERAGE** function. This found the average of the sales made per order from the sales price column. The average order sales is **211.78** and it was the basis of our sales performance summary as sales below the average was considered as poor or fair depending on tnhe value.

- **Sales Growth YOY**: This was done by using a combination of the **SUM, DIVIDE and CALCULATE** functions. The formula returned **2.68** as the sales growth value which indicated that revenue increased over the year.

#### INSIGHTS AND RECOMMENDATION

-**SALES TREND**

The sales trend chat showed that the highest revenue was gotten in Feburary 2024, the revenue was 298,800 which contributed 14% of the total revenue. It also showed that in April 2023, the revenue made was 7,425 and this is less than 1% of the total revenue, April 2023 had the lowest revenue. On further analysis, it was shown that the product bought in April was socks which is the second lowest performing product. In Feburary, the most purchased product was shoes which is the best performing product by quantity. This accounted for the high revenue generated in Feburary.

**RECOMMENDATION**
In other to boost sales in april, the stores can bring out Easter related packages that would attract more customers. Seasonal sales packages should also be encouraged.

-**PRODUCT ANALYSIS**

Page 3 of my Power BI dashboard shows the product performance in various regions, and the best performing products.

**HAT**: The best performing product by quantity is Hats, a total of **1,991** hats were sold. This generated a revenue of **316,195** which makes up 15% of the total revenue. Although hats are the best selling items by quantity it is the third performing product by sales. 

**SHOES**: This is the top performing product by sales accounting for **29%** of the total revenue. **1,987** pairs of shoes where sold generating a revenue of **613,380**. It was only in the North region that shoes where not sold at all. The south region bought the most pairs of shoes, they bought 993 pairs which is 50% of the total quantity sold.

**SHIRT**: This is the second best performing product by sales and the third best by quantity. **1,487** shirts were sold in total, only two regions bought shirts (North and East) with the north buying the bulk of it (67%). The sales of shirt generated a revenue of **485,600** which makes up **23%** of the total revenue.

**GLOVES, Jacket and  SOCKS**: They are the least performing products. Together they make up only **33%** of the total revenue. 

-**REGION PERFORMANCE**

**SOUTH**: This is the top region by total revenue. It generated a total revenue of **927,820** which makes up **44%** of the total revenue generated. The sales summary showed that no sales <20 was made, most sales were >200. The most popular product in the south was Shoes, followed by gloves and then socks. A total of **2,480** products were sold. Hats, jackets and shirts were not sold in this region. Page 2 and 3 of my BI report gives insight on this region.

**EAST**: This is the second best region by total revenue. It generated a total revenue of **485,925** which makes up **23%** of the total revenue. The sales summary showed that **60%** of the sales in this region was >20 but <400. A total of **2483** products were sold with **Hats** being the most sold product. 

**NORTH**: This region generated **387,000** in revenue. The most popular products sold here was shirts (992) and jackets (993).

**WEST**: This is the least performing region, contributing only **14%** of the total revenue. The sales performance showed that there was no sale above 400 in this region. This was the only region that recorded sales <20. The Poor sales accounted for **20%** of their total sales. The most sold product in the western region was Socks, **67%** of the total quantity of socks sold were purchaased in this region.
