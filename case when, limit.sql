use de_project;
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

## CASE WHEN
select  
customer_name, amount,
case
    when amount>4000 then 'high spender'
    when amount between 2000 and 4000 then 'medium spender'
    when amount <=2000 then 'low spender'
else 'no data'
end as spending
from customer_details

select customer_name,
case
    when phone_number is null then email
else phone_number
end as contact
from customer_details

## LIMIT
select *from customer_details limit 3;