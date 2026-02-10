USE MY_DATABASE;

-- The GROUP BY clause groups records by a column, 
-- while HAVING filters the aggregated data.

SELECT Major, COUNT(StudentID) AS StudentCount
FROM Students
GROUP BY Major;