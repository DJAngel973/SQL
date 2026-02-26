USE MY_DATABASE;

-- Example of a LEFT JOIN with WHERE and NULL to find students who are not enrolled in any course.


SELECT s.*
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
WHERE e.StudentID IS NULL;

SELECT 'Step 17: LEFT JOIN completed!' AS State;

-- s = alias for Students
-- e = alias for Enrollments