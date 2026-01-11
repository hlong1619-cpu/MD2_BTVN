USE btss6_management_db;
INSERT INTO employees (full_name, salary) VALUES
                                                          ('Nguyen Van A', 1500.00),
                                                          ('Tran thi B', 2000.00),
                                                          ('Le Van C', 2500.00);

-- Tao Stores procedure
DELIMITER //
CREATE PROCEDURE sp_get_avg_salary()
BEGIN
    DECLARE avg_sal DECIMAL(15, 2);

    -- 2, tinh toan va gan gia tri
    SELECT AVG(employees.salary) INTO avg_sal FROM employees;

    -- 3, Hien thi ra man hinh
    SELECT avg_sal AS Average_salary;
end //
DELIMITER ;

--
SELECT * FROM employees;
CALL sp_get_avg_salary();