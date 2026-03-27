Both are basically window function~ Read the Window function note  [Click Here](https://github.com/sushantoroy-stat/MySQL_problem_solving/blob/main/Notes/aggregateANDwindowFunctions.pdf)



RANK() and DENSE_RANK() are SQL window functions that rank rows within a partition, handling ties (identical values) similarly by giving them the same rank. <br>
The core difference is that RANK() skips numbers after a tie (e.g., 1, 2, 2, 4), while DENSE_RANK() provides consecutive, uninterrupted ranks (e.g., 1, 2, 2, 3)
