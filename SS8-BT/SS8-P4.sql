USE btss6_management_db;

--
DELIMITER //

CREATE PROCEDURE sp_check_order_value(IN p_total_amount DECIMAL(15, 2))
BEGIN

    IF p_total_amount >= 5000000 THEN
        SELECT 'Don hang gia tri cao' AS Mesage;
            ELSE IF p_total_amount >= 2000000 THEN
                SELECT 'Don hang binh thuong' AS Masage;
                    ELSE IF p_total_amount < 2000000 THEN
                        SELECT 'Don hang gia tri thap' AS Mesage;
            end if //
end //
DELIMITER ;

--
CALL sp_check_order_value(7000000);
CALL sp_check_order_value(2000000);

-- Code sua loi cu phap
-- Bước 1: Phải đổi DELIMITER trước khi tạo Procedure
DROP PROCEDURE IF EXISTS sp_check_order_value;

DELIMITER //

CREATE PROCEDURE sp_check_order_value(IN p_total_amount DECIMAL(15, 2))
BEGIN
    IF p_total_amount >= 5000000 THEN
        SELECT 'Don hang gia tri cao' AS Message;
    ELSEIF p_total_amount >= 2000000 THEN
        SELECT 'Don hang binh thuong' AS Message;
    ELSE
        SELECT 'Don hang gia tri thap' AS Message;
    END IF;
END //

DELIMITER ;

