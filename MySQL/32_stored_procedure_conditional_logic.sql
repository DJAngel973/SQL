-- This script demonstrates how to use OUT parameters
-- to return values from a stored procedure.
-- OUT parameters allow procedures to "return" values
-- by modifying a variable that exists in the calling scope.

USE MY_DATABASE;

-- Drop procedure if exists (idempotence)
DROP PROCEDURE IF EXISTS GetTotalStudents;

SELECT 'Step 1: Creating procedure GetTotalStudents with OUT parameter...' AS info;

-- Create procedure with OUT parameter
DELIMITER $$
CREATE PROCEDURE GetTotalStudents(OUT total INT)
BEGIN
    -- Count all students and store in OUT parameter
    -- The value will be available after calling the procedure
    SELECT COUNT(*) INTO total FROM Students;
END $$
DELIMITER ;

SELECT 'Step 2: Procedure created successfully!' AS info;

-- Verify procedure exists
SELECT 'Step 3: Verifying procedure exists...' AS info;
SHOW PROCEDURE STATUS WHERE Db = 'MY_DATABASE' AND Name = 'GetTotalStudents';

-- Call procedure and store result in session variable
SELECT 'Step 4: Calling procedure and storing result in @total...' AS info;
CALL GetTotalStudents(@total);

-- Display the returned value
SELECT 'Step 5: Displaying the total number of students:' AS info;
SELECT @total AS TotalStudents;

-- You can use the variable in other queries
SELECT 'Step 6: Using @total variable in another query...' AS info;
SELECT
    @total AS TotalStudents,
    ROUND(@total * 0.1, 0) AS TenPercent,
    ROUND(@total * 0.5, 0) AS HalfOfStudents;

-- Confirmation message
SELECT 'Step 32: Stored procedure with OUT parameter completed!' AS State;