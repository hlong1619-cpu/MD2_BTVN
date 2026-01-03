use btss6_management_db;

-- 1, Sp co gia trong mot khoang cu the
SELECT * FROM products
WHERE price BETWEEN 300 AND 600;

-- 2, Sp ten co chua 1 chuoi ky tu
SELECT * FROM products
WHERE name LIKE '%Ao%';

-- 3, Gia trung binh (GROUP BY & AVG)
SELECT p.catagory_id, AVG(price) AS average_price
FROM products p
GROUP BY catagory_id;

-- 4, Sp gia cao hon AVG
SELECT * FROM products
WHERE price > (SELECT AVG(price) FROM products);

-- SP co gia thap nhat
SELECT p.catagory_id, MIN(price) as min_price
FROM products p
GROUP BY catagory_id;

