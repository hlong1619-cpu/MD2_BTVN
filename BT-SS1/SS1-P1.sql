

create database students;
use students;
-- Tạo bảng
create table students (
    student_id varbinary(10) primary key auto_increment,
    student_name varchar(100) not null,
    student_birthday date not null,
    student_phone varchar(15),
    student_email varchar(100) unique

);