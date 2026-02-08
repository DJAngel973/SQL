USE MY_DATABASE;

DESCRIBE Students;

-- Insert student into the table
INSERT INTO Students (StudentID, Name, Age, Major)
VALUES (1, 'Alice Johnson', 20, 'Computer Science');

-- View entered data
SELECT 'Data entered:' AS info;
SELECT * FROM Students;

-- Counting records
SELECT COUNT(*) AS total_students FROM Students;

-- Confirmation message
SELECT 'Step 5: Data inserted successfully!' AS State;