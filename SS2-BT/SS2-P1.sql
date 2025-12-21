CREATE TABLE students (
                          student_id VARCHAR(10) PRIMARY KEY, -- Khóa chính
                          fullname VARCHAR(100) NOT NULL,
                          birthday DATE,
                          gender VARCHAR(10)
);