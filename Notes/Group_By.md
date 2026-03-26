## ✍🏼 What is GROUP BY?
Answer: GROUP BY is an SQL clause used to group rows that have the same values in one or more columns into summary rows.

It is usually used with aggregate functions like:
```sql
COUNT()
SUM()
AVG()
MAX()
MIN()
```
## ✍🏼Why do we use GROUP BY?
We use GROUP BY to:

* Summarize data
* Perform calculations on groups <br>
* Get insights (like totals, averages per category) <br>
→ Without GROUP BY, aggregate functions work on the whole table <br>
→ With GROUP BY, they work on each group separately <br>

## ⏰ When to Use GROUP BY?

Use GROUP BY when:

- You want category-wise analysis
- You need summary statistics per group
- You are working with reports or dashboards

📌 Examples:
- Total salary per department
- Number of students per class
- Average marks per subject

## ✍🏼Necessity of GROUP BY
- Data Summarization
→ Helps reduce large data into meaningful insights
- Decision Making
→ Used in business reports (e.g., department performance)
- Essential for Analytics
→ Core concept in data science, SQL interviews, dashboards
- Works with Aggregation
→ Without it, you cannot break down aggregate results by category



## ✍🏼Example with code
Problem: Count employees in each department
```sql
SELECT department, COUNT(*) AS total_employees
FROM Employees
GROUP BY department;
```
| Department | Total Employees |
| ---------- | --------------- |
| HR         | 2               |
| IT         | 2               |
| Finance    | 2               |


Example 2: Average salary per department
```sql
SELECT department, AVG(salary) AS avg_salary
FROM Employees
GROUP BY department;
```
Example 3: Total salary per department
```sql
SELECT department, SUM(salary) AS total_salary
FROM Employees
GROUP BY department;
```

## ⚠️ Keep Alert to evade wrong 

Every column in the SELECT must be:
- Either included in GROUP BY, OR
- Used with an aggregate function (COUNT, SUM, AVG, MAX, MIN)
take a look on the wrong query
```sql
SELECT name, department, COUNT(*)
FROM Employees
GROUP BY department;
```
this query is wrong because 
here we grouping by department but also selecting name.
