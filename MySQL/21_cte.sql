USE MY_DATABASE;

-- CTE table expression
-- It's a table that temporarily holds results,
-- it's useful for simplifying complex queries by dividing them into smaller parts.

-- Find majors with fewer than 8 students
-- First we create a temporary table called StudentCounts,
-- calculating the total number of students in each major.

SELECT 'Specialties with lower student enrollment:' AS info;

WITH StudentCounts As (
    SELECT Major, COUNT(StudentID) AS StudentCount
    FROM Students
    GROUP BY Major
)
SELECT Major, StudentCount
FROM StudentCounts
WHERE StudentCount < 8;

SELECT 'Step 21: Simplified query completed!' AS State;