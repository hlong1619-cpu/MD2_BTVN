CREATE DATABASE orders;
use orders;
-- 1. Tạo bảng
CREATE TABLE orders (
                        order_id INT PRIMARY KEY,
                        order_date DATETIME NOT NULL,
                        customer_name VARCHAR(100)
);

-- 2. Tạo bảng Sản phẩm
CREATE TABLE products (
                          product_id INT PRIMARY KEY,
                          product_name VARCHAR(150) NOT NULL,
                          price DECIMAL(10, 2) NOT NULL
);

-- 3. Tạo bảng trung gian với KHÓA CHÍNH KÉP
CREATE TABLE order_items (
                             order_id INT,
                             product_id INT,
                             quantity INT NOT NULL,

    -- Xác định PRIMARY KEY kép (Gồm 2 cột)
                             PRIMARY KEY (order_id, product_id),

    -- Thiết lập các FOREIGN KEY
                             FOREIGN KEY (order_id) REFERENCES orders(order_id),
                             FOREIGN KEY (product_id) REFERENCES products(product_id)
);