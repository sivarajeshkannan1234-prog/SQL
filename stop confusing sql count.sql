## interview question count(*), count(1), count(<column>),count(distinct <column>)

create database interview;
use interview;
create table demo(
id int,
customer_id int,
amount int,
status varchar(40)
);

insert into demo values
(1,100,250.00,'shipped'),
(2,101,150.00,'pending'),
(3,102,300.00,'shipped'),
(4,NULL,120.00,'cancelled'),
(5,100,NULL,'pending'),
(6,103,200.00,Null),
(7,101,180.00,'shipped'),
(8,NULL,NULL,null),
(9,100,250.00,'shipped');

select *from demo;

select count(*) from demo;

select count(1) from demo;

select count(amount) from demo;

select count(customer_id) from demo;

select distinct (customer_id) from demo;

select count(distinct (customer_id)) from demo;