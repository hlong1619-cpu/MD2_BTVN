create database users;
use users;
-- Table
CREATE TABLE users (
                       user_id INT PRIMARY KEY AUTO_INCREMENT,
                       username VARCHAR(50) UNIQUE NOT NULL,
                       password VARCHAR(255) NOT NULL,
                       email VARCHAR(100) UNIQUE,
                       status VARCHAR(20) DEFAULT 'ACTIVE'
);
-- Add check
ALTER TABLE users
    ADD CONSTRAINT chk_status CHECK (status IN ('ACTIVE', 'INACTIVE'));

-- Drop
DROP TABLE users;
