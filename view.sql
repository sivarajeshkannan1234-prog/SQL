use de_project;
drop table employees
CREATE TABLE employees (
employee_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(100),
hire_date DATE,
job_title VARCHAR(50),
salary DECIMAL(10, 2)
);
INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, job_title, salary)
VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '2022-05-01', 'Software Engineer', 85000.00),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '2023-03-15', 'Data Scientist', 92000.00),
(3, 'Alice', 'Johnson', 'alice.johnson@example.com', '2024-05-01', 'Engineer', 95000.00),
(4, 'Mark', 'Taylor', 'mark.taylor@example.com', '2022-11-15', 'Manager', 100000.00),
(5, 'Gowtham', 'sb', 'mark.taylor@example.com', '2022-11-15', 'Data Engineer', 100000.00),
(6, 'Peter', 'sb', 'mark.taylor@example.com', '2022-11-15', 'Data Engineer', 120000.00);

select employee_id, first_name, last_name,job_title, salary
from employees where salary > 90000;
customer_details
## VIEW
CREATE view high_earning as
select employee_id, first_name, last_name,job_title, salary
from employees where salary > 90000;

INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, job_title, salary) VALUES 
(7, 'john', 'sb', 'mark.taylor@example.com', '2022-11-15', 'Data Engineer', 120000.00);

select * from high_earning;
