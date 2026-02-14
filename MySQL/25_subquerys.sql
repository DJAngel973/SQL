USE MY_DATABASE;

-- List students enrolled in "Introduction to Programming" as well as in "Calculus I"

SELECT DISTINCT s.StudentID, s.Name
FROM Students s
JOIN Enrollments e1 ON s.StudentID = e1.StudentID
JOIN Enrollments e2 ON s.StudentID = e2.StudentID
WHERE e1.CourseName = 'Introduction to Programming'
    AND e2.CourseName = 'Calculus I';