-- This script demonstrates how to create a stored procedure
-- that accepts an input parameter to retrieve specific data.
-- DELIMITER is used to temporarily change the command delimiter
-- from ; to $$ so MySQL can properly parse the procedure body
-- which contains multiple semicolons.
-- ========================================

USE MY_DATABASE;

-- Drop procedure if it already exists (idempotence)
DROP PROCEDURE IF EXISTS GetStudentByID;

SELECT 'Step 1: Creating stored procedure GetStudentByID...' AS info;

-- Change delimiter to $$
DELIMITER $$

-- Create the stored procedure
CREATE PROCEDURE GetStudentByID(IN Student_ID INT)
BEGIN
    -- Procedure body: Select student by ID
    -- Parameters:
    --   IN Student_ID INT - The ID of the student to retrieve
    
    SELECT * FROM Students
    WHERE StudentID = Student_ID;
END $$

-- Restore delimiter to ;
DELIMITER ;

SELECT 'Step 2: Procedure created successfully!' AS info;

-- Verify the procedure exists
SELECT 'Step 3: Verifying procedure exists...' AS info;
SHOW PROCEDURE STATUS WHERE Db = 'MY_DATABASE' AND Name = 'GetStudentByID';

-- Test the procedure with different IDs
SELECT 'Step 4: Testing procedure with StudentID = 10' AS info;
CALL GetStudentByID(10);

SELECT 'Step 5: Testing procedure with StudentID = 5' AS info;
CALL GetStudentByID(5);

SELECT 'Step 6: Testing procedure with non-existent StudentID = 999' AS info;
CALL GetStudentByID(999);

-- Confirmation message
SELECT 'Step 31: Stored procedure with parameters completed!' AS State;