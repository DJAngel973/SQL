-- This script demonstrates advanced stored procedure concepts:
-- - DECLARE (local variables)
-- - SELECT INTO (assign query result to variable)
-- - IF/ELSEIF/ELSE (conditional logic)
-- - OUT parameters (return values)
-- This procedure evaluates a student's GPA and returns
-- a status: 'Excellent', 'Good', or 'Needs Improvement'

USE MY_DATABASE;

-- Drop procedure if exists
DROP PROCEDURE IF EXISTS CheckGPA;

SELECT 'Step 1: Creating procedure CheckGPA with conditional logic...' AS info;

-- Create procedure with IN and OUT parameters
DELIMITER $$
CREATE PROCEDURE CheckGPA(IN student_id INT, OUT status VARCHAR(20))
BEGIN
    -- Declare local variable to store the GPA
    DECLARE gpa_value DECIMAL(3,2);
    
    -- Get the student's GPA and store it in the variable
    -- If student doesn't exist, gpa_value will be NULL
    SELECT GPA INTO gpa_value
    FROM Students
    WHERE StudentID = student_id;
    
    -- Evaluate GPA with conditional logic
    IF gpa_value IS NULL THEN
        SET status = 'Student Not Found';
    ELSEIF gpa_value >= 3.5 THEN
        SET status = 'Excellent';
    ELSEIF gpa_value >= 2.5 THEN
        SET status = 'Good';
    ELSEIF gpa_value >= 2.0 THEN
        SET status = 'Fair';
    ELSE
        SET status = 'Needs Improvement';
    END IF;
END $$
DELIMITER ;

SELECT 'Step 2: Procedure created successfully!' AS info;

-- Verify procedure exists
SELECT 'Step 3: Verifying procedure exists...' AS info;
SHOW PROCEDURE STATUS WHERE Db = 'MY_DATABASE' AND Name = 'CheckGPA';

-- Test with different students
SELECT 'Step 4: Testing with student ID 10...' AS info;
-- First, let's see the actual GPA
SELECT StudentID, Name, GPA FROM Students WHERE StudentID = 10;
-- Now call the procedure
CALL CheckGPA(10, @status);
SELECT @status AS Status;

SELECT 'Step 5: Testing with student ID 5...' AS info;
SELECT StudentID, Name, GPA FROM Students WHERE StudentID = 5;
CALL CheckGPA(5, @status);
SELECT @status AS Status;

SELECT 'Step 6: Testing with student ID 1...' AS info;
SELECT StudentID, Name, GPA FROM Students WHERE StudentID = 1;
CALL CheckGPA(1, @status);
SELECT @status AS Status;

-- Test with non-existent student
SELECT 'Step 7: Testing with non-existent student (ID 999)...' AS info;
CALL CheckGPA(999, @status);
SELECT @status AS Status;

-- Check all students at once
SELECT 'Step 8: Bonus - View all students with their status...' AS info;
SELECT
    StudentID,
    Name,
    GPA,
    CASE
        WHEN GPA >= 3.5 THEN 'Excellent'
        WHEN GPA >= 2.5 THEN 'Good'
        WHEN GPA >= 2.0 THEN 'Fair'
        ELSE 'Needs Improvement'
    END AS Status
FROM Students
ORDER BY GPA DESC
LIMIT 10;

-- Confirmation message
SELECT 'Step 33: Stored procedure with conditional logic completed!' AS State;