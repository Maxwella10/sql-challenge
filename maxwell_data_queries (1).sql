-- QUESTION 1

SELECT e.emp_no,
		e.last_name,
                e.first_name,
                e.sex,
                s.salary
FROM employees e
JOIN salaries s USING(emp_no);

-- QUESTION 2

SELECT first_name,
		last_name,
                hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- QUESTION 3

SELECT e.first_name,
		e.last_name,
                e.emp_no,
                d.dept_name,
                d.dept_no
FROM employees e
JOIN dept_manager dm USING(emp_no)
JOIN departments d USING(dept_no);

-- QUESTION 4

SELECT e.emp_no,
		e.first_name,
		e.last_name,
                d.dept_name
FROM employees e
JOIN dept_emp de USING(emp_no)
JOIN departments d USING(dept_no);

-- QUESTION 5

SELECT first_name,
		last_name,
                sex
FROM employees
WHERE first_name LIKE 'Hercules' AND last_name LIKE 'B%';

-- QUESTION 6

SELECT e.first_name,
		e.last_name,
                e.emp_no,
                d.dept_name
FROM employees e
JOIN dept_emp de USING(emp_no)
JOIN departments d USING(dept_no)
WHERE d.dept_name = 'Sales';

-- QUESTION 7

SELECT e.first_name,
		e.last_name,
                e.emp_no,
                d.dept_name
FROM employees e
JOIN dept_emp de USING(emp_no)
JOIN departments d USING(dept_no)
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

-- QUESTION 8

SELECT last_name,
		COUNT(last_name) AS name_frequency
FROM employees
GROUP BY last_name
ORDER BY name_frequency DESC;