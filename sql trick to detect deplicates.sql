use restaurants;
drop table employees;
create table employees(
id int primary key,
account_number varchar (20),
first_name varchar (50),
last_name varchar(50),
dept varchar (50)
);

INSERT INTO employees (id, account_number, first_name, last_name, dept)
VALUES
(1, 'ACC12345', 'John', 'Doe', 'Sales'),
(2, 'ACC12345', 'Jane', 'Smith', 'Marketing'),
(3, 'ACC67890', 'Emily', 'Jones', 'HR'),
(4, 'ACC54321', 'Michael', 'Brown', 'IT'),
(5, 'ACC54321', 'Chris', 'White', 'IT'),
(6, 'ACC54321', 'Alex', 'Green', 'Finance'),
(7, 'ACC98765', 'Sarah', 'Taylor', 'Sales'),
(8, 'ACC99999', 'Robert', 'Clark', 'HR'),
(9, 'ACC12345', 'Laura', 'Wilson', 'Finance');

select * from employees


SELECT account_number, COUNT(*)
FROM employees
GROUP BY account_number
HAVING COUNT(*) > 1;

select id, account_number, row_number() over(partition by account_number) from employees;

with demo as(
select id, account_number, row_number() over(partition by account_number) as rn from employees)
select id, account_number from demo where rn>1