create database demobt_db;
use demobt_db;

-- Tablr categories
    CREATE TABLE IF NOT EXISTS categories(
       id INT PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(255) NOT NULL
    );
-- Create table PRODUCT
CREATE TABLE IF NOT EXISTS products(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL ,
    price DOUBLE NOT NULL ,
    category_id INT,
    -- Khoa ngoai rang buoc
    CONSTRAINT fk_product_category
    FOREIGN KEY (category_id) REFERENCES categories(id)
);
-- Tao danh muc
    INSERT INTO categories (name) VALUES ('Thoi trang');
-- Add products in table
INSERT INTO demobt_db.products(name, price, category_id)
VALUES
    ('Quan tay', 250, 1),
    ('Ao so mi', 300, 1),
    ('Vay ngan', 350, 1);
INSERT INTO demobt_db.products(name, price, category_id)
VALUES
    ('Ao thun', 280, 1),
    ('Mu', 100, 1),
    ('Ao khoac', 800, 1);

--
SELECT * FROM products;
-- Delete product
DELETE FROM products
WHERE id = 15;

-- Update price
UPDATE products
SET price = 500
WHERE id = 14;

-- Hien thi sp sap xep theo gia
SELECT * FROM products
ORDER BY price ASC; -- Hoac DECS

-- Thong ke so luong sp theo danh muc
SELECT c.name AS category_name,
       COUNT(p.id) AS total_products
FROM categories c
LEFT JOIN products p ON c.id = p.category_id
GROUP BY c.id, c.name;
