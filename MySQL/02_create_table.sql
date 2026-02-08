-- USe database
USE MY_DATABASE;

-- Drop table if exists (to be able to run it multiple times)
DROP TABLE IF EXISTS Students;

-- Create table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT,
    Major VARCHAR(50)
);

-- Confirm or view created table
SHOW tables;

-- See table structure
DESCRIBE Students;

-- Confirmation message
SELECT 'Step 2: Students table created succsfully!' AS State;