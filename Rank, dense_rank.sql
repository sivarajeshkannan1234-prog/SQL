use restaurants;
drop table student;
create table student(
student_id int,
student_name varchar(50),
exam_score int);

insert into student values
(1,'Alice', 95),
(2,'Bob', 90),
(3,'Charlie', 95),
(4,'David', 85),
(5,'Eva', 90);

select *from student;

## Rank()
select student_id,student_name,exam_score,
rank() over (order by exam_score desc) as score_rank from student

## Dense_Rank()
select student_id,student_name,exam_score,
dense_rank() over (order by exam_score desc) as score_rank from student

