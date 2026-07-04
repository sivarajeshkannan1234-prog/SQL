-- Third Normal Form (3NF)
-- Definition & Purpose (3NF) 121
-- 3NF requires that the table is in 2NF and that all the columns are directly dependent on the primary key. 122
-- (i.e., no transitive dependencies). 123
-- Purpose: To remove transitive dependencies where a non-key column depends on another non-key column.. 124

##  Before
-- This table is in 2NF but has a transitive dependency:

CREATE TABLE Courses_Non3NF (
course_id INT PRIMARY KEY,
course_name VARCHAR(100),
instructor VARCHAR(100),
instructor_office VARCHAR(100));

INSERT INTO Courses_Non3nf (course_id, course_name, instructor, instructor_office)
VALUES (101, 'Intro to SQL', 'Dr. Smith','room 101'),
(102, 'Database Design', 'Dr. Jones','room 102');

select  *from courses_non3nf;

CREATE TABLE Instructors6( 
instructor VARCHAR(100) PRIMARY KEY,
instructor_office VARCHAR(100)  );

CREATE TABLE Courses6 ( 
course_id INT PRIMARY KEY, 
course_name VARCHAR(100),
instructor VARCHAR(100),
FOREIGN KEY (instructor) REFERENCES Instructors6 (instructor) );

INSERT INTO Instructors6 (instructor, instructor_office) VALUES ('Dr. Smith', 'Room 101');

INSERT INTO Courses6 (course_id, course_name, instructor) VALUES (101, 'Intro to SQL', 'Dr. Smith');

select*from instructors6;

select *from courses6;
