create database ola;
use ola;
drop table ola.rides;
CREATE TABLE ola.rides (
ride_id INT,
driver_id INT,
rider_id int,
pickup_location VARCHAR(100),
dropoff_location VARCHAR(100),
ride_date DATETIME,
fare DECIMAL(10, 2)
);
insert into ola.rides (ride_id, driver_id, rider_id, pickup_location, dropoff_location, ride_date, fare) values
(1,101,202,'chennai', 'coimbatore', '2026-02-10 09:00:00', 500.00),
(2,102,203,'bangalore', 'hyderabad', '2026-02-10 08:30:00', 800.00);

select *from ola.rides;

select * from ola.rides where fare >'500' order by fare asc;
select * from ola.rides where fare >'500' and dropoff_location='hyderabad' order by fare asc;