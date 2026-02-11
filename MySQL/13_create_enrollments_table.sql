USE MY_DATABASE;

-- Drop table if exists (ro run multiple times)
DROP TABLE IF EXISTS Enrollments;

-- Create Enrollments table
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseName VARCHAR(100),
    EnrollmentDate DATE, -- Optional: you might want to track when they enrolled
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

-- Verify table creation
SELECT 'Enrollments table created' AS info;

SHOW TABLES;

DESCRIBE Enrollments;

SELECT 'Step 13: Enrollments table created successfully!' AS State;