USE MY_DATABASE;

-- DELIMITER is changed temporarily so MySQL can parse the procedure body.
-- since the procedure contains semicolons (;) inside BEGIN ... END

DROP PROCEDURE IF EXISTS GetAverageGPA;

DELIMITER $$
CREATE PROCEDURE GetAverageGPA()
BEGIN
    -- Returns the average GPA of all students
    SELECT AVG(GPA) AS AverageGPA FROM Students;
END $$
DELIMITER ;

-- Verify that the procedure exists
SHOW PROCEDURE STATUS WHERE Db = 'MY_DATABASE';

-- Execute that the procedure exists
CALL GetAverageGPA();