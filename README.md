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

* The table was inicially created using the employee number, first name and last name from the 'Employees' table, while the title, start date ('from_date') and position end date ('to_date') frin tge 'Titles' table. This was accomplished with an inner join on the 'employee number' column and filtering so that only those born between 1952 and 1955 where included. However further tunning was requiered since one same person that held multiple position in the company would generate multiple rows of information as well as those who are no longer in the company. The complete file can be found here [Retirement_Titles_Table](https://github.com/Li11iana/Pewlett-Hackard-Analysis/blob/main/Analysis/retirement_titles.csv).
* To solve the concerns expressed previously a second table was generated using the DISTINCT ON statement to obtain only one row per employee number and contraining the data so  only to the current position information would be collected (to_date = 9999-01-01). The file was named unique_titles and  file can be found here [Unique_Titles_Table](https://github.com/Li11iana/Pewlett-Hackard-Analysis/blob/main/Analysis/unique_titles.csv).
* Finally to summarize finding the unique_titles table was groupped by the position title and saved as a new table 'Retiring_titles'. As can be seen below, a total of 72,458 employees from the personnel near retirement age. From that total 2 hold high management positions as Managers which require a more complex succession plan. Futhermore, the majority of the retirees (25,916 employees) currently work as Senior Engineers, or as Senior Staff members (24,926 employees).

![Retiring_employees_by_title.png](https://github.com/Li11iana/Pewlett-Hackard-Analysis/blob/main/Analysis/Retiring_employees_by_title.png)


### The Employees Eligible for the Mentorship Program

![mentorship_eligibilty_by_title.png](https://github.com/Li11iana/Pewlett-Hackard-Analysis/blob/main/Analysis/mentorship_eligibilty_by_title.png)
*
*
*



## Analysis

How many roles will need to be filled as the "silver tsunami" begins to make an impact?

![Retiring_employees_count.png](https://github.com/Li11iana/Pewlett-Hackard-Analysis/blob/main/Analysis/Retiring_employees_count.png)

Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees


![mentorship_employee_count.png](https://github.com/Li11iana/Pewlett-Hackard-Analysis/blob/main/Analysis/mentorship_employee_count.png)
