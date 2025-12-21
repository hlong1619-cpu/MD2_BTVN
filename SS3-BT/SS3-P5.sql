-- Tạo Database nếu chưa tồn tại
CREATE DATABASE IF NOT EXISTS online_learning_db;
USE online_learning_db;

-- 1. Tạo bảng Giảng viên (Phía 1 trong quan hệ 1-N)
CREATE TABLE teachers (
                          teacher_id INT PRIMARY KEY AUTO_INCREMENT,
                          fullname VARCHAR(100) NOT NULL,
                          email VARCHAR(100) UNIQUE NOT NULL
);

-- 2. Tạo bảng Khóa học (Phía N trong quan hệ 1-N với teachers)
CREATE TABLE courses (
                         course_id INT PRIMARY KEY AUTO_INCREMENT,
                         course_name VARCHAR(150) NOT NULL,
                         description TEXT,
                         price DECIMAL(10, 2),
                         teacher_id INT,
                         FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);

-- 3. Tạo bảng Học viên
CREATE TABLE students (
                          student_id INT PRIMARY KEY AUTO_INCREMENT,
                          fullname VARCHAR(100) NOT NULL,
                          email VARCHAR(100) UNIQUE NOT NULL
);

-- 4. Tạo bảng trung gian Đăng ký (Quan hệ N-N giữa students và courses)
CREATE TABLE enrollments (
                             student_id INT,
                             course_id INT,
                             enroll_date DATETIME DEFAULT CURRENT_TIMESTAMP,
                             PRIMARY KEY (student_id, course_id), -- Khóa chính kép
                             FOREIGN KEY (student_id) REFERENCES students(student_id),
                             FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- 5. Dùng ALTER TABLE thêm ràng buộc giá khóa học > 0
ALTER TABLE courses
    ADD CONSTRAINT chk_price CHECK (price > 0);

-- 6. Lệnh xóa bảng enrollments khi cần
-- DROP TABLE IF EXISTS enrollments;