use btss6_management_db;

-- 1, Liet ke sp cung ten voi danh muc tuong ung
SELECT
    p.id,
    p.name,
    p.price,
    c.name AS category_name
FROM products p
JOIN catagories c ON p.catagory_id = c.id;

-- 2, Dem so don cho tung khach
SELECT
    c.name,
    COUNT(o.id) AS total_orders
FROM customers c
LEFT JOIN orders o ON c.id = o.customers_id
GROUP BY c.id, c.name;

-- 3, Xac dinh 5 khach hang co tong doanh thu cao nhat
SELECT
    c.name,
    SUM(od.quantity * od.price) AS total_spent
FROM customers c
JOIN orders o ON c.id = o.customers_id
JOIN order_details od ON o.id = od.orders_id
GROUP BY c.id, c.name
ORDER BY total_spent DESC
LIMIT 5;

-- 4, SP chua tung xuat hien trong don hang
SELECT p.id, p.name
FROM products p
LEFT JOIN order_details od ON p.id = od.product_id
WHERE od.product_id IS NULL ;

-- 5, Tim kh da mua sp thuoc danh muc co nhieu sp nhat
SELECT DISTINCT c.name
FROM customers c
         JOIN orders o ON c.id = o.customers_id
         JOIN order_details od ON o.id = od.orders_id
         JOIN products p ON od.product_id = p.id
WHERE p.catagory_id = (
    -- Tìm ID của danh mục có nhiều sản phẩm nhất
    SELECT catagory_id
    FROM products
    GROUP BY catagory_id
    ORDER BY COUNT(id) DESC
    LIMIT 1
);

--
