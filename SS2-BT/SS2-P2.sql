CREATE TABLE products (
                          product_id VARCHAR(10) PRIMARY KEY,
                          product_name VARCHAR(255) NOT NULL,
                          price DECIMAL(15, 2),
                          stock_quantity INT
);