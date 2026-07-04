create database uno;
use uno;
drop table orders, hotel;
create table hotel (id int primary key, name_hotel varchar(100), location varchar(100));
insert into hotel(id,name_hotel,location) values(1,'A2b','karur'),(2,'sai krishna','chennai'),(3,'balajibhavan','dindigul');
create table orders (orderid int primary key, hotelid int, orderdate date);
insert into orders (orderid,hotelid,orderdate) values (1,1,'2022-01-02'),(2,2,'2022-07-02'),(3,3,'2010-01-02');
select * from hotel;
select*from orders;
select
h.name_hotel as hotelsname,
o.orderdate
from hotel h
join orders o on id = hotelid;