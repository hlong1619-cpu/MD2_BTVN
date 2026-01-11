USE btss6_management_db;

--
INSERT INTO products (name, price, catagory) VALUES
                                                         ('iPhone 15', 20000000, 'Dien thoai'),
                                                         ('Samsung S24', 18000000, 'Dien thoai'),
                                                         ('Macbook M3', 30000000, 'May tinh'),
                                                         ('Dell XPS', 25000000, 'May tinh'),
                                                         ('iPad Pro', 22000000, 'May tinh bang');
SELECT * FROM products;
ALTER TABLE products
ADD catagory varchar(100);

-- Tao Procedure co tham so IN
DELIMITER //
CREATE PROCEDURE sp_get_products_by_category(IN p_category VARCHAR(50))
BEGIN
    SELECT products.id, products.name, products.price, products.catagory FROM products
        WHERE products.catagory = p_category;
end //

DELIMITER //;
CALL sp_get_products_by_category('Dien thoai');