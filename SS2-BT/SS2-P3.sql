CREATE TABLE students_constraint (
                                     student_id VARCHAR(10) PRIMARY KEY,
                                     fullname VARCHAR(100) NOT NULL,
                                     email VARCHAR(100) UNIQUE,
                                     age INT CHECK (age >= 18)
);