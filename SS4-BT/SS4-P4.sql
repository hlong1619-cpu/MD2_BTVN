use online_courses_db;
-- Hiển thị sinh viên chưa có email
SELECT * FROM students
WHERE email IS NULL;
-- Hiển thị sinh viên dã có email
SELECT * FROM students
WHERE email IS NOT NULL;
-- Họ tên bắt đầu bằng chữ Ng
SELECT * FROM students
WHERE full_name LIKE 'ng%';
-- Không phải giới tính nam
SELECT * FROM students
WHERE gender <> 'Nam';