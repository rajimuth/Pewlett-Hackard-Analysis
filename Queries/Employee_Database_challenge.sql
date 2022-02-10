SELECT e.emp_no,e.first_name,e.last_name,t.title,t.from_date,t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

select * from retirement_titles;

SELECT DISTINCT ON (emp_no)emp_no,first_name,last_name,title
INTO unique_titles
FROM retirement_titles 
WHERE to_date='9999-01-01'
ORDER BY emp_no ASC, to_date DESC;

SELECT * FROM unique_titles;

SELECT COUNT(emp_no)
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(emp_no)DESC;

SELECT * FROM retiring_titles;

-- DELIVERABLE 2 
-- MENTORSHIP ELIGIBILITY TABLE
SELECT DISTINCT ON (e.emp_no) e.emp_no,e.first_name,e.last_name, e.birth_date,de.from_date,de.to_date, t.title
INTO mentorship_eligibility
FROM employees as e
JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
left JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-1-1' AND '1965-12-31') AND (de.to_date='9999-01-01')
ORDER BY e.emp_no;

SELECT * FROM mentorship_eligibility;