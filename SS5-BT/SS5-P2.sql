use personnel_management_db;
SELECT
    department,
    COUNT(emp_id) AS total_employees, -- Số lượng nhân viên
    AVG(salary) AS avg_salary         -- Lương trung bình
FROM emlployees
GROUP BY department;
-- Cac phong co tren 3 nv
SELECT
    department,
    COUNT(emp_id) AS total_employees
FROM emlployees
GROUP BY department
HAVING COUNT(emp_id) > 3;
-- phong ban cos luong nv > 12tr
SELECT
    department,
    AVG(salary) AS avg_salary
FROM emlployees
GROUP BY department
HAVING AVG(salary) > 12000000;
