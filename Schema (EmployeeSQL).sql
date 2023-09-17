
CREATE TABLE titles (
    title_id VARCHAR (10) NOT NULL,
    title VARCHAR(30) NOT NULL,
	PRIMARY KEY (title_id)
	-- 	emp_title_id is not a unique key in the table employees so it's 
    -- 	wrong to put the FOREIGN KEY here, should put emp_title_is as a FOREIGN KEY
	-- 	in the employees table 
	-- 	BECAUSE this titles table here is the parent table for the emp_title_id
	-- 	FOREIGN KEY (title_id) REFERENCES employees(emp_title_id)
);

SELECT *
FROM titles;

CREATE TABLE employees (
    emp_no INT   NOT NULL,
    emp_title_id VARCHAR(10) NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR(20)   NOT NULL,
    last_name VARCHAR(30)   NOT NULL,
    sex VARCHAR(10) NOT NULL,
    hire_date DATE   NOT NULL,
    PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

SELECT *
FROM employees;

CREATE TABLE departments (
	dept_no VARCHAR(10) NOT NULL,
    dept_name VARCHAR(30) NOT NULL,
	PRIMARY KEY (dept_no)
);

SELECT *
FROM departments;

-- This is a junction table, it has a composite key 
-- (i.e., its primary keys are those from the employees 
-- and departments table AKA.FOREIGN KEYS)
-- a junction table will always have composite key
CREATE TABLE dept_emp (
    emp_no INT   NOT NULL,
    dept_no VARCHAR(10)   NOT NULL,
	PRIMARY KEY (emp_no,dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT *
FROM dept_emp;

-- This is a junction table, it has a composite key 
-- (i.e., its primary keys are those from the employees 
-- and departments table AKA.FOREIGN KEYS)
-- a junction table will always have composite key
-- This one a junction table but it contains only 1 primary key ?
CREATE TABLE dept_manager (
    dept_no VARCHAR(10)   NOT NULL,
    emp_no INT   NOT NULL,
	PRIMARY KEY (emp_no,dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Even though dept_manager has a column that contains unique values
-- i.e., emp_no, but this column is not representative of the info
-- contained in this table. This is a table about department managers
-- so it will have a composite key, meaning that both emp_no and dept_no
-- are primary keys
-- It is incorrect to set either emp_no or dept_no as the primary as neither of these
-- columns accurately describes this table which contains info about department managers
SELECT *
FROM dept_manager;

CREATE TABLE salaries (
    emp_no INT   NOT NULL,
    salary INT   NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT *
FROM salaries;














