-- DATA ANALYTICS INTERNSHIP - TASK 3: SQL QUERYING FUNDAMENTALS
-- Retail Orders Database Analysis
-- Author: [Your Name]
-- Date: September 2025
-- Objective: Demonstrate SQL operations on retail dataset for business insights

-- =============================================================================
-- DATABASE SETUP AND TABLE CREATION
-- =============================================================================

-- Create database for retail analysis
-- CREATE DATABASE IF NOT EXISTS retail_analysis;
-- USE retail_analysis;

-- Create Customers table
CREATE TABLE IF NOT EXISTS customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(20),
    region VARCHAR(50)
);

-- Create Products table
CREATE TABLE IF NOT EXISTS products (
    product_id VARCHAR(50) PRIMARY KEY,
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(200)
);

-- Create Orders table
CREATE TABLE IF NOT EXISTS orders (
    order_id VARCHAR(50) PRIMARY KEY,
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id INT,
    product_id VARCHAR(50),
    sales DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(5,2),
    profit DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert sample data for demonstration
-- Customers data
INSERT INTO customers VALUES
(1, 'John Smith', 'Consumer', 'United States', 'New York', 'New York', '10001', 'East'),
(2, 'Sarah Johnson', 'Corporate', 'United States', 'Los Angeles', 'California', '90001', 'West'),
(3, 'Mike Wilson', 'Home Office', 'United States', 'Chicago', 'Illinois', '60601', 'Central'),
(4, 'Emily Davis', 'Consumer', 'United States', 'Houston', 'Texas', '77001', 'Central'),
(5, 'David Brown', 'Corporate', 'United States', 'Phoenix', 'Arizona', '85001', 'West'),
(6, 'Lisa Garcia', 'Consumer', 'United States', 'Philadelphia', 'Pennsylvania', '19101', 'East'),
(7, 'James Miller', 'Home Office', 'United States', 'San Antonio', 'Texas', '78201', 'Central'),
(8, 'Maria Rodriguez', 'Corporate', 'United States', 'San Diego', 'California', '92101', 'West'),
(9, 'Robert Taylor', 'Consumer', 'United States', 'Dallas', 'Texas', '75201', 'Central'),
(10, 'Jennifer Anderson', 'Corporate', 'United States', 'San Jose', 'California', '95101', 'West');

-- Products data
INSERT INTO products VALUES
('PROD001', 'Technology', 'Phones', 'Samsung Galaxy S21'),
('PROD002', 'Technology', 'Computers', 'Dell Laptop'),
('PROD003', 'Furniture', 'Chairs', 'Office Chair'),
('PROD004', 'Office Supplies', 'Paper', 'Copy Paper'),
('PROD005', 'Technology', 'Accessories', 'Wireless Mouse'),
('PROD006', 'Furniture', 'Tables', 'Conference Table'),
('PROD007', 'Office Supplies', 'Binders', 'File Binder'),
('PROD008', 'Technology', 'Phones', 'iPhone 13'),
('PROD009', 'Furniture', 'Storage', 'Filing Cabinet'),
('PROD010', 'Office Supplies', 'Pens', 'Ballpoint Pens');

-- Orders data
INSERT INTO orders VALUES
('ORD001', '2024-01-15', '2024-01-18', 'Standard Class', 1, 'PROD001', 899.99, 1, 0.05, 200.00),
('ORD002', '2024-01-20', '2024-01-23', 'Second Class', 2, 'PROD002', 1299.99, 1, 0.10, 300.00),
('ORD003', '2024-02-05', '2024-02-08', 'First Class', 3, 'PROD003', 249.99, 2, 0.00, 100.00),
('ORD004', '2024-02-10', '2024-02-13', 'Standard Class', 1, 'PROD004', 19.99, 5, 0.15, 5.00),
('ORD005', '2024-02-15', '2024-02-18', 'Second Class', 4, 'PROD005', 29.99, 3, 0.00, 15.00),
('ORD006', '2024-03-01', '2024-03-04', 'First Class', 5, 'PROD006', 599.99, 1, 0.05, 150.00),
('ORD007', '2024-03-10', '2024-03-13', 'Standard Class', 6, 'PROD007', 12.99, 10, 0.20, 8.00),
('ORD008', '2024-03-20', '2024-03-23', 'Second Class', 7, 'PROD008', 1099.99, 1, 0.00, 250.00),
('ORD009', '2024-04-05', '2024-04-08', 'First Class', 8, 'PROD009', 449.99, 1, 0.10, 100.00),
('ORD010', '2024-04-15', '2024-04-18', 'Standard Class', 9, 'PROD010', 9.99, 20, 0.05, 20.00),
('ORD011', '2024-05-01', '2024-05-04', 'Second Class', 10, 'PROD001', 899.99, 2, 0.00, 400.00),
('ORD012', '2024-05-10', '2024-05-13', 'First Class', 2, 'PROD003', 249.99, 1, 0.10, 50.00),
('ORD013', '2024-06-01', '2024-06-04', 'Standard Class', 3, 'PROD005', 29.99, 5, 0.00, 75.00),
('ORD014', '2024-06-15', '2024-06-18', 'Second Class', 4, 'PROD007', 12.99, 8, 0.15, 12.00),
('ORD015', '2024-07-01', '2024-07-04', 'First Class', 5, 'PROD002', 1299.99, 1, 0.05, 350.00);

-- =============================================================================
-- BASIC SQL OPERATIONS DEMONSTRATION
-- =============================================================================

-- 1. BASIC SELECT OPERATIONS
-- =============================================================================

-- Simple SELECT - Retrieve all customers
SELECT * FROM customers;

-- SELECT specific columns
SELECT customer_name, city, segment FROM customers;

-- SELECT with alias
SELECT 
    customer_name AS 'Customer Name',
    city AS 'City',
    segment AS 'Business Segment'
FROM customers;

-- COUNT total records
SELECT COUNT(*) AS total_customers FROM customers;

-- =============================================================================

-- 2. WHERE CLAUSE - FILTERING DATA
-- =============================================================================

-- Filter customers by segment
SELECT * FROM customers 
WHERE segment = 'Corporate';

-- Filter orders by sales amount
SELECT * FROM orders 
WHERE sales > 500;

-- Multiple conditions with AND
SELECT * FROM orders 
WHERE sales > 100 AND profit > 50;

-- Multiple conditions with OR
SELECT * FROM customers 
WHERE segment = 'Corporate' OR segment = 'Home Office';

-- Filter with date conditions
SELECT * FROM orders 
WHERE order_date >= '2024-03-01';

-- Filter with IN operator
SELECT * FROM customers 
WHERE region IN ('East', 'West');

-- Filter with LIKE operator (pattern matching)
SELECT * FROM products 
WHERE product_name LIKE '%Phone%';

-- Filter with BETWEEN
SELECT * FROM orders 
WHERE sales BETWEEN 100 AND 1000;

-- =============================================================================

-- 3. ORDER BY - SORTING RESULTS
-- =============================================================================

-- Sort customers by name (ascending)
SELECT * FROM customers 
ORDER BY customer_name;

-- Sort orders by sales (descending)
SELECT * FROM orders 
ORDER BY sales DESC;

-- Multiple column sorting
SELECT customer_name, city, segment 
FROM customers 
ORDER BY segment, customer_name;

-- Sort with WHERE condition
SELECT * FROM orders 
WHERE profit > 50 
ORDER BY profit DESC;

-- =============================================================================

-- 4. GROUP BY AND AGGREGATE FUNCTIONS
-- =============================================================================

-- Count customers by segment
SELECT 
    segment,
    COUNT(*) AS customer_count
FROM customers 
GROUP BY segment;

-- Total sales by customer
SELECT 
    c.customer_name,
    SUM(o.sales) AS total_sales,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_sales DESC;

-- Average sales by product category
SELECT 
    p.category,
    AVG(o.sales) AS avg_sales,
    SUM(o.profit) AS total_profit,
    COUNT(o.order_id) AS total_orders
FROM products p
JOIN orders o ON p.product_id = o.product_id
GROUP BY p.category
ORDER BY avg_sales DESC;

-- Monthly sales analysis
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    MONTHNAME(order_date) AS month_name,
    SUM(sales) AS monthly_sales,
    COUNT(order_id) AS order_count
FROM orders
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;

-- Sales by region with HAVING clause
SELECT 
    c.region,
    SUM(o.sales) AS total_sales,
    AVG(o.profit) AS avg_profit
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.region
HAVING total_sales > 1000
ORDER BY total_sales DESC;

-- =============================================================================

-- 5. JOIN OPERATIONS
-- =============================================================================

-- INNER JOIN - Orders with customer details
SELECT 
    o.order_id,
    o.order_date,
    c.customer_name,
    c.segment,
    o.sales,
    o.profit
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id;

-- Multiple JOIN - Complete order information
SELECT 
    o.order_id,
    o.order_date,
    c.customer_name,
    c.city,
    c.region,
    p.product_name,
    p.category,
    o.sales,
    o.quantity,
    o.profit
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN products p ON o.product_id = p.product_id
ORDER BY o.order_date DESC;

-- LEFT JOIN - All customers with their orders (including customers with no orders)
SELECT 
    c.customer_name,
    c.segment,
    COALESCE(SUM(o.sales), 0) AS total_sales,
    COUNT(o.order_id) AS order_count
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name, c.segment
ORDER BY total_sales DESC;

-- =============================================================================

-- 6. ADVANCED QUERIES AND BUSINESS INSIGHTS
-- =============================================================================

-- Top 5 customers by sales
SELECT 
    c.customer_name,
    c.segment,
    c.city,
    SUM(o.sales) AS total_sales,
    SUM(o.profit) AS total_profit
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name, c.segment, c.city
ORDER BY total_sales DESC
LIMIT 5;

-- Product performance analysis
SELECT 
    p.product_name,
    p.category,
    p.sub_category,
    COUNT(o.order_id) AS times_ordered,
    SUM(o.quantity) AS total_quantity_sold,
    SUM(o.sales) AS total_revenue,
    SUM(o.profit) AS total_profit,
    AVG(o.profit/o.sales)*100 AS profit_margin_percentage
FROM products p
JOIN orders o ON p.product_id = o.product_id
GROUP BY p.product_id, p.product_name, p.category, p.sub_category
ORDER BY total_revenue DESC;

-- Customer segmentation analysis
SELECT 
    c.segment,
    c.region,
    COUNT(DISTINCT c.customer_id) AS customer_count,
    COUNT(o.order_id) AS total_orders,
    SUM(o.sales) AS total_sales,
    AVG(o.sales) AS avg_order_value,
    SUM(o.profit) AS total_profit
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.segment, c.region
ORDER BY total_sales DESC;

-- Seasonal sales analysis
SELECT 
    CASE 
        WHEN MONTH(order_date) IN (12, 1, 2) THEN 'Winter'
        WHEN MONTH(order_date) IN (3, 4, 5) THEN 'Spring'
        WHEN MONTH(order_date) IN (6, 7, 8) THEN 'Summer'
        ELSE 'Fall'
    END AS season,
    COUNT(order_id) AS total_orders,
    SUM(sales) AS total_sales,
    AVG(sales) AS avg_order_value
FROM orders
GROUP BY season
ORDER BY total_sales DESC;

-- Shipping mode analysis
SELECT 
    ship_mode,
    COUNT(order_id) AS order_count,
    AVG(DATEDIFF(ship_date, order_date)) AS avg_shipping_days,
    SUM(sales) AS total_sales,
    AVG(sales) AS avg_order_value
FROM orders
GROUP BY ship_mode
ORDER BY order_count DESC;

-- =============================================================================

-- 7. SUBQUERIES AND COMPLEX ANALYSIS
-- =============================================================================

-- Find customers with above-average order values
SELECT 
    c.customer_name,
    c.segment,
    AVG(o.sales) AS avg_order_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name, c.segment
HAVING AVG(o.sales) > (SELECT AVG(sales) FROM orders);

-- Second highest sales order (Interview Question Solution)
SELECT * FROM orders 
ORDER BY sales DESC 
LIMIT 1 OFFSET 1;

-- Alternative method for second highest
SELECT * FROM orders 
WHERE sales = (
    SELECT DISTINCT sales 
    FROM orders 
    ORDER BY sales DESC 
    LIMIT 1 OFFSET 1
);

-- Products never ordered
SELECT p.product_name, p.category 
FROM products p
LEFT JOIN orders o ON p.product_id = o.product_id
WHERE o.product_id IS NULL;

-- Customers who ordered in multiple categories
SELECT 
    c.customer_name,
    COUNT(DISTINCT p.category) AS categories_purchased
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN products p ON o.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(DISTINCT p.category) > 1;

-- =============================================================================

-- 8. WINDOW FUNCTIONS (Advanced SQL)
-- =============================================================================

-- Running total of sales
SELECT 
    order_date,
    order_id,
    sales,
    SUM(sales) OVER (ORDER BY order_date) AS running_total
FROM orders
ORDER BY order_date;

-- Rank customers by total sales
SELECT 
    c.customer_name,
    SUM(o.sales) AS total_sales,
    RANK() OVER (ORDER BY SUM(o.sales) DESC) AS sales_rank
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;

-- =============================================================================

-- 9. DATA QUALITY AND VALIDATION QUERIES
-- =============================================================================

-- Check for missing data
SELECT 
    'customers' AS table_name,
    SUM(CASE WHEN customer_name IS NULL THEN 1 ELSE 0 END) AS null_names,
    SUM(CASE WHEN segment IS NULL THEN 1 ELSE 0 END) AS null_segments
FROM customers
UNION ALL
SELECT 
    'orders' AS table_name,
    SUM(CASE WHEN sales IS NULL THEN 1 ELSE 0 END) AS null_sales,
    SUM(CASE WHEN profit IS NULL THEN 1 ELSE 0 END) AS null_profits
FROM orders;

-- Data validation - negative profits
SELECT 
    order_id,
    sales,
    profit,
    (profit/sales)*100 AS profit_margin
FROM orders
WHERE profit < 0;

-- =============================================================================

-- 10. BUSINESS INSIGHTS SUMMARY QUERIES
-- =============================================================================

-- Executive Summary Dashboard
SELECT 
    'Total Revenue' AS metric,
    CONCAT('$', FORMAT(SUM(sales), 2)) AS value
FROM orders
UNION ALL
SELECT 
    'Total Profit' AS metric,
    CONCAT('$', FORMAT(SUM(profit), 2)) AS value
FROM orders
UNION ALL
SELECT 
    'Total Orders' AS metric,
    COUNT(*) AS value
FROM orders
UNION ALL
SELECT 
    'Average Order Value' AS metric,
    CONCAT('$', FORMAT(AVG(sales), 2)) AS value
FROM orders
UNION ALL
SELECT 
    'Unique Customers' AS metric,
    COUNT(DISTINCT customer_id) AS value
FROM orders;

-- =============================================================================

-- INTERVIEW QUESTION SOLUTIONS
-- =============================================================================

-- 1. WHERE vs HAVING demonstration
-- WHERE: Filters rows before grouping
SELECT customer_id, sales 
FROM orders 
WHERE sales > 100;

-- HAVING: Filters groups after aggregation
SELECT 
    customer_id, 
    SUM(sales) as total_sales 
FROM orders 
GROUP BY customer_id 
HAVING SUM(sales) > 1000;

-- 2. GROUP BY without aggregate functions (valid but not typical)
SELECT segment 
FROM customers 
GROUP BY segment;

-- 3. Different JOIN types demonstration
-- INNER JOIN: Only matching records
SELECT c.customer_name, o.sales 
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;

-- LEFT JOIN: All customers, matching orders
SELECT c.customer_name, o.sales 
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- RIGHT JOIN: All orders, matching customers
SELECT c.customer_name, o.sales 
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;

-- =============================================================================
-- END OF SQL ANALYSIS SCRIPT
-- =============================================================================

-- Summary: This script demonstrates comprehensive SQL operations including:
-- 1. Database and table creation
-- 2. Basic SELECT operations
-- 3. WHERE clause filtering
-- 4. ORDER BY sorting
-- 5. GROUP BY and aggregations
-- 6. JOIN operations (INNER, LEFT, RIGHT)
-- 7. Advanced queries and subqueries
-- 8. Window functions
-- 9. Data quality validation
-- 10. Business intelligence queries
-- 11. Interview question solutions

-- All major SQL concepts required for retail database analysis are covered
-- with practical examples and business-relevant insights.