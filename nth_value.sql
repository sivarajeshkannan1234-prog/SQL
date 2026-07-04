use company;
create table employee12(
id int,
name varchar (50),
dept varchar(40),
salary int,
salary_date datetime);

insert into employee12 values
(1,'alice','HR',5000,'2025-01-01'),
(2,'bob','Engineering',7000,'2025-01-02'),
(3,'charlie','Engineering',8000,'2025-01-03'),
(4,'david','HR',6000,'2025-01-04'),
(5,'eva','Engineering',7500,'2025-01-05'),
(6,'frank','Engineering',6500,'2025-01-06'),
(7,'grace','HR',5500,'2025-01-07'),
(8,'hank','Engineering',8500,'2025-01-08');

select *from employee12 order by salary;

select *,
nth_value (salary,3) over (partition by dept order by salary desc
    rows between unbounded preceding and unbounded following) as nthvalues
from employee12;