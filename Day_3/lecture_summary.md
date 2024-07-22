# SQL Day 2 Lecture Summary
## Agenda
1. Clause
   - GROUP BY
   - HAVING

2. Data type
   - DECIMAL
   - TIMESTAMP DEFAULT NOW() ON UPDATE NOW()

3. Functions
   - MIN() and MAX()
   - SUM() and AVG()

4. DDL Command
   - ALTER
     - ADD/DROP COLUMN
     - MODIFY COLUMN
     - ADD/DROP constraints (when any key constraint has auto_increment, dropping that key cannot be possible without MODIFYING it first)
     - Rename column and table

5. DML Command
   - TRUNCATE

6. Data Analysis

7. LeetCode Questions

8. Logical Operator
   - AND
   - OR
   - NOT

9. Keyword
   - BETWEEN

10. HAVING vs WHERE

## SQL Code Summary

### Clause

#### GROUP BY
- **Description**: Used to group rows that have the same values in specified columns into summary rows.
- **Example**:
    ```sql
    SELECT LearnerSOJ, COUNT(*) as No_of_Joinings FROM learners GROUP BY LearnerSOJ;
    ```

#### HAVING
- **Description**: Used to filter groups created by the GROUP BY clause. Unlike WHERE, HAVING is used with aggregate functions.
- **Example**:
    ```sql
    SELECT LearnerSOJ FROM learners 
    GROUP BY LearnerSOJ 
    HAVING COUNT(LearnerSOJ) > 1;
    ```

### Data Type

#### DECIMAL
- **Description**: A precise numeric data type for fixed-point numbers.
- **Example**:
    ```sql
    ALTER TABLE courses_dummy MODIFY COLUMN CourseDurationMonths DECIMAL(3,1) NOT NULL;
    ```

#### TIMESTAMP DEFAULT NOW() ON UPDATE NOW()
- **Description**: Used to automatically set the date and time of a record when it is created and updated.
- **Example**:
    ```sql
    ALTER TABLE courses_dummy ADD COLUMN ChangeAt TIMESTAMP DEFAULT NOW();
    ALTER TABLE courses_dummy MODIFY COLUMN ChangeAt TIMESTAMP DEFAULT NOW() ON UPDATE NOW();
    ```

### Functions

#### MIN() and MAX()
- **Description**: Aggregate functions to return the minimum and maximum value in a set of values.
- **Example**:
    ```sql
    SELECT LearnerSOJ, MAX(YearsOfExperience) as MaxYearsofExp FROM learners GROUP BY LearnerSOJ;
    ```

#### SUM() and AVG()
- **Description**: Aggregate functions to return the sum and average of a set of values.
- **Example**:
    ```sql
    SELECT SUM(Salary) FROM employee;
    SELECT AVG(Salary) FROM employee;
    ```

### DDL Command

#### ALTER
- **Description**: Used to modify the structure of an existing database object.
- **Examples**:
    - **ADD/DROP COLUMN**:
        ```sql
        ALTER TABLE courses_dummy ADD COLUMN ChangeAt TIMESTAMP DEFAULT NOW();
        ALTER TABLE courses_dummy DROP COLUMN ChangeAt;
        ```
    - **MODIFY COLUMN**:
        ```sql
        ALTER TABLE courses_dummy MODIFY COLUMN CourseDurationMonths DECIMAL(3,1) NOT NULL;
        ```
    - **ADD/DROP constraints**:
        ```sql
        ALTER TABLE courses_dummy 
        MODIFY COLUMN CourseID INT, DROP PRIMARY KEY;
        ```
    - **Rename column and table**:
        ```sql
        ALTER TABLE courses_dummy RENAME COLUMN CourseTimingMonths TO CourseDurationMonths;
        ALTER TABLE old_table_name RENAME TO new_table_name;
        ```

### DML Command

#### TRUNCATE
- **Description**: Used to delete all rows in a table without logging individual row deletions.
- **Example**:
    ```sql
    TRUNCATE TABLE learners;
    ```

### Data Analysis
- **Description**: The process of inspecting, cleansing, transforming, and modeling data to discover useful information.
- **Example**: Several queries analyzing learner data by their source of joining, course enrollments, and years of experience.

### LeetCode Questions
- **Question 1**: Count the number of learners who joined the course via LinkedIn, YouTube, and Instagram.
    ```sql
    SELECT LearnerSOJ, COUNT(*) as No_of_Joinings FROM learners GROUP BY LearnerSOJ;
    ```

- **Question 2**: Corresponding to every course, how many enrollments are done?
    ```sql
    SELECT SelectedCourse , COUNT(*) as NO_Of_Enroll FROM learners GROUP BY SelectedCourse;
    ```

- **Question 3**: Corresponding to the individual source of joining, give the maximum years of experience any person has.
    ```sql
    SELECT LearnerSOJ, MAX(YearsOfExperience) as MaxYearsofExp FROM learners GROUP BY LearnerSOJ;
    ```

- **Question 4**: Display the record of those learners who are joining from more than two sources of joining.
    ```sql
    SELECT LearnerSOJ FROM learners 
    GROUP BY LearnerSOJ 
    HAVING COUNT(LearnerSOJ) > 1;
    ```

- **Question 5**: Display the count of the learners joined via LinkedIn.
    ```sql
    SELECT LearnerSOJ, COUNT(*) as No_of_leaners FROM learners
    GROUP BY LearnerSOJ
    HAVING LearnerSOJ = 'Linkedin';
    ```

- **Question 6**: Display the source of joining where enrollments are more than 2.
    ```sql
    SELECT LearnerSOJ, COUNT(*) as No_of_Enroll FROM learners
    GROUP BY LearnerSOJ
    HAVING No_of_Enroll > 2;
    ```

- **Question 7**: Display the company name from which we have maximum learners.
    ```sql
    SELECT LearnerCompany, COUNT(*) as No_of_Learners FROM learners
    GROUP BY LearnerCompany
    ORDER BY No_of_Learners DESC
    LIMIT 1;
    ```

- **Question 8**: Display the course which doesn't include "Excel".
    ```sql
    SELECT * FROM courses
    WHERE CourseName NOT LIKE '% Excel %';
    ```

- **Question 9**: Display the records of those students who have less than 4 years of experience and source of joining is YouTube.
    ```sql
    SELECT * FROM learners
    WHERE YearsOfExperience < 4 AND LearnerSOJ = 'Youtube';
    ```

- **Question 10**: Display the record of the learners who have years of experience between 1 to 3 years.
    ```sql
    SELECT * FROM learners
    WHERE YearsOfExperience BETWEEN 1 AND 3;
    ```

### Logical Operator

#### AND
- **Description**: Combines multiple conditions and returns true only if all conditions are true.
- **Example**:
    ```sql
    SELECT * FROM learners
    WHERE YearsOfExperience < 4 AND LearnerSOJ = 'Youtube';
    ```

#### OR
- **Description**: Combines multiple conditions and returns true if any condition is true.
- **Example**:
    ```sql
    SELECT * FROM learners
    WHERE YearsOfExperience < 4 OR LearnerSOJ = 'Youtube';
    ```

#### NOT
- **Description**: Negates a condition.
- **Example**:
    ```sql
    SELECT * FROM courses
    WHERE CourseName NOT LIKE '% Excel %';
    ```

### Keyword

#### BETWEEN
- **Description**: Used to filter the result set within a certain range. The range is inclusive.
- **Example**:
    ```sql
    SELECT * FROM learners
    WHERE YearsOfExperience BETWEEN 1 AND 3;
    ```

### HAVING vs WHERE

#### HAVING
- **Description**: Used to filter groups created by the GROUP BY clause. Suitable for use with aggregate functions.
- **Example**:
    ```sql
    SELECT LearnerSOJ, COUNT(*) as No_of_Joinings FROM learners
    GROUP BY LearnerSOJ
    HAVING COUNT(*) > 2;
    ```

#### WHERE
- **Description**: Used to filter rows before any groupings are made. Suitable for filtering individual rows.
- **Example**:
    ```sql
    SELECT * FROM learners
    WHERE YearsOfExperience < 4 AND LearnerSOJ = 'Youtube';
    ```

#### Comparison
- **Usage**: WHERE is used to filter individual rows before grouping, while HAVING is used to filter groups after grouping.
- **Example**:
    ```sql
    -- Using WHERE to filter rows with less than 4 years of experience
    SELECT * FROM learners
    WHERE YearsOfExperience < 4;
    
    -- Using HAVING to filter groups with more than 2 learners
    SELECT LearnerSOJ, COUNT(*) as No_of_Joinings FROM learners
    GROUP BY LearnerSOJ
    HAVING COUNT(*) > 2;
    ```
