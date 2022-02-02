Departments
-
dept_no varchar pk
dept_name varchar 

Dept_Emp
-
emp_no int pk
dept_no varchar fk - Departments.dept_no
from_date date
to_date date

Manager
-
dept_no varchar pk fk - Departments.dept_no
emp_no int pk fk - Employees.emp_no
from_date date
to_date date

Employees
-
emp_no pk int fk - Dept_Emp.emp_no
birth_date date
first_name varchar 
last_name varchar 
gender varchar 
hire_date date

Salaries
-
emp_no int pk fk - Employees.emp_no fk - Dept_Emp.emp_no fk - Titles.emp_no
salary int
from_date date
to_date date

Titles
-
emp_no int pk fk - Employees.emp_no
title varchar 
from_date date
to_date date
