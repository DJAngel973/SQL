USE MY_DATABASE;

SELECT 'Before UPDATE:' AS info;
SELECT * FROM Students;

-- Update student career 1
UPDATE Students
SET Major = 'Data Science'
WHERE StudentID = 1;

SELECT 'After UPDATE:' AS info;
SELECT * FROM Students;

SELECT 'Student updated:' AS info;
SELECT * FROM Students WHERE StudentID = 1;

SELECT 'Step 6: Data updated successfully!' AS State;