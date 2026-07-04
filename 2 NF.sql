-- Second Normal Form (2NF)
-- Definition & Purpose (2NF)
-- 2NF requires the table to be in 1NF and that all non-key columns(not primary key) are fully functionally dependent on the entire primary key.
-- Purpose: To remove partial dependencies (where a column depends on only part of a composite key)

## Before
-- This table is in 1NF but not in 2NF because course details depend only on course_id.

use company;
CREATE TABLE Enrollment_Non2NF (
student_id INT,
course_id INT,
course_name VARCHAR(100),
instructor VARCHAR(100),
PRIMARY KEY (student_id, course_id)
);

-- Sample data insertion
insert into Enrollment_Non2NF (student_id,course_id,course_name,instructor)
values
(1,'101','intro to sql','dr. smith'),
(2,'101','intro to sql','dr. smith'),
(1,'102','database design','dr. johns');

select *from Enrollment_Non2NF;

drop table Enrollment;
CREATE TABLE Enrollment (
student_id INT,
course_id INT,
PRIMARY KEY (student_id, course_id),
FOREIGN KEY (course_id) REFERENCES Courses (course_id)
);

CREATE TABLE Courses (
course_id INT PRIMARY KEY,
course_name VARCHAR(100), instructor
VARCHAR(100)
);


INSERT INTO Courses (course_id, course_name, instructor)
VALUES (101, 'Intro to SQL', 'Dr. Smith'),
(102, 'Database Design', 'Dr. Jones');

INSERT INTO Enrollment (student_id, course_id)
VALUES (1, 101),
(2, 101),
(1, 102);

select *from courses;
select*from enrollment;
