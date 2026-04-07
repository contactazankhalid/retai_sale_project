
-- My Analysis & Findings
--Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
select * from [SQL - Retail Sales Analysis_utf ]
where sale_date='2022-11-05'

--Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 2 in the month of Nov-2022
select * from [SQL - Retail Sales Analysis_utf ]
where category='clothing' and quantiy>2
   AND FORMAT(sale_date, 'yyyy-MM') = '2022-11';

   -- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
   select 
      category,
	  SUM(total_sale) 
	  from [SQL - Retail Sales Analysis_utf ] 
	  group by category;

	  -- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
	  select 
		    AVG(age) as avg_age
			from [SQL - Retail Sales Analysis_utf ] 
			where category='Beauty'


	-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
	select *
	from [SQL - Retail Sales Analysis_utf ] 
	where total_sale>1000;


	--Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
	select 
	gender,category,
	COUNT(transactions_id)
	from [SQL - Retail Sales Analysis_utf ] group by gender,category;


	-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
	select 
	Format(sale_date, 'yyyy') as [year],
	Format(sale_date,'MM') as [month],
	avg(total_sale) as avg_sale
	from [SQL - Retail Sales Analysis_utf ]
	group by format(sale_date,'yyyy') ,
	format(sale_date,'MM') ;


	-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales
	SELECT TOP 5customer_id,
	SUM(total_sale) AS TOTAL_SPENT
	FROM [SQL - Retail Sales Analysis_utf ]
	GROUP BY customer_id
	ORDER BY TOTAL_SPENT DESC


	--Write a SQL query to find the number of unique customers who purchased items from each category.
	SELECT
	category,COUNT( DISTINCT customer_id)
	FROM [SQL - Retail Sales Analysis_utf ]
	GROUP BY category;

	-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

WITH HOURLY_SALE
AS
(
SELECT *,
CASE
WHEN DATEPART(HOUR,SALE_TIME)<12 THEN 'MORNING'
WHEN DATEPART(HOUR,sale_TIME) BETWEEN 12 AND 17 THEN 'AFTERNOON'
ELSE 'EVENING'
END AS SHIFT
FROM [SQL - Retail Sales Analysis_utf ]
)
SELECT SHIFT,COUNT(*) FROM HOURLY_SALE GROUP BY SHIFT;


	