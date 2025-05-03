use mysql
select * from df_orders

create table df_orders([order_id] int primary key,
[order_date] date,
[ship_mode] varchar(20), 
[segment] varchar(20), 
[country] varchar(20), 
[city] varchar(20),
[state] varchar(20), [postal_code] varchar(20), 
[region] varchar(20), [category] varchar(20)
,[sub_category] varchar(20),
[product_id] varchar(50), [quantity] int,[discount] decimal(7,2), 
[sale_price] decimal(7,2), [profit] decimal(7,2))

select * from df_orders

---Analysis----

--1. find the top 10 highest revenue gentrating products

select top 10 product_id, sum(sale_price) from df_orders
group by product_id
order by sum(sale_price) desc

--2. find top 5 highest selling products in each region

with cte as
(select region,product_id, sum(sale_price)  as sales
from df_orders
group by region, product_id)
select * from (select *, row_number() over(partition by region order by sales desc) as rn
from cte) a
where rn<=5

-- 3. find month over month growth comparison from 2022 and 2023 sales
with cte as (select month(order_date) as month_name, year(order_date) as year_name, sum(sale_price) as sales
from df_orders
group by month(order_date) , year(order_date)
--order by month_name,year_name asc
)
select month_name,
sum(case when year_name=2022 then sales else 0 end) as sales_2022
,sum(case when year_name=2023 then sales else 0 end)as sales_2023
from cte
group by month_name
order by month_name

--4. for each category which month had highest sales
select * from df_orders

-- Subquery 
WITH cte AS (
    SELECT category, FORMAT(order_date, 'yyyyMM') AS order_year_month, SUM(sale_price) AS sales 
    FROM df_orders GROUP BY category, FORMAT(order_date, 'yyyyMM'))
select * from (SELECT *, ROW_NUMBER() OVER(PARTITION BY category ORDER BY sales DESC) AS rn FROM cte) a
where rn=1

-- With Double Cte 
WITH cte AS (
    SELECT category, FORMAT(order_date, 'yyyyMM') AS order_year_month, SUM(sale_price) AS sales 
    FROM df_orders GROUP BY category, FORMAT(order_date, 'yyyyMM') 
	)
,cte2 as (SELECT *, ROW_NUMBER() OVER(PARTITION BY category ORDER BY sales DESC) AS rn FROM cte) 
select * from cte2 where  rn=1 order by sales desc

--5. which sub category had highest growth by profit in 2023 compare to 2022 in percetage
with cte as (select year(order_date) as year_name,sub_category, sum(sale_price) as sales
from df_orders
group by year(order_date),sub_category
--order by month_name,year_name asc
)
,cte2 as(
select sub_category,
sum(case when year_name=2022 then sales else 0 end) as sales_2022
,sum(case when year_name=2023 then sales else 0 end)as sales_2023
from cte
group by sub_category)
select top 1 *,(sales_2023-sales_2022)*100/sales_2022 as profit from cte2 
order by (sales_2023-sales_2022)*100/sales_2022 desc


