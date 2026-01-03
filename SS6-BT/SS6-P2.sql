CREATE DATABASE IF NOT EXISTS btss6_management_db;
USE btss6_management_db;

-- Client table
CREATE TABLE IF NOT EXISTS customers(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL ,
    email VARCHAR(255) NOT NULL UNIQUE
);

-- Order table
CREATE TABLE IF NOT EXISTS orders(
    id INT PRIMARY KEY AUTO_INCREMENT,
    customers_id INT,
    order_date DATE NOT NULL ,
    FOREIGN KEY (customers_id) REFERENCES customers(id)
);

-- Create catagories table
    CREATE TABLE IF NOT EXISTS catagories(
        id INT PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(255)
    );

-- Product table
CREATE TABLE IF NOT EXISTS products(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL ,
    price DOUBLE NOT NULL

);
ALTER TABLE products
ADD COLUMN catagory_id INT;
--
    ALTER TABLE products
    ADD CONSTRAINT fk_catagoriers_products
    FOREIGN KEY (catagory_id) REFERENCES catagories(id);

-- Add products
INSERT INTO catagories(name)
VALUES ('Thoi trang');
SELECT * FROM catagories;
--
INSERT INTO products(name, price, products.catagory_id)
VALUES
    ('Quan jean', 500, 1),
    ('Ao khoac nam', 850, 1),
    ('Giay tay', 450, 1),
    ('Ao phong', 200, 1),
    ('Vay ngan', 350, 1);
--
SELECT * FROM products;

-- Order_detail table
CREATE TABLE IF NOT EXISTS order_details(
    orders_id INT,
    product_id INT,
    quantity INT NOT NULL ,
    price DOUBLE NOT NULL ,
    PRIMARY KEY (orders_id, product_id), -- Khoa chinh kep
    FOREIGN KEY (orders_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Them 2 khach hang moi
INSERT INTO customers(name, email)
VALUES
    ('Tran Van Nam', 'namtv@gmail.com'),
    ('Nguyen Thi Hong', 'hongnt@gmail.com');

SELECT * FROM customers;

-- Khach hang da co it nhat 1 don
SELECT DISTINCT c.id, c.name, c.email
FROM customers c
INNER JOIN orders o ON c.id = o.customers_id;

-- Tim khach hang chua co don nao
SELECT c.id, c.name, c.email
FROM customers c
LEFT JOIN orders o ON c.id = o.customers_id
WHERE o.id IS NULL ;

-- Tong doanh thu
SELECT c.name, SUM(od.quantity * od.price) AS total_revenue
FROM customers c
JOIN orders o ON c.id = o.customers_id
JOIN order_details od ON o.id = od. orders_id
GROUP BY c.id, c.name;

-- Xac dinh hang da mua co gia cao nhat (subquery)
SELECT DISTINCT c.name, p.name AS product_name, p.price
FROM customers c
JOIN orders o ON c.id = o.customers_id
JOIN order_details od ON o.id = od.orders_id
JOIN products p ON od.product_id = p.id
WHERE p.price = (SELECT MAX(price) FROM products);

