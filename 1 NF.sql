use company;
drop table 1NF;

## Before
-- Non-1NF table : contains multi_valued phone_numbers in a single column 
create table 1NF(
student_id int,
student_name varchar(100),
student_phone varchar(100));

-- sample data insertion (non-atomic phone numbers)
insert into 1NF (student_id, student_name, student_phone) values
(1,'siva','787-1509,098-7432'),
(2,'vishwa','986-2698');

select *from 1NF;

## after
-- main students table with atomic values
 create table Students(
student_id  int primary key,
student_name varchar(100)
);

-- separate table for phone numbers, ensuring each phone number is atomic
create table studentphones(
student_id int,
phone varchar(20),
primary key (student_id,phone),
foreign key(student_id) references Students(student_id));

-- insert students
insert into students (student_id,student_name)
values (1,'siva'),
	    (2,'bob');
        
-- insert phone numbers (each phone number in its own row)
insert into  studentphones (student_id,phone)
values (1,'123-4567'),
       (1,'987-6543'),
       (2,'555-1212');
       
       
select *from students;
select *from studentphones;