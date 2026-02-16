USE MY_DATABASE;

-- Calculate the average age of students enrolled in each course

SELECT e.CourseName, AVG(s.Age) AS AverageAge
FROM Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
GROUP BY e.CourseName;