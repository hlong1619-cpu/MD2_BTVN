use btss6_management_db;
ALTER TABLE products
ADD quantity int;
DELIMITER //

CREATE TRIGGER BeforeProductDelete
    BEFORE DELETE ON Products
    FOR EACH ROW
BEGIN
    -- Kiểm tra nếu số lượng sản phẩm lớn hơn 10
    IF OLD.quantity > 10 THEN
        -- Phát ra lỗi và thông báo để ngăn hành động DELETE
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Không thể xóa sản phẩm có số lượng lớn hơn 10!';
    END IF;
END //

DELIMITER ;