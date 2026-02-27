-- Get Top Students by GPA

USE MY_DATABASE;

DROP PROCEDURE IF EXISTS GetTopStudents;

DELIMITER $$
CREATE PROCEDURE GetTopStudents(IN min_gpa DECIMAL(3,2))
BEGIN
    -- Get students with GPA above the threshold
    SELECT
        StudentID,
        Name,
        Major,
        GPA
    FROM Students
    WHERE GPA > min_gpa
    ORDER BY GPA DESC;
    
    -- Also show count
    SELECT COUNT(*) AS TotalTopStudents
    FROM Students
    WHERE GPA > min_gpa;
END $$
DELIMITER ;

-- Test
SELECT 'Students with GPA > 3.5:' AS info;
CALL GetTopStudents(3.5);

SELECT 'Students with GPA > 3.0:' AS info;
CALL GetTopStudents(3.0);

SELECT 'Script 35: GetTopStudents completed!' AS State;