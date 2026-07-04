-- Create database
CREATE DATABASE de_project;

-- Use database
USE de_project;

-- Create table
CREATE TABLE student (
    id INT,
    name VARCHAR(100)
);

-- Insert data
INSERT INTO student VALUES (1, 'Siva');
INSERT INTO student VALUES (2, 'Surya');

-- Update data
UPDATE student
SET name = 'Vishwa'
WHERE id = 1;

-- Delete data
DELETE FROM student
WHERE id = 2;

-- Rename table
RENAME TABLE student TO student_details;

