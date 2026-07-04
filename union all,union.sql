use company;
drop table if exists employees;
drop table if exists contractors;

create table employees(
employee_id int auto_increment primary key,
first_name varchar(20),
last_name varchar(20),
position varchar(40),
salary decimal(10,2));

create table contractors(
contractor_id int auto_increment primary key,
first_name varchar(20),
last_name varchar(20),
position varchar(40),
salary decimal(10,2));

insert into employees (first_name,last_name, position, salary)
values
('alice','smith', 'developer', 70000.00),
('bob','johnson', 'developer', 75000.00),
('charlie','lee', 'manager', 90000.00);

insert into contractors (first_name,last_name, position, salary)
values
('dave','williams', 'developer', 40.00),
('eve','brown', 'tester', 35.00),
('bob','johnson', 'developer', 45.00);

select * from employees
union all
select *from contractors;

select first_name,last_name,position from employees
union 
select first_name,last_name,position from contractors;
