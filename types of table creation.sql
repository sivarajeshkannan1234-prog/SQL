create database	de_project;
use de_project;
create table test (sno int , name varchar(100));
insert into test (sno,name) values (1,'siva');
insert into test (sno,name) values (2,'surya');
select * from test;
update test set name ='vishwa' where sno =1;
delete from test where sno=2; 
select * from test;


##TYPES OF TABLE CREATION 
## TYPE 1
create table employees(
employee_id int primary key,
first_name varchar(50) not null,
last_name varchar(20) not null,
hire_date date not null,
salary decimal(10,2)
);
select * from employees;

## TYPE 2
##CTAS
create table high_paid_employees AS
select
employee_id,
first_name,
last_name,
hire_date,
salary
from employees where salary > 60000;

## TYPE 3
create temporary table temp_high_paid_employees(
employee_id int,
salary decimal(10,2)
);
insert into temp_high_paid_employees
select
employee_id,
salary
from employees
where salary > 60000

##TYPE 4
##CTE-COMMON TABLE EXPERESSION
WITH high_salary_cte AS(
select employee_id, first_name, last_name, salary
from employees 
where salary > 70000
)
create table high_salary_emplyees_via_cte
select* from high_salary_cte; 
