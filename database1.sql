#1.	Create a database named dbemp and switch to it.
create database dbemp1;
use dbemp1;

#2.	Create an employee table with appropriate data 
#types and constraints for employee details.
Create table employee (
	EmployeeID varchar(10),
    FirstName varchar(20),
    LastName varchar(20),
    Gender char(1),
    DateofBirth date,
    Designation varchar(20),
    DepartmentName varchar(20),
    ManagerId varchar(10),
    JoinedDate date,
    Salary decimal(10,0)
);
#3.	Insert at least two employee records into the employee table.
Insert into employee(
EmployeeID ,FirstName ,LastName ,Gender ,DateofBirth ,
Designation ,DepartmentName ,ManagerId ,JoinedDate ,Salary 
) values(
'002','Season','Manager','M','1996-04-02','Engineer',
'Software engineering','','2022-11-02','5000000000'
),(
'005','Srijana','Manager','F','2000-04-02','Manager',
'Software engineering','','2025-11-02','9000000');

select * from employee;
# 4.	Update the gender of an employee whose 
#EmployeeID is 003.
update  employee 
set Gender = 'M' 
where EmployeeID = '003';
#5.	Display the first name, current date,
#date of birth, and age of 
#employees who are older than 25 years.
select FirstName ,
CURDATE() as CurrentDate,DateofBirth,
timestampdiff(YEAR,DateofBirth,CURDATE()) as age
from employee where 
timestampdiff(YEAR,DateofBirth,CURDATE()) > 20;
#6.	Write a query to find the oldest employee
select * from employee 
where DateofBirth = 
(select Min(DateofBirth) from employee);
#7.	Write a query to find the Youngest employee
select * from employee 
where DateofBirth = 
(select Max(DateofBirth) from employee);
#8.	Display the maximum salary department-wise.
select DepartmentName, Max(Salary) as Maxsalary
from employee Group By DepartmentName;
#9.	Display the Min salary department-wise.
select DepartmentName, Min(Salary) as Minsalary
from employee Group By DepartmentName;
#10.	List the employees who act as managers .
select * from employee where
EmployeeID in (select ManagerID from employee);