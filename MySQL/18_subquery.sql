USE MY_DATABASE;

-- SUBQUERY (nested query), a query within another query
-- Now we look for students enrolled in at least one course.
-- Using a subquery in the WHERE clause.

SELECT 'Students enrolled in at least one course' AS info;

SELECT Name
FROM Students
WHERE StudentID IN (
    SELECT StudentID FROM Enrollments
);

SELECT 'Step 18: Subquery completed!' AS State;