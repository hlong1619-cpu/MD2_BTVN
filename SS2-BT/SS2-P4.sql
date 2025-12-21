CREATE TABLE users (
                       user_id INT PRIMARY KEY,
                       username VARCHAR(50) UNIQUE NOT NULL,
                       password VARCHAR(255) NOT NULL,
                       status VARCHAR(20) DEFAULT 'ACTIVE',
                       CONSTRAINT chk_status CHECK (status IN ('ACTIVE', 'INACTIVE'))
);