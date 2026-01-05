use students;

-- Tạo bảng sinh viên
CREATE TABLE IF NOT EXISTS students (
   student_id int primary key auto_increment,
   student_name varchar(255) not null ,
    birth_year int,
    class_name varchar(255),
    address varchar(255)

);

-- Them sv
INSERT INTO students (students.student_name, birth_year, class_name, address)
VALUES
    ( 'Nguyễn Văn An', 2005, 'CNTT1', 'Hà Nội'),
    ( 'Lê Thị Bình', 2006, 'Kế Toán 2', 'Đà Nẵng'),
    ( 'Trần Quang Cường', 2005, 'Cơ Khí 1', 'TP. Hồ Chí Minh'),
    ( 'Phạm Minh Đức', 2006, 'CNTT1', 'Hải Phòng'),
    ( 'Hoàng Thu Hà', 2005, 'Ngôn Ngữ Anh', 'Cần Thơ');

--
SELECT * FROM students;
--
CREATE VIEW v_student_basic AS
    SELECT
       student_id,
       student_name,
      class_name
FROM students;

