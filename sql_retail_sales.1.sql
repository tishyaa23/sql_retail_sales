
--Write a SQL query to retrieve all columns for sales made on '2022-11-05
 select * from public.retail_sales;
 select * from public.retail_sales where sale_date ='2022-11-05';

 --Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
 select * from public.retail_sales
 where category = 'Clothing' 
 and quantiy > 3
 and sale_date between '2022-11-01 ' and '2022-11-30';

--Write a SQL query to calculate the total sales (total_sale) for each category.
select category,Sum(total_sale) from public.retail_sales 
group by category;

--Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
select category, AVG(age) from public.retail_sales
where category='Beauty'
group by category;

--Write a SQL query to find all transactions where the total_sale is greater than 1000.
select transactions_id,total_sale from public.retail_sales
where total_sale >1000;

--Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
select category, gender, COUNT(*) as total_no_of_trans 
from public.retail_sales
group by gender,category;

--Write a SQL query to calculate the average sale for each month. Find out best selling month in each year


select year,month,avg_sale from
(
select 
extract (year from sale_date) as year,
to_char(sale_date,'mon') as month,
avg(total_sale) as avg_sale,
rank() over(partition by extract (year from sale_date) order by avg(total_sale) desc ) as rank
from public.retail_sales 
group by year,month) 
where rank =1;


--Write a SQL query to find the top 5 customers based on the highest total sales 
select * from public.retail_sales;
select customer_id,sum(total_sale) 
from public.retail_sales
group by customer_id
order by sum(total_sale) desc
limit 5;


--Write a SQL query to find the number of unique customers who purchased items from each category.
select 
 category, count(distinct (customer_id))
from public.retail_sales
group by category; 

-- Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
with sales as
(
select *, 
case 
when extract(hour from sale_time) <=12 then 'Morning'
when extract(hour from sale_time) >12 and extract(hour from sale_time) <=17 then 'Afternoon'
when extract(hour from sale_time) >17 then 'Evening'
end as shift
from public.retail_sales
)
select shift,
count(transactions_id) as no_of_orders
from sales 
group by shift;







