use de_project;
drop table customer_details;
create table customer_details (
id int,
customer_name varchar(50),
email varchar(20),
phone_number int,
address varchar(50),
amount int
);

insert into customer_details (id, customer_name, email, phone_number, address, amount) values 
(1,'siva','siva@gmail.com',0123456789,'dindigul',5000.00),
(2,'vishwa',null,0123459067,'bangalore',null),
(3,'surya','surya@gmail.com',null,'madurai',1500.00),
(4,'sri',null,null,'palani',2500.00),
(5,'karthik','karthik@gmail.com',78363621,null,3000.00);

select * from customer_details;

# NULL VALUES ARE CALCULATED
select count(*) from customer_details where phone_number is null

## HOW MANY NOT NULL VALUE ARE CALCULATED
select count(*) from customer_details where phone_number is not null

## COALESCE OR IFNULL us the any one word
select id, customer_name, amount,
coalesce(amount, '0.00')
from customer_details
