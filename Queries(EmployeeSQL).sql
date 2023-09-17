-- 1. List the employee number, last name, first name, 
-- sex, and salary of each employee.
SELECT e.emp_no,
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
FROM employees e
INNER JOIN salaries s ON
e.emp_no=s.emp_no;

-- 2. List the first name, last name, and hire date for the employees 
-- who were hired in 1986.
SELECT first_name,
	last_name,
	hire_date
FROM employees
-- This BETWEEN clause is used for non-VARCHAR values, (e.g., date or numbers)
-- wild cards (e.g., % and _) are used for VARCHAR values
WHERE hire_date BETWEEN '1986-1-1' AND '1986-12-31'
-- This date format works as well!
-- WHERE hire_date BETWEEN '1986/1/1' AND '1986/12/31';
ORDER BY hire_date DESC;

-- 3. List the manager of each department along with their 
-- department number, department name, employee number, last name, and first name.
SELECT e.last_name,
	e.first_name,
	d.dept_no,
	d.dept_name,
	dm.emp_no
FROM departments d 
INNER JOIN dept_manager dm ON
dm.dept_no = d.dept_no
INNER JOIN employees e ON
e.emp_no = dm.emp_no;

SELECT e.last_name,
	e.first_name,
	d.dept_no,
	d.dept_name,
	e.emp_no
FROM departments d 
INNER JOIN dept_manager dm ON
dm.dept_no = d.dept_no
INNER JOIN employees e ON
e.emp_no = dm.emp_no;

-- 4. List the department number for each employee along with that 
-- employee’s employee number, last name, first name, and department name.
SELECT e.last_name,
	e.first_name,
	d.dept_no,
	d.dept_name,
	de.emp_no
FROM employees e 
INNER JOIN dept_emp de ON
e.emp_no = de.emp_no
INNER JOIN departments d ON
d.dept_no = de.dept_no;

-- 5. List the first name, last name, and sex of each employee 
-- whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name,
	last_name,
	sex 
FROM employees
WHERE first_name = 'Hercules' AND
	last_name LIKE 'B%';
	
-- 6. (Using inner joins)List each employee in the Sales department, including their employee number, 
-- last name, and first name.
SELECT e.last_name,
	e.first_name,
	d.dept_name,
	-- 	should I use emp_no from dept_emp or employees table?
	de.emp_no
FROM employees e
INNER JOIN dept_emp de ON
e.emp_no = de.emp_no
INNER JOIN departments d ON
de.dept_no = d.dept_no
WHERE dept_name = 'Sales';

-- 6. (Using sub-queries)List each employee in the Sales department, including their employee number, 
-- last name, and first name.
SELECT emp_no,
	last_name,
	first_name
FROM employees
WHERE emp_no IN
(
	SELECT emp_no 
	FROM dept_emp 
	WHERE dept_no IN
	(
		SELECT dept_no 
		FROM departments
		WHERE dept_name = 'Sales'
	)
);

-- 7. (Using clause OR) List each employee in the Sales and Development departments, 
-- including their employee number, 
-- last name, first name, and department name.
SELECT de.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM employees e
INNER JOIN dept_emp de ON
e.emp_no = de.emp_no
INNER JOIN departments d ON
de.dept_no = d.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- 7.(Using UNION) List each employee in the Sales and Development departments, 
-- including their employee number, 
-- last name, first name, and department name.
SELECT de.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM employees e
INNER JOIN dept_emp de ON
e.emp_no = de.emp_no
INNER JOIN departments d ON
de.dept_no = d.dept_no
WHERE dept_name = 'Sales'
UNION ALL
SELECT e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM employees e
INNER JOIN dept_emp de ON
e.emp_no = de.emp_no
INNER JOIN departments d ON
de.dept_no = d.dept_no
WHERE dept_name = 'Development';

-- 8.List the frequency counts, in descending order, of 
-- all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS "frequency of last name"
FROM employees
GROUP BY last_name 
ORDER BY "frequency of last name" DESC;

SELECT last_name, first_name
FROM employees
WHERE last_name = 'Gelosh';











