select * from amazon_orders;

alter table amazon_orders add mobile_number varchar(10);

alter table amazon_orders drop column mobile_number;

alter table amazon_orders rename column mobile_number to mobile;

-- Rename column name
sp_rename 'amazon_orders.mobile' , 'mobile1';
alter table amazon_orders drop column mobile1;

alter table amazon_orders alter column order_date datetime;
alter table amazon_orders alter column payment_mode varchar(50);

insert into amazon_orders values (
    3, '2023-01-26 02:10:03', 5000, 'some2', 'praanshu', 'Debit', '9876543212'
)

insert into amazon_orders values (
    4, '2023-01-26 02:10:03', 5000, 'some5', 'praanshu', 'Credit Card', '9876543212'
)

drop table amazon_orders;

create table amazon_orders
(
order_id integer primary key,
order_date date,
amount decimal(6,2) not null,
product_name varchar(100),
customer_id varchar(20) not null,
payment_mode varchar(20) check (payment_mode in ('UPI', 'Credit Card', 'Debit Card', 'Cash')),
mobile_number varchar(10),
constraint amount_greater_0 check(amount > 0)
);

-- Primary Key Constraint
insert into amazon_orders values (
    1, '2023-01-26 02:10:03', 5000, 'some5', 'praanshu', 'Credit Card', '9876543212'
)

-- custom constraint on amount
insert into amazon_orders values (
    2, '2023-01-26 02:10:03', 10, 'some5', 'praanshu', 'Credit Card', '9876543212'
)

-- custom constraint on payment_mode
insert into amazon_orders values (
    3, '2023-01-26 02:10:03', 10, 'some5', 'praanshu', 'Credit Card', '9876543212'
)

insert into amazon_orders values (
    4, '2023-01-26 02:10:03', 10, 'some5', 'praanshu', 'UPI', '9876543212'
)

-- insert into amazon_orders values (
--     4, '2023-01-26 02:10:03', 0, 'some5', 'praanshu', 'UPI', '9876543212'
-- )

alter table amazon_orders add constraint un_order_id unique(order_id);
alter table amazon_orders drop constraint un_order_id;

