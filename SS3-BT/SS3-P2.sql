CREATE DATABASE books;
use books;
-- Tạo bảng Sách
CREATE TABLE books (
                       book_id INT PRIMARY KEY,
                       title VARCHAR(255) NOT NULL
);

-- Tạo bảng Độc giả
CREATE TABLE readers (
                         reader_id INT PRIMARY KEY,
                         name VARCHAR(100) NOT NULL
);

-- Tạo bảng trung gian Mượn sách
CREATE TABLE borrowings (
                            borrow_id INT PRIMARY KEY,
                            book_id INT,
                            reader_id INT,
                            borrow_date DATE,
                            return_date DATE,
    -- Thiết lập khóa ngoại
                            FOREIGN KEY (book_id) REFERENCES books(book_id),
                            FOREIGN KEY (reader_id) REFERENCES readers(reader_id)
);