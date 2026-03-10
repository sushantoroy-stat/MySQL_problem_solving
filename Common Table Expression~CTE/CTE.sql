--- 1. Total Revenue per Product
WITH product_sales AS (
	SELECT product, SUM(revenue) AS total_revenue
	FROM sales_data
    GROUP BY product
	)
SELECT *
FROM product_sales
ORDER BY total_revenue DESC;

--- 2. Top product in each region
WITH product_ranked AS (
	SELECT region, product, SUM(revenue) AS total_revenue,
    RANK() OVER (PARTITION BY region ORDER BY SUM(revenue) DESC) AS rnk
    FROM sales_data
    GROUP BY region, product
    )
SELECT product, region, total_revenue
FROM product_ranked
WHERE rnk = 1;

--- 3. Customer Spending Analysis
WITH customer_spending AS (
    SELECT customer, SUM(revenue) AS total_spent
    FROM sales_data
    GROUP BY customer
)
SELECT *
FROM customer_spending
WHERE total_spent > (
    SELECT AVG(total_spent)
    FROM customer_spending
);

--- 4. Daily Sales with Running Total
WITH daily_sales AS (
    SELECT order_date, SUM(revenue) AS daily_revenue
    FROM sales_data
    GROUP BY order_date
)
SELECT
order_date,
daily_revenue,
SUM(daily_revenue) OVER (ORDER BY order_date) AS cumulative_sales
FROM daily_sales;
