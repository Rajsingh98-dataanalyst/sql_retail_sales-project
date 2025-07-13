🛍️ Retail Sales SQL Project
This project focuses on analyzing a retail sales dataset using SQL. It showcases various data analytics techniques that are essential for understanding customer behavior, sales performance, and business trends in a retail environment. All SQL queries were executed in PostgreSQL using pgAdmin.

📌 Project Objectives
Clean and explore transactional retail data

Answer common business questions using SQL

Demonstrate data analysis skills using joins, filtering, aggregations, CTEs, and window functions

Gain insights about customers, categories, and sales trends

🗃️ Dataset Overview
The dataset contains the following columns:

Column Name	Description
transaction_id	Unique transaction identifier
sale_date	Date of sale
sale_time	Time of sale
customer_id	ID of the customer
gender	Gender of the customer
age	Age of the customer
category	Product category (e.g. Clothing)
quantity	Number of items purchased
price_per_unit	Unit price of product
cogs	Cost of goods sold
total_sale	Total amount from the sale

🧹 Data Cleaning
Checked for NULL values in key columns (transaction_id, sale_date, sale_time, gender, category, etc.)

Removed incomplete records to ensure data quality

📊 Key Business Questions Answered
Question	Technique Used
Sales made on a specific date	Filtering with WHERE
Clothing category sales with quantity > 4 in November 2022	TO_CHAR, filters
Total sales and total orders by product category	GROUP BY, aggregations
Average age of customers who bought from the "Beauty" category	AVG() + filter
Transactions where total_sale > 1000	Filtering
Transactions count by gender and category	GROUP BY
Best-selling month in each year based on average sales	Window function RANK()
Top 5 customers with the highest total sales	ORDER BY + LIMIT
Unique customers by category	COUNT(DISTINCT customer_id)
Number of orders per time shift (Morning, Afternoon, Night)	CASE in CTE, grouping

🧠 Skills Demonstrated
SQL Data Cleaning

Aggregations (SUM, AVG, COUNT)

Filtering and Conditional Logic

Date and Time functions

Common Table Expressions (CTEs)

Window Functions (RANK() for best month)

Subqueries and Aliases

🗂️ Project Files
pgsql
Copy
Edit
Retail_Sales_SQL_Project/
├── retail_sales_schema.sql        -- Table creation script
├── data_cleaning_queries.sql      -- Data cleaning queries
├── business_analysis_queries.sql  -- Business question answers
├── README.md                      -- Project documentation
🔗 Connect with Me
📍 Raj - Aspiring Data Analyst
🎓 B.Sc. IT, University of Mumbai (2023–2025)
🔗 LinkedIn Profile
