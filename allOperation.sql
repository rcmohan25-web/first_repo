show databases;
drop database allOperation;
CREATE DATABASE IF NOT EXISTS allOperation;
USE allOperation;


DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Persons;

CREATE TABLE Persons (
    PersonID INT NOT NULL AUTO_INCREMENT,
    LastName VARCHAR(255),
    FirstName VARCHAR(255),
    gender ENUM('Male','Female','Other'),
    date_of_birth DATE,
    Address VARCHAR(255),
    City VARCHAR(255),
    PostCode VARCHAR(255),
    Country VARCHAR(255),
    email VARCHAR(255),
    PRIMARY KEY (PersonID)
);

-- INSERT DATA
INSERT INTO Persons(LastName,FirstName,gender,date_of_birth,Address,City,PostCode,Country,email) VALUES
('Sharma','Hari','Male','2002-02-10','Kathmandu Nepal','Ktm','2250','Nepal','hari@gmail.com'),
('Bisural','Srijan','Male','2003-03-10','Dhading','Ktm','2135','Nepal','srijan@gmail.com'),
('KC','Srijana','Female','2005-10-20','Chaurjahari-10','Dang','2134','Nepal','srijana@gmail.com'),
('Karki','Ritu','Female','1999-11-23','Sauraha','NPJ','6035','Nepal','ritu@gmail.com');

-- CREATE ORDERS TABLE
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    PersonID INT,
    Course VARCHAR(100),
    Amount INT,
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);


-- INSERT INTO ORDERS

INSERT INTO Orders(PersonID, Course, Amount) VALUES
(1,'IELTS',15000),
(2,'PTE',18000),
(1,'Visa Service',25000),
(3,'Counselling',5000);


-- SELECT ALL

SELECT * FROM Persons;
SELECT * FROM Orders;


-- WHERE OPERATORS

SELECT * FROM Persons WHERE City='Ktm';
SELECT * FROM Persons WHERE PersonID > 2;
SELECT * FROM Persons WHERE gender!='Male';


-- LOGICAL OPERATORS

SELECT * FROM Persons WHERE City='Ktm' AND gender='Male';
SELECT * FROM Persons WHERE City='Ktm' OR City='Dang';
SELECT * FROM Persons WHERE NOT City='Ktm';


-- LIKE OPERATOR

SELECT * FROM Persons WHERE FirstName LIKE 'S%';
SELECT * FROM Persons WHERE LastName LIKE '%a';


-- BETWEEN

SELECT * FROM Persons WHERE PersonID BETWEEN 1 AND 3;


SELECT * FROM Persons WHERE City IN ('Ktm','Dang');


SELECT * FROM Persons ORDER BY FirstName ASC;
SELECT * FROM Persons ORDER BY PersonID DESC;


SELECT COUNT(*) FROM Persons;
SELECT MAX(PersonID) FROM Persons;
SELECT MIN(PersonID) FROM Persons;


UPDATE Persons
SET City='Pokhara'
WHERE PersonID=1;


DELETE FROM Persons
WHERE PersonID=4;


SELECT Persons.FirstName, Orders.Course, Orders.Amount
FROM Persons
INNER JOIN Orders
ON Persons.PersonID = Orders.PersonID;


SELECT Persons.FirstName, Orders.Course
FROM Persons
LEFT JOIN Orders
ON Persons.PersonID = Orders.PersonID;


SELECT Persons.FirstName, Orders.Course
FROM Persons
RIGHT JOIN Orders
ON Persons.PersonID = Orders.PersonID;


SELECT Persons.FirstName, Orders.Course
FROM Persons
LEFT JOIN Orders ON Persons.PersonID = Orders.PersonID

UNION

SELECT Persons.FirstName, Orders.Course
FROM Persons
RIGHT JOIN Orders ON Persons.PersonID = Orders.PersonID;


SELECT City, COUNT(*) 
FROM Persons
GROUP BY City;


SELECT City, COUNT(*) 
FROM Persons
GROUP BY City
HAVING COUNT(*) > 1;


SELECT * FROM Persons
WHERE FirstName LIKE '%ri%';

