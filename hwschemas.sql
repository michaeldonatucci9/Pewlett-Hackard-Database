-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT emp.emp_no, last_name, first_name, sex, sal.salary
FROM employees as emp
JOIN salaries as sal ON emp.emp_no = sal.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date 
FROM employees
WHERE EXTRACT(year FROM hire_date) = 1986;

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT mgr.dept_no, dept_name, mgr.emp_no, last_name, first_name
FROM dept_manager as mgr
JOIN departments as depts on depts.dept_no = mgr.dept_no
JOIN employees as emp on emp.emp_no = mgr.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT emp.emp_no, last_name, first_name, dept_name
FROM employees as emp
JOIN dept_emp ON dept_emp.emp_no = emp.emp_no
JOIN departments as dept ON dept.dept_no = dept_emp.dept_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex
FROM employees 
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT emp.emp_no, last_name, first_name, dept_name
FROM employees as emp
JOIN dept_emp ON dept_emp.emp_no = emp.emp_no
JOIN departments as dept ON dept.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT emp.emp_no, last_name, first_name, dept_name
FROM employees as emp
JOIN dept_emp ON dept_emp.emp_no = emp.emp_no
JOIN departments as dept ON dept.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, count(last_name)
FROM employees
GROUP BY last_name
ORDER BY count DESC;