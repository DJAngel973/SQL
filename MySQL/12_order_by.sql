USE MY_DATABASE

-- 1. Add GPA column again
SELECT 'Step 1: Adding GPA column' AS info;

-- Add GPA column
ALTER TABLE Students
ADD GPA DECIMAL(3, 2);

DESCRIBE Students;

-- 2. Update GPA with random numbers
SELECT 'Step 2: Updating GPA with random values' AS info;

-- Update GPA
UPDATE Students
SET GPA = ROUND(RAND() * 4, 2);

-- 3. View first 10 students to see the change
SELECT 'Step 3: First 10 students with GPA' AS info;

SELECT * FROM Students LIMIT 10;

-- 4. Order by GPA descending (Top 10)
SELECT 'Step 4: Top 10 students by GPA' AS info;

SELECT Name, GPA FROM Students ORDER BY GPA DESC LIMIT 10;

-- Confirmation message
SELECT 'Step 12: ORDER BY completed!' AS State;