# Pewlett-Hackard-Analysis
## Purpose of the analysis:
Pewlett-Hackard is a large company with several employees working in different departments. All the employee details such as employee number, names, gender,salaraies, titles, birth date, hiring date, postion held from and to date, salary from and to date Departments, departments managers are all managed in several excel sheets as CSV file. Several of the employees in the company are getting ready for retirement. The retirment ready employees were shortlisted based on their birth date and hiring date. The decision makers also want to have an idea about the various titles held by these potential retirement eligible employees. In addition, the initial analysis listed several employees eligible for retirement. As the company gets ready to hire new employees to fill this position, they are also faced with a challenge of training the newly hired employees. So the decision makers are also thinking about a Mentorship program with few of these retiring employees who can work part-time and also help in mentoring the newly hired employees.
## Resources:
The data for this analysis for retrieved from 6 CSV files found in the data folder. The files include: employees.csv, dept_emp csv, titles.csv, salary.csv, departments.csv, dept_managers.csv
POSTGRES 18.pgadmin4 was used for genrating database, table and queries.

## Initial Analysis:
- Initial analysis included shortlisting retirment ready employees from the pool of employees list by filtering based on birthdate and hiring date.
code.
- Later, the managers fron the list and their department was shortlisted
- The sales department executives wanted to know how may employees from list were from their department. 
-  List was also generated for employees from both sales and Developmnent departments.

## Current Analysis:
### Results
The first deliverable of the current analysis is to look at the list and  Number of Retiring Employees by Title 
Employees whose birth_date is BETWEEN '1952-01-01' AND '1955-12-31' was chosen for retirement

<img width="447" alt="image" src="https://user-images.githubusercontent.com/94877067/153531034-72be9200-9aa4-47b4-9408-f3ef8f14e76e.png">


The above list shows that few employees had  2 titles as they had titles changed over the years.
<img width="383" alt="image" src="https://user-images.githubusercontent.com/94877067/153530937-13a98d4f-d0d1-4d18-a337-0048ce79cc33.png">




So we want the list to have the recent title. This was accomplished by using the DISTINCT ON function that allows us to filter out data of employees with recent titles. The table was named as Unique_titles.


<img width="377" alt="image" src="https://user-images.githubusercontent.com/94877067/153530678-cc10142f-73c9-412e-8be4-ea498d6cfe38.png">


The table was as shown below 


<img width="281" alt="image" src="https://user-images.githubusercontent.com/94877067/153530751-8734eb85-6d44-4d86-8ecc-a4ad50df228f.png">


Total number of employees eligible here is 72458

- Hiredate should also have been a conditional factor to filter out this list. Hvaing hiredate between 1985-1988, reduced the employee count to 65,427.



The number of employees in each titles was then counted.


<img width="159" alt="image" src="https://user-images.githubusercontent.com/94877067/153530575-1f568f65-cf81-4efd-af98-d57748d27499.png">



The table was as shown below


<img width="127" alt="image" src="https://user-images.githubusercontent.com/94877067/153530529-dde5f681-f5b4-4b3d-ac6c-c3d35bb95301.png">


For the second deliverable, the number of employees who are eligible was shortlisted again from the list of employees but with the birthdate in the year of 1965.

<img width="676" alt="image" src="https://user-images.githubusercontent.com/94877067/153531755-f783c13f-47df-4a4a-85b7-d1454f1dceae.png">

## RESULTS and future analysis suggestions:
- Total number of employees eligible in unique_titles  are 72458

**To do -Hiredate should also have been a conditional factor to filter out this list. Having hiredate between 1985-1988, reduced the employee count to 65,427.**

- The retiring titles count also reflect on how many position needs to be filled when these employees retire.
- Grouping of the data by title also showed that there are only 2 managers who are retirment ready. But these two are filtered out with hire date there will not be any managers who will be retiring. 
- -Highest number of titles that will become vacant will be Senior Engineer and Senior staff. But there are less Engineer and staff who will be retiring, we can hope that many current staff and Engineer can transition in to seniorship role.

**- To do: But additional analysis needs to be done to find out the count of current employees who are staff and engineers.**
**- To do: We can also make the criteria stringent to have employees eleigible for retiring only from 1952 or 1952 and 1953.**

-With respect to mentorship eligibility list, the filtering was done for employees born in 1965. So the total count of employees in this list was only 1549.
When we group it by titles to see the total number of employees for each title, the table looked like below:

<img width="181" alt="image" src="https://user-images.githubusercontent.com/94877067/153534333-78575941-c5d8-4add-9aea-859928de24d5.png">
 
 **-To do: But I believe we need to select the birthdate from 1952-1955 like beofore as employees born in 1965 are too young to retire and we already have sevral retirement eligible employees from birth date 1952-1955. These employees also would have had more experience to be eligible for mentorship.**
 **- To do: Also it will be interesting to see the departments of these employees**


