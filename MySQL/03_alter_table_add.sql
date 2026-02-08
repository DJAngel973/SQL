-- Use database
USE MY_DATABASE;

-- Show structure before by modify
SELECT 'Before ALTER TABLE:' AS info;
DESCRIBE Students;

-- Delete if it exists (it doesn't give an error if it)
ALTER TABLE Students DROP COLUMN IF EXISTS GPA;

-- Add column GPA
ALTER TABLE Students
ADD GPA DECIMAL(3, 2);

-- Show structure after by modify
SELECT 'After ALTER TABLE:' AS info;
DESCRIBE Students;

-- Verify that the column was added
SELECT COLUMN_NAME, DATA_TYPE, IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'MY_DATABASE'
    AND TABLE_NAME = 'Students'
    AND COLUMN_NAME = 'GPA';

-- Confirmation message
SELECT 'Step 3: Column GPA added successfully!' AS State;