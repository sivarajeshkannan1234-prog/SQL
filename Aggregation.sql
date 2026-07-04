use de_project;
CREATE TABLE CustomerTransactions (
id INT PRIMARY KEY,
login_device VARCHAR(50),
customer_name VARCHAR(100),
ip_address VARCHAR(20),
product VARCHAR(100),
amount DECIMAL(10, 2),
is_placed BOOLEAN,
is_viewed BOOLEAN,
transaction_status VARCHAR(20)
);

INSERT INTO CustomerTransactions VALUES
(1, 'Mobile', 'Ravi', '192.168.1.1', 'Laptop', 50000.00, TRUE, FALSE, 'Completed'),
(2, 'Desktop', 'Priya', '192.168.1.2', 'Smartphone', 20000.00, TRUE, TRUE, 'Completed'),
(3, 'Tablet', 'Arjun', '192.168.1.3', 'Headphones', 1500.00, FALSE, TRUE, 'Failed'),
(4, 'Mobile', 'Meena', '192.168.1.4', 'Shoes', 2500.00, TRUE, FALSE, 'Completed'),
(5, 'Desktop', 'Karthik', '192.168.1.5', 'watch', 5000.00, TRUE, TRUE, 'Completed'),
(6, 'Mobile', 'Sowmya', '192.168.1.6', 'Tablet', 15000.00, TRUE, TRUE, 'Completed'),
(7, 'Tablet', 'Ramesh', '192.168.1.7', 'Smartphone', 25000.00, FALSE, TRUE, 'Failed'),
(8, 'Desktop', 'Divya', '192.168.1.8', 'Laptop', 60000.00, TRUE, FALSE, 'Completed'),
(9, 'Mobile', 'Arun', '192.168.1.9', 'Smartwatch', 12000.08, TRUE, TRUE, 'Completed'),
(10, 'Tablet', 'Deepa', '192.168.1.10', 'Laptop', 55000.00, FALSE, FALSE, 'Pending');

select *from CustomerTransactions;

select count(*) from CustomerTransactions;

select count(*) from CustomerTransactions where transaction_status='Failed' and product='loptop';

select count(*) from CustomerTransactions where transaction_status in ('Failed','pending');

select sum(amount) from CustomerTransactions;

select sum(amount) from CustomerTransactions where transaction_status='completed'

##ALASH NAME OR NIKE NAME
select sum(amount) as total_transaction from CustomerTransactions where transaction_status='completed';

select min(amount) as min_transation from CustomerTransactions;

select max(amount) as max_transation from CustomerTransactions;

select avg(amount) as avg_transation from CustomerTransactions;

## GROUP BY
select login_device,
sum(amount) as total_revenue
from customerTransactions
group by login_device;


## HAVING 
select login_device,
sum(amount) as total_revenue
from customerTransactions
group by login_device
having
sum(amount)>80000;
