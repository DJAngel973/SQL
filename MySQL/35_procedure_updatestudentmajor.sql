
-- Update Student Major

USE MY_DATABASE;

DROP PROCEDURE IF EXISTS UpdateStudentMajor;

DELIMITER $$
CREATE PROCEDURE UpdateStudentMajor(
    IN student_id INT,
    IN new_major VARCHAR(100),
    OUT success_message VARCHAR(100)
)
BEGIN
    DECLARE student_exists INT;
    
    -- Check if student exists
    SELECT COUNT(*) INTO student_exists
    FROM Students
    WHERE StudentID = student_id;
    
    IF student_exists = 0 THEN
        SET success_message = 'Error: Student not found';
    ELSE
        -- Update the major
        UPDATE Students
        SET Major = new_major
        WHERE StudentID = student_id;
        
        SET success_message = CONCAT('Success: Updated major to ', new_major);
    END IF;
END $$
DELIMITER ;

-- Test
SELECT 'Before update:' AS info;
SELECT StudentID, Name, Major FROM Students WHERE StudentID = 10;

CALL UpdateStudentMajor(10, 'Artificial Intelligence', @msg);
SELECT @msg AS Result;

SELECT 'After update:' AS info;
SELECT StudentID, Name, Major FROM Students WHERE StudentID = 10;

-- Test with non-existent student
CALL UpdateStudentMajor(999, 'Physics', @msg);
SELECT @msg AS Result;

SELECT 'Script 36: UpdateStudentMajor completed!' AS State;