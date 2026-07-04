
create database uber;
use uber;

drop table rides;
CREATE TABLE uber.rides (
ride_id INT,
driver_id INT NOT NULL,
rider_id INT NOT NULL,
pickup_location VARCHAR(100) NOT NULL,
dropoff_location VARCHAR(100) NOT NULL,
ride_date DATETIME NOT NULL,
fare DECIMAL(10, 2) NOT NULL,
primary key (ride_id, rider_id)
);

insert into uber.rides (ride_id, driver_id, rider_id, pickup_location, dropoff_location, ride_date, fare)
values
(1,101,202,'chennai', 'coimbatore', '2026-02-10 09:00:00', 500.00);

select *  from uber.rides;

desc rides;


## PRIMARY KEY, UNIQUE DIFFERENCE
create table user(
user_id int primary key,
email_id varchar(100) unique
);

insert into user (user_id, email_id) values (1, 'user@gamil.com');
select *from user;

insert into user (user_id, email_id) values (2, null);
select *from user;

insert into user (user_id, email_id) values (null, null);
select *from user;

## NOT NULL
drop table uber.rides;
CREATE TABLE uber.rides (
ride_id INT primary key,
driver_id INT NOT NULL,
rider_id INT ,
pickup_location VARCHAR(100) NOT NULL,
dropoff_location VARCHAR(100) NOT NULL,
ride_date DATETIME NOT NULL,
fare DECIMAL(10, 2) NOT NULL
);

desc rides;

insert into uber.rides (ride_id, driver_id, rider_id, pickup_location, dropoff_location, ride_date, fare)
values
(1,101,null,'chennai', 'coimbatore', '2026-02-10 09:00:00', 500.00);

select *  from uber.rides;

## CHECK
drop table uber.rides;
CREATE TABLE uber.rides (
ride_id INT primary key,
driver_id INT NOT NULL,
rider_id INT ,
pickup_location VARCHAR(100) NOT NULL,
dropoff_location VARCHAR(100) NOT NULL,
ride_date DATETIME NOT NULL,
fare DECIMAL(10, 2) check (fare > 0)
);

insert into uber.rides (ride_id, driver_id, rider_id, pickup_location, dropoff_location, ride_date, fare)
values
(1,101,null,'chennai', 'coimbatore', '2026-02-10 09:00:00', -500.00);

select *  from uber.rides;


