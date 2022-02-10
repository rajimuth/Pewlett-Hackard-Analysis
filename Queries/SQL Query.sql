CREATE TABLE departments(
	dept_no VARCHAR(4) NOT NULL,
	dept_name VARCHAR(40) NOT NULL,
	PRIMARY KEY (dept_no),
	UNIQUE (dept_name)
);
CREATE TABLE Employees(
	emp_no INT NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	gender VARCHAR(4) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
);
CREATE TABLE Manager(
	dept_no VARCHAR(4) NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES department (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);
CREATE TABLE Dept_Emp(
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
	);

CREATE TABLE Salaries(
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);


CREATE TABLE Titles(
	emp_no INTEGER NOT NULL,
	title VARCHAR (20) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
	);

SELECT * FROM departments;
SELECT * FROM manager;
SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM titles;
SELECT * FROM salaries;

SELECT first_name , last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

SELECT first_name,last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

SELECT first_name,last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31;

SELECT first_name,last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31;

SELECT first_name,last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31;

SELECT first_name , last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT emp_no, first_name , last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info;


-- Selecting and viewing all the tables created 
SELECT * FROM departments;
SELECT * FROM manager;
SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM salaries;
SELECT * FROM titles;
SELECT * FROM retirement_info;

-- Using count to find the counts of columns in different tables

SELECT COUNT (dept_name) FROM departments;
SELECT COUNT (emp_no) FROM manager;
SELECT COUNT (emp_no) FROM retirement_info;
SELECT COUNT (first_name) FROM retirement_info;

-- 	INNER Joining departments and manager
SELECT  departments.dept_name, 
		manager.emp_no,
		manager.from_date,
		manager.to_date
INTO merge1		
FROM departments
INNER JOIN manager
ON departments.dept_no = manager.dept_no;

-- Checking counts to see how the counts of columns differe after joining- merge1 is the merged table
SELECT COUNT(dept_no) FROM departments;
SELECT COUNT (dept_name) FROM departments;
SELECT COUNT (salary) FROM salaries;
SELECT COUNT(title) FROM titles;
select count(emp_no) from merge1;
select count(emp_no) from manager;
select count(dept_name) from merge1;
select count(dept_name) from departments;

-- LEFT JOIN retirement_info and dept_emp
select  retirement_info.emp_no,
        retirement_info.first_name,
		retirement_info.last_name,
		dept_emp.to_date
INTO current_emp
FROM retirement_info
LEFT JOIN dept_emp
on retirement_info.emp_no=dept_emp.emp_no;

-- Selecting and viewing all the tables created 
SELECT * FROM departments;
SELECT * FROM manager;
SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM salaries;
SELECT * FROM titles;
SELECT * FROM retirement_info;

-- Using count to find the counts of columns in different tables

SELECT COUNT (dept_name) FROM departments;
SELECT COUNT (emp_no) FROM manager;
SELECT COUNT (emp_no) FROM retirement_info;
SELECT COUNT (first_name) FROM retirement_info;
-- 	INNER Joining departments and manager
SELECT  departments.dept_name, 
		manager.emp_no,
		manager.from_date,
		manager.to_date
INTO merge1		
FROM departments
INNER JOIN manager
ON departments.dept_no = manager.dept_no;

-- Checking counts to see how the counts of columns differe after joining- merge1 is the merged table
SELECT COUNT(dept_no) FROM departments;
SELECT COUNT (dept_name) FROM departments;
SELECT COUNT (salary) FROM salaries;
SELECT COUNT(title) FROM titles;
select count(emp_no) from merge1;
select count(emp_no) from manager;
select count(dept_name) from merge1;
select count(dept_name) from departments;

-- LEFT JOIN retirement_info and dept_emp
select retirement_info.first_name,
		retirement_info.last_name,
		dept_emp.to_date
INTO current_emp
FROM retirement_info
LEFT JOIN dept_emp
on retirement_info.emp_no=dept_emp.emp_no;
-- To write in shortcut
select  ri.emp_no,
	   ri.first_name,
		ri.last_name,
		de.to_date
INTO current_emp 		
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no=de.emp_no
WHERE de.to_date =('9999-01-01');

SELECT * FROM current_emp;
-- EMPLOYEE COUNT BY DEPARTMENT NUMBER
SELECT count(ce.emp_no),de.dept_no
INTO current_emp_dept
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no=de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;
SELECT * FROM current_emp_dept;



SELECT * FROM TODATE_emp_info;
SELECT COUNT(emp_no) FROM emp_info;

SELECT tei.emp_no,tei.first_name,tei.last_name,tei.gender, s.salary,s.to_date
FROM TODATE_emp_info as tei
INNER JOIN salaries as s
ON tei.emp_no = s.emp_no
ORDER BY to_date DESC;

-- ORDERING SALARY DATA BY TO-DATE IN DESCENDING ORDER
SELECT * FROM salaries
ORDER BY to_date DESC;
SELECT * FROM TODATE_emp_info;

-- list 1 :UP TO DATE LIST OF CURRRENT EMPLOYEES
-- Employee Information: TO DATE A list of employees containing their unique employee number, their last name, first name, gender, and salary,e.last_
-- MAKING 2 JOINTS AND WHERE STATMENT
SELECT e.emp_no,e.first_name,e.last_name,e.gender,s.salary,de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date ='9999-01-01');
select * from emp_info;

-- List 2: Management
-- This list includes the manager's employee number, first name, last name, and their starting and ending employment dates.
-- ERD DATA CONNECTION: MAN.EMP_NO,EMP.FIRST_NAME, EMP.LAST_NAME, DE.FROM_DATE, DE.TO_DATE
SELECT dm.dept_no,d.dept_name,dm.emp_no, ce.first_name, ce.last_name,dm.from_date, dm.to_date
INTO manager_info
FROM manager as dm
INNER JOIN current_emp as ce
ON (dm.emp_no = ce.emp_no)
INNER JOIN departments as d
ON (dm.dept_no = d.dept_no)
;

SELECT * FROM manager_info;

SELECT * FROM emp_info;
SELECT * FROM current_emp_dept;

-- LIST 3:DEPARTMENT RETIREES
SELECT ce.first_name, ce.last_name,de.emp_no,d.dept_name
FROM current_emp as ce
INNER JOIN dept_emp as de
ON de.emp_no = ce.emp_no
INNER JOIN departments as d
ON de.dept_no = d.dept_no;

-- SALES DEPT RETIREES
SELECT ce.first_name, ce.last_name,de.emp_no,d.dept_name
into sales_retirees
FROM current_emp as ce
INNER JOIN dept_emp as de
ON de.emp_no = ce.emp_no
INNER JOIN departments as d
ON de.dept_no = d.dept_no
where (d.dept_name = 'Sales');
select * from sales_retirees;
select count(first_name) FROM sales_retirees;

-- LIST FROM BOTH SALES AND DEVELOPMENT DEPARTMENT
SELECT ce.first_name, ce.last_name,de.emp_no,d.dept_name
into sal_dev_retirees
FROM current_emp as ce
INNER JOIN dept_emp as de
ON de.emp_no = ce.emp_no
INNER JOIN departments as d
ON de.dept_no = d.dept_no
where d.dept_name in ('Sales', 'Development');
select * from sal_dev_retirees;
select count(first_name) FROM sal_dev_retirees AS sale_dev_count;
