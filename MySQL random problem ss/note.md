✍🏼 Question: Consider P1(a, c) and P2(b, d) to be two points on a 2D plane where (a, b) are the respective minimum and maximum values of Northern Latitude (LAT_N) and (c, d) are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION. <br>
→ Query the Euclidean Distance between points P1 and P2 and format your answer to display 4 decimal digits.

## Code
```sql
SELECT ROUND(
    SQRT(POWER(MAX(LAT_N) - MIN(LAT_N), 2) + POWER(MAX(LONG_W) - MIN(LONG_W), 2)),
    4
)
FROM STATION;
```

✍🏼 Question:



### Code
```sql
SELECT ROUND(
    ABS(MIN(LAT_N) - MAX(LAT_N)) +
    ABS(MIN(LONG_W) - MAX(LONG_W)),
    4
)
FROM STATION;
```



✍🏼 Question: A median is defined as a number separating the higher half of a data set from the lower half. Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places.

## Code
```sql
SELECT ROUND(AVG(LAT_N), 4)
FROM (
    SELECT LAT_N, 
           ROW_NUMBER() OVER (ORDER BY LAT_N) AS rn,
           COUNT(*) OVER () AS total
    FROM STATION
) AS t
WHERE rn IN (FLOOR((total + 1)/2), FLOOR((total + 2)/2));
```


Explanation: <br>
# 📊 Median of Northern Latitudes (LAT_N)

## 🔍 Step-by-Step Explanation

### 1. Inner Query

```sql
SELECT LAT_N, 
       ROW_NUMBER() OVER (ORDER BY LAT_N) AS rn,
       COUNT(*) OVER () AS total
FROM STATION
```

* `ROW_NUMBER() OVER (ORDER BY LAT_N)`
  → Assigns a position (`rn`) to each row after sorting `LAT_N` in ascending order.

* `COUNT(*) OVER ()`
  → Returns the **total number of rows** for every row.

📌 Example:

| LAT_N | rn | total |
| ----- | -- | ----- |
| 10    | 1  | 5     |
| 20    | 2  | 5     |
| 30    | 3  | 5     |
| 40    | 4  | 5     |
| 50    | 5  | 5     |

---

### 2. Finding Median Position

```sql
WHERE rn IN (FLOOR((total + 1)/2), FLOOR((total + 2)/2))
```

This handles both cases:

#### ✅ Odd number of rows:

* Example: total = 5
* Median index = 3
* Formula gives: (3, 3) → selects one value

#### ✅ Even number of rows:

* Example: total = 6
* Median indices = 3 and 4
* Formula gives: (3, 4) → selects two values

---

### 3. Final Step

```sql
SELECT ROUND(AVG(LAT_N), 4)
```

* `AVG()` → calculates median

  * One value (odd case) → returns that value
  * Two values (even case) → returns average
* `ROUND(..., 4)` → formats result to 4 decimal places

---

## 🎯 Key Idea

* Sort the data
* Find middle position(s)
* Use `AVG()` to compute median
* Use `ROUND()` for formatting

---

## ✅ Summary

| Case       | Rows Selected | Result       |
| ---------- | ------------- | ------------ |
| Odd count  | 1 row         | Middle value |
| Even count | 2 rows        | Average      |

---




🧑‍💻Question: Given the CITY and COUNTRY tables, find the total population of all cities that are located in the continent 'Asia'. The CITY.CountryCode and COUNTRY.Code columns are matching keys used to join the tables. <br>
Solve:
```sql
SELECT SUM(CITY.POPULATION)
FROM CITY
JOIN COUNTRY
ON CITY.CountryCode = COUNTRY.Code
WHERE COUNTRY.CONTINENT = 'Asia';
```

🧑‍💻Question: Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

Solve: 
```sql
SELECT COUNTRY.Continent, FLOOR(AVG(CITY.Population))
FROM CITY
JOIN COUNTRY
ON CITY.CountryCode = COUNTRY.Code
GROUP BY COUNTRY.Continent;
```

Note: The SQL FLOOR() function is a mathematical function that rounds a given numeric value down to the nearest integer that is less than or equal to the input value. It effectively removes the decimal portion for positive numbers, but rounds further away from zero for negative numbers. <br>
Example:  SELECT FLOOR(123.45); Output: 123	 Here, 123 is the largest integer less than or equal to 123.45. <br>
SELECT FLOOR(11.99); Output: 11, Here, 11 is the largest integer less than or equal to 11.99. <br>
Negative Decimal, 	SELECT FLOOR(-123.45); Output: 	-124. here,	-124 is the largest integer less than or equal to -123.45. <br>
SELECT FLOOR(-5.1);	Outpot: -6, here,	-6 is the largest integer less than or equal to -5.1.



✍🏼Question: You are given two tables: Students and Grades. Students contains three columns ID, Name and Marks. Grades contains the following data: Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. Ketty doesn't want the NAMES of those students who received a grade lower than 8. The report must be in descending order by grade -- i.e. higher grades are entered first. If there is more than one student with the same grade (8-10) assigned to them, order those particular students by their name alphabetically. Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order. If there is more than one student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order. Write a query to help Eve.

Solution:
```sql
SELECT 
    CASE 
        WHEN G.Grade < 8 THEN NULL
        ELSE S.Name
    END AS Name,
    G.Grade,
    S.Marks
FROM Students S
JOIN Grades G
ON S.Marks BETWEEN G.Min_Mark AND G.Max_Mark
ORDER BY 
    G.Grade DESC,
    CASE 
        WHEN G.Grade >= 8 THEN S.Name
    END ASC,
    CASE 
        WHEN G.Grade < 8 THEN S.Marks
    END ASC;
```

Note:
The SQL CASE WHEN statement is a conditional expression that allows you to implement if/then/else logic within your queries. It evaluates conditions sequentially and returns a value as soon as the first condition is met, functioning similarly to switch statements in other programming languages

Example:
```sql
SELECT
    ProductName,
    Price,
    CASE
        WHEN Price < 20 THEN 'Low Cost'
        WHEN Price BETWEEN 20 AND 50 THEN 'Medium Cost'
        ELSE 'High Cost'
    END AS PriceCategory
FROM
    Products;
```



✍🏼Problem: Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge. Order your output in descending order by the total number of challenges in which the hacker earned a full score. If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.

Solve: 
```sql
SELECT 
    H.hacker_id,
    H.name
FROM Hackers H
JOIN Submissions S 
    ON H.hacker_id = S.hacker_id
JOIN Challenges C 
    ON S.challenge_id = C.challenge_id
JOIN Difficulty D 
    ON C.difficulty_level = D.difficulty_level
WHERE S.score = D.score
GROUP BY H.hacker_id, H.name
HAVING COUNT(DISTINCT S.challenge_id) > 1
ORDER BY 
    COUNT(DISTINCT S.challenge_id) DESC,
    H.hacker_id ASC;
```
Problem link: https://www.hackerrank.com/challenges/full-score/problem?isFullScreen=false











