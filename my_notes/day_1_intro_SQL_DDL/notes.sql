create table amazon_orders (
    order_id INTEGER, 
    order_date DATE,
    amount DECIMAL(6, 2),
    product_name VARCHAR(100),
    customer_id VARCHAR(20),
    payment_mode VARCHAR(10)
);

insert into amazon_orders values(
    1,
    '2023-01-01',
    100,
    'some-1',
    'praanshu',
    'UPI'
);

insert into amazon_orders values(
    2,
    '2023-01-23',
    100,
    'some-2',
    'praanshu',
    'Credit'
);

SELECT * from amazon_orders;

select 
    order_id, order_date, amount, product_name
from 
    amazon_orders;

select
    *
from
    amazon_orders
WHERE
    order_id = 2