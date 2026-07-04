create database company;
use company;
 
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50)
);
INSERT INTO customers (customer_id, customer_name, city) VALUES
(1, 'Ravi Kumar', 'Chennai'),
(2, 'Priya Sharma', 'Bangalore'),
(3, 'Arjun Mehta', 'Hyderabad'),
(4, 'Meena Gupta', 'Mumbai'),
(5, 'Karthik Raj', 'Chennai');

drop table orders;
CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    order_amount DECIMAL(10,2),
    order_date DATE
);

INSERT INTO orders VALUES
(101, 1, 5000.00, '2025-01-01'),
(102, 2, 10000.00, '2025-01-02'),
(103, 3, 3000.00, '2025-01-03'),
(104, 4, 1500.00, '2025-01-04'),
(105, 1, 7000.00, '2025-01-05'),
(106, 5, 8000.00, '2025-01-06');

## SUB QUERY USING SELECT FUNCTION
select customer_name,
(select max(order_amount) from orders)as highest_order 
from customers;

select distinct customer_id from orders where order_amount >=5000;
 
## SUB QUERY USING WHERE FUNCTION
select customer_name
from customers
where customer_id in(
    select distinct customer_id 
    from orders 
    where order_amount >=5000
    );

## SUB QUERY USING exists FUNCTION
select customer_name
from customers
where exists (
select * from customers where city='chennai'
);

select
customer_name,
city,
(select sum(order_amount)
from orders o
where o.customer_id = c.customer_id) as total_orders
from customers c;

## SUB QUERY USING CASE WHEN FUNCTION
select
customer_name,
case
when (select sum(order_amount) from orders where orders.customer_id = customers.customer_id)>
	 (select avg(order_amount) from orders) then 'above average'
else 'below average'
end as order_category
from customers;