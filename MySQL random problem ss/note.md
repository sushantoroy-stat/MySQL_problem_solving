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
