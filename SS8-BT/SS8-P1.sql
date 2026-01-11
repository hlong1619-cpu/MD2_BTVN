CREATE DATABASE IF NOT EXISTS student_management;
USE student_management;

-- Create table
CREATE TABLE IF NOT EXISTS students1 (
    st_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100),
    class_name VARCHAR(50)
);

-- Them du lieu vao bang
INSERT INTO students1 (full_name, class_name) VALUES
                                                  ('Nguyen Van A', 'Java01'),
                                                  ('Tran Thi B', 'JS02'),
                                                  ('Le Van C', 'PHP03');

-- Create Procedure
DELIMITER //

CREATE PROCEDURE sp_get_all_students()
BEGIN
    SELECT students1.st_id, students1.full_name, students1.class_name FROM students1;
end //

DELIMITER //;

CALL sp_get_all_students();