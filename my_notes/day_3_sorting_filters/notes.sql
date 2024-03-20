select * from orders;

select *
from orders
where category in ('Furniture', 'Technology')

select *
from orders
where quantity > 3

select order_id, quantity
from orders
where quantity between 2 and 4

select distinct category
from orders

select distinct quantity
from orders
where quantity between 2 and 4
order by quantity desc

select *
from orders
where category = 'Furniture' or category = 'Technology'

select * from orders
where customer_name like 'b%'

select * from orders
where customer_name like '%e[^ ]g%'