use online_courses_db;

select * from students where student_id = '2';
select student_id, full_name, birth_date
from students
where year(birth_date) between 2003 and 2005;
-- SET SQL_SAFE_UPDATES = 0; -- Tat tinh nang an toan error
-- Hien thi theo gioi tinh
select student_id, full_name, gender
from students
where gender in ('nam');
select student_id, full_name, birth_date
from students
where student_id in ('1', '4', '5');
