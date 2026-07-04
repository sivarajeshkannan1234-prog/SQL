use restaurants;

create table sales(
transation_id int,
store varchar(50),
sales_amount int);

insert into sales values
(1,'A',100.00),
(2,'A',200.00),
(3,'A',150.00),
(4,'B',250.00),
(5,'B',300.00);

select * from sales;

select store, sum(sales_amount) from sales
group by store

select transation_id, store, sales_amount, 
sum(sales_amount) over (partition by store) as totalsales
from sales;

select transation_id, store, sales_amount, 
sum(sales_amount) over (partition by store order by transation_id desc) as totalsales
from sales;

## Row_number
select transation_id,store,sales_amount,
row_number() over (partition by store order by sales_amount desc) as Row_Num 
from sales;

drop table employees;
create table employees(
employee_id int,
name varchar (40),
dept varchar(40),
hiredate date
);

insert into employees(employee_id,name,dept,hiredate)
values
(1,'Alice','HR','2020-05-01'),
(1,'Alice','HR','2022-06-15'),
(2,'Bob','IT','2021-07-10'),
(3,'charlie','Finance','2020-09-30'),
(3,'charlie','Finance','2022-05-22');

select *from employees;

with employeerank as(
select employee_id,name,dept,hiredate,
row_number() over(partition by employee_id order by hiredate) as RowNum
from employees
)
select *from employeerank where RowNum =1