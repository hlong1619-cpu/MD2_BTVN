use btss6_management_db;

-- 1, Them don hang
INSERT INTO orders (orders.customers_id, order_date)
VALUES (1, '2025-01-02');
SELECT * FROM orders;

--
INSERT INTO order_details (orders_id, product_id, quantity, price)
VALUES
    (1, 1, 2, 500),
    (1, 4, 3, 200);
SELECT id FROM orders;

-- Tinh tong doanh thu
SELECT SUM(od.quantity * price) AS total_shop_revenue
FROM order_details od;

-- 3, Doanh thu trung binh tren moi don
SELECT AVG(order_total) AS average_order_value
FROM (
    SELECT SUM(od.quantity * price) AS order_total
    FROM order_details od
    GROUP BY orders_id
     ) AS subquery;

-- 4, don hang co doanh thu cao nhat
SELECT od.orders_id, SUM(quantity * price) AS total_revenue
FROM order_details od
GROUP BY orders_id
ORDER BY total_revenue DESC
LIMIT 1;

-- Tim sp ban chay
SELECT
    p.name,
    SUM(od.quantity) AS total_sold
FROM order_details od
JOIN products p ON od.product_id = p.id
GROUP BY p.id, p.name
ORDER BY total_sold DESC
LIMIT 3;