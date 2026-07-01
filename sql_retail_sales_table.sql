CREATE TABLE RETAIL_SALES(
transactions_id INT,
sale_date DATE,
sale_time TIME,
customer_id INT,
Gender VARCHAR,
age INT,
category VARCHAR,
quantiy INT,
price_per_unit INT,
cogs NUMERIC,
total_sale INT
);
SELECT * FROM public.retail_sales;