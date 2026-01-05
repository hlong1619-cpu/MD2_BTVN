use btss6_management_db;
SELECT * FROM customers;
ALTER TABLE orders
ADD name varchar(255);
-- 1, hien thi ma do hang, ngay dat, ten khach
SELECT
    o.id,
    o.name,
    c.name
FROM orders o
INNER JOIN customers c ON o.customers_id = c.id;

-- Hien thi danh sach sp trong moi don
SELECT
    order_id,
    product_name,
    quantity,
    price

FROM Order_items;