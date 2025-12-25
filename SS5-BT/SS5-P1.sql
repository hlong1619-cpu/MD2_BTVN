use online_courses_db;
alter table students
add score varchar(100);
SELECT
    student_id,
    UPPER(full_name) AS full_name_uppercase -- Đặt tên giả (alias)
FROM students;
-- Tính tuổi sinh viên
SELECT
    full_name,
    (YEAR(CURDATE()) - birth_date) AS age
FROM students;
-- Làm tròn điểm trung bình

SELECT
    full_name,
    ROUND(score, 1) AS rounded_score
FROM students;
