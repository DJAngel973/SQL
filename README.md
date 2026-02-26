# Database Practice - SQL, PostgreSQL and MongoDB

This repository is intended for educational purposes, focused on practicing SQL in databases.
It includes basic scripts progressing toward a more advanced approach learned through Coursera,
all executed from Visual Studio Code. A Docker Compose file is also included to create containers for MySQL, PostgreSQL, and MongoDB.

---

## Contents

- **MySQL**: Basic to advanced SQL scripts
- **PostgreSQL**: (Coming soon)
- **MongoDB**: (Coming soon)

---

## Technologies

- **MySQL 8.0**
- **PostgreSQL 15**
- **MongoDB 7**
- **Docker & Docker Compose**

---

## Topics Covered in MySQL

### **Fundamentals**
1. Create and drop databases
2. Create and modify tables (CREATE, ALTER, DROP)
3. Insert data (INSERT)
4. Update data (UPDATE)
5. Delete data (DELETE)

### **Queries**
6. SELECT with WHERE
7. Group data (GROUP BY)
8. Filter groups (HAVING)
9. Sort results (ORDER BY)

### **Table Relationships**
10. INNER JOIN
11. LEFT JOIN
12. LEFT JOIN with IS NULL

### **Advanced Queries**
13. Subqueries (SUBQUERY)
14. Window Functions (ROW_NUMBER)
15. PARTITION BY
16. Views (CREATE VIEW)

---

## Docker Setup

### **Prerequisites**

- Docker installed
- Docker Compose installed

### **Start containers**

```bash
# Start services
docker compose up -d

# Verify they are running
docker ps
```

### **Execute MySQL scripts**

```bash
# Execute a specific script
docker exec -i inicio-mysql-coursera mysql -u root -p{MYSQL_ROOT_PASSWORD} < MySQL/01_create_database.sql

# Connect interactively
docker exec -it inicio-mysql-coursera mysql -u root -p{MYSQL_ROOT_PASSWORD}
```

### **Stop containers**

```bash
# Stop without deleting data
docker compose down

# Stop AND delete volumes (careful!)
docker compose down -v
```

---

## Key Aspects When Creating SQL Scripts

### **Basic Structure**

Every script should have:

```sql
-- ========================================
-- Script description
-- ========================================

USE MY_DATABASE;

-- Clear comments explaining what it does
SELECT ...;

-- Confirmation message at the end
SELECT 'Script completed!' AS State;
```

---

### **Idempotence** (able to run multiple times)

```sql
-- Good practice
DROP TABLE IF EXISTS Students;
CREATE TABLE Students (...);

-- For views
DROP VIEW IF EXISTS StudentSummary;
CREATE VIEW StudentSummary AS ...;
```

---

### **Naming Conventions**

| Element | Convention | Example |
|----------|------------|---------|
| **Tables** | PascalCase, plural | `Students`, `Enrollments` |
| **Columns** | PascalCase, singular | `StudentID`, `Name` |
| **Views** | Descriptive | `StudentEnrollmentSummary` |
| **Aliases** | Lowercase, abbreviated | `s`, `e`, `stu` |

---

### **SQL Execution Order**

```sql
SELECT ...       -- 5. Select columns
FROM ...         -- 1. From which table(s)
JOIN ... ON ...  -- 2. Combine tables
WHERE ...        -- 3. Filter rows
GROUP BY ...     -- 4. Group
HAVING ...       -- 6. Filter groups
ORDER BY ...     -- 7. Sort
LIMIT ...        -- 8. Limit results
```

---

### **Types of JOINs**

```sql
-- INNER JOIN: Only matches
SELECT s.Name, e.CourseName
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID;

-- LEFT JOIN: All from left + matches
SELECT s.Name, e.CourseName
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID;

-- LEFT JOIN + NULL: No matches
SELECT s.Name
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
WHERE e.StudentID IS NULL;
```

---

### **Window Functions vs GROUP BY**

```sql
-- GROUP BY: Groups and summarizes (loses individual detail)
SELECT Major, COUNT(*) AS Total
FROM Students
GROUP BY Major;
-- Result: Computer Science | 9

-- WINDOW FUNCTION: Keeps individual detail + aggregate
SELECT Name, Major, COUNT(*) OVER (PARTITION BY Major) AS Total
FROM Students;
-- Result: Alice | Computer Science | 9
--         Bob   | Computer Science | 9
```

---

### **Subqueries**

```sql
-- In WHERE (filter by result of another query)
SELECT Name
FROM Students
WHERE StudentID IN (
    SELECT StudentID FROM Enrollments
);

-- In FROM (use result as temporary table)
SELECT AVG(EnrollmentCount) AS AvgCourses
FROM (
    SELECT StudentID, COUNT(*) AS EnrollmentCount
    FROM Enrollments
    GROUP BY StudentID
) AS StudentCourses;
```

---

### **Security Best Practices**

```bash
# ✅ Use environment variables
docker exec -i container mysql -u root -p${PASSWORD} < script.sql

# ⚠️ Visible password (only for local development)
docker exec -i container mysql -u root -pPASSWORDEXAMPLE < script.sql
```

---

### **Result Verification**

Always include verifications:

```sql
-- After INSERT
SELECT COUNT(*) AS total_inserted FROM Students;

-- After UPDATE
SELECT * FROM Students WHERE condition LIMIT 5;

-- After DELETE
SELECT COUNT(*) AS remaining FROM Students;
```

---