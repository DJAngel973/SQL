USE MY_DATABASE;

-- Find the most common major among students enrolled in 'Linear Algebra'

SELECT s.Major, COUNT(*) AS TotalStudents
FROM Students s
WHERE s.StudentID IN (
    SELECT e.StudentID
    FROM Enrollments e
    WHERE e.CourseName = 'Linear Algebra'
)
GROUP BY s.Major
ORDER BY TotalStudents DESC LIMIT 1;