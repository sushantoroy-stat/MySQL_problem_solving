| JOIN Type  | Returns                  |
| ---------- | ------------------------ |
| INNER JOIN | Only matching rows       |
| LEFT JOIN  | All left + matched right |
| RIGHT JOIN | All right + matched left |
| FULL JOIN  | All from both            |
| CROSS JOIN | All combinations         |
| SELF JOIN  | Table joins itself       |


In MySQL, the JOIN clause is a fundamental operation used to combine rows from two or more tables based on a related column between them, such as a foreign key. This allows you to retrieve data distributed across multiple, normalized tables in a single, efficient query, which helps reduce data redundancy and improve data integrity. 

Key Concepts
- Purpose: The primary goal of a JOIN is to link data from related tables logically. For instance, joining Customers and Orders tables on a common CustomerID column can show which customers placed which orders.
- Syntax: Joins are typically used within a SELECT statement and include an ON or USING clause to specify the matching condition.
- Efficiency: Using a single JOIN query to retrieve data is generally more efficient than running multiple separate queries and combining the results in your application.

- Types of JOINs in MySQL
MySQL supports several types of joins, each serving a different data retrieval scenario: 
W3Schools
W3Schools
 +1
- INNER JOIN: Returns rows with matching values in both tables.
- LEFT JOIN: Returns all rows from the left table, with NULL for unmatched right table rows.
- RIGHT JOIN: Returns all rows from the right table, with NULL for unmatched left table rows.
- CROSS JOIN: Produces a Cartesian product (all combinations) of both tables.
- SELF JOIN: Joins a table to itself using aliases.
- FULL OUTER JOIN: Not natively supported, but can be simulated using a UNION of a LEFT JOIN and a RIGHT JOIN.

<img width="231" height="158" alt="image" src="https://github.com/user-attachments/assets/54c39b0c-7943-443d-a706-19c14ce73bf3" />
<img width="231" height="158" alt="image" src="https://github.com/user-attachments/assets/d34b75a9-a7f0-4482-9ba6-2d213a217fa2" />
<img width="231" height="158" alt="image" src="https://github.com/user-attachments/assets/d4f20c82-ce8c-4c95-bb36-ae7b5814e0f0" />
<img width="231" height="158" alt="image" src="https://github.com/user-attachments/assets/d672d3ab-3674-4080-a48c-19a7b2048095" />







