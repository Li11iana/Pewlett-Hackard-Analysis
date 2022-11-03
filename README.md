# Pewlett-Hackard-Analysis
## Overview
For this challenge the company Pewlett-Hackard is facing a growing number of employees approaching retirement age. If measures are not taken in advance it could leave the company unprepared to face the challenges ahead. This project aims to utilize the data from the company database using SQL and provide the information needed to prepare for the upcoming transition in staff.

Through SQL a employee information database was generated, the data was analyzed and condensed to provides management about the retiring employeees as well as identifying mentorship candidates from the remaining personnel. The report aims to lead the company's strategic planning in the face of significant structural change.

### Objective
Using PostgreSQL & pgAdmin generate a unified database for all company employee information and obtain from said database information about the number of retiring employees as well as the number of employees eligible for mentorship.

## Results
Company employee information in Excel files was analyzed to establish how the data related between files using Quick Database Diagrams (QuickDBD) as shown in the next Image:

![Retiring_employees_count](https://github.com/Li11iana/Pewlett-Hackard-Analysis/blob/main/Analysis/Retiring_employees_count.png))

Based on that diagram the database on PostgreSQL was generated. From there the following queries and report tables were created to address  retiring personnel concerns.

### The Number of Retiring Employees by Title

Gathering the relevant information from the original Excel files and using the client's criteria information about all current employees born between 1952 and 1955 was compiled into a single table. The table name 'Retiring_employees' was curated so that only the most recent position for each employee would be displayed.
A sample of said table can be seen below, followed by the major findings:

* The table was inicially created using the employee number, first name, and last name from the 'Employees' table, while the title, start date ('from_date') and position end date ('to_date') from the 'Titles' table. This was accomplished with an inner join on the 'employee number' column and filtering so that only those born between 1952 and 1955 where included. However further tunning was requiered since one same person that held multiple position in the company would generate multiple rows of information as well as those who are no longer in the company. The complete file can be found here [Retirement_Titles_Table](https://github.com/Li11iana/Pewlett-Hackard-Analysis/blob/main/Analysis/retirement_titles.csv).
* To solve the concerns expressed previously a second table was generated using the DISTINCT ON statement to obtain only one row per employee number and contraining the data so  only to the current position information would be collected (to_date = 9999-01-01). The file was named unique_titles and  file can be found here [Unique_Titles_Table](https://github.com/Li11iana/Pewlett-Hackard-Analysis/blob/main/Analysis/unique_titles.csv).
* Finally to summarize finding the unique_titles table was groupped by the position title and saved as a new table 'Retiring_titles'. As can be seen below, a total of 72,458 employees from the personnel near retirement age. From that total 2 hold high management positions as Managers which require a more complex succession plan. Futhermore, the majority of the retirees (25,916 employees) currently work as Senior Engineers, or as Senior Staff members (24,926 employees).

![Retiring_employees_by_title.png](https://github.com/Li11iana/Pewlett-Hackard-Analysis/blob/main/Analysis/Retiring_employees_by_title.png)


### The Employees Eligible for the Mentorship Program

A mentorship program is being established by Pewlett-Hackard to help fill the vast number of job opennings that the company is expecting. Selection criteria for said program are age, specifically the employees born between January 1, 1965 and December 31, 1965; secondly, the mentee must be currently employed at the company. In this section of the project a comprehensive list of employees eligible for the mentorship program will be generated from the database as described below:

* The table was created from three different excel files using multiple inner joins, the employee number, *first name*, *last name*, and *birthday* from the 'Employees' table; the columns *start date* ('from_date') and *position end date* ('to_date') from the 'Department Employee' table and finally the column *title* from the 'Title' table. Just as in the previous section the join was made using employee number as the primary key.
* The method DISTIC on used on the employee number ensured that records would not be duplicated and use the contraint WHERE to filter only employess that were currently working at Pewlett-Hackard (to_date = '9999-01-01') we assure that only relevent entries will be collected in the ['Mentorship_eligibility'](https://github.com/Li11iana/Pewlett-Hackard-Analysis/blob/main/Analysis/mentorship_eligibilty.csv) table.
* As shown on the table below the majority of the mentorship eligible employees are currently working in the position of 'Senior Staff' (290,009 employees), 'Senior Engineer' (278,953 employees), followed c

![mentorship_eligibilty_by_title.png](https://github.com/Li11iana/Pewlett-Hackard-Analysis/blob/main/Analysis/mentorship_eligibilty_by_title.png)

Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.
Retrieve the from_date and to_date columns from the Department Employee table.
Retrieve the title column from the Titles table.
Use a DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
Create a new table using the INTO clause.
Join the Employees and the Department Employee tables on the primary key.
Join the Employees and the Titles tables on the primary key.
Filter the data on the to_date column to all the current employees, then filter the data on the birth_date columns to get all the employees whose birth dates are between January 1, 1965 and December 31, 1965.


## Analysis

How many roles will need to be filled as the "silver tsunami" begins to make an impact?

![Retiring_employees_count.png](https://github.com/Li11iana/Pewlett-Hackard-Analysis/blob/main/Analysis/Retiring_employees_count.png)

Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees


![mentorship_employee_count.png](https://github.com/Li11iana/Pewlett-Hackard-Analysis/blob/main/Analysis/mentorship_employee_count.png)
