USE MY_DATABASE;

-- Verify that it exists before deleting
SHOW TABLES;

-- Delete table
DROP TABLE IF EXISTS Students;

-- Verify that it was deleted
SHOW TABLES;

SELECT 'Step 4: Table Students dropped successfully!' AS State;