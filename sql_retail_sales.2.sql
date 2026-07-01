-- EDA
select * from public.retail_sales;
--check whether the transaction ids are unique or not
select transactions_id from  public.retail_sales where transactions_id is null;
select transactions_id, count(*) from  public.retail_sales 
group by transactions_id
having count(*) >1;
--sales date in correct format or not 
select sale_date from  public.retail_sales 
SELECT sale_date
FROM public.retail_sales
WHERE TO_CHAR(sale_date, 'YYYY-MM-DD') !~ '^\d{4}-\d{2}-\d{2}$';
-- check type of category
select category from  public.retail_sales 
group by category;
--quantity check
select quantiy from  public.retail_sales 
group by quantiy;
--checking for all null values 
select * from public.retail_sales
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
age is null
or 
category is null
or 
quantiy is null 
or 
price_per_unit is null 
or
cogs is null 
or
total_sale is null

--deleting for null values
delete from public.retail_sales
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
age is null
or 
category is null
or 
quantiy is null 
or 
price_per_unit is null 
or
cogs is null 
or
total_sale is null
