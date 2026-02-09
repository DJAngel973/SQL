USE MY_DATABASE;

-- Crean previous data (to run multiple times)
TRUNCATE TABLE Students;

SELECT 'Table cleared. Inserting data...' AS info;

-- Insert 30 students
INSERT INTO Students (StudentID, Name, Age, Major) VALUES
(1, 'Alice Johnson', 20, 'Computer Science'),
(2, 'Bob Smith', 22, 'Mathematics'),
(3, 'Charlie Brown', 19, 'History'),
(4, 'David Lee', 21, 'Computer Science'),
(5, 'Eve Wilson', 23, 'English'),
(6, 'Frank Miller', 20, 'Mathematics'),
(7, 'Grace Davis', 22, 'History'),
(8, 'Henry Garcia', 19, 'Computer Science'),
(9, 'Ivy Rodriguez', 21, 'English'),
(10, 'Jack Martinez', 23, 'Mathematics'),
(11, 'Karen White', 20, 'Computer Science'),
(12, 'Liam Green', 22, 'Mathematics'),
(13, 'Mia Taylor', 19, 'History'),
(14, 'Noah Anderson', 21, 'English'),
(15, 'Olivia Thomas', 23, 'Computer Science'),
(16, 'Peter Jackson', 20, 'Mathematics'),
(17, 'Quinn Moore', 22, 'History'),
(18, 'Ryan Martin', 19, 'English'),
(19, 'Sophia Thompson', 21, 'Computer Science'),
(20, 'Tyler Garcia', 23, 'Mathematics'),
(21, 'Ursula Perez', 20, 'Computer Science'),
(22, 'Victor Wilson', 22, 'Mathematics'),
(23, 'Wendy Sanchez', 19, 'History'),
(24, 'Xavier Clark', 21, 'English'),
(25, 'Yara Lewis', 23, 'Mathematics'),
(26, 'Zachary Young', 20, 'Computer Science'),
(27, 'Abigail Allen', 22, 'History'),
(28, 'Benjamin Wright', 19, 'English'),
(29, 'Caleb King', 21, 'Computer Science'),
(30, 'Daniel Scott', 23, 'Mathematics');

SELECT 'Data inserted successfully!' AS info;
SELECT COUNT(*) AS total_students FROM Students;

-- First 10 students
SELECT 'First 10 students:' AS info;
SELECT * FROM Students LIMIT 10;

-- Last 5 students
SELECT 'Last 5 students:' AS info;
SELECT * FROM Students ORDER BY StudentID DESC LIMIT 5;

SELECT 'Step 8: Multiple data inserted successfully!' AS State;