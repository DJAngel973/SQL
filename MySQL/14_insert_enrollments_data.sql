USE MY_DATABASE;

-- Crean previous data (to run multiple times)
TRUNCATE TABLE Enrollments;

SELECT 'Table cleared. Inserting enrollment data...' AS info;

-- Insert 30 students
INSERT INTO Enrollments (StudentID, CourseName, EnrollmentDate) VALUES
(1, 'Introduction to Programming', '2024-09-05'),
(1, 'Calculus I', '2024-09-05'),
(3, 'Linear Algebra', '2024-09-05'),
(5, 'Introduction to Programming', '2024-09-05'),
(7, 'Calculus I', '2024-09-05'),
(9, 'Linear Algebra', '2024-09-05'),
(11, 'Introduction to Programming', '2024-09-05'),
(13, 'Calculus I', '2024-09-05'),
(15, 'Linear Algebra', '2024-09-05'),
(17, 'Introduction to Programming', '2024-09-05'),
(19, 'Calculus I', '2024-09-05'),
(21, 'Linear Algebra', '2024-09-05'),
(23, 'Introduction to Programming', '2024-09-05'),
(25, 'Calculus I', '2024-09-05'),
(27, 'Linear Algebra', '2024-09-05'),
(2, 'Probability and Statistics', '2024-09-05'),
(4, 'Differential Equations', '2024-09-05'),
(6, 'Probability and Statistics', '2024-09-05'),
(8, 'Differential Equations', '2024-09-05'),
(10, 'Probability and Statistics', '2024-09-05'),
(12, 'Differential Equations', '2024-09-05'),
(14, 'Probability and Statistics', '2024-09-05'),
(16, 'Differential Equations', '2024-09-05'),
(20, 'Differential Equations', '2024-09-05'),
(22, 'Probability and Statistics', '2024-09-05'),
(24, 'Differential Equations', '2024-09-05'),
(26, 'Probability and Statistics', '2024-09-05');

SELECT 'Data inserted successfully!' AS info;
SELECT COUNT(*) AS total_enrollments FROM Enrollments;

-- First 5 enrollmetns
SELECT 'First 5 enrollments:' AS info;
SELECT * FROM Enrollments LIMIT 10;

-- Last 5 enrollmetns
SELECT 'Last 5 enrollments:' AS info;
SELECT * FROM Enrollments ORDER BY EnrollmentID DESC LIMIT 5;

SELECT 'Step 14: Enrollment data inserted successfully!' AS State;