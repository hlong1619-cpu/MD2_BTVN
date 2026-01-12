use btss6_management_db;

SELECT *FROM customers;
ALTER TABLE customers
 ADD COLUMN phone varchar(15) not null;
ALTER TABLE customers
    ADD COLUMN address varchar(255) not null ;

-- Tao Unique cho email
CREATE UNIQUE INDEX idx_email ON customers(email);

-- Tao index thuong cho phone
CREATE INDEX idx_phone ON customers(phone);

EXPLAIN SELECT * FROM customers WHERE email = 'namtv@gmail.com';

INSERT INTO customers (name, email, phone, address) VALUES
                                                                 ('User 1', 'user1@gmail.com', '0901234561', 'Hanoi'),
                                                                 ('User 2', 'user2@gmail.com', '0901234562', 'HCMC'),
                                                                 ('User 10', 'user10@gmail.com', '0901234570', 'Da Nang');

--
ALTER TABLE customers DROP INDEX idx_email;
EXPLAIN SELECT * FROM customers WHERE email = 'user10@gmail.com';
--

