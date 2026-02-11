USE MY_DATABASE;

-- In this example, the LEFT JOIN will help me to show all students,
-- including those who have not enrolled in any course.

SELECT 'All students, including those not enrolled in a course (LEFT JOIN):' AS info;

SELECT Students.Name, Enrollments.CourseName
FROM Students
LEFT JOIN Enrollments ON Students.StudentID = Enrollments.StudentID;

SELECT 'Step 16: LEFT JOIN completed!' AS State;