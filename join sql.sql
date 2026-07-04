use restaurants;

create table restaurant(
id int,
name varchar(50),
location varchar(50)
);

insert into restaurant values
(1,'abc bistro','new york'),
(2,'the foodie','los angeles'),
(3,'tasty treat','chicago');

select * from restaurant;

create table orders(
order_id int,
restaurant_id int,
order_date datetime);

insert into orders values
(1 , 1 , '2023-01-01'),
(2 , 1 , '2023-01-02'),
(3 , 2 , '2023-01-05'),
(4 , 14, '2023-01-07');

select * from orders;

## join = inner join
select
r.name as restaurant_name,
o.order_date
from Restaurant r
join orders o on r.id = o.restaurant_id

## left join
select
r.name as restaurant_name,
o.order_date
from Restaurant r
left join orders o on r.id = o.restaurant_id

## RIGHT JOIN
select
r.name as restaurant_name,
o.order_date
from Restaurant r
right join orders o on r.id = o.restaurant_id

create table employees(
id int primary key,
name varchar(100) not null,
manager_id int null
);

insert into employees (id, name, manager_id) values
(1,'ailce', 3),
(2,'bob', 3),
(3,'charlie',null),
(4,'diana',3);

select * from employees;

select
e.name as employee_name,
m.name as manager_name
from employees e
left join employees m
on e.manager_id = m.id;