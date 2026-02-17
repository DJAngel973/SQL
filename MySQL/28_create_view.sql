USE MY_DATABASE;

-- Create a view that displays the students name, major, GPA, and the number of courses they are enrolled in.

CREATE VIEW StudentEnrollmentSummary AS
SELECT
    s.Name,
    s.Major,
    s.GPA,
    COUNT(e.CourseName) AS EnrollmentCount
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
GROUP BY s.StudentID, s.Name, s.Major, s.GPA;

-- Query the view
SELECT * FROM StudentEnrollmentSummary;