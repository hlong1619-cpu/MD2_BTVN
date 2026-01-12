use btss6_management_db;
SELECT * FROM products;

ALTER TABLE products
ADD COLUMN stock INT NOT NULL CHECK ( stock >= 0 );
INSERT INTO products (name, price, stock) VALUES
                                                      ('Product 1', 500000, 10),    ('Product 2', 1500000, 5),
                                                      ('Product 3', 2000000, 8),    ('Product 4', 800000, 12),
                                                      ('Product 5', 2500000, 15),   ('Product 6', 900000, 20),
                                                      ('Product 7', 1200000, 7),    ('Product 8', 300000, 30),
                                                      ('Product 9', 1750000, 6),    ('Product 10', 450000, 11),
                                                      ('Product 11', 100000, 50),   ('Product 12', 1100000, 13),
                                                      ('Product 13', 950000, 4),    ('Product 14', 600000, 9),
                                                      ('Product 15', 3500000, 6),   ('Product 16', 750000, 18),
                                                      ('Product 17', 5555555, 8),   ('Product 18', 200000, 25),
                                                      ('Product 19', 1000001, 3),   ('Product 20', 150000, 40);

-- Tao Stored Procedure
DELIMITER //
CREATE PROCEDURE get_high_value_products()
BEGIN
    SELECT
    id, name, price, stock
            FROM products
                WHERE price > 1000000;
end //
DELIMITER ;
CALL get_high_value_products();