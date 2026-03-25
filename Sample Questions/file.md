Create 3 tables in Company Database

```sql
CREATE DATABASE company_db;
USE company_db;

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    hire_date DATE
);

INSERT INTO Employees VALUES
(1, 'Rahim', 'HR', 30000, '2022-01-10'),
(2, 'Karim', 'IT', 50000, '2021-06-15'),
(3, 'Sumon', 'IT', 45000, '2023-03-20'),
(4, 'Jamal', 'Finance', 40000, '2020-11-05'),
(5, 'Nabila', 'HR', 35000, '2022-07-25'),
(6, 'Tania', 'Finance', 48000, '2021-09-10');

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO Departments VALUES
(1, 'HR', 'Dhaka'),
(2, 'IT', 'Chittagong'),
(3, 'Finance', 'Khulna');

CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    emp_id INT,
    project_name VARCHAR(50),
    budget INT
);

INSERT INTO Projects VALUES
(101, 2, 'Website Development', 100000),
(102, 3, 'Mobile App', 80000),
(103, 2, 'AI System', 120000),
(104, 4, 'Audit System', 60000),
(105, 6, 'Finance Tracker', 70000);

--- Beginner Level Questions 
/*Show all employees.
Show only employee names and salaries.
Find employees who work in the IT department.
Find employees with salary greater than 40,000.
Sort employees by salary (highest to lowest). */

--- 1. Show all employees.
SELECT * FROM employees;
--- 2. Show only employee names and salaries.
SELECT name, salary 
FROM employees;
--- 3. Find employees who work in the IT department.
SELECT * 
FROM employees 
WHERE department = 'IT';
--- 4. Find employees with salary greater than 40,000.
SELECT * 
FROM employees 
WHERE salary > 40000;

--- 5. Sort employees by salary (highest to lowest)
SELECT *
FROM employees
ORDER BY salary DESC; 


/* 🟡 Intermediate Level
Count total number of employees.
Find average salary of employees.
Find highest and lowest salary.
Show employees hired after 2022.
Count employees in each department.
Find total salary paid in each department. */

--- 6. Count total number of employees
SELECT COUNT(name) AS number_of_employess
FROM employees; 

--- 7. Find average salary of employees.
SELECT AVG(salary) AS Average_salary
FROM employees
ORDER BY AVG(salary); 

--- 8. Find highest and lowest salary.
SELECT 
    MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary
FROM Employees;

--- 9. Show employees hired after 2022.
SELECT *
FROM Employees
WHERE hire_date > '2022-12-31';

--- 10. Count employees in each department.
SELECT 
    department,
    COUNT(*) AS total_employees
FROM Employees
GROUP BY department;




```




