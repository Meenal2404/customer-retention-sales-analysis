-- Create Database
CREATE DATABASE sales_project;
USE sales_project;

-- Create Table
CREATE TABLE orders (
    order_id INT,
    customer_id VARCHAR(10),
    order_date DATE,
    region VARCHAR(20),
    product_category VARCHAR(50),
    sales INT,
    profit INT
);

-- Total Customers
SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM orders;

-- Repeat Customers
SELECT customer_id, COUNT(order_id) AS order_count
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 1;

-- Repeat Customer Count
SELECT COUNT(*) AS repeat_customers
FROM (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(order_id) > 1
) AS sub;

-- Monthly Revenue
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(sales) AS total_revenue
FROM orders
GROUP BY month
ORDER BY month;

-- Region-wise Revenue
SELECT 
    region,
    SUM(sales) AS revenue
FROM orders
GROUP BY region
ORDER BY revenue DESC;