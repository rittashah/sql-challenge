--List the employee number, last name, first name, sex, and salary of each employee
SELECT Em.emp_no, Em.last_name, Em.first_name, Em.sex, Sa.salary
FROM employees Em
JOIN salaries Sa
ON Em.emp_no = Sa.emp_no
ORDER BY emp_no Asc;

--List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '01/01/1986' AND '12/31/1986'
ORDER BY hire_date ASC;

--List the manager of each department along with their department number, department name, employee number, last name, and first name 
SELECT m.dept_no, de.dept_name, Em.emp_no,Em.last_name, Em.first_name
FROM dept_manager m
JOIN employees Em 
ON m.emp_no = Em.emp_no
JOIN departments de 
ON m.dept_no = de.dept_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name 
SELECT Em.emp_no, Em.last_name, Em.first_name, de.dept_name,dept_emp.emp_no
FROM employees Em
JOIN  dept_emp  
ON Em.emp_no = dept_emp.emp_no
JOIN departments de
ON dept_emp.dept_no = de.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT Em.first_name, Em.last_name, Em.sex
FROM employees Em
WHERE first_name = 'Hercules' AND last_name iLIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name 
SELECT Em.emp_no, Em.last_name, Em.first_name, de.dept_name
FROM employees Em
JOIN  dept_emp  
ON Em.emp_no = dept_emp.emp_no
JOIN departments de
ON dept_emp.dept_no = de.dept_no
WHERE de.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name 
SELECT Em.emp_no, Em.last_name, Em.first_name, de.dept_name
FROM employees Em
JOIN  dept_emp  
ON Em.emp_no = dept_emp.emp_no
JOIN departments de
ON dept_emp.dept_no = de.dept_no
WHERE de.dept_name IN ('Sales','Development');

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT last_name, COUNT(last_name) AS "Total"
FROM employees
GROUP BY last_name
ORDER BY "Total" DESC;
