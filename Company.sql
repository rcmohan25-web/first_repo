
create database COMPANYDB;
use COMPANYDB;

create table department(
DNAME varchar(20),
DNUMBER int primary key,
MGRSSN varchar(20),
MGRSTARTDATE date
);

create table EMPLOYEE(
FNAME VARCHAR(20),
MINIT char(1),
LNAME VARCHAR(20),
SSN VARCHAR(15) primary key,
BDATE date,
ADDRESS varchar(100),
SEX char(1),
SALARY int,
SUPERSSN varchar(15),
DNO int,
foreign key (DNO) references DEPARTMENT(DNUMBER)
);
INSERT INTO DEPARTMENT (DNAME, DNUMBER, MGRSSN, MGRSTARTDATE) VALUES
('HR', 1, NULL, '2022-01-01'),
('IT', 2, NULL, '2022-02-01'),
('Finance', 3, NULL, '2022-03-01'),
('Marketing', 4, NULL, '2022-04-01'),
('Sales', 5, NULL, '2022-05-01'),
('Production', 6, NULL, '2022-06-01'),
('Admin', 7, NULL, '2022-07-01'),
('Research', 8, NULL, '2022-08-01'),
('Support', 9, NULL, '2022-09-01'),
('Logistics', 10, NULL, '2022-10-01');
INSERT INTO EMPLOYEE 
(FNAME, MINIT, LNAME, SSN, BDATE, ADDRESS, SEX, SALARY, SUPERSSN, DNO)
VALUES
('John', 'A', 'Smith', 'E001', '1990-05-10', 'New York', 'M', 50000, NULL, 1),
('Sarah', 'B', 'Johnson', 'E002', '1988-03-12', 'Chicago', 'F', 60000, 'E001', 2),
('Michael', 'C', 'Brown', 'E003', '1992-07-19', 'Texas', 'M', 55000, 'E001', 3),
('Emily', 'D', 'Davis', 'E004', '1995-01-25', 'Florida', 'F', 52000, 'E002', 4),
('David', 'E', 'Wilson', 'E005', '1987-09-14', 'Nevada', 'M', 70000, 'E002', 5),
('Jessica', 'F', 'Taylor', 'E006', '1993-11-30', 'Ohio', 'F', 48000, 'E003', 6),
('Daniel', 'G', 'Anderson', 'E007', '1991-04-18', 'Arizona', 'M', 53000, 'E003', 7),
('Laura', 'H', 'Thomas', 'E008', '1989-08-21', 'Boston', 'F', 61000, 'E004', 8),
('James', 'I', 'Moore', 'E009', '1994-12-05', 'Seattle', 'M', 45000, 'E005', 9),
('Sophia', 'J', 'Martin', 'E010', '1996-06-15', 'Denver', 'F', 47000, 'E006', 10);

select * from DEPARTMENT;
select * from EMPLOYEE;
#q1 10% salary raise for reserach department
select E.FNAME, E.LNAME, E.SALARy * 1.1 as increased_salary
from EMPLOYEE E
JOIN DEPARTMENT D ON E.DNO = D.DNUMBER
WHERE D.DNAME = 'Research';
#q2 salary stasticstics of account department
# sum, max, min avg for department administration
SELECT E.FNAME, E.LNAME, E.SALARY 
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DNO = D.DNUMBER
WHERE D.DNAME = 'Support';

select sum(E.SALARY) AS total,
max(E.SALARY) AS max,
min(E.SALARY) AS min,
avg(E.SALARY) AS average
from EMPLOYEE E
JOIN DEPARTMENT D ON E.DNO = D.DNUMBER
WHERE D.DNAME = 'Finance';
#q3 employee controlled by department no 5
SELECT EMPLOYEE.FNAME, EMPLOYEE.LNAME
FROM EMPLOYEE
JOIN DEPARTMENT 
ON EMPLOYEE.DNO = DEPARTMENT.DNUMBER
WHERE DEPARTMENT.DNUMBER = 5;
select E.FNAME, E.LNAME FROM EMPLOYEE E
where E.DNO = 5;
#q4 Department having at least 2 employees
SELECT D.DNAME, COUNT(*) AS EMP_COUNT
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DNO =D.DNUMBER
GROUP BY D.DNUMBER, D.DNAME
HAVING COUNT(*) >= 2;

#q5 employees born in 1990's
SELECT FNAME, LNAME, BDATE
FROM EMPLOYEE
WHERE BDATE BETWEEN '1990-01-01' AND '1999-12-31';



