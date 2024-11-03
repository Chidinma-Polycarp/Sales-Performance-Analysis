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

- Microsoft excel [Download](
