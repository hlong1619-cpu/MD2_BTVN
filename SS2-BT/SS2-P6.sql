CREATE DATABASE advanced;
use advanced;
-- 1. Tạo bảng Đơn hàng
CREATE TABLE orders (
                        order_id INT PRIMARY KEY,
                        order_date DATE NOT NULL,
                        status VARCHAR(20) NOT NULL
);

-- 2. Tạo bảng Sản phẩm
CREATE TABLE products (
                          product_id INT PRIMARY KEY,
                          product_name VARCHAR(100) NOT NULL,
                          price DECIMAL(15, 2) NOT NULL
);

-- 3. Tạo bảng trung gian Chi tiết đơn hàng
CREATE TABLE order_items (
                             order_id INT,
                             product_id INT,
                             quantity INT NOT NULL,
    -- Thiết lập Khóa chính
                             PRIMARY KEY (order_id, product_id),
    -- Thiết lập các Khóa ngoại
                             FOREIGN KEY (order_id) REFERENCES orders(order_id),
                             FOREIGN KEY (product_id) REFERENCES products(product_id)
);