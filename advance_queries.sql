-- 1 Rank products by price
SELECT product_name,
price,
RANK() OVER (ORDER BY price DESC) AS price_rank
FROM products;

-- 2 Top 3 selling products
SELECT p.product_name,
SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 3;

-- 3 Sales by category
SELECT c.category_name,
SUM(oi.quantity * oi.price) AS category_sales
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name;

-- 4 Running total of sales
SELECT order_id,
SUM(quantity * price) OVER (ORDER BY order_id) AS running_total
FROM order_items;

-- 5 Find most valuable customer
SELECT c.name,
SUM(oi.quantity * oi.price) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 1;

-- 6 Customer order ranking
SELECT c.name,
COUNT(o.order_id) AS total_orders,
RANK() OVER (ORDER BY COUNT(o.order_id) DESC) AS rank_customer
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.name;