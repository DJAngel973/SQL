USE MY_DATABASE;

-- HAVING helps us add a filter layer to show only the specialties for which the count is less than 7

SELECT Major, COUNT(StudentID) AS StudentCount
FROM Students
GROUP BY Major
HAVING COUNT(StudentID) < 7;