-- Delete Student with Safety Checks

USE MY_DATABASE;

DROP PROCEDURE IF EXISTS DeleteStudent;

DELIMITER $$
CREATE PROCEDURE DeleteStudent(
    IN student_id INT,
    OUT result_message VARCHAR(200)
)
BEGIN
    DECLARE student_exists INT;
    DECLARE student_name VARCHAR(100);
    DECLARE enrollment_count INT;
    
    -- Check if student exists
    SELECT COUNT(*) INTO student_exists
    FROM Students
    WHERE StudentID = student_id;
    
    IF student_exists = 0 THEN
        SET result_message = 'Error: Student not found';
    ELSE
        -- Get student name for message
        SELECT Name INTO student_name
        FROM Students
        WHERE StudentID = student_id;
        
        -- Check if student has enrollments
        SELECT COUNT(*) INTO enrollment_count
        FROM Enrollments
        WHERE StudentID = student_id;
        
        -- Delete enrollments first (foreign key constraint)
        IF enrollment_count > 0 THEN
            DELETE FROM Enrollments WHERE StudentID = student_id;
        END IF;
        
        -- Delete student
        DELETE FROM Students WHERE StudentID = student_id;
        
        SET result_message = CONCAT(
            'Success: Deleted student ',
            student_name,
            ' (ID: ', student_id, ') and ',
            enrollment_count,
            ' enrollment(s)'
        );
    END IF;
END $$
DELIMITER ;

-- Test (use a copy or recreate data after)
SELECT 'Before deletion - Total students:' AS info;
SELECT COUNT(*) AS Total FROM Students;

-- Try deleting student 30 (should exist)
CALL DeleteStudent(30, @msg);
SELECT @msg AS Result;

SELECT 'After deletion - Total students:' AS info;
SELECT COUNT(*) AS Total FROM Students;

-- Try deleting non-existent student
CALL DeleteStudent(999, @msg);
SELECT @msg AS Result;

SELECT 'Script 37: DeleteStudent completed!' AS State;