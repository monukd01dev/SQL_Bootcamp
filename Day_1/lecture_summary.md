# SQL Session Summary

## Database Operations:
- `SHOW DATABASES;`
- `CREATE DATABASE techforallwithpriya;`
- `CREATE DATABASE IF NOT EXISTS techforallwithpriya;`
- `USE techforallwithpriya;`
- `SELECT database();`

## Table Operations:
### a. Data Definition Language (DDL) Commands:
- CREATE TABLE
- DESC (DESCRIBE)
- DROP TABLE
- SHOW TABLES

### b. Constraints Covered:
- PRIMARY KEY
- NOT NULL
- AUTO_INCREMENT

## Data Manipulation Language (DML) Commands:
### a. INSERT:
- Basic INSERT
- INSERT with column specification
- Multiple row INSERT

### b. SELECT:
- SELECT *
- SELECT with specific columns
- SELECT with WHERE clause

### c. UPDATE:
- UPDATE with WHERE clause

### d. DELETE:
- DELETE with WHERE clause

## Key Concepts:
- Database creation and selection
- Table creation and schema definition
- Primary key constraints
- Auto-increment for unique identifiers
- Data insertion techniques
- Querying and filtering data
- Updating records
- Deleting records
- Importance of using primary keys in UPDATE and DELETE operations


## Questions and Answers:

### Q1: Give me the record of the employee having the age more than 25?

```sql
SELECT * FROM employee WHERE Age > 25;
```
### Q2: Update the John's LastName to Wick?

```sql
UPDATE employee SET LastName = 'Wick' WHERE EID = 3;
SELECT * FROM employee WHERE EID = 3;
```
### Q3: Difference between UPDATE and ALTER command?
- UPDATE is a DML (Data Manipulation Language) command that works at the record level.
- ALTER is a DDL (Data Definition Language) command that works at the schema level.

### Q4: Delete any record using EID?
```sql
DELETE FROM employee WHERE EID = 4;
SELECT * FROM employee WHERE EID = 4;
```

## Additional Notes:
- The session covered the difference between UPDATE (DML) and ALTER (DDL) commands
- Emphasized the importance of using primary keys for record updates and deletions
- Demonstrated the use of WHERE clauses for filtering and specific operations
- Showed how to handle potential errors (e.g., IF NOT EXISTS for database creation)



