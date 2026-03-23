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

