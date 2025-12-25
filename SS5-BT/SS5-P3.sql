create database if not exists products_db;
use products_db;
create table product(
    product_id varchar(100) primary key ,
        product_name varchar(100) not null ,
        category varchar(50) not null ,
        price varchar(50)
);
-- Sp co gia cao hon trung binh
SELECT * FROM product
WHERE price > (SELECT AVG(price) FROM product);
-- Sp co gia cao nhat trong tung loai
/*SELECT * FROM product
WHERE price = (
    SELECT MAX(price)
    FROM product
    WHERE category > category
);*/
-- Sp co it nhat 1 mon > 20000000
SELECT * FROM product
WHERE category IN (
    SELECT DISTINCT category
    FROM product
    WHERE price > 20000000
);


