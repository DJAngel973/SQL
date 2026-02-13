USE MY_DATABASE;

-- Identify the students with the highest GPA in each major.
-- Combining window functions such as RANK() with PARTITION BY
-- to rank students within a major and select the highest-scoring students

SELECT Major, Name, GPA FROM (
    SELECT Major, Name, GPA, RANK() OVER (PARTITION BY Major ORDER BY GPA DESC) AS StudentsRank
    FROM Students
) AS RankedStudents
WHERE StudentsRank = 1;