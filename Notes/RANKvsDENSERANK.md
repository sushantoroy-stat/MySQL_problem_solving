Both are basically window function~ Read the Window function note  [Click Here](https://github.com/sushantoroy-stat/MySQL_problem_solving/blob/main/Notes/aggregateANDwindowFunctions.pdf)



RANK() and DENSE_RANK() are SQL window functions that rank rows within a partition, handling ties (identical values) similarly by giving them the same rank. <br>
The core difference is that RANK() skips numbers after a tie (e.g., 1, 2, 2, 4), while DENSE_RANK() provides consecutive, uninterrupted ranks (e.g., 1, 2, 2, 3)

Example Scenarios
Imagine a table of exam scores: 100, 95, 95, 90.
- RANK(): <br>
100 → 1 <br>
95 → 2 <br>
95 → 2 <br>
90 → 4 (skips 3 because two people tied for 2nd)
- DENSE_RANK(): <br>
100 → 1 <br>
95 → 2 <br>
95 → 2 <br>
90 → 3 (continues consecutively) 

## 🖥️ When to Use Which
- RANK(): Use when ties mean the next rank should be skipped, such as in Olympic medal positions, where a tie for 1st means there is no 2nd place, only a 3rd place.
- DENSE_RANK(): Use when you need a continuous ranking regardless of ties, such as a Top 10 list where you want to include all unique values.

Both functions use the same syntax: FUNCTION() OVER (PARTITION BY ... ORDER BY ...)


## Example
```sql
SELECT 
    Name, 
    Salary,
    RANK() OVER (ORDER BY Salary DESC) AS Rank_Result,
    DENSE_RANK() OVER (ORDER BY Salary DESC) AS Dense_Rank_Result
FROM Employees;
```
Output:
| Employee Name | Salary | RANK_Result | DENSE_RANK_Result | Note                              |
| ------------- | ------ | ----------- | ----------------- | --------------------------------- |
| Shafiq        | 5000   | 1           | 1                 | Highest Salary                    |
| Jonny         | 4000   | 2           | 2                 | Tied for 2nd                      |
| Mita          | 4000   | 2           | 2                 | Tied for 2nd                      |
| Arif          | 3500   | 4           | 3                 | RANK skips 3; DENSE_RANK does not |
| Saju          | 3000   | 5           | 4                 | Next consecutive rank             |


