-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (______) _____,
______,
______,
______

INTO nameyourtable
FROM _______
WHERE _______
ORDER BY _____, _____ DESC;


-- DELIVERABLE 1: The Number of Retiring Employees by Title

-- Create retirement_titles table with employees' numbers, name, last name and title for all those born between 1952 and 1955
SELECT	
	e.emp_no,
    e.first_name,
	e.last_name,
    ti.title,
    ti.from_date,
    ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON ((e.emp_no = ti.emp_no))
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no ASC;

--Check table created
SELECT * FROM retirement_titles;

--Create unique_titles table from retirement_titles with no duplicates and only with those currently working (to_date='9999-01-01')
--Organize results in ascending order by the employee number and descending order by the last date
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title 
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no ASC, to_date DESC;

--Check table created
SELECT * FROM unique_titles;

-- Retrieve the number of titles from the unique-titles table
SELECT COUNT(title) title
FROM unique_titles;

-- Create retiring titles table to hold the number of employees about to retire by their most recent job
-- Group the table by title, then sort the count column in descending order
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;

--Check table created
SELECT * FROM retiring_titles;

-- DELIVERABLE 2: The Employees Eligible for the Mentorship Program
-- Mentorship Eligibility QUERY
SELECT DISTINCT ON (e.emp_no)	
	e.emp_no, e.first_name, e.last_name, e.birth_date,
	de.from_date, de.to_date,
	ti.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no ASC;

-- Deliverable 3 Instructions
-- For this part of the Challenge, you’ll write a report to help the manager prepare for the upcoming "silver tsunami."

-- The analysis should contain the following:

-- Overview of the analysis: Explain the purpose of this analysis.
-- Results: Provide a bulleted list with four major points from the two analysis deliverables. Use images as support where needed.
-- Summary: Provide high-level responses to the following questions, then provide two additional queries or tables that may provide more insight into the upcoming "silver tsunami."
-- How many roles will need to be filled as the "silver tsunami" begins to make an impact?
-- Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
-- Deliverable 3 Requirements
-- Structure, Organization, and Formatting (6 points)
-- The written analysis has the following structure, organization, and formatting:

-- There is a title, and there are multiple sections. (2 pt)
-- Each section has a heading and subheading. (2 pt)
-- Links to images are working and displayed correctly. (2 pt)
-- Analysis (14 points)
-- The written analysis has the following:

-- Overview of the analysis:

-- The purpose of the new analysis is well defined. (3 pt)
-- Results:

-- There is a bulleted list with four major points from the two analysis deliverables. (6 pt)
-- Summary:

-- The summary addresses the two questions and contains two additional queries or tables that may provide more insight. (5 pt)
