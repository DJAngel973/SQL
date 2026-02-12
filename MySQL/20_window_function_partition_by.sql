USE MY_DATABASE;

-- This SQL query calculates the total number of students in each major.
-- It retrieves the major and the name of each student,
-- then uses the function COUNT(*) OVER (PARTITION BY Mejor)
-- to count the number of students within each major.

SELECT 'Total students per major:' AS info;

SELECT Major, Name, COUNT(*) OVER (PARTITION BY Major) AS TotalStudents
FROM Students LIMIT 10;

SELECT 'Step 20: Students grouped by major completed!' AS State;