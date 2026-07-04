use company;

create table employee(
id int,
name varchar(50),
salary int,
year int);

insert into employee values
(1,'alice', 5000.00,2021),
(1,'alice', 5500.00,2022),
(1,'alice', 6000.00,2023),
(1,'alice', 6500.00,2024),
(1,'alice', 7000.00,2025),
(2,'bob', 4500.00,2023),
(2,'bob', 4800.00,2024),
(3,'charlie', 4000.00,2023),
(3,'charlie', 4200.00,2024),
(4,'david', 4600.00,2023),
(4,'david', 4700.00,2024),
(5,'eva', 5200.00,2023),
(5,'eva', 5400.00,2024);


## first_value
select *,
first_value (salary) over (partition by id order by year) as first_salary
from employee;

##last_values
select *,
last_value (salary) over (partition by id order by year
					 rows between current row and unbounded following) as last_salary
from employee;

## difference
select *,
last_value (salary) over (partition by id order by year
					 rows between current row and unbounded following) as last_salary,
last_value (salary) over (partition by id order by year
					 rows between current row and unbounded following) - salary as difference
from employee;
