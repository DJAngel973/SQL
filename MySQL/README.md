# MySQL - Fundamentals and Practice

This directory contains progressive MySQL scripts ranging from basic concepts to advanced queries. It is designed for people new to relational databases and includes knowledge and examples acquired from the **Java Engineer course on Coursera**.

---

##  What is MySQL?

**MySQL** is an open-source relational database management system (RDBMS). It is one of the most popular database engines in the world, used by millions of web and enterprise applications.

### **Key Features:**
- **Fast and reliable** for web applications
- **Secure** with robust access control
- **Relational** - organizes data in tables with relationships
- **Open Source** - GPL license
- **Widely adopted** - large community and extensive documentation

---

## When to Use MySQL?

### ✅ **Ideal for:**
- Web applications (WordPress, Drupal, Joomla)
- E-commerce (online stores, shopping carts)
- Content Management Systems (CMS)
- CRUD applications (Create, Read, Update, Delete)
- High-traffic websites with intensive read operations

### ❌ **Not the best option for:**
- Extremely complex data analysis (PostgreSQL is better)
- Unstructured or semi-structured data (MongoDB is better)
- Applications with ultra-complex transactions

---

## Real-World Use Cases

| Company/Product | MySQL Usage |
|-----------------|-------------|
| **Facebook** | User data and message storage |
| **Twitter** | Timeline system and tweets |
| **YouTube** | Video metadata and user management |
| **Netflix** | Subscription and billing management |
| **Uber** | Trip data and transactions |
| **Airbnb** | Reservations and property listings |
| **Spotify** | User data and playlists |
| **GitHub** | Repository metadata and user management |

---

## Script Contents

### **Basic Level: Fundamentals**

| Script | Description | Concepts |
|--------|-------------|----------|
| `01_create_database.sql` | Create database | `CREATE DATABASE`, `USE` |
| `02_create_table.sql` | Create tables | `CREATE TABLE`, data types |
| `03_alter_table_add.sql` | Modify table (add column) | `ALTER TABLE ADD` |
| `04_delete_table.sql` | Drop table | `DROP TABLE` |
| `05_insert_data.sql` | Insert single record | `INSERT INTO` |
| `06_update_data.sql` | Update records | `UPDATE SET WHERE` |
| `07_delete_data.sql` | Delete records | `DELETE FROM WHERE` |
| `08_insert_multiple_data.sql` | Insert multiple records | `INSERT VALUES (...)` |

**What you'll learn:**
- How to create and manage databases
- Basic table operations (DDL)
- CRUD operations (DML)
- Data types and constraints

---

### **Intermediate Level: Queries and Relationships**

| Script | Description | Concepts |
|--------|-------------|----------|
| `09_select_where.sql` | Queries with filters | `SELECT WHERE` |
| `10_group_by.sql` | Group data | `GROUP BY`, aggregations |
| `11_having.sql` | Filter groups | `HAVING` |
| `12_order_by.sql` | Sort results | `ORDER BY ASC/DESC` |
| `13_create_enrollments.sql` | Relationship table | Foreign Keys |
| `14_insert_enrollments_data.sql` | Related data | Referential integrity |
| `15_inner_join.sql` | Inner join | `INNER JOIN` |
| `16_left_join.sql` | Left join | `LEFT JOIN` |
| `17_left_join_null.sql` | Join with NULL | `LEFT JOIN + IS NULL` |

**What you'll learn:**
- Filter and sort data efficiently
- Aggregate functions (`COUNT`, `SUM`, `AVG`, `MAX`, `MIN`)
- Table relationships (one-to-many, many-to-many)
- How to combine data from multiple tables

---

### **Advanced Level: Complex Queries**

| Script | Description | Concepts |
|--------|-------------|----------|
| `18_subquery_where.sql` | Subqueries in WHERE | Subqueries |
| `19_subquery_from.sql` | Subqueries in FROM | Derived tables |
| `20_window_row_number.sql` | Window functions | `ROW_NUMBER()` |
| `21_cte.sql` | Common Table Expressions | `WITH ... AS` (CTE) |
| `22_partition_by.sql` | Partitioning | `PARTITION BY` |
| `23_create_view.sql` | Create views | `CREATE VIEW` |
| `24_group_count.sql` | Grouped counts | `GROUP BY COUNT()` |

**What you'll learn:**
- Break down complex queries into manageable parts
- Perform calculations across partitions without grouping
- Create reusable query templates with views
- Optimize query performance

---

## How to Use These Scripts

### **Option 1: Execute from Docker (Recommended)**

```bash
# Execute a specific script
docker exec -i inicio-mysql-coursera mysql -u root -p${MYSQL_ROOT_PASSWORD} < MySQL/01_create_database.sql

# Or with password directly (local development only)
docker exec -i inicio-mysql-coursera mysql -u root -pyourpassword < MySQL/01_create_database.sql
```

### **Option 2: Interactive Connection**

```bash
# Enter the MySQL container
docker exec -it inicio-mysql-coursera mysql -u root -p${MYSQL_ROOT_PASSWORD}

# Inside MySQL, execute commands manually
mysql> USE MY_DATABASE;
mysql> SOURCE /path/to/script.sql;
```

### **Option 3: From Visual Studio Code**

1. Install the **MySQL** extension by Weijan Chen
2. Connect to the container at `localhost:3306`
3. Execute scripts directly from the editor

---

## Recommended Learning Path

### **For Beginners:**

```
Week 1: Basics
├── 01-04: Database and table operations
└── 05-08: CRUD operations

Week 2: Queries
├── 09-12: Filtering, grouping, and sorting
└── Practice with real datasets

Week 3: Relationships
├── 13-14: Create relationships between tables
└── 15-17: Master JOINs

Week 4: Advanced
├── 18-19: Subqueries
├── 20-22: Window functions and CTEs
└── 23-24: Views and optimization
```

---

## Key Concepts Explained

### **1️⃣ CRUD Operations**

The foundation of any database application:

```sql
-- CREATE
INSERT INTO Students (Name, Age) VALUES ('Alice', 20);

-- READ
SELECT * FROM Students WHERE Age > 18;

-- UPDATE
UPDATE Students SET Age = 21 WHERE Name = 'Alice';

-- DELETE
DELETE FROM Students WHERE StudentID = 1;
```

---

### **2️⃣ Table Relationships**

Real-world data is connected:

```sql
Students          Enrollments
┌──────────┐      ┌──────────┐
│StudentID │──┐   │StudentID │
│Name      │  └──→│CourseName│
│Age       │      │Date      │
└──────────┘      └──────────┘

One student ➡️ Many enrollments (One-to-Many)
```

---

### **3️⃣ JOINs - Combining Data**

```sql
-- INNER JOIN: Only matches (students WITH enrollments)
SELECT s.Name, e.CourseName
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID;

-- LEFT JOIN: All students (WITH or WITHOUT enrollments)
SELECT s.Name, e.CourseName
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID;

-- LEFT JOIN + NULL: Students WITHOUT enrollments
SELECT s.Name
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
WHERE e.StudentID IS NULL;
```

---

### **4️⃣ Aggregations and Grouping**

```sql
-- How many students per major?
SELECT Major, COUNT(*) AS Total
FROM Students
GROUP BY Major;

-- Majors with more than 5 students
SELECT Major, COUNT(*) AS Total
FROM Students
GROUP BY Major
HAVING COUNT(*) > 5;
```

---

### **5️⃣ Window Functions vs GROUP BY**

**The key difference:**

```sql
-- GROUP BY: Collapses rows, loses individual detail
SELECT Major, COUNT(*) AS Total
FROM Students
GROUP BY Major;
-- Result: Computer Science | 9 (only 1 row per major)

-- WINDOW FUNCTION: Keeps all rows + adds aggregate
SELECT Name, Major, COUNT(*) OVER (PARTITION BY Major) AS Total
FROM Students;
-- Result: Alice | Computer Science | 9
--         Bob   | Computer Science | 9
--         (all individual students shown)
```

**When to use each:**
- **GROUP BY**: When you want summary data (reports, dashboards)
- **WINDOW FUNCTIONS**: When you need both detail and aggregate (rankings, running totals)

---

### **6️⃣ Subqueries**

Queries inside queries:

```sql
-- Find students enrolled in more than 2 courses
SELECT Name
FROM Students
WHERE StudentID IN (
    SELECT StudentID
    FROM Enrollments
    GROUP BY StudentID
    HAVING COUNT(*) > 2
);
```

---

### **7️⃣ Common Table Expressions (CTEs)**

Make complex queries readable:

```sql
-- Find majors with low enrollment
WITH StudentCounts AS (
    SELECT Major, COUNT(StudentID) AS StudentCount
    FROM Students
    GROUP BY Major
)
SELECT Major, StudentCount
FROM StudentCounts
WHERE StudentCount < 8;
```

**Benefits:**
- More readable than nested subqueries
- Can reference the CTE multiple times
- Better for debugging complex logic

---

## Best Practices Applied

### **Script Structure**

Every script follows this template:

```sql
-- ========================================
-- Script description
-- ========================================

USE MY_DATABASE;

-- Clear comments explaining what it does
SELECT 'Step 1: Starting operation' AS info;

-- Main operation
SELECT ...;

-- Verification
SELECT COUNT(*) AS total FROM table;

-- Confirmation message
SELECT 'Script completed successfully!' AS State;
```

### **Idempotence** (Run Multiple Times Safely)

```sql
-- Database
DROP DATABASE IF EXISTS MY_DATABASE;
CREATE DATABASE MY_DATABASE;

-- Tables
DROP TABLE IF EXISTS Students;
CREATE TABLE Students (...);

-- Views
DROP VIEW IF EXISTS StudentSummary;
CREATE VIEW StudentSummary AS ...;
```

### **Naming Conventions**

| Element | Convention | Example |
|---------|------------|---------|
| **Tables** | PascalCase, plural | `Students`, `Enrollments` |
| **Columns** | PascalCase, singular | `StudentID`, `Name` |
| **Views** | Descriptive | `StudentEnrollmentSummary` |
| **Aliases** | Lowercase, abbreviated | `s`, `e`, `stu` |

---

## SQL Query Execution Order

Understanding how MySQL processes queries:

```sql
SELECT Name, Major           -- 5. Select columns
FROM Students                -- 1. Get data from table
INNER JOIN Enrollments       -- 2. Combine tables
    ON s.ID = e.StudentID
WHERE Age > 18               -- 3. Filter rows
GROUP BY Major               -- 4. Group data
HAVING COUNT(*) > 5          -- 6. Filter groups
ORDER BY Major ASC           -- 7. Sort results
LIMIT 10;                    -- 8. Limit output
```

**Why this matters:** Knowing the execution order helps you:
- Write more efficient queries
- Understand why certain syntax works or doesn't
- Debug query errors faster

---

## Security Best Practices

```bash
# ✅ Use environment variables (production)
docker exec -i container mysql -u root -p${PASSWORD} < script.sql

# ⚠️ Visible password (local development only)
docker exec -i container mysql -u root -pYOURPASSWORD < script.sql
```

**Never commit:**
- `.env` files with real passwords
- Hardcoded credentials in scripts
- Production connection strings

---

## Result Verification

Always verify your operations:

```sql
-- After INSERT
SELECT COUNT(*) AS total_inserted FROM Students;
SELECT * FROM Students ORDER BY StudentID DESC LIMIT 5;

-- After UPDATE
SELECT * FROM Students WHERE condition LIMIT 10;

-- After DELETE
SELECT COUNT(*) AS remaining FROM Students;
```

---

## Learning Resources

### **Documentation:**
- [Official MySQL Documentation](https://dev.mysql.com/doc/)
- [MySQL Tutorial](https://www.mysqltutorial.org/)
- [SQLBolt - Interactive Exercises](https://sqlbolt.com/)

### **Practice:**
- [LeetCode Database Problems](https://leetcode.com/problemset/database/)
- [HackerRank SQL](https://www.hackerrank.com/domains/sql)

---

## Troubleshooting

### **Cannot connect to MySQL**
```bash
# Check if container is running
docker ps | grep mysql

# Check container logs
docker logs inicio-mysql-coursera

# Restart container if needed
docker restart inicio-mysql-coursera
```

### **"Access denied for user"**
```bash
# Verify credentials in .env file
cat .env | grep MYSQL_ROOT_PASSWORD

# Try connecting with root user
docker exec -it inicio-mysql-coursera mysql -u root -p
```

### **"Database doesn't exist"**
```sql
-- List all databases
SHOW DATABASES;

-- Create if missing
CREATE DATABASE IF NOT EXISTS MY_DATABASE;
```

### **"Table doesn't exist"**
```sql
-- Check current database
SELECT DATABASE();

-- List tables in database
SHOW TABLES;

-- Use correct database
USE MY_DATABASE;
```

---

## Current Progress

- [x] Fundamentals (CRUD operations)
- [x] Basic queries (WHERE, GROUP BY, HAVING, ORDER BY)
- [x] Table relationships (JOINs)
- [x] Advanced queries (Subqueries, Window Functions, CTEs, Views)
- [ ] Indexes and optimization
- [ ] Transactions and error handling
- [ ] Stored Procedures and Triggers
- [ ] Security and user permissions

---

##  About This Content

This material is based on knowledge and practical examples acquired from the **Java Engineer Professional Certificate** course on Coursera. The scripts have been adapted and expanded for educational purposes, following industry best practices.

---

**Start from script 01 and progress at your own pace!**

For questions or improvements, see [CONTRIBUTING.md](../CONTRIBUTING.md).