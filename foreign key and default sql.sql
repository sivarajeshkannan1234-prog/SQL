use uber;
drop table if exists drivers;
CREATE TABLE drivers (
driver_id INT PRIMARY KEY,
driver_name VARCHAR(100),
license_number VARCHAR(50) UNIQUE
);
 
drop table if exists rides;
CREATE TABLE rides (
ride_id INT PRIMARY KEY,
driver_id INT,
pickup_location VARCHAR(100),
dropoff_location VARCHAR(100),
ride_date DATETIME,
fare DECIMAL(10, 2),
FOREIGN KEY (driver_id) REFERENCES drivers (driver_id) on delete cascade
);

insert into drivers (driver_id, driver_name, license_number) values 
(101, 'siva', 'XYZ12345'),
(102, 'vishwa', 'ABBC12345');

insert into rides (ride_id, driver_id, pickup_location, dropoff_location, ride_date, fare) values
(301, 101, 'Chennai', 'Coimbatore', '2024-12-01 08:00:00', 500.00),
(302, 101, 'Chennai', 'Madurai', '2024-12-01 09:30:00', 600.00),
(303, 102, 'Bangalore', 'Hyderabad', '2024-12-02 18:00:00', 700.00);

select * from drivers;
select * from rides;

alter table rides add column is_delete boolean default false;

update rides set is_delete=true where driver_id=102; 


##DEFAULT
create table demo1 (sno int, name varchar(100), country varchar(3) default 'ind');
desc demo1;
insert into demo1 (sno, name)  values (1, 'siva'),(2, 'vishwa'),(3, 'sri');
select *from demo1;