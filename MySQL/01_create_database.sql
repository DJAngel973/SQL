-- Create database
CREATE DATABASE MY_DATABASE;

-- Use database
USE MY_DATABASE;

-- Create table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT,
    Major VARCHAR(50)
);

-- Confirm or view created table
SHOW tables;