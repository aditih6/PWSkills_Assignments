CREATE DATABASE TEMP1;

CREATE DATABASE TEMP2;

CREATE DATABASE COLLEGE;
CREATE DATABASE IF NOT EXISTS COLLEGE;


DROP DATABASE  IF EXISTS TEMP1;
DROP DATABASE TEMP2;

USE COLLEGE;

CREATE TABLE student (
id INT PRIMARY KEY,
name VARCHAR(50),
age INT NOT NULL
);

INSERT INTO student VALUES(1, "ADITI", 24);
INSERT INTO student VALUES(2, "JOE", 30);

SELECT * FROM student;

SHOW DATABASES;

SHOW TABLES;

DROP TABLE student;

CREATE TABLE student (
rollno INT PRIMARY KEY,
name VARCHAR(50)
);


USE COLLEGE;

 


INSERT INTO Employees (EmployeeID, Name, Department, Salary) VALUES
(1, 'Alice', 'HR', 50000),
(2, 'Bob', 'HR', 60000),
(3, 'Charlie', 'IT', 70000),
(4, 'David', 'IT', 90000),
(5, 'Eve', 'Finance', 55000),
(6, 'Frank', 'Finance', 75000),
(7, 'Grace', 'IT', 65000),
(8, 'Helen', 'HR', 52000);


WITH AvgSalary AS (
    SELECT Department, AVG(Salary) AS Avg_Salary
    FROM Employees
    GROUP BY Department
)
SELECT e.Name, e.Department, e.Salary, a.Avg_Salary
FROM Employees e
JOIN AvgSalary a ON e.Department = a.Department
WHERE e.Salary > a.Avg_Salary
ORDER BY e.Department;






