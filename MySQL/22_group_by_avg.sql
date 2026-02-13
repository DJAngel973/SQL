USE MY_DATABASE;

-- Find the average GPA of students in each major.
-- Using GROUP BY and AVG() to calculate the average GPA for each major.

SELECT 'Average number of students per major:' AS info;

SELECT Major, AVG(GPA) AS AverageGPA
FROM Students
GROUP BY Major;

SELECT 'Step 22: Average GPA completed!' AS State;