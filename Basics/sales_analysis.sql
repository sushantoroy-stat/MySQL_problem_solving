CREATE DATABASE company_history;
USE company_history;
SELECT * 
FROM sales_data;

--- 1. estimate total sales 
SELECT SUM(revenue) AS total_sales
FROM sales_data;
DROP DATABASE sales_data;

--- 2. Product wise sales
SELECT product, SUM(revenue) AS Total_sales_by_product
FROM sales_data
GROUP BY product
ORDER BY Total_sales_by_product DESC;

--- 3. Region wise sales 
SELECT region, SUM(revenue) AS Region_wise_sales
FROM sales_data
GROUP BY region
ORDER BY Region_wise_sales DESC;

--- 4. Most sold products 
SELECT product, SUM(quantity) AS Total_quantity
FROM sales_data
GROUP BY product
ORDER BY Total_quantity DESC 
LIMIT 1;


--- 5. Monthly sales

SELECT MONTH(order_date) AS month,
       SUM(revenue) AS total_sales
FROM sales_data
GROUP BY month
ORDER BY month;

------ 
SELECT customer,
       SUM(revenue) AS total_spent
FROM sales_data
GROUP BY customer
ORDER BY total_spent DESC
LIMIT 10;