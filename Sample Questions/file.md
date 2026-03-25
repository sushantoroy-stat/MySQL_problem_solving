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
```




