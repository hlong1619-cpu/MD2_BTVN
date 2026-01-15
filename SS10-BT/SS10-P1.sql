use btss6_management_db;
--
    SELECT * FROM products;

-- 1. Tạo bảng InventoryChanges
CREATE TABLE InventoryChanges (
                                  changeID INT AUTO_INCREMENT PRIMARY KEY,
                                  id INT,
                                  oldQuantity INT,
                                  newQuantity INT,
                                  changeDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    -- Tạo khóa ngoại liên kết với bảng Products
                                  FOREIGN KEY (id) REFERENCES Products(id)
);
--
DELIMITER //

CREATE TRIGGER AfterProductUpdate
    AFTER UPDATE ON Products
    FOR EACH ROW
BEGIN
    -- Chỉ ghi lại thay đổi nếu số lượng (quantity) thực sự khác so với trước đó
    IF OLD.quantity <> NEW.quantity THEN
        INSERT INTO InventoryChanges (InventoryChanges.id, oldQuantity, newQuantity, changeDate)
        VALUES (OLD.id, OLD.quantity, NEW.quantity, NOW());
    END IF;
END //

DELIMITER ;