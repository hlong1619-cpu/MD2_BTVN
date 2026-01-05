create database idx_employee_department;

--
create table if not exists employees (
    employee_id int primary key auto_increment,
    full_name varchar(255) not null ,
    department varchar(100),
    salary double
);
CREATE INDEX idx_employee_department
    ON employees(department);