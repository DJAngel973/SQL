-- Calculate Average Grade by Course
-- This script creates a CourseGrades table based on
-- existing Enrollments and generates realistic random grades.
-- Then creates a procedure to calculate course averages.

USE MY_DATABASE;

-- Drop table if exists (idempotence)
DROP TABLE IF EXISTS CourseGrades;

SELECT 'Step 1: Creating CourseGrades table...' AS info;

-- Create CourseGrades table with foreign key to Students
CREATE TABLE CourseGrades (
    GradeID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT NOT NULL,
    CourseName VARCHAR(100) NOT NULL,
    Grade DECIMAL(5,2) NOT NULL,
    GradeDate DATE DEFAULT (CURRENT_DATE),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE,
    UNIQUE KEY unique_student_course (StudentID, CourseName)
);

SELECT 'Step 2: Table created. Inserting grades based on existing enrollments...' AS info;

-- Insert grades for all enrolled students with realistic random grades
-- Grades will be between 60 and 100 (realistic academic range)
INSERT INTO CourseGrades (StudentID, CourseName, Grade)
SELECT
    StudentID,
    CourseName,
    ROUND(60 + (RAND() * 40), 2) AS Grade  -- Random grade between 60-100
FROM Enrollments;

SELECT 'Step 3: Grades inserted successfully!' AS info;
SELECT COUNT(*) AS TotalGrades FROM CourseGrades;

-- Show sample data
SELECT 'Step 4: Sample grades (first 10 records):' AS info;
SELECT
    cg.StudentID,
    s.Name,
    cg.CourseName,
    cg.Grade
FROM CourseGrades cg
JOIN Students s ON cg.StudentID = s.StudentID
ORDER BY cg.GradeID
LIMIT 10;

-- Drop procedure if exists
DROP PROCEDURE IF EXISTS CalculateAverageGrade;

SELECT 'Step 5: Creating procedure CalculateAverageGrade...' AS info;

-- Create procedure to calculate average grade by course
DELIMITER $$
CREATE PROCEDURE CalculateAverageGrade(
    IN course_name VARCHAR(100),
    OUT avg_grade DECIMAL(5,2),
    OUT student_count INT,
    OUT max_grade DECIMAL(5,2),
    OUT min_grade DECIMAL(5,2)
)
BEGIN
    -- Calculate statistics for the course
    SELECT
        ROUND(AVG(Grade), 2),
        COUNT(DISTINCT StudentID),
        MAX(Grade),
        MIN(Grade)
    INTO
        avg_grade,
        student_count,
        max_grade,
        min_grade
    FROM CourseGrades
    WHERE CourseName = course_name;
    
    -- If no records found, set to NULL
    IF student_count IS NULL OR student_count = 0 THEN
        SET avg_grade = NULL;
        SET student_count = 0;
        SET max_grade = NULL;
        SET min_grade = NULL;
    END IF;
END $$
DELIMITER ;

SELECT 'Step 6: Procedure created successfully!' AS info;

-- Verify procedure exists
SELECT 'Step 7: Verifying procedure exists...' AS info;
SHOW PROCEDURE STATUS WHERE Db = 'MY_DATABASE' AND Name = 'CalculateAverageGrade';

-- Test with "Introduction to Programming"
SELECT 'Step 8: Testing with "Introduction to Programming"' AS info;
-- Show the actual grades first
SELECT
    s.StudentID,
    s.Name,
    cg.Grade
FROM CourseGrades cg
JOIN Students s ON cg.StudentID = s.StudentID
WHERE cg.CourseName = 'Introduction to Programming'
ORDER BY cg.Grade DESC;

-- Now call the procedure
CALL CalculateAverageGrade('Introduction to Programming', @avg, @count, @max, @min);
SELECT
    'Introduction to Programming' AS Course,
    @avg AS AverageGrade,
    @count AS StudentCount,
    @max AS HighestGrade,
    @min AS LowestGrade;

-- Test with "Calculus I"
SELECT 'Step 9: Testing with "Calculus I"' AS info;
CALL CalculateAverageGrade('Calculus I', @avg, @count, @max, @min);
SELECT
    'Calculus I' AS Course,
    @avg AS AverageGrade,
    @count AS StudentCount,
    @max AS HighestGrade,
    @min AS LowestGrade;

-- Test with "Linear Algebra"
SELECT 'Step 10: Testing with "Linear Algebra"' AS info;
CALL CalculateAverageGrade('Linear Algebra', @avg, @count, @max, @min);
SELECT
    'Linear Algebra' AS Course,
    @avg AS AverageGrade,
    @count AS StudentCount,
    @max AS HighestGrade,
    @min AS LowestGrade;

-- Test with non-existent course
SELECT 'Step 11: Testing with non-existent course "Physics 101"' AS info;
CALL CalculateAverageGrade('Physics 101', @avg, @count, @max, @min);
SELECT
    'Physics 101' AS Course,
    @avg AS AverageGrade,
    @count AS StudentCount,
    @max AS HighestGrade,
    @min AS LowestGrade;

-- View statistics for ALL courses
SELECT 'Step 12: Statistics for ALL courses:' AS info;
SELECT
    CourseName,
    ROUND(AVG(Grade), 2) AS AverageGrade,
    COUNT(DISTINCT StudentID) AS StudentCount,
    ROUND(MAX(Grade), 2) AS HighestGrade,
    ROUND(MIN(Grade), 2) AS LowestGrade,
    ROUND(STDDEV(Grade), 2) AS StandardDeviation
FROM CourseGrades
GROUP BY CourseName
ORDER BY AverageGrade DESC;

-- Top 5 students by average grade across all courses
SELECT 'Step 13: Top 5 students by average grade:' AS info;
SELECT
    s.StudentID,
    s.Name,
    s.Major,
    ROUND(AVG(cg.Grade), 2) AS AverageGrade,
    COUNT(cg.CourseName) AS CoursesTaken
FROM Students s
JOIN CourseGrades cg ON s.StudentID = cg.StudentID
GROUP BY s.StudentID, s.Name, s.Major
ORDER BY AverageGrade DESC
LIMIT 5;

-- Confirmation message
SELECT 'Step 38: Calculate Average Grade procedure completed!' AS State;