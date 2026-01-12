use btss6_management_db;
DELIMITER //
CREATE PROCEDURE insert_customer(
    IN in_customer_name VARCHAR(50),
    IN in_email VARCHAR(100),
    IN in_phone VARCHAR(15),
    IN in_address VARCHAR(255)
)
BEGIN
    INSERT INTO btss6_management_db.customers( name, email, phone, address)
        VALUES (in_customer_name, in_email, in_phone, in_address);

    SELECT 'Thêm mới khách hàng thành công' AS Messager;
end //
DELIMITER ;

--
CALL insert_customer('Long', 'long@gmail.com', 0123123123, 'NGHE AN');
SELECT * FROM view_customer_contact;
