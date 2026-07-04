use company;

create table productsales(
product_id int,
product_name varchar(50),
saleamount int,
saledate datetime
);

insert into productsales values
(1,'product A', 500.00,'2025-01-01'),
(1,'product A', 400.00,'2025-02-02'),
(1,'product A', 700.00,'2025-03-01'),
(1,'product A', 500.00,'2025-04-02');

select * ,
lead (saleamount) over (order by saledate) as nextsalesamount
from productsales

select product_id, product_name, saledate, saleamount,
lead(saleamount)over (order by saledate) as nextmonthsales,
lead(saleamount) over(order by saledate) - saleamount as salesdifference
from productsales

