use btss6_management_db;

-- 1, Them 2 khach hang moi
INSERT INTO customers (name, email)
VALUES
    ('Pham Minh Anh', 'manh@gmail.com'),
    ('Hoang Trung Duc', 'duchoang@gmailo.com');

-- 2, Liet ke khach co it nhat 1 don hang
SELECT DISTINCT c.id, c.name, c.email
FROM customers c
INNER JOIN orders o ON c.id = o.customers_id;

-- 3, Khac hang chua tung dat don
SELECT c.id, c.name, c.email
FROM customers c
LEFT JOIN orders o  ON c.id = o.customers_id
WHERE o.id IS NULL ;

-- 4, Tinh tong doanh thu moi khach
SELECT
    c.name,
    SUM(od.quantity * od.price) AS total_revenue
FROM customers c
JOIN orders o ON c.id = o.customers_id
JOIN order_details od ON o.id = od.orders_id
GROUP BY c.id, c.name;

-- 5, Xac didnh khach hang da mua sp co gias ca0 nhat
SELECT DISTINCT c.name, c.email
FROM customers c
JOIN orders o ON c.id = customers_id
JOIN order_details od ON o.id = od.orders_id
WHERE od.price = (SELECT MAX(price) FROM products);