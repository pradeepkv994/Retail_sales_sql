Drop table if exists retail_Sale;
CREATE TABLE retail_sale
			(
    			transactions_id int PRIMARY KEY,
    			sale_date DATE,	
    			sale_time TIME,
    			customer_id INT,	
    			gender VARCHAR(15),
    			age INT,
    			category VARCHAR(35),
    			quantity INT,
    			price_per_unit FLOAT,	
    			cogs FLOAT,
    			total_sale FLOAT
			);



select * from retail_sale;

select* from retail_Sale;
select count(*) from retail_sale;
select count(customer_id) from retail_sale;

##Find null values

select * from retail_sale where transactions_id is null;

select * from retail_sale where sale_date is null;

select * from retail_sale where sale_time is null;

select * from retail_sale where total_sale is null;

select* 
	from retail_sale 
		where 
        transactions_id is null
        or 
        sale_date is null
        or
        sale_time is null
        or
        customer_id is null
        or
        gender is null
        or
        category is null
        or
        quantity is null
        or
        price_per_unit is null
        or
        cogs is null
        or
        total_sale is null
        ;

Delete from retail_sale 
		where 
        transactions_id is null
        or 
        sale_date is null
        or
        sale_time is null
        or
        customer_id is null
        or
        gender is null
        or
        category is null
        or
        quantity is null
        or
        price_per_unit is null
        or
        cogs is null
        or
        total_sale is null
        ;
select count(*) from retail_sale;
select* 
	from retail_sale 
		where 
        age is null;
--
select count(*) as total_sale from retail_sale;

---How many unique customers we have

select count(distinct customer_id) from retail_sale;

--How many unique customers we have

select distinct category from retail_sale;

 Data Analysis & Business Key Problems & Answers

-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05'
select * from retail_sale where sale_date = '2022-11-05';

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022.
select 
* 
from retail_Sale 
where 
category ='Clothing' 
and
to_char(sale_date,'YYYY-MM')= '2022-11'
AND
QUANTITY >= 4;
select * from retail_Sale;

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
SELECT CATEGORY,SUM(TOTAL_sALE) AS NET_SALE,COUNT(*) AS TOTAL_ORDERS FROM RETAIL_SALE GROUP BY CATEGORY;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
select CATEGORY,ROUND(avg(age),2) as avg_age from retail_sale where category='Beauty' GROUP BY CATEGORY;

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
select* from retail_sale where total_Sale >1000;

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
select gender,category,count(transactions_id) as Total_Trans from retail_sale group by gender,category;

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
SELECT to_char(sale_date,'MM') AS SALE_MONTH,to_char(sale_date,'YYYY') AS SALE_YEAR,AVG(TOTAL_SALE) AS AVG_SALE 
FROM RETAIL_SALE 
GROUP BY to_char(sale_date,'MM') ,to_char(sale_date,'YYYY');

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
select * from retail_Sale;
SELECT CUSTOMER_ID,SUM(TOTAL_SALE) AS NET_SALE FROM RETAIL_SALE GROUP BY CUSTOMER_ID ORDER BY NET_SALE DESC LIMIT 5;
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.

SELECT CATEGORY,COUNT(DISTINCT CUSTOMER_ID) AS NO_OF_CUS FROM RETAIL_SALE GROUP BY CATEGORY;
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

