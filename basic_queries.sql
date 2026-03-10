use sales_db;

-- 1. Show all customers
SELECT * FROM customers;

-- 2. Show customer names and emails
SELECT name, email FROM customers;

-- 3. Find customers from 'Delhi'
SELECT * FROM customers
WHERE city = 'Delhi';

-- 4. List all products priced above 500
SELECT * FROM products
WHERE price > 500;

-- 5. Count total customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- 6. Find average product price
SELECT AVG(price) AS avg_price
FROM products;

-- 7. Find total number of orders
SELECT COUNT(*) AS total_orders
FROM orders;

-- 8. Show top 5 most expensive products
SELECT * FROM products
ORDER BY price DESC
LIMIT 5;