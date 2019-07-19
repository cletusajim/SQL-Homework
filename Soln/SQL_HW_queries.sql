--1. List the following details of each employee: employee number, 
--last name, first name, gender, and salary
select e.emp_no AS "Emp #", e.last_name As "Last Name", e.first_name AS "First Name", 
		e.gender AS "Gender", s.salary as "Salary"
from employees e
join salaries s on s.emp_no = e.emp_no
;

--2. List employees who were hired in 1986.
select e.emp_no AS "Employee #", e.last_name as "Last Name", e.first_name as "First Name"
from employees e
where date_part('year', e.hire_date)=1986
;

--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates.
select dm.dept_no AS "Dept #", d.dept_name AS "Dept Name", dm.emp_no as "Employee Number", 
		e.last_name AS "Last Name", e.first_name as "First Name",
	   de.from_date AS "From ", de.to_date AS "To"
from dept_manager dm
join departments d on d.dept_no = dm.dept_no
join employees e on e.emp_no = dm.emp_no
join dept_emp de on de.emp_no = e.emp_no
order by d.dept_no asc 
;

--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
select e.emp_no AS "Emp #", e.last_name AS "Last Name",  e.first_name AS "First Name",
	  d.dept_name
from employees e
join dept_emp de on de.emp_no = e.emp_no
join departments d on d.dept_no = de.dept_no
order by "Emp #" asc
;

--5. List all employees whose first name is "Hercules" and last names begin with "B."
select e.emp_no AS "Emp #", e.gender as "Gender", e.first_name AS "First Name", e.last_name AS "Last Name"  
from employees e
where e.first_name = 'Hercules'
and e.last_name like 'B%'
;

--6. List all employees in the Sales department, including their 
--employee number, last name, first name, and department name.
select e.emp_no AS "Emp #", e.first_name AS "First Name", 
		e.last_name AS "Last Name", d.dept_name AS "Dept. Name"
from employees e
join dept_emp de on de.emp_no = e.emp_no
join departments d on d.dept_no = de.dept_no
where d.dept_name = 'Sales'
;

--7. List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
select e.emp_no AS "Emp #", e.first_name AS "First Name", 
		e.last_name AS "Last Name", d.dept_name AS "Dept. Name"
from employees e
join dept_emp de on de.emp_no = e.emp_no
join departments d on d.dept_no = de.dept_no
where d.dept_name = 'Sales' 
or d.dept_name = 'Development'
;

--8. In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
select last_name, count(last_name) AS "Frequency" 
from employees
group by last_name
order by "Frequency" desc
;



