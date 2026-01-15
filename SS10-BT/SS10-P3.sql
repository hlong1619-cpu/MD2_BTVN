use btss6_management_db;
DELIMITER //

CREATE TRIGGER BeforeInsertProduct
    BEFORE INSERT ON Products
    FOR EACH ROW
BEGIN
    -- Kiểm tra nếu số lượng thêm mới nhỏ hơn 0
    IF NEW.quantity < 0 THEN
        -- Phát ra lỗi để ngăn chặn hành động INSERT
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Lỗi: Số lượng sản phẩm (quantity) không được nhỏ hơn 0!';
    END IF;
END //

DELIMITER ;
--
INSERT INTO Products (Name, quantity) VALUES ('Bàn phím lỗi', -5);
INSERT INTO Products (Name, quantity) VALUES ('Tai nghe Sony', 0);
INSERT INTO Products (Name, quantity) VALUES ('Loa Bluetooth', 20);