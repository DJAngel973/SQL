USE MY_DATABASE;

-- Find courses with higher enrollment

SELECT CourseName, COUNT(*) AS EnrollmentCount
FROM Enrollments
GROUP BY CourseName
ORDER BY EnrollmentCount DESC;