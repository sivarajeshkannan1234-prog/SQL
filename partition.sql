USE company;
DROP TABLE IF EXISTS orders;

##  range partition
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT ,
    order_date DATE NOT NULL,
    customer_name VARCHAR(50),
    amount DECIMAL(10,2),
    primary key(order_id, order_date)
)
PARTITION BY RANGE (YEAR(order_date)) (
    PARTITION p_before_2020 VALUES LESS THAN (2020),
    PARTITION p_2020 VALUES LESS THAN (2021),
    PARTITION p_2021 VALUES LESS THAN (2022),
    PARTITION p_2022 VALUES LESS THAN (2023),
    PARTITION p_future VALUES LESS THAN MAXVALUE
);

INSERT INTO orders (order_date, customer_name, amount)
VALUES
('2019-05-10', 'Alice', 100.00),
('2020-01-15', 'Bob', 200.50),
('2020-12-01', 'Charlie', 300.00),
('2021-07-20', 'Diana', 150.75),
('2022-03-02', 'Edward', 500.00),
('2025-06-18', 'FutureMan', 9999.99);

select *from  orders;

select 
partition_name,
partition_method,
partition_expression,
subpartition_method,
subpartition_expression
from information_schema.partitions
where table_schema='company'
and table_name='orders';

show create table orders;

select * from orders where order_date=2020;

explain format=json
select * from orders where  order_date='2021-07-20'

## list partition
drop table employeess;
CREATE TABLE employeess(
employee_id INT AUTO_INCREMENT ,
first_name VARCHAR(50),
last_name VARCHAR(50),
department VARCHAR(50),
primary key (employee_id,department)
)

PARTITION BY LIST columns (department) (
PARTITION p_sales  VALUES IN ('Sales'),
PARTITION p_hr   VALUES IN ('HR'),
PARTITION p_engineering  VALUES IN ('Engineering', 'DevOps'),
PARTITION p_other  VALUES IN ('Finance', 'Marketing', 'Operations'));

insert into employeess (first_name,last_name,department)
values
('alice','smith','sales'),
('bob','johnson','hr'),
('charlie','lee','engineering'),
('diana','lopez','devops'),
('eve','turner','marketing');

select* from employeess where department='sales'


explain format=json
select* from employeess where department in ('sales','HR')

## hash partition
drop table if exists sensor_data;
CREATE TABLE sensor_data(
sensor_id INT NOT NULL,
reading_time DATETIME NOT NULL,
reading_value DECIMAL(10,2),
PRIMARY KEY (sensor_id, reading_time)
)
PARTITION BY HASH(sensor_id)
PARTITIONS 4;

INSERT INTO sensor_data (sensor_id, reading_time, reading_value)
VALUES
(101, '2025-01-01 10:00:00', 23.50),
(102, '2025-01-01 10:05:00', 24.10),
(103, '2025-01-01 10:10:00', 22.75),
(104, '2025-01-01 10:15:00', 25.00),
(105, '2025-01-01 10:20:00', 20.00),
(106, '2025-01-01 10:25:00', 21.60);

explain format=json
select* from sensor_data where sensor_id =101;
 
