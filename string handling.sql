use  de_project;
create table customerDetails (
id int,
customer_name varchar(50),
email varchar(50),
city varchar(50),
phone_number int
);

insert into customerDetails (id, customer_name, email, city, phone_number) values
(1,'siva raj', 'siva@gamil.com', 'dindigul', 787153),
(2,'surya pragaash', 'surya@gmail.', 'bangalore', 908532),
(3,'vishwa boy', 'vishwa@gmail.com', 'hyderabad', 234512),
(4,'ravi kumar', 'ravi@gmail.com', 'mumbai', null),
(5,'krishna moorthi', 'krishna@gmail.com', 'chennai', 345832);

select 
length (customer_name) as name_length,
upper (city) as city_upper,
lower(customer_name) as cust_lower,
concat(customer_name,' ',city,'TN') as name_c,
substring(customer_name,1,10) as prefix,
trim('  chennai  ') as trimmed_city,
rpad(customer_name,15,'*') as left_padded_name,
replace(customer_name,' ','_') as updated_name,
instr(customer_name, 'a') as position_of_a,
right(customer_name,5) as first_5_chars,
reverse(customer_name) as reversed_name,
format(9876543210,2) as formatted_numbber,
length(upper(concat(customer_name,' ',city,'TN'))) as name_c

from customerDetails;

