use restaurants;
CREATE TABLE orders_normal (
order_id INT PRIMARY KEY,
user_id INT,
amount DECIMAL (10,2),
created_at DATE
);

drop table orders_partitioned;
CREATE TABLE orders_partitioned (
order_id INT,
user_id INT,
amount DECIMAL (10,2),
created_at DATE,
PRIMARY KEY (order_id, created_at))

PARTITION BY RANGE (TO_DAYS (created_at)) (
PARTITION P2023_jan VALUES LESS THAN (TO_DAYS('2023-02-01')),
PARTITION p2023_feb VALUES LESS THAN (TO_DAYS('2023-03-01')),
PARTITION P2023_mar VALUES LESS THAN (TO_DAYS('2023-04-01')),
PARTITION P2023_apr VALUES LESS THAN (TO_DAYS('2023-05-01')),
PARTITION p2023_may VALUES LESS THAN (TO_DAYS('2023-06-01')),
PARTITION P2023_jun VALUES LESS THAN (TO_DAYS('2023-07-01')),
PARTITION P2023_jul VALUES LESS THAN (TO_DAYS('2023-08-01')),
PARTITION pmax      VALUES LESS THAN (MAXVALUE)
);

insert into orders_partitioned select *from orders_normal;

select count(*) from order_normal;

explain format =json
select *from orders_partitioned
where created_at = '2023-07-01';

set profiling =1;

select count(*) from orders_normal where created_at ='2023-07-01';
select count(*) from orders_partitioned where created_at='2023-07-01';

show profiles;

OR

explain analyze select count(*) from orders_normal where created_at ='2023-07-01';
explain analyze select count(*) from orders_partitioned where created_at ='2023-07-01';

alter partition

alter table orders_partitioned
drop partition pmax;

alter table your_table 
add partition(
partition partition_name values LESS THEN (to_days('YYYY-MM-DD'))
);

alter table orders_partitioned
drop partition pmax,
add partition(
partition p2023_aug values LESS THEN (to_days('2023-09-01')),
partition pmax values less then  (maxvalues)
);