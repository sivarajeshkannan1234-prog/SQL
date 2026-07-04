use interview;
create table employeesales(
id int,
name varchar(40),
salesamount decimal(10,2));

INSERT INTO employeesales (id, name, salesamount) VALUES
(1, 'Alice', 10000),
(2, 'Bob', 8500),
(3, 'Charlie', 7500),
(4, 'David', 6000),
(5, 'Eva', 11000),
(6, 'Frank', 4500),
(7, 'Grace', 3000),
(8, 'Hank', 4000),
(9, 'Ivy', 8000),
(10, 'Jack', 9500);

select id,name,salesamount,
ntile(4) over(order by salesamount desc) as performance_group
from employeesales;

