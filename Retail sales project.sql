--DROP TABLE IF EXISTS retail_sales;
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
--Exploring the data	
SELECT COUNT(*) 
FROM retail_sales

SELECT * 
FROM retail_sales 
LIMIT 5;

-- Checking for null values
SELECT * FROM retail_sales
WHERE 
    transaction_id IS NULL
    OR
    sale_date IS NULL
    OR 
    sale_time IS NULL
    OR
    gender IS NULL
    OR
    category IS NULL
    OR
    quantity IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;

-- Delete rows that contains null values 
DELETE FROM retail_sales
WHERE 
    transaction_id IS NULL
    OR
    sale_date IS NULL
    OR 
    sale_time IS NULL
    OR
    gender IS NULL
    OR
    category IS NULL
    OR
    quantity IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;

--How many costumers we have?
SELECT COUNT(DISTINCT customer_id ) as Num_of_customers 
FROM retail_sales

--How many categories we have?
SELECT DISTINCT category as Categories 
FROM retail_sales

--What is the range of ages?
SELECT MIN(age) , MAX(age)
FROM retail_sales

--What are the transactions that made on 2022-11-05?
SELECT *
FROM retail_sales
WHERE sale_date ='2022-11-05'

--What are the transactions where the category is 'Clothing' 
--and the quantity sold is more than 10 in the month of Nov-2022
SELECT *
FROM retail_sales
WHERE DATE_TRUNC('month',sale_date )= '2022-11-01' 
AND category = 'Clothing'
AND(quantity)>=4

--Which category is the most popular? and what is total revenue?
SELECT category ,COUNT(transaction_id) AS NUM_OF_ORDERS,SUM(total_sale) AS NET_SALE
FROM retail_sales
GROUP BY 1
ORDER BY 2 DESC

--What is the average age of customers who buy from Beauty category?
SELECT ROUND(AVG(age),3)
FROM retail_sales
WHERE category='Beauty'

-- What are the transactions where the total_sale > or equal 1000 ?
SELECT *
FROM retail_sales
WHERE total_sale>=1000
ORDER BY total_sale

-- What is the total number of transactions made by each gender in each category?
SELECT category ,gender , COUNT(transaction_id) AS NUM_OF_ORDERS
FROM retail_sales
GROUP BY 1,2
ORDER BY 3

-- What is the best selling month in each year?
SELECT *
FROM (
SELECT EXTRACT(YEAR FROM sale_date ) as year,
EXTRACT(MONTH FROM sale_date ) as month ,
AVG(total_sale) as avg_sales,
RANK() OVER (PARTITION BY EXTRACT(YEAR FROM sale_date ) ORDER BY AVG(total_sale) DESC ) 
FROM retail_sales
GROUP BY 1,2
)t2
WHERE rank=1

--Who are the top 5 customers with the highest total_sales?
SELECT customer_id,SUM(total_sale) AS sum_total_sale
FROM retail_sales
GROUP BY 1
ORDER BY 2 desc
LIMIT 5  

--From each category how many unique customers purchased items from them?
SELECT category, COUNT (DISTINCT customer_id) AS NUM_OF_CUSTOMERS
FROM retail_sales
GROUP BY 1
ORDER BY 1,2

-- What is the number of transactions in each shift (Morning <12, Afternoon between 12 & 17 , Evening >17)?
Select shift , COUNT(transaction_id)
FROM(
SELECT *,
CASE 
WHEN DATE_PART('hour',sale_time)<12 THEN 'Morning'
WHEN DATE_PART('hour',sale_time)BETWEEN 12 AND 17  THEN 'Afternoon'
ELSE 'Evening' 
END as shift
FROM retail_sales 
) as t2
GROUP BY 1
ORDER BY 2 

--Which age group has the most number of transactions?
WITH t1 as (SELECT *,
CASE 
WHEN age<20 THEN 'Teenagers'
WHEN age BETWEEN 20 AND 35  THEN 'Young Adults'
WHEN age BETWEEN 36 AND 50 THEN 'Adults'
ELSE 'Older Adults' 
END as Group_age
FROM retail_sales )

SELECT Group_age,COUNT(*)
FROM t1
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1

--How many days are between the first and last transactions for each customer? Which one has the longest period? 
SELECT customer_id, last_trans-first_trans AS num_of_days
FROM
(
SELECT customer_id, MIN(sale_date) AS first_trans ,MAX(sale_date) as last_trans
FROM retail_sales 
GROUP BY 1 
ORDER BY 1
)
ORDER BY 2 DESC
LIMIT 1

--Which days of the week have the highest number of sales?
SELECT DATE_part('DOW' , SALE_DATE) ,TRIM(TO_CHAR(SALE_DATE,'Day')) ,COUNT(transaction_id)
FROM retail_sales
GROUP BY 1,2
ORDER BY 3 DESC


