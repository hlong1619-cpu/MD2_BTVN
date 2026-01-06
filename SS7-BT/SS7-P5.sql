use btss6_management_db;
select * from employees;
--
create view v_employee_public AS
    select
        employee_id,
        full_name,
        department
from employees;

