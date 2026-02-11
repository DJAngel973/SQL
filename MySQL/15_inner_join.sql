USE MY_DATABASE

-- An INNER JOIN is used ti display only the students who are in the enrollments table.
-- This will exclude students who have not enrolled in any courses.

SELECT 'Students enrolled in courses (INNER JOIN):' AS info;

SELECT Students.Name, Enrollments.CourseName
FROM Students
INNER JOIN Enrollments ON Students.StudentID = Enrollments.StudentID;

-- Count total results
SELECT 'Total enrollments with student info:' AS info;

SELECT COUNT(*) AS total
FROM Students
INNER JOIN Enrollments ON Students.StudentID = Enrollments.StudentID;

-- Confirmation message
SELECT 'Step 15: INNER JOIN completed!' AS State;