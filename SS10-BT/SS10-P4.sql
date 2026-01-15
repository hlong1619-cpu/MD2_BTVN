-- Tạo Database (nếu chưa có)
CREATE DATABASE IF NOT EXISTS EmployeeManagement;
USE EmployeeManagement;

-- 1. Tạo bảng employees
CREATE TABLE employees (
                           id INT AUTO_INCREMENT PRIMARY KEY,
                           first_name VARCHAR(50),
                           last_name VARCHAR(50),
                           salary DECIMAL(10,2),
                           email VARCHAR(100) UNIQUE,
                           phone_number VARCHAR(15)
);

-- 2. Tạo bảng salary_log
CREATE TABLE salary_log (
                            log_id INT AUTO_INCREMENT PRIMARY KEY,
                            employee_id INT,
                            old_salary DECIMAL(10, 2),
                            new_salary DECIMAL(10, 2),
                            change_date DATETIME DEFAULT CURRENT_TIMESTAMP,
                            FOREIGN KEY (employee_id) REFERENCES employees(id)
);
--
INSERT INTO employees (first_name, last_name, salary, email, phone_number) VALUES
                                                                               ('Nguyen', 'An', 1500.00, 'an.nguyen@example.com', '0901234561'),
                                                                               ('Tran', 'Binh', 1800.00, 'binh.tran@example.com', '0901234562'),
                                                                               ('Le', 'Chi', 2000.00, 'chi.le@example.com', '0901234563'),
                                                                               ('Pham', 'Dung', 1200.00, 'dung.pham@example.com', '0901234564'),
                                                                               ('Hoang', 'Em', 2500.00, 'em.hoang@example.com', '0901234565'),
                                                                               ('Vu', 'Fan', 1700.00, 'fan.vu@example.com', '0901234566'),
                                                                               ('Phan', 'Giang', 2200.00, 'giang.phan@example.com', '0901234567'),
                                                                               ('Do', 'Hanh', 1900.00, 'hanh.do@example.com', '0901234568'),
                                                                               ('Bui', 'Inh', 1400.00, 'inh.bui@example.com', '0901234569'),
                                                                               ('Dang', 'Khoa', 3000.00, 'khoa.dang@example.com', '0901234570');
--
DELIMITER //

CREATE TRIGGER trg_after_update_salary
    AFTER UPDATE ON employees
    FOR EACH ROW
BEGIN
    -- Kiểm tra nếu lương thực sự có sự thay đổi mới ghi log
    IF OLD.salary <> NEW.salary THEN
        INSERT INTO salary_log (employee_id, old_salary, new_salary, change_date)
        VALUES (OLD.id, OLD.salary, NEW.salary, NOW());
    END IF;
END //

DELIMITER ;
--
-- Tăng lương cho nhân viên có id = 1 (Nguyen An) từ 1500 lên 1750
UPDATE employees
SET salary = 1750.00
WHERE id = 1;