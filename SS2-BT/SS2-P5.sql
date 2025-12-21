CREATE DATABASE classes;
use classes;
-- Tạo bảng lớp học
CREATE TABLE classes (
                         class_id VARCHAR(10) PRIMARY KEY,
                         class_name VARCHAR(100) NOT NULL,
                         school_year VARCHAR(20) NOT NULL
);

-- Tạo bảng sinh viên
CREATE TABLE students (
                          student_id VARCHAR(10) PRIMARY KEY,
                          fullname VARCHAR(100) NOT NULL,
                          birthday DATE,
                          gender VARCHAR(10),
                          class_id VARCHAR(10) NOT NULL,
    -- Thiết lập khóa ngoại
                          FOREIGN KEY (class_id) REFERENCES classes(class_id)
);