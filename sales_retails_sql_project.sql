--sql retails sales analysis --p1
CREATE DATABASE sql_project_p2;


--create table
DROP TABLE IF EXISTS retail_sales;
CREATE TABLE retail_sales
            (
                transaction_id INT PRIMARY KEY,	
                sale_date DATE,	 
                sale_time TIME,	
                customer_id	INT,
                gender	VARCHAR(15),
                age	INT,
                category VARCHAR(15),	
                quantity	INT,
                price_per_unit FLOAT,	
                cogs	FLOAT,
                total_sale FLOAT
            );
		
select  * from retail_sales
limit 10;

select count(*) from 
retail_sales;

--data cleaning

select * from retail_sales
where transaction_id is null;

select * from retail_sales
where sale_date is null;

select * from retail_sales
where 
    transaction_id is null
	or
	sale_date is null
	or 
	sale_time is null
	or
	gender is null
	or 
	category is null
	or
	quantity is null
	or 
	cogs is null
	or 
	total_sale is null;


delete from retail_sales
where 
    transaction_id is null
	or
	sale_date is null
	or 
	sale_time is null
	or
	gender is null
	or 
	category is null
	or
	quantity is null
	or 
	cogs is null
	or 
	total_sale is null;
	
--data exploration 

--how many sales we have ?

select count(*) as total_sales
 from retail_sales;

--how many unique customer we have?

 select count( DISTINCT customer_id)  AS TOTAL_SALES
 from  retail_sales;

select distinct category from retail_sales;

--data Analysis & business key problems & answer

-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the mont of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05

select * from retail_sales
where sale_date = '2022-11-05';

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022
 
select *
from retail_sales
where category = 'Clothing'
AND
TO_CHAR(SALE_DATE,'YYYY-MM') = '2022-11'
AND
quantity >= 4;
--
select  category,
sum(total_sale) as sales,
count(*) as total_orders
from retail_sales
group by 1;


-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.


select 
     Round(avg(age),2) as avg_age
	 from retail_sales
	 where category = 'Beauty'
	 
- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
select * from retail_sales
where total_sale > 1000;



-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

select category,gender,
count(*) as total_trans
from retail_sales
group by 1,2
order by 1;


-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year

SELECT 
       year,
       month,
    avg_sale
FROM 
(    
SELECT 
    EXTRACT(YEAR FROM sale_date) as year,
    EXTRACT(MONTH FROM sale_date) as month,
    AVG(total_sale) as avg_sale,
    RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC) as rank
FROM retail_sales
GROUP BY 1, 2
) as t1
WHERE rank = 1

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales

select  customer_id , 
sum(total_sale) as totals_sale
from retail_sales
group by customer_id
order by 2 desc
limit 5;

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.

select  count(DISTINCT customer_id), category,
 from retail_sales
group by 2;
    

-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)

with hours_sales as
(
select *, 
case
    when EXTRACT(HOUR FROM sale_time) < 12 Then 'morning'
   when EXTRACT(HOUR FROM sale_time) Between 12 and 17 Then 'afternoon'
   else 'night'
   end as shift
   from retail_sales
)
 select  shift,
 count(*) as total_order
 from hours_sales
 group  by shift;


--End of project --















			