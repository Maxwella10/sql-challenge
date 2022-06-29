-- creating the database schema for the tables

CREATE SCHEMA maxwell;

-- creating the employees table
CREATE TABLE employees(
	emp_no INT PRIMARY KEY,
        emp_title_id VARCHAR(6),
        birth_date DATE,
        first_name VARCHAR(20),
        last_name VARCHAR(20),
        sex VARCHAR(1),
        hire_date DATE
);

-- creating the titles table
CREATE TABLE titles(
	title_id VARCHAR(6) PRIMARY KEY,
        title VARCHAR(20)
);

-- making the title_id as foreign key in the employees table
ALTER TABLE employees
ADD FOREIGN KEY(emp_title_id)
REFERENCES titles(title_id)
ON DELETE SET NULL;

-- creating the salaries table
CREATE TABLE salaries(
	emp_no INT PRIMARY KEY,
        salary INT,
        FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);

-- creating the departments table
CREATE TABLE departments(
	dept_no VARCHAR(4) PRIMARY KEY,
        dept_name VARCHAR(25)
);

-- creating the dept_emp table
CREATE TABLE dept_emp(
	emp_no INT,
        dept_no VARCHAR(4),
        PRIMARY KEY(emp_no, dept_no),
        FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
        FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
);

-- creating the dept_manager table
CREATE TABLE dept_manager(
	dept_no VARCHAR(4),
        emp_no INT,
        PRIMARY KEY(emp_no, dept_no),
        FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
        FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
);

-- using the loading and populating eachtable from our csv files
SET GLOBAL LOCAL_INFILE = ON;
LOAD DATA LOCAL INFILE 'C:/Users/Phantom/Downloads/maxwell/employees.csv' 
INTO TABLE employees
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(emp_no, emp_title_id, birth_date, first_name, last_name, sex, hire_date);


LOAD DATA LOCAL INFILE 'C:/Users/Phantom/Downloads/maxwell/titles.csv' 
INTO TABLE titles
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(title_id, title);


LOAD DATA LOCAL INFILE 'C:/Users/Phantom/Downloads/maxwell/salaries.csv' 
INTO TABLE salaries
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(emp_no, salary);


LOAD DATA LOCAL INFILE 'C:/Users/Phantom/Downloads/maxwell/departments.csv' 
INTO TABLE departments
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(dept_no, dept_name);


LOAD DATA LOCAL INFILE 'C:/Users/Phantom/Downloads/maxwell/dept_emp.csv' 
INTO TABLE dept_emp
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(emp_no, dept_no);


LOAD DATA LOCAL INFILE 'C:/Users/Phantom/Downloads/maxwell/dept_manager.csv' 
INTO TABLE dept_manager
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(dept_no, emp_no);