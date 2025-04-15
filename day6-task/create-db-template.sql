-- Run this in VS Code SQLTools or MySQL CLI
CREATE DATABASE IF NOT EXISTS sales_db;
USE sales_db;

CREATE TABLE IF NOT EXISTS orders (
  order_id INT,
  order_date DATE,
  amount DECIMAL(10,2),
  product_id INT
);


LOAD DATA INFILE 'A:\\V5C0D3\\Internship_Tasks\\day6-task\\OnlineSales.csv'
INTO TABLE orders
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SET GLOBAL local_infile = 1;

SELECT 
  EXTRACT(YEAR FROM order_date) AS order_year,
  EXTRACT(MONTH FROM order_date) AS order_month,
  SUM(amount) AS total_revenue,
  COUNT(DISTINCT order_id) AS total_orders
FROM orders
GROUP BY order_year, order_month
ORDER BY order_year, order_month;


SELECT 
  EXTRACT(MONTH FROM order_date) AS order_month,
  SUM(amount) AS revenue_2023
FROM orders
GROUP BY order_month
ORDER BY order_month;


SELECT 
  DATE_FORMAT(order_date, '%Y-%m') AS month,
  SUM(amount) AS total_revenue,
  COUNT(DISTINCT order_id) AS total_orders
FROM orders
WHERE order_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
GROUP BY month
ORDER BY month;


WITH monthly_revenue AS (
  SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(amount) AS revenue
  FROM orders
  GROUP BY month
),
growth AS (
  SELECT 
    month,
    revenue,
    LAG(revenue) OVER (ORDER BY month) AS prev_month_revenue
  FROM monthly_revenue
)
SELECT 
  month,
  revenue,
  prev_month_revenue,
  ROUND(((revenue - prev_month_revenue)/prev_month_revenue) * 100, 2) AS percent_growth
FROM growth
WHERE prev_month_revenue IS NOT NULL;

SELECT 
  DATE_FORMAT(order_date, '%Y-%m') AS month,
  SUM(amount) AS total_revenue
FROM orders
GROUP BY month
ORDER BY total_revenue DESC
LIMIT 1;


WITH monthly AS (
  SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(amount) AS revenue
  FROM orders
  GROUP BY month
),
moving_avg AS (
  SELECT 
    month,
    revenue,
    ROUND(AVG(revenue) OVER (ORDER BY month ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2) AS moving_avg_3_month
  FROM monthly
)
SELECT * FROM moving_avg;


