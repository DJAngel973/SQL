USE MY_DATABASE;

SELECT 'Before DELETE:' AS info;
SELECT * FROM Students;
SELECT 'Total students before:' AS info;
SELECT COUNT(*) AS total FROM Students;

-- Delete student with ID = 1
DELETE FROM Students
WHERE StudentID = 1;

SELECT 'After DELETE:' AS info;
SELECT * FROM Students;
SELECT 'Total students after:' AS info;
SELECT COUNT(*) AS total FROM Students;
SELECT 'Step 7: Data deleted successfully!' AS State;