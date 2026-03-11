-- 1 Show orders with customer names
SELECT o.order_id, c.name, o.order_date
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id;

-- 2 Show order items with product names
SELECT oi.order_id, p.product_name, oi.quantity
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id;

-- 3 Show product with category name
SELECT p.product_name, c.category_name
FROM products p
JOIN categories c
ON p.category_id = c.category_id;

-- 4 Total sales per product
SELECT p.product_name,
SUM(oi.quantity * oi.price) AS total_sales
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_name;

-- 5 Total orders per customer
SELECT c.name,
COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.name;

-- 6 Show orders with total order value
SELECT o.order_id,
SUM(oi.quantity * oi.price) AS order_value
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.order_id;

-- 7 Customers who placed an order
SELECT 
    c.customer_id,
    c.name,
    o.order_id,
    o.order_date
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

-- 8 All orders and there customers
 SELECT 
    c.name,
    o.order_id,
    o.order_date
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

-- 9 Full outer joins
SELECT 
    c.name,
    o.order_id
FROM customers c
FULL OUTER JOIN orders o
ON c.customer_id = o.customer_id;

-- 10 Products that are being ordered
SELECT 
    p.product_name,
    oi.quantity,
    o.order_id
FROM order_items oi
INNER JOIN products p
ON oi.product_id = p.product_id
INNER JOIN orders o
ON oi.order_id = o.order_id;