create database TechSolutionDB;
use techSolutionDB;
create table if not exists Department(
DeptID INT Primary key,
DeptName VARCHAR(100) NOT NULL,
Location VARCHAR(100)
);

CREATE TABLE Employee (
EmpID INT Primary key,
FirstName VARCHAR(100),
LastName VARCHAR(100),
Gender VARCHAR(50),
Salary DECIMAL(10, 2),
HireDate DATE,
DeptID INT,
 Foreign key(DeptID) references Department(DeptID)
);

CREATE TABLE  Project (
ProjectID INT Primary key,
ProjectName VARCHAR(100),
StartDate DATE,
EndDate DATE,
Budget DECIMAL(15,2)
);

CREATE TABLE Works_On (
EmpID INT,
ProjectID INT,
HoursWorked INT,
Primary key(EmpID, ProjectID),
Foreign key(EmpID) references Employee(EmpID),
Foreign key(ProjectID) references Project(ProjectID)
);

INSERT INTO Department (DeptID, DeptName, Location)
VALUES
(1, 'IT', 'Kathmandu'),
(2, 'HR', 'Pokhara'),
(3, 'Finance', 'Lalitpur'),
(4, 'Marketing', 'Bhaktapur');

INSERT INTO Employee (EmpID, FirstName, LastName, Gender, Salary, HireDate, DeptID)
VALUES
(101, 'Ram', 'Sharma', 'Male', 50000, '2022-01-15', 1),
(102, 'Sita', 'Thapa', 'Female', 45000, '2021-03-20', 2),
(103, 'Hari', 'Khadka', 'Male', 60000, '2020-07-10', 1),
(104, 'Gita', 'Rai', 'Female', 55000, '2023-02-05', 3),
(105, 'Kiran', 'Gurung', 'Male', 48000, '2022-11-12', 4);

INSERT INTO Project (ProjectID, ProjectName, StartDate, EndDate, Budget)
VALUES
(201, 'Website Development', '2023-01-01', '2023-06-30', 200000),
(202, 'Mobile App', '2023-02-15', '2023-09-30', 300000),
(203, 'Database System', '2023-03-01', '2023-08-15', 150000),
(204, 'Cloud Migration', '2023-04-10', '2023-12-31', 400000);

INSERT INTO Works_On (EmpID, ProjectID, HoursWorked)
VALUES
(101, 201, 120),
(101, 203, 90),
(102, 201, 60),
(103, 202, 150),
(104, 203, 100),
(105, 204, 140);

UPDATE Employee
set salary = Salary + (Salary*0.10)
Where EmpID = 4;

DELETE FROM Works_On
WHERE ProjectID = 201;

DELETE FROM Project
where ProjectID = 201;


SELECT * 
FROM Employee
where 
Salary > 50000;

select FirstName, LastName, Salary
from Employee
Order by Salary DESC;

SELECT E.*
FROM Employee E
JOIN Department D ON E.DeptID = D.DeptID
WHERE D.DeptName = 'IT';

select D.DeptName, count(E.EmpID) as TotalEmployees
from Department D
left join Employee E on D.DeptID = E.DeptID
group by D.DeptName;

select *
from Employee
where HireDate > 2022-01-01;

select E.FirstName, E.LastName, D.DeptName
from Employee E
left join Department D on E.DeptID = D.DeptID;


SELECT E.EmpID, E.FirstName, E.LastName, P.ProjectName
FROM Employee E
JOIN Works_On W ON E.EmpID = W.EmpID
JOIN Project P ON W.ProjectID = P.ProjectID;

select P.ProjectName, SUM(W.HoursWorked) as TotalHours
from Project P
join Works_On W on P.ProjectID = W.ProjectID
group by P.projectName;

select D.DeptName, avg(E.Salary) as AvgSalary
from Employee E
join Department D on E.DeptID = D.DeptID
group by D.DeptName;

select D.DeptName, count(E.EmpID) as TotalEmployees
from Department D
join Employee E on D.DeptID = E.DeptID
group by D.DeptName
order by TotalEmployees desc
limit 1;

SELECT EmpID, FirstName, LastName, Salary
FROM Employee
WHERE Salary > (SELECT AVG(Salary) FROM Employee);

create view HighSalaryEmployees as
select EmpId, FirstName, LastName, Salary, DeptID
from Employee
where Salary > 60000;
select * 
from HighSalaryEmployees;

create index idx_LastName
ON Employee (LastName);
SHOW INDEXES FROM Employee;









