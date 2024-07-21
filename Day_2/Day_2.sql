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
    BatchDate TIMESTAMP NOT NULL,
    PRIMARY KEY (LearnerID),
    UNIQUE KEY(LearnerEmail),
    FOREIGN KEY (SelectedCourse) REFERENCES courses(CourseID)
);
DROP TABLE learners;
DESC learners;

-- inserting records into learners table
-- Insert queries for learners table with the specified constraints

INSERT INTO learners (LearnerFirstName, LearnerLastName, LearnerEmail, LearnerPhoneNumber, LearnerEnrollmentDate, SelectedCourse, YearsOfExperience, LearnerCompany, LearnerSOJ, BatchDate)
VALUES
('Amit', 'Sharma', 'amit.sharma@example.com', '9876543210', '2024-02-28', 1, 3, 'TechMahindra', 'Linkedin', '2024-08-01'),
('Rajesh', 'Verma', 'rajesh.verma@example.com', '9876543211', '2024-01-15', 2, 5, 'Infosys', 'Youtube', '2024-08-02'),
('Sita', 'Patel', 'sita.patel@example.com', '9876543212', '2024-03-24', 3, 2, 'TCS', 'Instagram', '2024-08-03'),
('Vikas', 'Kumar', 'vikas.kumar@example.com', '9876543213', '2024-02-15', 1, 4, 'Wipro', 'Linkedin', '2024-08-04'),
('Anita', 'Desai', 'anita.desai@example.com', '9876543214', '2024-01-14', 2, 1, 'HCL', 'Youtube', '2024-08-05'),
('Ravi', 'Singh', 'ravi.singh@example.com', '9876543215', '2024-03-23', 3, 6, 'Cognizant', 'Instagram', '2024-08-06');

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