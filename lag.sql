use company;

create table employeesalaries(
id int,
name varchar(50),
salary int,
year int);

insert into employeesalaries values
(1,'alice', 5000.00,2023),
(1,'alice', 5500.00,2024),
(2,'bob', 4500.00,2023),
(2,'bob', 4800.00,2024),
(3,'charlie', 4000.00,2023),
(3,'charlie', 4200.00,2024),
(4,'david', 4600.00,2023),
(4,'david', 4700.00,2024),
(5,'eva', 5200.00,2023),
(5,'eva', 5400.00,2024);

select *,
lag (salary) over (partition by id order by year) as previoussalary
from employeesalaries;

select *,
lag (salary) over (partition by id order by year) as previoussalary,
salary -lag (salary) over (partition by id order by year) as salarydifference
from employeesalaries;
