show databases;

#1.	Create a database named dbemp and switch to it.
create database dbemp1;
use dbemp1;

#2.	Create an employee table with appropriate data 
#types and constraints for employee details.
drop table if exists employee;
CREATE TABLE employee (
    EmployeeID VARCHAR(10) PRIMARY KEY,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    Gender CHAR(1) CHECK (Gender IN ('M','F')),
    DateofBirth DATE NOT NULL,
    Designation VARCHAR(20),
    DepartmentName VARCHAR(20),
    ManagerId VARCHAR(10),
    JoinedDate DATE,
    Salary DECIMAL(10,0),
    FOREIGN KEY (ManagerId) REFERENCES employee(EmployeeID)
);

#3.	Insert at least two employee records into the employee table.
Insert into employee values
('2','Season','Maharjan','M','1996-04-02','Engineer',
'Software engineering',NULL,'2022-11-02','50000000');

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
#insert one more record in table
insert into employee values
('001','Mohan','Rokaya','M','1999-04-02','Supervision',
'branch supervisor',NULL,'2025-11-02','9000000');
insert into employee values
('5','Srijan','Sharma','F','2000-04-02','Manager',
'Software engineering',NULL,'2025-11-02','9000000');

--  update designation for a employee whose ID is 002.
-- "update employee set Salary = 2000 where EmployeeID = 1;
--  queries to get data from two or more table
--  select orders.orderID,
-- customers.customersID, orders.orderdate
-- from orders, customer where orders.customerID = customer>customerID;"
# update record in table
update employee
set LastName = 'Kc' where EmployeeID = 2;

