--data aggregation
select count(*) as no_of_records  from orders

select sum(sales) as total_sales from orders

select max(sales) as max_sales from orders

select min(sales) as min_sales from orders

select avg(sales) as avg_sales from orders

select sum(sales)/count(*) as avg_sales from orders

--group by 
select category,sum(sales) as category_sales
from orders
group by category
;

select region,sum(sales) as region_sales,avg(sales) as region_avg
from orders
group by region


select category,sub_category,sum(sales) as category_sales
from orders
group by category,sub_category
order by category,sub_category


select category,region,sum(sales) as sales
from orders
group by category,region
order by category,region

select category,sub_category,region,sum(sales) as sales
from orders
group by category,sub_category,region
order by category,sub_category,region


select category,sum(sales) as category_sales
from orders
where region='West'
group by category
order by category_sales
;

select region,sum(sales) as region_sales,avg(sales) as region_avg,max(sales) as max_sales
from orders
group by region
having max(sales) < 15000 and sum(sales) > 700000


select region,sum(sales) as region_sales,avg(sales) as region_avg,max(sales) as max_sales
from orders
group by region
having max(sales) < 15000 


select category,region,sum(sales) as region_sales
from orders
group by category


select category,region,sum(sales) as region_sales
from orders
group by category,region
order by category

select category ,max(order_date) latest_order_date
from orders
group by category
having max(order_date)>'2020-03-01'

select category 
from orders
where order_date > '2020-03-01'
group by category

select distinct category,region
from orders
order by category,region

select category ,region
from orders
group by category, region
order by category,region

--group by category
--having max(order_date)>'2023-03-01'

select count(*)
,count(order_id)
,count(postal_code)
,avg(sales)
,count(distinct order_id) total_distinct_orders
from orders

where sales>0
select category ,count(order_id) as cnt,count(distinct order_id) as no_of_orders
from orders
group by category

select category,max(sales)
from orders
group by category
having max(sales)=300