# SQL Day 2 Lecture Summary

## Topics Covered

1. **Strong and Weak Entities**
2. **Constraints:**
   - Primary Key
   - Composite Key
   - Foreign Key
   - Unique
3. **Data Types**
   - Including TIMESTAMP
4. **Sorting**
   - ORDER BY
5. **Aggregate Functions**
   - COUNT, MIN, MAX
6. **DISTINCT Keyword**
7. **LIMIT Clause**
8. **Nesting Commands**
9. **Aliases**
   - AS Keyword

## Table Creation

- Created `courses` table with constraints
- Created `learners` table with various constraints including foreign key

## Data Manipulation

- Inserted data into both tables
- Performed various SELECT queries with different clauses and conditions

## Key SQL Concepts Demonstrated

- Use of `PRIMARY KEY`, `AUTO_INCREMENT`, `UNIQUE`, and `FOREIGN KEY` constraints
- `TIMESTAMP` data type usage
- `ORDER BY` for sorting (both ASC and DESC)
- `LIMIT` clause to restrict the number of results
- Aggregate functions: `COUNT()`, `MIN()`, and `MAX()`
- `COUNT()` function with and without `DISTINCT`
- Subqueries (nested `SELECT` statements)
- `UPDATE` statement for modifying records
- `AS` keyword for aliases

## Important Note

### Correct Usage of the SET Clause in an UPDATE Statement

- **Using commas (,) in the SET clause** of an `UPDATE` statement allows you to update multiple columns simultaneously.

### Incorrect Approach

- Using `AND` in the SET clause would **not** produce the expected result.

### Key Points

- In SQL, `AND` is used in the `WHERE` clause for filtering, **not** in the `SET` clause for updates.

### Example

#### Correct Usage:

```sql
UPDATE learners
SET YearsOfExperience = 2, LearnerCompany = 'Wipro'
WHERE LearnerID = 5;
```

## Analysis Questions and Solutions

### Q1: Give me the record of the employee getting the highest salary?

```sql
SELECT * FROM employee ORDER BY Salary DESC LIMIT 1;
    -- what is the flow of the above command?
		-- from -> select -> orderby -> limit
```

### Q2 : Give me the record of the employee getting the highest salary and age > 25?

```sql
SELECT * FROM employee WHERE Age > 25 ORDER BY Salary DESC LIMIT 1;
    -- what is the flow of the above command?
		-- from -> where -> select -> orderby -> limit
    SELECT * FROM employee WHERE Age > 25 ORDER BY Salary DESC;
    SELECT * FROM employee WHERE Salary = (
		SELECT MAX(Salary) FROM employee WHERE age > 25
    );
```

### Q3 : Display the no of enrollment in the website of techforallwithpriya?

```sql
SELECT COUNT(*) as No_of_Enrollment FROM learners;
```

### Q4 : Total no of enrollments for courseID 3?

```sql
SELECT COUNT(*) as SQL_Bootcamp_Enrollments FROM learners WHERE SelectedCourse = 3;
```

### Q5 : No of enrollments happen in january?

```sql
SELECT COUNT(LearnerID) as Jan_Enrollments FROM learners WHERE LearnerEnrollmentDate < '2024-02-01';
    SELECT COUNT(LearnerID) as Jan_Enrollments FROM learners WHERE LearnerEnrollmentDate LIKE '%-01-%';
    SELECT * FROM learners;
```

### Q6 : Update the data with years of experience as 2 and learner's company as "Wipro" ?

```sql
UPDATE learners SET YearsOfExperience = 2 , LearnerCompany = 'Wipro' WHERE LearnerID = 5;
```

### Q7 : Count the company of the learner's?

```sql
-- COUNT() -> count the not null entries
    -- we need unique company
    -- so for that we use DISTINCT
	SELECT COUNT(DISTINCT LearnerCompany) as Company_Count FROM learners;
```
