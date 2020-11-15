select 
e.emp_no as "employee number", 
e.last_name as "last name", 
e.first_name as "first name", 
e.sex as sex, 
s.salary as salary
from employees e
INNER JOIN salaries s on e.emp_no = s.emp_no;

select 
e.first_name as "first name", 
e.last_name as "last name", 
e.hire_date
from employees e
where EXTRACT(YEAR from e.hire_date) = 1986;

select 
d.dept_no as "department number",
d.dept_name as "department name",
e.emp_no as "manager's employee number",
e.last_name as "last name",
e.first_name as "first name"
from dept_emp de
JOIN departments d on de.dept_no = d.dept_no
JOIN employees e on de.emp_no = e.emp_no;

select 
dm.dept_no as "department number",
d.dept_name as "department name",
dm.emp_no as "employee number",
e.last_name as "last name",
e.first_name as "first name"
from dept_manager dm
JOIN departments d on d.dept_no = dm.dept_no
JOIN employees e on e.emp_no = dm.emp_no;

List the department of each employee with the following information: employee number, last name, first name, and department name.

select 
d.dept_name as "department",
d.dept_no,
e.emp_no as "employee number",
e.last_name as "last name",
e.first_name as "first name"
from departments d
JOIN dept_emp de on de.dept_no = d.dept_no
JOIN employees e on de.emp_no = e.emp_no
order by d.dept_no
;
select * from departments;

select count(emp_no), dept_no from dept_emp 
group by dept_no;