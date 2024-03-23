select orders.order_id, return_reason
from orders
inner join returns on orders.order_id = returns.order_id

select orders.order_id, return_reason
from orders
left join returns on orders.order_id = returns.order_id

select orders.order_id, return_reason
from orders
right join returns on orders.order_id = returns.order_id

select * from employee
select * from dept

select *
from employee
inner join dept on employee.dept_id = dept.dep_id

select *
from employee
right join dept on employee.dept_id = dept.dep_id

select *
from employee
left join dept on employee.dept_id = dept.dep_id

select *
from employee
full join dept on employee.dept_id = dept.dep_id