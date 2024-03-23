-- Note: please do not use any functions which are not taught in the class. you need to solve the questions only with the concepts that have been discussed so far.

-- 1- write a query to get region wise count of return orders

select orders.region, count(orders.order_id) as count_orders
from orders
inner join [returns] on orders.order_id = returns.order_id
group by orders.region


-- 2- write a query to get category wise sales of orders that were not returned

select orders.category, round(sum(orders.sales), 2) as total_sales
from orders
full join [returns] on orders.order_id = returns.order_id
where return_reason is NULL
group by orders.category

-- 3- write a query to print dep name and average salary of employees in that dep .

select dept.dep_id, min(dept.dep_name) as department_name, avg(employee.salary) as average_salary
from employee
full join dept on dept.dep_id = employee.dept_id
group by dept.dep_id

-- 4- write a query to print dep names where none of the emplyees have same salary.

select dept.dep_name
from employee
inner join dept on dept.dep_id = employee.dept_id
group by dept.dep_name
having count(emp_id) = count(distinct salary)

-- 5- write a query to print sub categories where we have all 3 kinds of returns (others,bad quality,wrong items)

select orders.sub_category , count(distinct returns.return_reason) as return_kind_count
from orders
inner join [returns] on orders.order_id = returns.order_id
group by sub_category
having count(distinct returns.return_reason) = 3

-- 6- write a query to find cities where not even a single order was returned.

select orders.city, count(returns.order_id) as cities_count
from orders
left join [returns] on orders.order_id = returns.order_id
group by orders.city
having count(returns.order_id) = 0
order by orders.city

-- 7- write a query to find top 3 subcategories by sales of returned orders in east region

select top 3 sub_category, round(sum(sales), 2) as total_sales
from orders
inner join [returns] on orders.order_id = returns.order_id
where orders.region = 'East'
group by orders.sub_category
order by total_sales desc

-- 8- write a query to print dep name for which there is no employee

select dept.dep_name, count(employee.emp_id) as employee_count
from employee
full join dept on dept.dep_id = employee.dept_id
group by dept.dep_name
having count(employee.emp_id) = 0

-- 9- write a query to print employees name where dep id is not avaiable in dept table

select employee.emp_name
from employee
left join dept on dept.dep_id = employee.dept_id
where dept.dep_id is NULL

-- 10-write a query to print emp name , their manager name and diffrence in their age for employees whose age is less then their manager's age 

select employee.emp_name, manager.emp_name, manager.emp_age - employee.emp_age as age_difference
from employee
inner join employee as manager on manager.emp_id = employee.manager_id
where employee.emp_age < manager.emp_age

-- 11-write a query to print emp name, manager name and senior manager name (senior manager is manager's manager)

select * from employee

select employee.emp_name as employee_name, manager.emp_name as manager_name, s_manager.emp_name as s_manager_name
    -- employee.emp_id, employee.emp_name, employee.manager_id
    -- ,manager.emp_id as manager_emp_id, manager.emp_name as manager_name, manager.manager_id as manager_manager_id
    -- ,s_manager.emp_id as s_manager_emp_id, s_manager.emp_name as s_manager_name, s_manager.manager_id as s_manager_manager_id
from employee
inner join employee as manager on manager.emp_id = employee.manager_id
inner join employee as s_manager on s_manager.emp_id = manager.manager_id
