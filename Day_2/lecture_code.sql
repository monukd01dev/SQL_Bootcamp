-- today's targets
-- 1. strong entity
-- 2. weak entity
-- 3. contraints
-- 	 a. primary key
-- 	 b. composite key
-- 	 c. foreign key
-- 	 d. unique
-- 4. Data Type
--   a. timestamp -> syntax -> 'YYYY-MM-DD HH:MM:SS'
-- 5. Sorting -> ORDER BY -> ascending order default if you want to sort in descending order use ORDER BY DESC
-- 6. COUNT(*) and COUNT(Attribute_name)
-- 7. DISTINCT
-- 8. LIMIT -> controls how many records to be shown
-- 9. MIN() and  MAX() and Nesting commands
-- 10. AS -> alias command

-- first things to do 
USE techforallwithpriya;

-- creating table courses
CREATE TABLE courses(
CourseID INT PRIMARY KEY AUTO_INCREMENT,
CourseName VARCHAR(100) NOT NULL UNIQUE,
CourseDurationMonths INT NOT NULL,
CourseFee INT NOT NULL
);
DROP TABLE courses;
DESC courses;

-- insertion in courses table
INSERT INTO courses(CourseName,CourseDurationMonths,CourseFee) VALUES
("The Complete Excel Mastery Course",3,1499),
("DSA for Interview Preparation",2,4999),
("SQL Bootcamp",1,2999);

SELECT * FROM courses; 

-- learners table creation
CREATE TABLE learners(
	LearnerID INT AUTO_INCREMENT,
    LearnerFirstName VARCHAR(50) NOT NULL,
    LearnerLastName VARCHAR(50) NOT NULL,
    LearnerEmail VARCHAR(50) NOT NULL,
    LearnerPhoneNumber VARCHAR(15) NOT NULL, -- take varchar(10) for numbers int have some limitations
    LearnerEnrollmentDate TIMESTAMP NOT NULL,
    SelectedCourse INT NOT NULL,
    YearsOfExperience INT NOT NULL,
    LearnerCompany VARCHAR(50),
    LearnerSOJ VARCHAR(50) NOT NULL,
    BatchStartDate TIMESTAMP NOT NULL,
    Location VARCHAR(50) NOT NULL,
    PRIMARY KEY (LearnerID),
    UNIQUE KEY(LearnerEmail),
    FOREIGN KEY (SelectedCourse) REFERENCES courses(CourseID)
);
DROP TABLE learners;
DESC learners;

-- inserting records into learners table
-- Insert queries for learners table with the specified constraints

INSERT INTO learners (LearnerFirstName, LearnerLastName, LearnerEmail, LearnerPhoneNumber, LearnerEnrollmentDate, SelectedCourse, YearsOfExperience, LearnerCompany, LearnerSOJ, BatchStartDate, Location)
VALUES
-- Learners for courseID 1 (enrollment before 2024-02-29)
('Arun', 'Venkatesh', 'arun.venkatesh@example.com', '9123456780', '2024-01-05', 1, 8, 'Reliance', 'Linkedin', '2024-08-01', 'Mumbai'),
('Pallavi', 'Rao', 'pallavi.rao@example.com', '9123456783', '2024-01-22', 1, 5, 'Google', 'Youtube', '2024-08-04', 'Bangalore'),
('Sonal', 'Mehta', 'sonal.mehta@example.com', '9123456785', '2024-02-28', 1, 1, 'Adobe', 'Instagram', '2024-08-06', 'Delhi'),
('Vikram', 'Patil', 'vikram.patil@example.com', '9123456786', '2024-01-15', 1, 9, 'Accenture', 'Linkedin', '2024-08-07', 'Hyderabad'),
('Sneha', 'Khan', 'sneha.khan@example.com', '9123456789', '2024-01-28', 1, 5, 'Infosys', 'Instagram', '2024-08-10', 'Chennai'),
('Ajay', 'Reddy', 'ajay.reddy@example.com', '9123456792', '2024-01-19', 1, 2, 'TechMahindra', 'Youtube', '2024-08-13', 'Pune'),
('Radha', 'Mishra', 'radha.mishra@example.com', '9123456795', '2024-01-23', 1, 8, 'Adobe', 'Linkedin', '2024-08-16', 'Kolkata'),

-- Learners for courseID 2 (enrollment before 2024-01-16)
('Meera', 'Nair', 'meera.nair@example.com', '9123456781', '2024-01-05', 2, 2, 'Flipkart', 'Linkedin', '2024-08-02', 'Mumbai'),
('Karthik', 'Ghosh', 'karthik.ghosh@example.com', '9123456784', '2024-01-11', 2, 7, 'Microsoft', 'Youtube', '2024-08-05', 'Bangalore'),
('Neha', 'Kapoor', 'neha.kapoor@example.com', '9123456787', '2024-01-08', 2, 3, 'Wipro', 'Instagram', '2024-08-08', 'Delhi'),
('Aman', 'Singh', 'aman.singh@example.com', '9123456790', '2024-01-13', 2, 4, 'HCL', 'Youtube', '2024-08-11', 'Hyderabad'),
('Geeta', 'Jain', 'geeta.jain@example.com', '9123456793', '2024-01-02', 2, 9, 'Google', 'Linkedin', '2024-08-14', 'Chennai'),
('Rohit', 'Bhat', 'rohit.bhat@example.com', '9123456796', '2024-01-05', 2, 5, 'Accenture', 'Youtube', '2024-08-17', 'Pune'),

-- Learners for courseID 3 (enrollment before 2024-03-25)
('Sunil', 'Desai', 'sunil.desai@example.com', '9123456782', '2024-02-12', 3, 4, 'Amazon', 'Linkedin', '2024-08-03', 'Kolkata'),
('Ravi', 'Sharma', 'ravi.sharma@example.com', '9123456788', '2024-02-20', 3, 6, 'TCS', 'Youtube', '2024-08-09', 'Mumbai'),
('Priya', 'Iyer', 'priya.iyer@example.com', '9123456791', '2024-02-25', 3, 7, 'Cognizant', 'Instagram', '2024-08-12', 'Bangalore'),
('Manoj', 'Joshi', 'manoj.joshi@example.com', '9123456794', '2024-02-10', 3, 4, 'Microsoft', 'Linkedin', '2024-08-15', 'Delhi'),
('Lata', 'Kumar', 'lata.kumar@example.com', '9123456797', '2024-02-17', 3, 3, 'Cognizant', 'Instagram', '2024-08-18', 'Hyderabad'),
('Sumit', 'Roy', 'sumit.roy@example.com', '9123456700', '2024-02-22', 3, 5, 'HCL', 'Linkedin', '2024-08-21', 'Chennai'),
('Asha', 'Seth', 'asha.seth@example.com', '9123456703', '2024-02-08', 3, 1, 'Google', 'Youtube', '2024-08-24', 'Pune'),
('Rajan', 'Chauhan', 'rajan.chauhan@example.com', '9123456706', '2024-02-14', 3, 3, 'Accenture', 'Instagram', '2024-08-27', 'Kolkata'),
('Leela', 'Gandhi', 'leela.gandhi@example.com', '9123456709', '2024-02-18', 3, 5, 'Infosys', 'Linkedin', '2024-08-30', 'Mumbai');



SELECT * FROM learners;

-- Data Analysis [employee,courses,learners]
-- Question 1 : Give me the record of the employee getting the highest salary?
	SELECT * FROM employee ORDER BY Salary DESC LIMIT 1;
    -- what is the flow of the above command?
		-- from -> select -> orderby -> limit
    SELECT * FROM employee;
    
-- Question 2 : Give me the record of the employee getting the highest salary and age > 25?
	SELECT * FROM employee WHERE Age > 25 ORDER BY Salary DESC LIMIT 1;
    -- what is the flow of the above command?
		-- from -> where -> select -> orderby -> limit
    SELECT * FROM employee WHERE Age > 25 ORDER BY Salary DESC;
    SELECT * FROM employee WHERE Salary = (
		SELECT MAX(Salary) FROM employee WHERE age > 25
    );
    
-- Question 3 : Display the no of enrollment in the website of techforallwithpriya?
	SELECT COUNT(*) as No_of_Enrollment FROM learners;
    
-- Question 4 : Total no of enrollments for courseID 3?
	SELECT COUNT(*) as SQL_Bootcamp_Enrollments FROM learners WHERE SelectedCourse = 3;

-- Question 5 : No of enrollments happen in january?
	SELECT COUNT(LearnerID) as Jan_Enrollments FROM learners WHERE LearnerEnrollmentDate < '2024-02-01';
    SELECT COUNT(LearnerID) as Jan_Enrollments FROM learners WHERE LearnerEnrollmentDate LIKE '%-01-%';
    SELECT * FROM learners;
    
-- Question 6 : Update the  data with years of experience as 2 and learner's company as "Wipro" ?
	UPDATE learners SET YearsOfExperience = 2 , LearnerCompany = 'Wipro' WHERE LearnerID = 5;
	
-- Question 7 : Count the company of the learner's?
	-- COUNT() -> count the not null entries
    -- we need unique company
    -- so for that we use DISTINCT
	SELECT COUNT(DISTINCT LearnerCompany) as Company_Count FROM learners;