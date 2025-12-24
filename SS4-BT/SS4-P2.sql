use online_courses_db;
UPDATE students
SET email = 'nam@gmail.com'
WHERE email IS NULL;
select * from students where email = 'nam@gmail.com';
update students
set gender = 'Nam'
where student_id = '5';
select * from students where student_id = '5';

