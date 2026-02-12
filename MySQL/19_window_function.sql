USE MY_DATABASE;

-- Window function: Allows calculations to be performed across a set of rows related to the current row.
-- This SQL query ranks students by GPA, retrieves each student's name and GPA,
-- and then uses the ROW_NUMBER() function to assign a rank based on GPA in descending order (the highest GPA receives rank 1)

SELECT 'Students ranked according to their GPA:' AS info;

SELECT Name, GPA, ROW_NUMBER() OVER (ORDER BY GPA DESC) AS `Rank`
FROM Students;

SELECT 'Step 19: Students by GPA completed!' AS State;