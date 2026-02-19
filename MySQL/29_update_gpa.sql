USE MY_DATABASE;

-- Update GPA to generate random numbers

UPDATE Students
SET GPA = ROUND(RAND() * 4, 2);

SELECT StudentID, Name, GPA FROM Students;

-- RAND() generates a random number between 0 and 1.
-- Multiplying by 4 scales the value to the GPA range 0.00 to 4.00
-- ROUND(..., 2) ensures the result has exactly two decimal places, matching the column definition DECIMAL(3, 2)