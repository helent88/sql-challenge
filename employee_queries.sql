-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
 
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager as dm
JOIN departments as d ON dm.dept_no = d.dept_no
JOIN employees as e ON dm.emp_no = e.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
   
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
JOIN dept_emp as de ON e.emp_no = de.emp_no
JOIN departments as d ON de.dept_no = d.dept_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' and last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT * FROM departments;
-- The department number of Sales department is d007

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
JOIN dept_emp as de ON e.emp_no = de.emp_no
JOIN departments as d ON de.dept_no = d.dept_no
WHERE d.dept_no = 'd007';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT * FROM departments;
-- The department numbers of Sales and Development departments are d007 and d005

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
JOIN dept_emp as de ON e.emp_no = de.emp_no
JOIN departments as d ON de.dept_no = d.dept_no
WHERE d.dept_no in ('d005', 'd007');

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) AS "Frequency count"
FROM employees
GROUP BY last_name
ORDER BY "Frequency count" DESC;