# Customer Retention & Sales Analysis

## Problem
Analyze declining repeat customers and understand revenue drivers.

## Tools
SQL, Power BI, Excel

## Dataset
E-commerce orders (Jan–Jun 2024)

## Key Metrics
- Total Revenue: ₹8,800
- Total Customers: 13
- Repeat Customer Rate: 23.08%

## SQL Analysis
## SQL Analysis

Below are key SQL queries used for analysis:

### 1. Total Customers

```sql
SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM orders;
```

### 2. Repeat Customers

```sql
SELECT customer_id, COUNT(order_id) AS order_count
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 1;
```

### 3. Monthly Revenue

```sql
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(sales) AS total_revenue
FROM orders
GROUP BY month
ORDER BY month;
```

### 4. Revenue by Region

```sql
SELECT 
    region,
    SUM(sales) AS revenue
FROM orders
GROUP BY region
ORDER BY revenue DESC;
```


## Analysis
- Monthly revenue trend shows sharp increase after March.
- Repeat customer rate remains low.

## Insight
Revenue growth is driven by new customer acquisition rather than retention, indicating a potential sustainability risk.

## Recommendation
- Introduce loyalty/retention programs
- Target repeat purchase incentives
- Improve engagement with existing customers

## Dashboard
![Dashboard](dashboard/dashboard.png)