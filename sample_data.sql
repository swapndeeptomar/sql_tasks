create database sales_db;
use sales_db;

-- DROP TABLES

DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS customers;

-- CREATE TABLES

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- INSERT DATA

-- Customers
INSERT INTO customers VALUES
(1,'Amit Sharma','amit@email.com','Delhi'),
(2,'Priya Singh','priya@email.com','Mumbai'),
(3,'Rahul Verma','rahul@email.com','Delhi'),
(4,'Sneha Patel','sneha@email.com','Ahmedabad'),
(5,'Rohit Gupta','rohit@email.com','Bangalore');

-- Categories
INSERT INTO categories VALUES
(1,'Electronics'),
(2,'Accessories'),
(3,'Home Appliances');

-- Products
INSERT INTO products VALUES
(1,'Laptop',60000,1),
(2,'Smartphone',30000,1),
(3,'Headphones',2000,2),
(4,'Keyboard',1500,2),
(5,'Microwave',8000,3),
(6,'Refrigerator',40000,3);

-- Orders
INSERT INTO orders VALUES
(1,1,'2025-01-10'),
(2,2,'2025-01-11'),
(3,3,'2025-01-15'),
(4,1,'2025-01-20'),
(5,4,'2025-01-21'),
(6,5,'2025-01-22');

-- Order Items
INSERT INTO order_items VALUES
(1,1,1,1,60000),
(2,1,3,2,2000),
(3,2,2,1,30000),
(4,2,4,1,1500),
(5,3,3,1,2000),
(6,3,5,1,8000),
(7,4,1,1,60000),
(8,4,4,2,1500),
(9,5,6,1,40000),
(10,6,2,1,30000),
(11,6,3,1,2000);